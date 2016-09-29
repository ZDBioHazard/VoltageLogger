Arduino Voltage Logger
======================

This simple-ish device takes a voltage reading at Arduino pin `A0`, and logs it
to EEPROM with a timestamp from a `DS3231` RTC module. When you press the
button, all stored data will be written to UART at 9600 baud and the EEPROM
will be reset.

The green LED (`D1` on pin `D9`) blinks when it takes a reading, and the red
LED (`D2` on pin `D10`) becomes lit when the EEPROM is full. 1K of EEPROM can
hold 146 7-byte records, that's 36.5 hours at the default sample rate of 15
minutes.

Resistors `R3`, `R4`, and `R5`, form the current shunt. It is tapped 1/3 of the
way in to make sure the analog input is not over 5V for the small 5V/1W panel I
was testing. You will probably need to adjust the current shunt for a bigger
panel. It's pretty close to the limit for a 5V/1W panel.

The `DS3231` module I used is a tiny cheap one designed for a Raspberry Pi.
Really useful, and often less than $1 USD on eBay.
