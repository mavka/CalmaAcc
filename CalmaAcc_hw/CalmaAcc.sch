EESchema Schematic File Version 2
LIBS:Connectors_kl
LIBS:pcb_details
LIBS:power
LIBS:Power_kl
LIBS:Tittar_kl
LIBS:st_kl
LIBS:Transistors_kl
LIBS:CalmaAcc-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
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
P 5800 3050
F 0 "DD?" H 5300 4500 60  0000 C CNN
F 1 "STM32F042G4" H 5850 4500 60  0000 C CNN
F 2 "" H 5850 2750 60  0000 C CNN
F 3 "" H 5850 2750 60  0000 C CNN
	1    5800 3050
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 56470FC3
P 3950 3700
F 0 "C?" H 3850 3600 50  0000 L CNN
F 1 "0.1u" H 3850 3800 50  0000 L CNN
F 2 "CAP_0603" V 4050 3550 28  0000 C BNN
F 3 "" H 3950 3700 60  0000 C CNN
	1    3950 3700
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 5647102D
P 3650 3700
F 0 "C?" H 3550 3600 50  0000 L CNN
F 1 "0.1u" H 3550 3800 50  0000 L CNN
F 2 "CAP_0603" V 3750 3550 28  0000 C BNN
F 3 "" H 3650 3700 60  0000 C CNN
	1    3650 3700
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 5647104C
P 3350 3700
F 0 "C?" H 3250 3600 50  0000 L CNN
F 1 "4.7u" H 3250 3800 50  0000 L CNN
F 2 "CAP_0603" V 3450 3550 28  0000 C BNN
F 3 "" H 3350 3700 60  0000 C CNN
	1    3350 3700
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 56471098
P 3050 3700
F 0 "C?" H 2950 3600 50  0000 L CNN
F 1 "10n" H 2950 3800 50  0000 L CNN
F 2 "CAP_0603" V 3150 3550 28  0000 C BNN
F 3 "" H 3050 3700 60  0000 C CNN
	1    3050 3700
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 564710BB
P 2750 3700
F 0 "C?" H 2650 3600 50  0000 L CNN
F 1 "1u" H 2650 3800 50  0000 L CNN
F 2 "CAP_0603" V 2850 3550 28  0000 C BNN
F 3 "" H 2750 3700 60  0000 C CNN
	1    2750 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 3300 4250 3300
Wire Wire Line
	3950 3300 3950 3500
Wire Wire Line
	3250 3200 4250 3200
Wire Wire Line
	3350 3200 3350 3500
Wire Wire Line
	3650 3500 3650 3200
Connection ~ 3650 3200
Wire Wire Line
	2650 3100 4250 3100
Wire Wire Line
	2750 3100 2750 3500
Wire Wire Line
	3050 3500 3050 3100
Connection ~ 3050 3100
$Comp
L GND #PWR?
U 1 1 56471133
P 3950 4100
F 0 "#PWR?" H 4040 4080 30  0001 C CNN
F 1 "GND" H 3950 4020 30  0001 C CNN
F 2 "" H 3950 4100 60  0000 C CNN
F 3 "" H 3950 4100 60  0000 C CNN
	1    3950 4100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 56471153
P 3650 4100
F 0 "#PWR?" H 3740 4080 30  0001 C CNN
F 1 "GND" H 3650 4020 30  0001 C CNN
F 2 "" H 3650 4100 60  0000 C CNN
F 3 "" H 3650 4100 60  0000 C CNN
	1    3650 4100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 56471173
P 3350 4100
F 0 "#PWR?" H 3440 4080 30  0001 C CNN
F 1 "GND" H 3350 4020 30  0001 C CNN
F 2 "" H 3350 4100 60  0000 C CNN
F 3 "" H 3350 4100 60  0000 C CNN
	1    3350 4100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 56471193
P 3050 4100
F 0 "#PWR?" H 3140 4080 30  0001 C CNN
F 1 "GND" H 3050 4020 30  0001 C CNN
F 2 "" H 3050 4100 60  0000 C CNN
F 3 "" H 3050 4100 60  0000 C CNN
	1    3050 4100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 564711B3
P 2750 4100
F 0 "#PWR?" H 2840 4080 30  0001 C CNN
F 1 "GND" H 2750 4020 30  0001 C CNN
F 2 "" H 2750 4100 60  0000 C CNN
F 3 "" H 2750 4100 60  0000 C CNN
	1    2750 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 3900 3950 4100
Wire Wire Line
	3650 3900 3650 4100
Wire Wire Line
	3350 3900 3350 4100
Wire Wire Line
	3050 3900 3050 4100
Wire Wire Line
	2750 3900 2750 4100
$Comp
L +3.3V #PWR?
U 1 1 56471423
P 3850 3300
F 0 "#PWR?" H 3850 3260 30  0001 C CNN
F 1 "+3.3V" H 3930 3330 30  0000 C CNN
F 2 "" H 3850 3300 60  0000 C CNN
F 3 "" H 3850 3300 60  0000 C CNN
	1    3850 3300
	-1   0    0    1   
$EndComp
$Comp
L +3.3V #PWR?
U 1 1 56471443
P 3250 3200
F 0 "#PWR?" H 3250 3160 30  0001 C CNN
F 1 "+3.3V" H 3330 3230 30  0000 C CNN
F 2 "" H 3250 3200 60  0000 C CNN
F 3 "" H 3250 3200 60  0000 C CNN
	1    3250 3200
	-1   0    0    1   
$EndComp
$Comp
L +3.3V #PWR?
U 1 1 5647147F
P 2650 3100
F 0 "#PWR?" H 2650 3060 30  0001 C CNN
F 1 "+3.3V" H 2730 3130 30  0000 C CNN
F 2 "" H 2650 3100 60  0000 C CNN
F 3 "" H 2650 3100 60  0000 C CNN
	1    2650 3100
	-1   0    0    1   
$EndComp
Connection ~ 3950 3300
Connection ~ 3350 3200
Connection ~ 2750 3100
$Comp
L GND #PWR?
U 1 1 564714EA
P 7450 3500
F 0 "#PWR?" H 7540 3480 30  0001 C CNN
F 1 "GND" H 7450 3420 30  0001 C CNN
F 2 "" H 7450 3500 60  0000 C CNN
F 3 "" H 7450 3500 60  0000 C CNN
	1    7450 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 3300 7450 3300
Wire Wire Line
	7450 3300 7450 3500
NoConn ~ 4250 3000
NoConn ~ 4250 2800
NoConn ~ 4250 2700
$EndSCHEMATC
