#include <Wire.h>
#include <RTClib.h>
#include <EEPROM.h>

#define PIN_LED_STATUS 9
#define PIN_LED_ERROR 10
#define PIN_BUTTON 8
#define PIN_READ A0

#define TIME_SETTLE 5000 // 5 seconds.
#define TIME_POLL 5000 // 5 seconds.
#define TIME_SAMPLE 900000 // 15 minutes.
#define TIME_BLINK 500 // 500 milliseconds.

#define SERIAL_BAUD 9600

#define VOLTAGE_REF 2.5 // Volts.
#define DIVIDER_FACTOR (1.0 / 3.0) // Factor.
#define SHUNT_OHMS 29.8 // Ohms.

struct Record {
    uint32_t timestamp;
    uint16_t millivolts;
    uint8_t milliamps;
};

RTC_DS3231 rtc;
DateTime now = {0};
char buf[64] = {0};
uint64_t then = 0;
uint64_t next = 0;

uint16_t memptr = 0; // Index into EEPROM.
const uint16_t eeprom_len = EEPROM.length();
const uint16_t eeprom_max = (uint16_t)floor(eeprom_len / sizeof(Record));
struct Record rec = {0};

void setup() {
    pinMode(PIN_LED_STATUS, OUTPUT);
    digitalWrite(PIN_LED_STATUS, LOW);
    pinMode(PIN_LED_ERROR, OUTPUT);
    digitalWrite(PIN_LED_ERROR, LOW);
    pinMode(PIN_BUTTON, INPUT_PULLUP);
    analogReference(INTERNAL);
    analogRead(PIN_READ); // Read here to prime the new reference.

    Serial1.begin(SERIAL_BAUD);
    Serial1.println("Serial ready");

    Serial1.println("Starting RTC");
    if ( ! rtc.begin() ) {
        digitalWrite(PIN_LED_ERROR, HIGH);
        Serial1.println("Couldn't find RTC. Halting");
        while ( 1 ) delay(1000);
    }

    if ( rtc.lostPower() || digitalRead(PIN_BUTTON) == LOW ) {
        then = millis();
        digitalWrite(PIN_LED_ERROR, HIGH);

        Serial1.println("Setting RTC to sketch compile time.");
        rtc.adjust(DateTime(F(__DATE__), F(__TIME__)));

        Serial1.println("Clearing EEPROM.");
        for ( memptr = 0 ; memptr < eeprom_len ; memptr++ )
            EEPROM.write(memptr, 0x00);
        memptr = 0;

        delay(min(max(0, TIME_BLINK - (millis() - then)), TIME_BLINK));
        digitalWrite(PIN_LED_ERROR, LOW);
    }

    Serial1.println("Scanning EEPROM");
    for ( memptr = 0 ; memptr < eeprom_len ; memptr += sizeof(Record) ) {
        EEPROM.get(memptr, rec);
        if ( rec.timestamp == 0 )
            break;
    }

    snprintf(buf, sizeof(buf), "EEPROM has %u/%u records. (%lu/%lu minutes)",
             memptr / sizeof(Record), eeprom_max,
             ((TIME_SAMPLE / 1000) * (uint32_t)(memptr / sizeof(Record))) / 60,
             ((TIME_SAMPLE / 1000) * (uint32_t)eeprom_max) / 60);
    Serial1.println(buf);

    now = rtc.now();
    snprintf(buf, sizeof(buf), "Current time: %04u-%02u-%02u %02u:%02u:%02u",
             now.year(), now.month(), now.day(),
             now.hour(), now.minute(), now.second());
    Serial1.println(buf);

    snprintf(buf, sizeof(buf), "Startup took %lums.", millis());
    Serial1.println(buf);

    Serial1.println("Waiting a little to let voltages settle.");
    delay(TIME_SETTLE);

    Serial1.println("Starting main loop.");
}

void loop() {
    double volts = 0.0;
    double amps = 0.0;

    then = millis();

    if ( then < next ) {
        if ( digitalRead(PIN_BUTTON) == LOW ) {
            digitalWrite(PIN_LED_ERROR, HIGH);

            Serial1.println("Dumping EEPROM.");
            Serial1.println("datetime,millivolts,milliamps");
            for ( memptr = 0 ; memptr < eeprom_len ; memptr += sizeof(Record) ) {
                EEPROM.get(memptr, rec);
                if ( rec.timestamp == 0 )
                    break;
                now = DateTime(rec.timestamp);
                snprintf(buf, sizeof(buf), "%04u-%02u-%02u %02u:%02u:%02u,%04u,%03u",
                         now.year(), now.month(), now.day(),
                         now.hour(), now.minute(), now.second(),
                         rec.millivolts, rec.milliamps);
                Serial1.println(buf);
            }

            Serial1.println("Clearing EEPROM.");
            for ( memptr = 0 ; memptr < eeprom_len ; memptr++ )
                EEPROM.write(memptr, 0x00);
            memptr = 0;

            digitalWrite(PIN_LED_ERROR, LOW);
        }

        // FIXME - next sample might be less than TIME_POLL ms from now.
        delay(min(max(0, TIME_POLL - (millis() - then)), TIME_POLL));
        return;
    }

    next += TIME_SAMPLE;

    if ( memptr + sizeof(Record) > eeprom_len ) {
        digitalWrite(PIN_LED_ERROR, HIGH);
        Serial1.println("Memory is full. Press the button to dump EEPROM to serial.");
        return;
    }

    digitalWrite(PIN_LED_STATUS, HIGH);

    now = rtc.now();
    volts = ((analogRead(PIN_READ) / 1024.0) * VOLTAGE_REF) / DIVIDER_FACTOR;
    amps = volts / SHUNT_OHMS;

    snprintf(buf, sizeof(buf), "%umV/%umA at %04u-%02u-%2u %02u:%02u:%02u",
             (uint16_t)(volts * 1000), (uint8_t)(amps * 1000),
             now.year(), now.month(), now.day(),
             now.hour(), now.minute(), now.second());
    Serial1.println(buf);

    rec = {
        .timestamp = now.unixtime(),
        .millivolts = (uint16_t)(volts * 1000),
        .milliamps = (uint8_t)(amps * 1000)
    };
    EEPROM.put(memptr, rec);
    memptr += sizeof(Record);

    delay(min(max(0, TIME_BLINK - (millis() - then)), TIME_BLINK));
    digitalWrite(PIN_LED_STATUS, LOW);
}
