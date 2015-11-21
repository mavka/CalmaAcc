EESchema Schematic File Version 2
LIBS:Connectors_kl
LIBS:pcb_details
LIBS:power
LIBS:Power_kl
LIBS:Tittar_kl
LIBS:st_kl
LIBS:Transistors_kl
LIBS:Sensors
LIBS:CalmaAcc-cache
EELAYER 25 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L C C7
U 1 1 5647102D
P 6400 3800
F 0 "C7" H 6300 3700 50  0000 L CNN
F 1 "0.1u" H 6300 3900 50  0000 L CNN
F 2 "Capacitors:CAP_0402" V 6500 3650 28  0001 C BNN
F 3 "" H 6400 3800 60  0000 C CNN
	1    6400 3800
	1    0    0    -1  
$EndComp
$Comp
L C C6
U 1 1 5647104C
P 6100 3800
F 0 "C6" H 6000 3700 50  0000 L CNN
F 1 "4.7u" H 6000 3900 50  0000 L CNN
F 2 "Capacitors:CAP_0402" V 6200 3650 28  0001 C BNN
F 3 "" H 6100 3800 60  0000 C CNN
	1    6100 3800
	1    0    0    -1  
$EndComp
$Comp
L C C5
U 1 1 56471098
P 5800 3800
F 0 "C5" H 5700 3700 50  0000 L CNN
F 1 "10n" H 5700 3900 50  0000 L CNN
F 2 "Capacitors:CAP_0402" V 5900 3650 28  0001 C BNN
F 3 "" H 5800 3800 60  0000 C CNN
	1    5800 3800
	1    0    0    -1  
$EndComp
$Comp
L C C4
U 1 1 564710BB
P 5500 3800
F 0 "C4" H 5400 3700 50  0000 L CNN
F 1 "1u" H 5400 3900 50  0000 L CNN
F 2 "Capacitors:CAP_0402" V 5600 3650 28  0001 C BNN
F 3 "" H 5500 3800 60  0000 C CNN
	1    5500 3800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR01
U 1 1 56471153
P 6400 4200
F 0 "#PWR01" H 6490 4180 30  0001 C CNN
F 1 "GND" H 6400 4120 30  0001 C CNN
F 2 "" H 6400 4200 60  0000 C CNN
F 3 "" H 6400 4200 60  0000 C CNN
	1    6400 4200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 56471173
P 6100 4200
F 0 "#PWR02" H 6190 4180 30  0001 C CNN
F 1 "GND" H 6100 4120 30  0001 C CNN
F 2 "" H 6100 4200 60  0000 C CNN
F 3 "" H 6100 4200 60  0000 C CNN
	1    6100 4200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR03
U 1 1 56471193
P 5800 4200
F 0 "#PWR03" H 5890 4180 30  0001 C CNN
F 1 "GND" H 5800 4120 30  0001 C CNN
F 2 "" H 5800 4200 60  0000 C CNN
F 3 "" H 5800 4200 60  0000 C CNN
	1    5800 4200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR04
U 1 1 564711B3
P 5500 4200
F 0 "#PWR04" H 5590 4180 30  0001 C CNN
F 1 "GND" H 5500 4120 30  0001 C CNN
F 2 "" H 5500 4200 60  0000 C CNN
F 3 "" H 5500 4200 60  0000 C CNN
	1    5500 4200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR05
U 1 1 564714EA
P 10200 3550
F 0 "#PWR05" H 10290 3530 30  0001 C CNN
F 1 "GND" H 10200 3470 30  0001 C CNN
F 2 "" H 10200 3550 60  0000 C CNN
F 3 "" H 10200 3550 60  0000 C CNN
	1    10200 3550
	1    0    0    -1  
$EndComp
$Comp
L BAT B1
U 1 1 56488297
P 2100 5550
F 0 "B1" H 2250 5750 60  0000 C CNN
F 1 "BAT" H 1850 5750 60  0000 C CNN
F 2 "Batteries_kl:BAT_CH7410" H 2100 5550 60  0001 C CNN
F 3 "" H 2100 5550 60  0000 C CNN
	1    2100 5550
	0    1    1    0   
$EndComp
$Comp
L GND #PWR06
U 1 1 56488406
P 1500 5550
F 0 "#PWR06" H 1590 5530 30  0001 C CNN
F 1 "GND" H 1500 5470 30  0001 C CNN
F 2 "" H 1500 5550 60  0000 C CNN
F 3 "" H 1500 5550 60  0000 C CNN
	1    1500 5550
	0    1    1    0   
$EndComp
$Comp
L +BATT #PWR07
U 1 1 56488459
P 2750 5550
F 0 "#PWR07" H 2750 5510 30  0001 C CNN
F 1 "+BATT" H 2830 5580 30  0000 C CNN
F 2 "" H 2750 5550 60  0000 C CNN
F 3 "" H 2750 5550 60  0000 C CNN
	1    2750 5550
	1    0    0    -1  
$EndComp
$Comp
L +BATT #PWR08
U 1 1 56488624
P 5400 3200
F 0 "#PWR08" H 5400 3160 30  0001 C CNN
F 1 "+BATT" H 5480 3230 30  0000 C CNN
F 2 "" H 5400 3200 60  0000 C CNN
F 3 "" H 5400 3200 60  0000 C CNN
	1    5400 3200
	-1   0    0    1   
$EndComp
$Comp
L +BATT #PWR09
U 1 1 56488665
P 6000 3350
F 0 "#PWR09" H 6000 3310 30  0001 C CNN
F 1 "+BATT" H 6080 3380 30  0000 C CNN
F 2 "" H 6000 3350 60  0000 C CNN
F 3 "" H 6000 3350 60  0000 C CNN
	1    6000 3350
	-1   0    0    1   
$EndComp
Wire Wire Line
	6000 3350 7000 3350
Wire Wire Line
	6100 3350 6100 3600
Wire Wire Line
	6400 3600 6400 3350
Connection ~ 6400 3350
Wire Wire Line
	5400 3200 7000 3200
Wire Wire Line
	5500 3200 5500 3600
Wire Wire Line
	5800 3600 5800 3200
Connection ~ 5800 3200
Wire Wire Line
	6400 4000 6400 4200
Wire Wire Line
	6100 4000 6100 4200
Wire Wire Line
	5800 4000 5800 4200
Wire Wire Line
	5500 4000 5500 4200
Connection ~ 6100 3350
Connection ~ 5500 3200
Wire Wire Line
	10100 3350 10200 3350
Wire Wire Line
	10200 3350 10200 3550
Wire Wire Line
	1850 5550 1500 5550
Wire Wire Line
	2300 5550 2750 5550
$Comp
L C C10
U 1 1 56488B03
P 11350 7800
F 0 "C10" H 11250 7700 50  0000 L CNN
F 1 "47u" H 11250 7900 50  0000 L CNN
F 2 "Capacitors:CAP_0805" V 11450 7650 28  0001 C BNN
F 3 "" H 11350 7800 60  0000 C CNN
	1    11350 7800
	1    0    0    -1  
$EndComp
$Comp
L C C9
U 1 1 56488B5E
P 11050 7800
F 0 "C9" H 10950 7700 50  0000 L CNN
F 1 "47u" H 10950 7900 50  0000 L CNN
F 2 "Capacitors:CAP_0805" V 11150 7650 28  0001 C BNN
F 3 "" H 11050 7800 60  0000 C CNN
	1    11050 7800
	1    0    0    -1  
$EndComp
$Comp
L +BATT #PWR010
U 1 1 56488C25
P 10650 7550
F 0 "#PWR010" H 10650 7510 30  0001 C CNN
F 1 "+BATT" H 10730 7580 30  0000 C CNN
F 2 "" H 10650 7550 60  0000 C CNN
F 3 "" H 10650 7550 60  0000 C CNN
	1    10650 7550
	-1   0    0    1   
$EndComp
$Comp
L D_Shottky D2
U 1 1 56488C75
P 11750 7800
F 0 "D2" H 11750 7900 40  0000 C CNN
F 1 "BAT54WS" H 11750 7700 40  0000 C CNN
F 2 "Diodes:SOD323" H 11750 7800 60  0001 C CNN
F 3 "" H 11750 7800 60  0000 C CNN
	1    11750 7800
	0    -1   -1   0   
$EndComp
$Comp
L CONN_2 XL3
U 1 1 56488D61
P 12250 8250
F 0 "XL3" V 12200 8250 40  0000 C CNN
F 1 "CONN_2" V 12300 8250 40  0000 C CNN
F 2 "Connectors:PLS-2" H 12250 8250 60  0001 C CNN
F 3 "" H 12250 8250 60  0000 C CNN
	1    12250 8250
	1    0    0    -1  
$EndComp
Wire Wire Line
	11050 7600 11050 7550
Connection ~ 11050 7550
Wire Wire Line
	11350 7550 11350 7600
$Comp
L GND #PWR011
U 1 1 56488E9B
P 11350 8150
F 0 "#PWR011" H 11440 8130 30  0001 C CNN
F 1 "GND" H 11350 8070 30  0001 C CNN
F 2 "" H 11350 8150 60  0000 C CNN
F 3 "" H 11350 8150 60  0000 C CNN
	1    11350 8150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR012
U 1 1 56488EC7
P 11050 8150
F 0 "#PWR012" H 11140 8130 30  0001 C CNN
F 1 "GND" H 11050 8070 30  0001 C CNN
F 2 "" H 11050 8150 60  0000 C CNN
F 3 "" H 11050 8150 60  0000 C CNN
	1    11050 8150
	1    0    0    -1  
$EndComp
Wire Wire Line
	11350 8000 11350 8150
Wire Wire Line
	11050 8000 11050 8150
$Comp
L NPN Q1
U 1 1 56488F54
P 11700 8650
F 0 "Q1" H 11900 8700 60  0000 C CNN
F 1 "MMBT2222" H 12050 8600 60  0000 C CNN
F 2 "SOT:SOT23-3" H 11700 8650 60  0001 C CNN
F 3 "" H 11700 8650 60  0000 C CNN
	1    11700 8650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR013
U 1 1 56489007
P 11750 9050
F 0 "#PWR013" H 11840 9030 30  0001 C CNN
F 1 "GND" H 11750 8970 30  0001 C CNN
F 2 "" H 11750 9050 60  0000 C CNN
F 3 "" H 11750 9050 60  0000 C CNN
	1    11750 9050
	1    0    0    -1  
$EndComp
Wire Wire Line
	11750 8850 11750 9050
$Comp
L R R4
U 1 1 5648910B
P 11000 8650
F 0 "R4" V 11080 8500 50  0000 C CNN
F 1 "1k" V 11000 8650 50  0000 C CNN
F 2 "Resistors:RES_0402" V 11080 8750 28  0001 C CNN
F 3 "" H 11000 8650 60  0000 C CNN
	1    11000 8650
	0    1    1    0   
$EndComp
Wire Wire Line
	11500 8650 11250 8650
Text Label 10450 8650 0    60   ~ 0
Vibro
Text Label 10600 2500 2    60   ~ 0
Vibro
$Comp
L MMA8452Q DD1
U 1 1 5648A46A
P 3250 8650
F 0 "DD1" H 3600 9150 60  0000 C CNN
F 1 "MMA8452Q" H 3000 9150 60  0000 C CNN
F 2 "QFN_DFN:QFN16_5_3" H 3250 8650 60  0001 C CNN
F 3 "" H 3250 8650 60  0000 C CNN
	1    3250 8650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR014
U 1 1 5648A5B1
P 2950 9300
F 0 "#PWR014" H 3040 9280 30  0001 C CNN
F 1 "GND" H 2950 9220 30  0001 C CNN
F 2 "" H 2950 9300 60  0000 C CNN
F 3 "" H 2950 9300 60  0000 C CNN
	1    2950 9300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 9150 2950 9300
Wire Wire Line
	2850 9150 2850 9200
Wire Wire Line
	2850 9200 3050 9200
Connection ~ 2950 9200
Wire Wire Line
	3050 9200 3050 9150
$Comp
L GND #PWR015
U 1 1 5648A6B6
P 4200 8300
F 0 "#PWR015" H 4290 8280 30  0001 C CNN
F 1 "GND" H 4200 8220 30  0001 C CNN
F 2 "" H 4200 8300 60  0000 C CNN
F 3 "" H 4200 8300 60  0000 C CNN
	1    4200 8300
	0    1    1    0   
$EndComp
Wire Wire Line
	3950 8300 4200 8300
$Comp
L C C1
U 1 1 5648A72C
P 4100 9000
F 0 "C1" H 4000 8900 50  0000 L CNN
F 1 "4.7u" H 4110 9100 50  0000 L CNN
F 2 "Capacitors:CAP_0402" V 4200 8850 28  0001 C BNN
F 3 "" H 4100 9000 60  0000 C CNN
	1    4100 9000
	1    0    0    -1  
$EndComp
$Comp
L C C2
U 1 1 5648A771
P 4400 9000
F 0 "C2" H 4300 8900 50  0000 L CNN
F 1 "0.1u" H 4415 9105 50  0000 L CNN
F 2 "Capacitors:CAP_0402" V 4500 8850 28  0001 C BNN
F 3 "" H 4400 9000 60  0000 C CNN
	1    4400 9000
	1    0    0    -1  
$EndComp
$Comp
L C C3
U 1 1 5648A7AA
P 4700 9000
F 0 "C3" H 4600 8900 50  0000 L CNN
F 1 "0.1u" H 4720 9110 50  0000 L CNN
F 2 "Capacitors:CAP_0402" V 4800 8850 28  0001 C BNN
F 3 "" H 4700 9000 60  0000 C CNN
	1    4700 9000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 8700 4200 8700
Wire Wire Line
	4100 8700 4100 8800
Wire Wire Line
	3950 8600 4500 8600
Wire Wire Line
	4400 8600 4400 8800
Wire Wire Line
	3950 8450 4700 8450
Wire Wire Line
	4700 8450 4700 8800
$Comp
L +BATT #PWR016
U 1 1 5648A8C3
P 4200 8700
F 0 "#PWR016" H 4200 8660 30  0001 C CNN
F 1 "+BATT" H 4280 8730 30  0000 C CNN
F 2 "" H 4200 8700 60  0000 C CNN
F 3 "" H 4200 8700 60  0000 C CNN
	1    4200 8700
	1    0    0    -1  
$EndComp
$Comp
L +BATT #PWR017
U 1 1 5648A8FB
P 4500 8600
F 0 "#PWR017" H 4500 8560 30  0001 C CNN
F 1 "+BATT" H 4580 8630 30  0000 C CNN
F 2 "" H 4500 8600 60  0000 C CNN
F 3 "" H 4500 8600 60  0000 C CNN
	1    4500 8600
	1    0    0    -1  
$EndComp
Connection ~ 4100 8700
Connection ~ 4400 8600
$Comp
L GND #PWR018
U 1 1 5648A9D2
P 4100 9350
F 0 "#PWR018" H 4190 9330 30  0001 C CNN
F 1 "GND" H 4100 9270 30  0001 C CNN
F 2 "" H 4100 9350 60  0000 C CNN
F 3 "" H 4100 9350 60  0000 C CNN
	1    4100 9350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR019
U 1 1 5648AA0A
P 4400 9350
F 0 "#PWR019" H 4490 9330 30  0001 C CNN
F 1 "GND" H 4400 9270 30  0001 C CNN
F 2 "" H 4400 9350 60  0000 C CNN
F 3 "" H 4400 9350 60  0000 C CNN
	1    4400 9350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR020
U 1 1 5648AA42
P 4700 9350
F 0 "#PWR020" H 4790 9330 30  0001 C CNN
F 1 "GND" H 4700 9270 30  0001 C CNN
F 2 "" H 4700 9350 60  0000 C CNN
F 3 "" H 4700 9350 60  0000 C CNN
	1    4700 9350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 9200 4100 9350
Wire Wire Line
	4400 9200 4400 9350
Wire Wire Line
	4700 9200 4700 9350
$Comp
L R R1
U 1 1 5648AE67
P 5900 8400
F 0 "R1" V 5800 8400 50  0000 C CNN
F 1 "4k7" V 5900 8400 50  0000 C CNN
F 2 "Resistors:RES_0402" V 5980 8500 28  0001 C CNN
F 3 "" H 5900 8400 60  0000 C CNN
	1    5900 8400
	0    1    1    0   
$EndComp
$Comp
L R R2
U 1 1 5648AEC4
P 5900 8600
F 0 "R2" V 6050 8600 50  0000 C CNN
F 1 "4k7" V 5900 8600 50  0000 C CNN
F 2 "Resistors:RES_0402" V 5980 8700 28  0001 C CNN
F 3 "" H 5900 8600 60  0000 C CNN
	1    5900 8600
	0    1    1    0   
$EndComp
$Comp
L +BATT #PWR021
U 1 1 5648AF51
P 5500 8500
F 0 "#PWR021" H 5500 8460 30  0001 C CNN
F 1 "+BATT" H 5580 8530 30  0000 C CNN
F 2 "" H 5500 8500 60  0000 C CNN
F 3 "" H 5500 8500 60  0000 C CNN
	1    5500 8500
	-1   0    0    1   
$EndComp
Wire Wire Line
	5500 8500 5650 8500
Wire Wire Line
	5650 8400 5650 8600
Connection ~ 5650 8500
Text Label 6550 8600 2    60   ~ 0
I2C_SDA
Text Label 6550 8400 2    60   ~ 0
I2C_SCL
Wire Wire Line
	6150 8400 6550 8400
Wire Wire Line
	6150 8600 6550 8600
Text Label 2050 8300 0    60   ~ 0
I2C_SCL
Text Label 2050 8400 0    60   ~ 0
I2C_SDA
Text Label 2050 8550 0    60   ~ 0
ACC_INT1
Wire Wire Line
	2550 8300 2050 8300
Wire Wire Line
	2550 8400 2050 8400
Wire Wire Line
	2550 8550 2050 8550
NoConn ~ 2550 8650
Text Label 6550 2700 0    60   ~ 0
I2C_SCL
Text Label 6550 2550 0    60   ~ 0
I2C_SDA
Text Label 10600 2100 2    60   ~ 0
ACC_INT1
$Comp
L LED D1
U 1 1 56489C07
P 5900 2150
F 0 "D1" H 6000 2290 50  0000 C CNN
F 1 "LED" H 5820 2290 50  0000 C CNN
F 2 "LEDs:LED_0603" H 5900 2150 60  0001 C CNN
F 3 "" H 5900 2150 60  0000 C CNN
	1    5900 2150
	-1   0    0    1   
$EndComp
$Comp
L R R3
U 1 1 56489CC6
P 6550 2150
F 0 "R3" V 6630 2000 50  0000 C CNN
F 1 "100R" V 6550 2150 50  0000 C CNN
F 2 "Resistors:RES_0402" V 6630 2250 28  0001 C CNN
F 3 "" H 6550 2150 60  0000 C CNN
	1    6550 2150
	0    1    1    0   
$EndComp
$Comp
L GND #PWR022
U 1 1 5648A1C4
P 5450 2350
F 0 "#PWR022" H 5540 2330 30  0001 C CNN
F 1 "GND" H 5450 2270 30  0001 C CNN
F 2 "" H 5450 2350 60  0000 C CNN
F 3 "" H 5450 2350 60  0000 C CNN
	1    5450 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 2150 5450 2150
Wire Wire Line
	5450 2150 5450 2350
$Comp
L LED D3
U 1 1 5648A4BE
P 11450 2600
F 0 "D3" H 11550 2740 50  0000 C CNN
F 1 "LED" H 11370 2740 50  0000 C CNN
F 2 "LEDs:LED_0603" H 11450 2600 60  0001 C CNN
F 3 "" H 11450 2600 60  0000 C CNN
	1    11450 2600
	1    0    0    -1  
$EndComp
$Comp
L LED D4
U 1 1 5648A575
P 11450 2900
F 0 "D4" H 11550 3040 50  0000 C CNN
F 1 "LED" H 11370 3040 50  0000 C CNN
F 2 "LEDs:LED_0603" H 11450 2900 60  0001 C CNN
F 3 "" H 11450 2900 60  0000 C CNN
	1    11450 2900
	1    0    0    -1  
$EndComp
$Comp
L R R5
U 1 1 5648A5E6
P 10850 2600
F 0 "R5" V 10750 2600 50  0000 C CNN
F 1 "100R" V 10850 2600 50  0000 C CNN
F 2 "Resistors:RES_0402" V 10930 2700 28  0001 C CNN
F 3 "" H 10850 2600 60  0000 C CNN
	1    10850 2600
	0    1    1    0   
$EndComp
$Comp
L R R6
U 1 1 5648A67F
P 10850 2900
F 0 "R6" V 10950 2850 50  0000 C CNN
F 1 "100R" V 10850 2900 50  0000 C CNN
F 2 "Resistors:RES_0402" V 10930 3000 28  0001 C CNN
F 3 "" H 10850 2900 60  0000 C CNN
	1    10850 2900
	0    1    1    0   
$EndComp
Wire Wire Line
	10100 2700 10600 2700
Wire Wire Line
	10600 2700 10600 2600
Wire Wire Line
	10100 2800 10600 2800
Wire Wire Line
	10600 2800 10600 2900
Wire Wire Line
	11100 2600 11250 2600
Wire Wire Line
	11100 2900 11250 2900
$Comp
L GND #PWR023
U 1 1 5648A87D
P 11900 2600
F 0 "#PWR023" H 11990 2580 30  0001 C CNN
F 1 "GND" H 11900 2520 30  0001 C CNN
F 2 "" H 11900 2600 60  0000 C CNN
F 3 "" H 11900 2600 60  0000 C CNN
	1    11900 2600
	0    1    1    0   
$EndComp
$Comp
L GND #PWR024
U 1 1 5648A8C5
P 11900 2900
F 0 "#PWR024" H 11990 2880 30  0001 C CNN
F 1 "GND" H 11900 2820 30  0001 C CNN
F 2 "" H 11900 2900 60  0000 C CNN
F 3 "" H 11900 2900 60  0000 C CNN
	1    11900 2900
	0    1    1    0   
$EndComp
Wire Wire Line
	11650 2600 11900 2600
Wire Wire Line
	11650 2900 11900 2900
Wire Wire Line
	6800 2150 7000 2150
Wire Wire Line
	6100 2150 6300 2150
Connection ~ 11350 7550
Wire Wire Line
	11750 7550 11750 7600
Connection ~ 11750 7550
Wire Wire Line
	10750 8650 10450 8650
Wire Wire Line
	10650 7550 12050 7550
Wire Wire Line
	12050 7550 12050 8150
Wire Wire Line
	12050 8350 11750 8350
Wire Wire Line
	11750 8000 11750 8450
Connection ~ 11750 8350
$Comp
L CONN_3 XL4
U 1 1 5648B6D3
P 2050 3900
F 0 "XL4" V 2000 3900 40  0000 C CNN
F 1 "CONN_3" V 2100 3900 40  0000 C CNN
F 2 "Connectors:PLS-3" H 2050 3900 60  0001 C CNN
F 3 "" H 2050 3900 60  0000 C CNN
	1    2050 3900
	1    0    0    1   
$EndComp
$Comp
L ST_SWD XL1
U 1 1 5648BB15
P 2050 2300
F 0 "XL1" H 1900 2600 60  0000 C CNN
F 1 "ST_SWD" H 2250 2600 60  0000 C CNN
F 2 "Connectors:PLS-4" H 2050 2300 60  0001 C CNN
F 3 "" H 2050 2300 60  0000 C CNN
	1    2050 2300
	1    0    0    -1  
$EndComp
$Comp
L +BATT #PWR025
U 1 1 5648BB9C
P 2600 2350
F 0 "#PWR025" H 2600 2310 30  0001 C CNN
F 1 "+BATT" H 2680 2380 30  0000 C CNN
F 2 "" H 2600 2350 60  0000 C CNN
F 3 "" H 2600 2350 60  0000 C CNN
	1    2600 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 2350 2600 2350
$Comp
L GND #PWR026
U 1 1 5648BD96
P 2500 2550
F 0 "#PWR026" H 2590 2530 30  0001 C CNN
F 1 "GND" H 2500 2470 30  0001 C CNN
F 2 "" H 2500 2550 60  0000 C CNN
F 3 "" H 2500 2550 60  0000 C CNN
	1    2500 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 2450 2500 2450
Wire Wire Line
	2500 2450 2500 2550
Text Label 2500 2150 0    60   ~ 0
SWCLK
Text Label 2500 2250 0    60   ~ 0
SWDIO
Wire Wire Line
	2400 2150 2500 2150
Wire Wire Line
	2400 2250 2500 2250
Text Label 10600 3200 2    60   ~ 0
SWCLK
Text Label 10600 3100 2    60   ~ 0
SWDIO
Text Label 2400 3900 0    60   ~ 0
UART_TX
Text Label 2400 3800 0    60   ~ 0
UART_RX
$Comp
L GND #PWR027
U 1 1 5648CA97
P 2400 4100
F 0 "#PWR027" H 2490 4080 30  0001 C CNN
F 1 "GND" H 2400 4020 30  0001 C CNN
F 2 "" H 2400 4100 60  0000 C CNN
F 3 "" H 2400 4100 60  0000 C CNN
	1    2400 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 3800 2400 3800
Wire Wire Line
	2250 3900 2400 3900
Wire Wire Line
	2250 4000 2400 4000
Wire Wire Line
	2400 4000 2400 4100
Text Label 10600 2400 2    60   ~ 0
UART_RX
Text Label 10600 2300 2    60   ~ 0
UART_TX
Wire Notes Line
	500  6450 15950 6450
Wire Notes Line
	8200 6450 8200 11100
Text Notes 2300 1850 2    60   ~ 0
Programming
Text Notes 2250 3600 2    60   ~ 0
Debug port
Text Notes 3500 7850 2    60   ~ 0
Accelerometer
Text Notes 11300 7200 2    60   ~ 0
Vibro
NoConn ~ 17600 2100
Text Label 11750 8300 1    60   ~ 0
Vibro_out
$Comp
L STM32F042F6P6 DD2
U 1 1 564DD21B
P 8550 2750
F 0 "DD2" H 8050 3600 60  0000 C CNN
F 1 "STM32F042F6P6" H 8600 3600 60  0000 C CNN
F 2 "SO_DIL_TSSOP:TSSOP20" H 8600 1850 60  0001 C CNN
F 3 "" H 8600 1850 60  0000 C CNN
	1    8550 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	10100 2100 10600 2100
NoConn ~ 10100 2200
Wire Wire Line
	10100 2300 10600 2300
Wire Wire Line
	10100 2400 10600 2400
Wire Wire Line
	10100 2500 10600 2500
NoConn ~ 10100 2600
Wire Wire Line
	10100 3100 10600 3100
Wire Wire Line
	10100 3200 10600 3200
NoConn ~ 10100 2900
NoConn ~ 10100 3000
Wire Wire Line
	6550 2550 7000 2550
Wire Wire Line
	6550 2700 7000 2700
NoConn ~ 7000 2300
NoConn ~ 7000 2950
$EndSCHEMATC
