EESchema Schematic File Version 2
LIBS:device
LIBS:power
LIBS:conn
LIBS:my_library
EELAYER 25 0
EELAYER END
$Descr User 6000 4500
encoding utf-8
Sheet 1 1
Title "Voltage Logger"
Date "2016-06-28"
Rev "1"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L SPARKFUN_PRO_MICRO U1
U 1 1 5772B466
P 1650 1800
F 0 "U1" H 1150 2800 60  0000 L CNN
F 1 "SPARKFUN_PRO_MICRO" H 1650 800 60  0000 C CNN
F 2 "my_footprints:Sparkfun_Pro_Micro" H 1650 700 60  0001 C TNN
F 3 "" H 1550 800 60  0000 C CNN
	1    1650 1800
	1    0    0    -1  
$EndComp
NoConn ~ 950  950 
NoConn ~ 950  2150
NoConn ~ 2350 950 
NoConn ~ 2350 1050
NoConn ~ 2350 1150
NoConn ~ 2350 1350
NoConn ~ 2350 1450
NoConn ~ 2350 1550
NoConn ~ 2350 1950
NoConn ~ 2350 2050
NoConn ~ 2350 2150
NoConn ~ 2350 2250
NoConn ~ 2350 2550
Wire Wire Line
	850  850  850  1050
Wire Wire Line
	850  1050 950  1050
$Comp
L GND #PWR?
U 1 1 5772B813
P 850 2850
F 0 "#PWR?" H 850 2600 50  0001 C CNN
F 1 "GND" H 850 2700 50  0000 C CNN
F 2 "" H 850 2850 50  0000 C CNN
F 3 "" H 850 2850 50  0000 C CNN
	1    850  2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	950  2450 850  2450
Wire Wire Line
	850  2450 850  2850
Wire Wire Line
	950  2550 850  2550
Connection ~ 850  2550
Wire Wire Line
	950  2650 850  2650
Connection ~ 850  2650
$Comp
L CONN_01X02 P1
U 1 1 5772C4BB
P 4050 1200
F 0 "P1" H 4050 1350 50  0000 C CNN
F 1 "READ" V 4150 1200 50  0000 C CNN
F 2 "" H 4050 1200 50  0000 C CNN
F 3 "" H 4050 1200 50  0000 C CNN
	1    4050 1200
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 5772C51C
P 2600 1250
F 0 "R3" V 2700 1250 50  0000 C CNN
F 1 "10" V 2600 1250 50  0000 C CNN
F 2 "" V 2530 1250 50  0000 C CNN
F 3 "" H 2600 1250 50  0000 C CNN
	1    2600 1250
	0    1    1    0   
$EndComp
$Comp
L R R4
U 1 1 5772C79C
P 3000 1250
F 0 "R4" V 3100 1250 50  0000 C CNN
F 1 "10" V 3000 1250 50  0000 C CNN
F 2 "" V 2930 1250 50  0000 C CNN
F 3 "" H 3000 1250 50  0000 C CNN
	1    3000 1250
	0    1    1    0   
$EndComp
$Comp
L R R5
U 1 1 5772C7CB
P 3400 1250
F 0 "R5" V 3500 1250 50  0000 C CNN
F 1 "10" V 3400 1250 50  0000 C CNN
F 2 "" V 3330 1250 50  0000 C CNN
F 3 "" H 3400 1250 50  0000 C CNN
	1    3400 1250
	0    1    1    0   
$EndComp
Text Label 2350 2350 0    60   ~ 0
SCL
Text Label 2350 2450 0    60   ~ 0
SDA
$Comp
L SW_PUSH SW1
U 1 1 5772C9A2
P 2950 2250
F 0 "SW1" H 2800 2400 50  0000 R CNN
F 1 "SW_PUSH" H 2900 2400 50  0000 L CNN
F 2 "" H 2950 2250 50  0000 C CNN
F 3 "" H 2950 2250 50  0000 C CNN
	1    2950 2250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2350 2350 2550 2350
Wire Wire Line
	2350 2450 2550 2450
Wire Wire Line
	2350 1850 2950 1850
Wire Wire Line
	2950 1850 2950 1950
$Comp
L GND #PWR?
U 1 1 5772CCCE
P 2950 2850
F 0 "#PWR?" H 2950 2600 50  0001 C CNN
F 1 "GND" H 2950 2700 50  0000 C CNN
F 2 "" H 2950 2850 50  0000 C CNN
F 3 "" H 2950 2850 50  0000 C CNN
	1    2950 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 2550 2950 2850
$Comp
L R R1
U 1 1 5772CD87
P 2600 1750
F 0 "R1" V 2750 1750 50  0000 C CNN
F 1 "150" V 2600 1750 50  0000 C CNN
F 2 "" V 2530 1750 50  0000 C CNN
F 3 "" H 2600 1750 50  0000 C CNN
	1    2600 1750
	0    1    1    0   
$EndComp
$Comp
L R R2
U 1 1 5772CE1F
P 2600 1650
F 0 "R2" V 2500 1650 50  0000 C CNN
F 1 "150" V 2600 1650 50  0000 C CNN
F 2 "" V 2530 1650 50  0000 C CNN
F 3 "" H 2600 1650 50  0000 C CNN
	1    2600 1650
	0    1    1    0   
$EndComp
Wire Wire Line
	2350 1650 2450 1650
Wire Wire Line
	2450 1750 2350 1750
$Comp
L LED D1
U 1 1 5772CECE
P 3200 2050
F 0 "D1" H 3250 2150 50  0000 L CNN
F 1 "GREEN" H 3150 2150 50  0000 R CNN
F 2 "" H 3200 2050 50  0000 C CNN
F 3 "" H 3200 2050 50  0000 C CNN
	1    3200 2050
	0    -1   -1   0   
$EndComp
$Comp
L LED D2
U 1 1 5772D119
P 3450 2050
F 0 "D2" H 3500 2150 50  0000 L CNN
F 1 "RED" H 3400 2150 50  0000 R CNN
F 2 "" H 3450 2050 50  0000 C CNN
F 3 "" H 3450 2050 50  0000 C CNN
	1    3450 2050
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR?
U 1 1 5772D1A4
P 3200 2850
F 0 "#PWR?" H 3200 2600 50  0001 C CNN
F 1 "GND" H 3200 2700 50  0000 C CNN
F 2 "" H 3200 2850 50  0000 C CNN
F 3 "" H 3200 2850 50  0000 C CNN
	1    3200 2850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5772D1D0
P 3450 2850
F 0 "#PWR?" H 3450 2600 50  0001 C CNN
F 1 "GND" H 3450 2700 50  0000 C CNN
F 2 "" H 3450 2850 50  0000 C CNN
F 3 "" H 3450 2850 50  0000 C CNN
	1    3450 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 1750 3200 1750
Wire Wire Line
	3200 1750 3200 1850
Wire Wire Line
	2750 1650 3450 1650
Wire Wire Line
	3450 1650 3450 1850
Wire Wire Line
	3200 2250 3200 2850
Wire Wire Line
	3450 2250 3450 2850
Wire Wire Line
	2350 2650 2450 2650
Wire Wire Line
	2350 1250 2450 1250
Wire Wire Line
	2750 1250 2850 1250
Wire Wire Line
	3150 1250 3250 1250
Wire Wire Line
	3550 1250 3850 1250
Wire Wire Line
	3200 1250 3200 1150
Wire Wire Line
	3200 1150 3850 1150
Connection ~ 3200 1250
$Comp
L GND #PWR?
U 1 1 5772D8EF
P 3700 2850
F 0 "#PWR?" H 3700 2600 50  0001 C CNN
F 1 "GND" H 3700 2700 50  0000 C CNN
F 2 "" H 3700 2850 50  0000 C CNN
F 3 "" H 3700 2850 50  0000 C CNN
	1    3700 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 1250 3700 2850
Connection ~ 3700 1250
$Comp
L CONN_01X02 P2
U 1 1 5772DA23
P 2650 2700
F 0 "P2" H 2650 2850 50  0000 C CNN
F 1 "UART" V 2750 2700 50  0000 C CNN
F 2 "" H 2650 2700 50  0000 C CNN
F 3 "" H 2650 2700 50  0000 C CNN
	1    2650 2700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5772DACB
P 2350 2850
F 0 "#PWR?" H 2350 2600 50  0001 C CNN
F 1 "GND" H 2350 2700 50  0000 C CNN
F 2 "" H 2350 2850 50  0000 C CNN
F 3 "" H 2350 2850 50  0000 C CNN
	1    2350 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 2750 2350 2750
Wire Wire Line
	2350 2750 2350 2850
Text Label 5050 2750 0    60   ~ 0
SCL
Text Label 5050 2450 0    60   ~ 0
SDA
$Comp
L GND #PWR?
U 1 1 5772E8B1
P 3950 2850
F 0 "#PWR?" H 3950 2600 50  0001 C CNN
F 1 "GND" H 3950 2700 50  0000 C CNN
F 2 "" H 3950 2850 50  0000 C CNN
F 3 "" H 3950 2850 50  0000 C CNN
	1    3950 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 2350 3950 2450
Wire Wire Line
	3950 2450 4050 2450
Wire Wire Line
	4050 2750 3950 2750
Wire Wire Line
	3950 2750 3950 2850
$Comp
L +5V #PWR?
U 1 1 5772E954
P 850 850
F 0 "#PWR?" H 850 700 50  0001 C CNN
F 1 "+5V" H 850 990 50  0000 C CNN
F 2 "" H 850 850 50  0000 C CNN
F 3 "" H 850 850 50  0000 C CNN
	1    850  850 
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR?
U 1 1 5772E98A
P 3950 2350
F 0 "#PWR?" H 3950 2200 50  0001 C CNN
F 1 "+5V" H 3950 2490 50  0000 C CNN
F 2 "" H 3950 2350 50  0000 C CNN
F 3 "" H 3950 2350 50  0000 C CNN
	1    3950 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 2450 5250 2450
Wire Wire Line
	5050 2750 5250 2750
$Comp
L RPI_DS3231 U2
U 1 1 5772C7A5
P 4550 2600
F 0 "U2" H 4150 2900 60  0000 L CNN
F 1 "RPI_DS3231" H 4550 2300 60  0000 C CNN
F 2 "" H 4900 2550 60  0000 C CNN
F 3 "" H 4900 2550 60  0000 C CNN
	1    4550 2600
	1    0    0    -1  
$EndComp
$EndSCHEMATC
