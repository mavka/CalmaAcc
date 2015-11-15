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
L STM32F042G4 DD?
U 1 1 564689D6
P 9350 3350
F 0 "DD?" H 8850 4800 60  0000 C CNN
F 1 "STM32F042G4" H 9400 4800 60  0000 C CNN
F 2 "" H 9400 3050 60  0000 C CNN
F 3 "" H 9400 3050 60  0000 C CNN
	1    9350 3350
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 56470FC3
P 7500 4000
F 0 "C?" H 7400 3900 50  0000 L CNN
F 1 "0.1u" H 7400 4100 50  0000 L CNN
F 2 "CAP_0603" V 7600 3850 28  0000 C BNN
F 3 "" H 7500 4000 60  0000 C CNN
	1    7500 4000
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 5647102D
P 7200 4000
F 0 "C?" H 7100 3900 50  0000 L CNN
F 1 "0.1u" H 7100 4100 50  0000 L CNN
F 2 "CAP_0603" V 7300 3850 28  0000 C BNN
F 3 "" H 7200 4000 60  0000 C CNN
	1    7200 4000
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 5647104C
P 6900 4000
F 0 "C?" H 6800 3900 50  0000 L CNN
F 1 "4.7u" H 6800 4100 50  0000 L CNN
F 2 "CAP_0603" V 7000 3850 28  0000 C BNN
F 3 "" H 6900 4000 60  0000 C CNN
	1    6900 4000
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 56471098
P 6600 4000
F 0 "C?" H 6500 3900 50  0000 L CNN
F 1 "10n" H 6500 4100 50  0000 L CNN
F 2 "CAP_0603" V 6700 3850 28  0000 C BNN
F 3 "" H 6600 4000 60  0000 C CNN
	1    6600 4000
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 564710BB
P 6300 4000
F 0 "C?" H 6200 3900 50  0000 L CNN
F 1 "1u" H 6200 4100 50  0000 L CNN
F 2 "CAP_0603" V 6400 3850 28  0000 C BNN
F 3 "" H 6300 4000 60  0000 C CNN
	1    6300 4000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 56471133
P 7500 4400
F 0 "#PWR?" H 7590 4380 30  0001 C CNN
F 1 "GND" H 7500 4320 30  0001 C CNN
F 2 "" H 7500 4400 60  0000 C CNN
F 3 "" H 7500 4400 60  0000 C CNN
	1    7500 4400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 56471153
P 7200 4400
F 0 "#PWR?" H 7290 4380 30  0001 C CNN
F 1 "GND" H 7200 4320 30  0001 C CNN
F 2 "" H 7200 4400 60  0000 C CNN
F 3 "" H 7200 4400 60  0000 C CNN
	1    7200 4400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 56471173
P 6900 4400
F 0 "#PWR?" H 6990 4380 30  0001 C CNN
F 1 "GND" H 6900 4320 30  0001 C CNN
F 2 "" H 6900 4400 60  0000 C CNN
F 3 "" H 6900 4400 60  0000 C CNN
	1    6900 4400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 56471193
P 6600 4400
F 0 "#PWR?" H 6690 4380 30  0001 C CNN
F 1 "GND" H 6600 4320 30  0001 C CNN
F 2 "" H 6600 4400 60  0000 C CNN
F 3 "" H 6600 4400 60  0000 C CNN
	1    6600 4400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 564711B3
P 6300 4400
F 0 "#PWR?" H 6390 4380 30  0001 C CNN
F 1 "GND" H 6300 4320 30  0001 C CNN
F 2 "" H 6300 4400 60  0000 C CNN
F 3 "" H 6300 4400 60  0000 C CNN
	1    6300 4400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 564714EA
P 11000 3800
F 0 "#PWR?" H 11090 3780 30  0001 C CNN
F 1 "GND" H 11000 3720 30  0001 C CNN
F 2 "" H 11000 3800 60  0000 C CNN
F 3 "" H 11000 3800 60  0000 C CNN
	1    11000 3800
	1    0    0    -1  
$EndComp
NoConn ~ 7800 3300
NoConn ~ 7800 3100
NoConn ~ 7800 3000
$Comp
L BAT B?
U 1 1 56488297
P 2100 5550
F 0 "B?" H 2250 5750 60  0000 C CNN
F 1 "BAT" H 1850 5750 60  0000 C CNN
F 2 "" H 2100 5550 60  0000 C CNN
F 3 "" H 2100 5550 60  0000 C CNN
	1    2100 5550
	0    1    1    0   
$EndComp
$Comp
L GND #PWR?
U 1 1 56488406
P 1500 5550
F 0 "#PWR?" H 1590 5530 30  0001 C CNN
F 1 "GND" H 1500 5470 30  0001 C CNN
F 2 "" H 1500 5550 60  0000 C CNN
F 3 "" H 1500 5550 60  0000 C CNN
	1    1500 5550
	0    1    1    0   
$EndComp
$Comp
L +BATT #PWR?
U 1 1 56488459
P 2750 5550
F 0 "#PWR?" H 2750 5510 30  0001 C CNN
F 1 "+BATT" H 2830 5580 30  0000 C CNN
F 2 "" H 2750 5550 60  0000 C CNN
F 3 "" H 2750 5550 60  0000 C CNN
	1    2750 5550
	1    0    0    -1  
$EndComp
$Comp
L +BATT #PWR?
U 1 1 56488624
P 6200 3400
F 0 "#PWR?" H 6200 3360 30  0001 C CNN
F 1 "+BATT" H 6280 3430 30  0000 C CNN
F 2 "" H 6200 3400 60  0000 C CNN
F 3 "" H 6200 3400 60  0000 C CNN
	1    6200 3400
	-1   0    0    1   
$EndComp
$Comp
L +BATT #PWR?
U 1 1 56488665
P 6800 3500
F 0 "#PWR?" H 6800 3460 30  0001 C CNN
F 1 "+BATT" H 6880 3530 30  0000 C CNN
F 2 "" H 6800 3500 60  0000 C CNN
F 3 "" H 6800 3500 60  0000 C CNN
	1    6800 3500
	-1   0    0    1   
$EndComp
$Comp
L +BATT #PWR?
U 1 1 56488687
P 7400 3600
F 0 "#PWR?" H 7400 3560 30  0001 C CNN
F 1 "+BATT" H 7480 3630 30  0000 C CNN
F 2 "" H 7400 3600 60  0000 C CNN
F 3 "" H 7400 3600 60  0000 C CNN
	1    7400 3600
	-1   0    0    1   
$EndComp
Wire Wire Line
	7400 3600 7800 3600
Wire Wire Line
	7500 3600 7500 3800
Wire Wire Line
	6800 3500 7800 3500
Wire Wire Line
	6900 3500 6900 3800
Wire Wire Line
	7200 3800 7200 3500
Connection ~ 7200 3500
Wire Wire Line
	6200 3400 7800 3400
Wire Wire Line
	6300 3400 6300 3800
Wire Wire Line
	6600 3800 6600 3400
Connection ~ 6600 3400
Wire Wire Line
	7500 4200 7500 4400
Wire Wire Line
	7200 4200 7200 4400
Wire Wire Line
	6900 4200 6900 4400
Wire Wire Line
	6600 4200 6600 4400
Wire Wire Line
	6300 4200 6300 4400
Connection ~ 7500 3600
Connection ~ 6900 3500
Connection ~ 6300 3400
Wire Wire Line
	10900 3600 11000 3600
Wire Wire Line
	11000 3600 11000 3800
Wire Wire Line
	1850 5550 1500 5550
Wire Wire Line
	2300 5550 2750 5550
$Comp
L C C?
U 1 1 56488B03
P 11350 7800
F 0 "C?" H 11250 7700 50  0000 L CNN
F 1 "47u" H 11250 7900 50  0000 L CNN
F 2 "CAP_0805" V 11450 7650 28  0000 C BNN
F 3 "" H 11350 7800 60  0000 C CNN
	1    11350 7800
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 56488B5E
P 11050 7800
F 0 "C?" H 10950 7700 50  0000 L CNN
F 1 "47u" H 10950 7900 50  0000 L CNN
F 2 "CAP_0805" V 11150 7650 28  0000 C BNN
F 3 "" H 11050 7800 60  0000 C CNN
	1    11050 7800
	1    0    0    -1  
$EndComp
$Comp
L +BATT #PWR?
U 1 1 56488C25
P 10650 7550
F 0 "#PWR?" H 10650 7510 30  0001 C CNN
F 1 "+BATT" H 10730 7580 30  0000 C CNN
F 2 "" H 10650 7550 60  0000 C CNN
F 3 "" H 10650 7550 60  0000 C CNN
	1    10650 7550
	-1   0    0    1   
$EndComp
$Comp
L D_Shottky D?
U 1 1 56488C75
P 11750 7800
F 0 "D?" H 11750 7900 40  0000 C CNN
F 1 "BAT54WS" H 11750 7700 40  0000 C CNN
F 2 "" H 11750 7800 60  0000 C CNN
F 3 "" H 11750 7800 60  0000 C CNN
	1    11750 7800
	0    -1   -1   0   
$EndComp
$Comp
L CONN_2 XL?
U 1 1 56488D61
P 12250 8250
F 0 "XL?" V 12200 8250 40  0000 C CNN
F 1 "CONN_2" V 12300 8250 40  0000 C CNN
F 2 "" H 12250 8250 60  0000 C CNN
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
L GND #PWR?
U 1 1 56488E9B
P 11350 8150
F 0 "#PWR?" H 11440 8130 30  0001 C CNN
F 1 "GND" H 11350 8070 30  0001 C CNN
F 2 "" H 11350 8150 60  0000 C CNN
F 3 "" H 11350 8150 60  0000 C CNN
	1    11350 8150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 56488EC7
P 11050 8150
F 0 "#PWR?" H 11140 8130 30  0001 C CNN
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
L NPN Q?
U 1 1 56488F54
P 11700 8650
F 0 "Q?" H 11900 8700 60  0000 C CNN
F 1 "MMBT2222" H 12050 8600 60  0000 C CNN
F 2 "" H 11700 8650 60  0000 C CNN
F 3 "" H 11700 8650 60  0000 C CNN
	1    11700 8650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 56489007
P 11750 9050
F 0 "#PWR?" H 11840 9030 30  0001 C CNN
F 1 "GND" H 11750 8970 30  0001 C CNN
F 2 "" H 11750 9050 60  0000 C CNN
F 3 "" H 11750 9050 60  0000 C CNN
	1    11750 9050
	1    0    0    -1  
$EndComp
Wire Wire Line
	11750 8850 11750 9050
$Comp
L R R?
U 1 1 5648910B
P 11000 8650
F 0 "R?" V 11080 8500 50  0000 C CNN
F 1 "1k" V 11000 8650 50  0000 C CNN
F 2 "RES_0603" V 11080 8750 28  0000 C CNN
F 3 "" H 11000 8650 60  0000 C CNN
	1    11000 8650
	0    1    1    0   
$EndComp
Wire Wire Line
	11500 8650 11250 8650
Text Label 10450 8650 0    60   ~ 0
Vibro
Text Label 11250 2500 2    60   ~ 0
Vibro
Wire Wire Line
	10900 2500 11250 2500
$Comp
L MMA8452Q DD?
U 1 1 5648A46A
P 3250 8650
F 0 "DD?" H 3600 9150 60  0000 C CNN
F 1 "MMA8452Q" H 3000 9150 60  0000 C CNN
F 2 "" H 3250 8650 60  0000 C CNN
F 3 "" H 3250 8650 60  0000 C CNN
	1    3250 8650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5648A5B1
P 2950 9300
F 0 "#PWR?" H 3040 9280 30  0001 C CNN
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
L GND #PWR?
U 1 1 5648A6B6
P 4200 8300
F 0 "#PWR?" H 4290 8280 30  0001 C CNN
F 1 "GND" H 4200 8220 30  0001 C CNN
F 2 "" H 4200 8300 60  0000 C CNN
F 3 "" H 4200 8300 60  0000 C CNN
	1    4200 8300
	0    1    1    0   
$EndComp
Wire Wire Line
	3950 8300 4200 8300
$Comp
L C C?
U 1 1 5648A72C
P 4100 9000
F 0 "C?" H 4000 8900 50  0000 L CNN
F 1 "4.7u" H 4110 9100 50  0000 L CNN
F 2 "CAP_0603" V 4200 8850 28  0000 C BNN
F 3 "" H 4100 9000 60  0000 C CNN
	1    4100 9000
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 5648A771
P 4400 9000
F 0 "C?" H 4300 8900 50  0000 L CNN
F 1 "0.1u" H 4415 9105 50  0000 L CNN
F 2 "CAP_0603" V 4500 8850 28  0000 C BNN
F 3 "" H 4400 9000 60  0000 C CNN
	1    4400 9000
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 5648A7AA
P 4700 9000
F 0 "C?" H 4600 8900 50  0000 L CNN
F 1 "0.1u" H 4720 9110 50  0000 L CNN
F 2 "CAP_0603" V 4800 8850 28  0000 C BNN
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
L +BATT #PWR?
U 1 1 5648A8C3
P 4200 8700
F 0 "#PWR?" H 4200 8660 30  0001 C CNN
F 1 "+BATT" H 4280 8730 30  0000 C CNN
F 2 "" H 4200 8700 60  0000 C CNN
F 3 "" H 4200 8700 60  0000 C CNN
	1    4200 8700
	1    0    0    -1  
$EndComp
$Comp
L +BATT #PWR?
U 1 1 5648A8FB
P 4500 8600
F 0 "#PWR?" H 4500 8560 30  0001 C CNN
F 1 "+BATT" H 4580 8630 30  0000 C CNN
F 2 "" H 4500 8600 60  0000 C CNN
F 3 "" H 4500 8600 60  0000 C CNN
	1    4500 8600
	1    0    0    -1  
$EndComp
Connection ~ 4100 8700
Connection ~ 4400 8600
$Comp
L GND #PWR?
U 1 1 5648A9D2
P 4100 9350
F 0 "#PWR?" H 4190 9330 30  0001 C CNN
F 1 "GND" H 4100 9270 30  0001 C CNN
F 2 "" H 4100 9350 60  0000 C CNN
F 3 "" H 4100 9350 60  0000 C CNN
	1    4100 9350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5648AA0A
P 4400 9350
F 0 "#PWR?" H 4490 9330 30  0001 C CNN
F 1 "GND" H 4400 9270 30  0001 C CNN
F 2 "" H 4400 9350 60  0000 C CNN
F 3 "" H 4400 9350 60  0000 C CNN
	1    4400 9350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5648AA42
P 4700 9350
F 0 "#PWR?" H 4790 9330 30  0001 C CNN
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
L R R?
U 1 1 5648AE67
P 5900 8400
F 0 "R?" V 5800 8400 50  0000 C CNN
F 1 "4k7" V 5900 8400 50  0000 C CNN
F 2 "RES_0603" V 5980 8500 28  0000 C CNN
F 3 "" H 5900 8400 60  0000 C CNN
	1    5900 8400
	0    1    1    0   
$EndComp
$Comp
L R R?
U 1 1 5648AEC4
P 5900 8600
F 0 "R?" V 6050 8600 50  0000 C CNN
F 1 "4k7" V 5900 8600 50  0000 C CNN
F 2 "RES_0603" V 5980 8700 28  0000 C CNN
F 3 "" H 5900 8600 60  0000 C CNN
	1    5900 8600
	0    1    1    0   
$EndComp
$Comp
L +BATT #PWR?
U 1 1 5648AF51
P 5500 8500
F 0 "#PWR?" H 5500 8460 30  0001 C CNN
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
Text Label 7300 2600 0    60   ~ 0
I2C_SCL
Text Label 7300 2700 0    60   ~ 0
I2C_SDA
Wire Wire Line
	7300 2600 7800 2600
Wire Wire Line
	7300 2700 7800 2700
Text Label 11400 2100 2    60   ~ 0
ACC_INT1
Wire Wire Line
	10900 2100 11400 2100
$Comp
L LED D?
U 1 1 56489C07
P 6700 2100
F 0 "D?" H 6800 2240 50  0000 C CNN
F 1 "LED" H 6620 2240 50  0000 C CNN
F 2 "" H 6700 2100 60  0000 C CNN
F 3 "" H 6700 2100 60  0000 C CNN
	1    6700 2100
	-1   0    0    1   
$EndComp
$Comp
L R R?
U 1 1 56489CC6
P 7350 2100
F 0 "R?" V 7430 1950 50  0000 C CNN
F 1 "51R" V 7350 2100 50  0000 C CNN
F 2 "RES_0603" V 7430 2200 28  0000 C CNN
F 3 "" H 7350 2100 60  0000 C CNN
	1    7350 2100
	0    1    1    0   
$EndComp
$Comp
L GND #PWR?
U 1 1 5648A1C4
P 6250 2300
F 0 "#PWR?" H 6340 2280 30  0001 C CNN
F 1 "GND" H 6250 2220 30  0001 C CNN
F 2 "" H 6250 2300 60  0000 C CNN
F 3 "" H 6250 2300 60  0000 C CNN
	1    6250 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 2100 6250 2100
Wire Wire Line
	6250 2100 6250 2300
$Comp
L LED D?
U 1 1 5648A4BE
P 12250 2600
F 0 "D?" H 12350 2740 50  0000 C CNN
F 1 "LED" H 12170 2740 50  0000 C CNN
F 2 "" H 12250 2600 60  0000 C CNN
F 3 "" H 12250 2600 60  0000 C CNN
	1    12250 2600
	1    0    0    -1  
$EndComp
$Comp
L LED D?
U 1 1 5648A575
P 12250 2900
F 0 "D?" H 12350 3040 50  0000 C CNN
F 1 "LED" H 12170 3040 50  0000 C CNN
F 2 "" H 12250 2900 60  0000 C CNN
F 3 "" H 12250 2900 60  0000 C CNN
	1    12250 2900
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 5648A5E6
P 11650 2600
F 0 "R?" V 11550 2600 50  0000 C CNN
F 1 "51R" V 11650 2600 50  0000 C CNN
F 2 "RES_0603" V 11730 2700 28  0000 C CNN
F 3 "" H 11650 2600 60  0000 C CNN
	1    11650 2600
	0    1    1    0   
$EndComp
$Comp
L R R?
U 1 1 5648A67F
P 11650 2900
F 0 "R?" V 11750 2850 50  0000 C CNN
F 1 "51R" V 11650 2900 50  0000 C CNN
F 2 "RES_0603" V 11730 3000 28  0000 C CNN
F 3 "" H 11650 2900 60  0000 C CNN
	1    11650 2900
	0    1    1    0   
$EndComp
Wire Wire Line
	10900 2700 11400 2700
Wire Wire Line
	11400 2700 11400 2600
Wire Wire Line
	10900 2800 11400 2800
Wire Wire Line
	11400 2800 11400 2900
Wire Wire Line
	11900 2600 12050 2600
Wire Wire Line
	11900 2900 12050 2900
$Comp
L GND #PWR?
U 1 1 5648A87D
P 12700 2600
F 0 "#PWR?" H 12790 2580 30  0001 C CNN
F 1 "GND" H 12700 2520 30  0001 C CNN
F 2 "" H 12700 2600 60  0000 C CNN
F 3 "" H 12700 2600 60  0000 C CNN
	1    12700 2600
	0    1    1    0   
$EndComp
$Comp
L GND #PWR?
U 1 1 5648A8C5
P 12700 2900
F 0 "#PWR?" H 12790 2880 30  0001 C CNN
F 1 "GND" H 12700 2820 30  0001 C CNN
F 2 "" H 12700 2900 60  0000 C CNN
F 3 "" H 12700 2900 60  0000 C CNN
	1    12700 2900
	0    1    1    0   
$EndComp
Wire Wire Line
	12450 2600 12700 2600
Wire Wire Line
	12450 2900 12700 2900
Wire Wire Line
	7600 2100 7800 2100
Wire Wire Line
	6900 2100 7100 2100
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
L CONN_3 XL?
U 1 1 5648B6D3
P 2050 3900
F 0 "XL?" V 2000 3900 40  0000 C CNN
F 1 "CONN_3" V 2100 3900 40  0000 C CNN
F 2 "" H 2050 3900 60  0000 C CNN
F 3 "" H 2050 3900 60  0000 C CNN
	1    2050 3900
	1    0    0    1   
$EndComp
$Comp
L ST_SWD XL?
U 1 1 5648BB15
P 2050 2300
F 0 "XL?" H 1900 2600 60  0000 C CNN
F 1 "ST_SWD" H 2250 2600 60  0000 C CNN
F 2 "" H 2050 2300 60  0000 C CNN
F 3 "" H 2050 2300 60  0000 C CNN
	1    2050 2300
	1    0    0    -1  
$EndComp
$Comp
L +BATT #PWR?
U 1 1 5648BB9C
P 2600 2350
F 0 "#PWR?" H 2600 2310 30  0001 C CNN
F 1 "+BATT" H 2680 2380 30  0000 C CNN
F 2 "" H 2600 2350 60  0000 C CNN
F 3 "" H 2600 2350 60  0000 C CNN
	1    2600 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 2350 2600 2350
$Comp
L GND #PWR?
U 1 1 5648BD96
P 2500 2550
F 0 "#PWR?" H 2590 2530 30  0001 C CNN
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
Text Label 11300 3200 2    60   ~ 0
SWCLK
Wire Wire Line
	10900 3200 11300 3200
Text Label 11300 3100 2    60   ~ 0
SWDIO
Wire Wire Line
	10900 3100 11300 3100
Text Label 2400 3900 0    60   ~ 0
UART_TX
Text Label 2400 3800 0    60   ~ 0
UART_RX
$Comp
L GND #PWR?
U 1 1 5648CA97
P 2400 4100
F 0 "#PWR?" H 2490 4080 30  0001 C CNN
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
Text Label 11400 2400 2    60   ~ 0
UART_RX
Wire Wire Line
	10900 2400 11400 2400
Text Label 11400 2300 2    60   ~ 0
UART_TX
Wire Wire Line
	10900 2300 11400 2300
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
NoConn ~ 7800 2200
NoConn ~ 7800 2300
NoConn ~ 7800 2400
NoConn ~ 7800 2500
NoConn ~ 7800 2800
NoConn ~ 10900 2200
NoConn ~ 10900 2600
NoConn ~ 10900 2900
NoConn ~ 10900 3000
NoConn ~ 10900 3300
$EndSCHEMATC
