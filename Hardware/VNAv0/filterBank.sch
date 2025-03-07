EESchema Schematic File Version 4
LIBS:VNA-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 6 8
Title "Filter Bank"
Date "2019-04-06"
Rev "0"
Comp "Josh Johnson"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	8000 3100 8000 3150
Wire Wire Line
	8000 3150 8100 3150
Wire Wire Line
	8700 3100 8700 3150
Wire Wire Line
	8600 3100 8600 3150
Connection ~ 8600 3150
Wire Wire Line
	8600 3150 8700 3150
Wire Wire Line
	8500 3100 8500 3150
Connection ~ 8500 3150
Wire Wire Line
	8500 3150 8600 3150
Wire Wire Line
	8400 3100 8400 3150
Connection ~ 8400 3150
Wire Wire Line
	8400 3150 8500 3150
Wire Wire Line
	8300 3100 8300 3150
Connection ~ 8300 3150
Wire Wire Line
	8300 3150 8400 3150
Wire Wire Line
	8200 3100 8200 3150
Connection ~ 8200 3150
Wire Wire Line
	8200 3150 8300 3150
Wire Wire Line
	8100 3100 8100 3150
Connection ~ 8100 3150
Wire Wire Line
	8100 3150 8200 3150
$Comp
L power:GND #PWR081
U 1 1 5C2A3D55
P 8700 3200
F 0 "#PWR081" H 8700 2950 50  0001 C CNN
F 1 "GND" H 8705 3027 50  0000 C CNN
F 2 "" H 8700 3200 50  0001 C CNN
F 3 "" H 8700 3200 50  0001 C CNN
	1    8700 3200
	1    0    0    -1  
$EndComp
Connection ~ 8700 3150
NoConn ~ 8800 3100
$Comp
L Device:C C48
U 1 1 5C2A3E6B
P 8600 1850
F 0 "C48" V 8450 1850 50  0000 C CNN
F 1 "10n" V 8750 1850 50  0000 C CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 8638 1700 50  0001 C CNN
F 3 "~" H 8600 1850 50  0001 C CNN
	1    8600 1850
	0    1    1    0   
$EndComp
Wire Wire Line
	8450 2000 8450 1850
Connection ~ 8450 1850
Wire Wire Line
	8450 1850 8450 1700
Wire Wire Line
	8750 1850 8750 1950
$Comp
L power:GND #PWR082
U 1 1 5C2A413F
P 8750 1950
F 0 "#PWR082" H 8750 1700 50  0001 C CNN
F 1 "GND" H 8755 1777 50  0000 C CNN
F 2 "" H 8750 1950 50  0001 C CNN
F 3 "" H 8750 1950 50  0001 C CNN
	1    8750 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 3050 3700 3100
Wire Wire Line
	3700 3100 3600 3100
Wire Wire Line
	3000 3050 3000 3100
Wire Wire Line
	3100 3050 3100 3100
Connection ~ 3100 3100
Wire Wire Line
	3100 3100 3000 3100
Wire Wire Line
	3200 3050 3200 3100
Connection ~ 3200 3100
Wire Wire Line
	3200 3100 3100 3100
Wire Wire Line
	3300 3050 3300 3100
Connection ~ 3300 3100
Wire Wire Line
	3300 3100 3200 3100
Wire Wire Line
	3400 3050 3400 3100
Connection ~ 3400 3100
Wire Wire Line
	3400 3100 3300 3100
Wire Wire Line
	3500 3050 3500 3100
Connection ~ 3500 3100
Wire Wire Line
	3500 3100 3400 3100
Wire Wire Line
	3600 3050 3600 3100
Connection ~ 3600 3100
Wire Wire Line
	3600 3100 3500 3100
$Comp
L power:GND #PWR074
U 1 1 5C2A4744
P 3000 3150
F 0 "#PWR074" H 3000 2900 50  0001 C CNN
F 1 "GND" H 3005 2977 50  0000 C CNN
F 2 "" H 3000 3150 50  0001 C CNN
F 3 "" H 3000 3150 50  0001 C CNN
	1    3000 3150
	-1   0    0    -1  
$EndComp
Connection ~ 3000 3100
NoConn ~ 2900 3050
Wire Wire Line
	3550 1800 3550 1900
$Comp
L power:GND #PWR075
U 1 1 5C2A475D
P 3550 1900
F 0 "#PWR075" H 3550 1650 50  0001 C CNN
F 1 "GND" H 3555 1727 50  0000 C CNN
F 2 "" H 3550 1900 50  0001 C CNN
F 3 "" H 3550 1900 50  0001 C CNN
	1    3550 1900
	1    0    0    -1  
$EndComp
Text Label 4600 2250 2    50   ~ 0
SW_1_RF_1
Text Label 4600 2350 2    50   ~ 0
SW_1_RF_2
Text Label 4600 2450 2    50   ~ 0
SW_1_RF_3
Text Label 4600 2550 2    50   ~ 0
SW_1_RF_4
Text Label 6650 2250 2    50   ~ 0
SW_2_RF_3
Text Label 6650 2950 2    50   ~ 0
SW_2_RF_4
Text Label 3000 6500 2    50   ~ 0
SW_1_CTRL_1
Wire Wire Line
	1400 7000 1600 7000
Wire Wire Line
	2200 7000 2250 7000
Wire Wire Line
	1600 7100 1500 7100
Wire Wire Line
	1500 7100 1500 7200
$Comp
L power:GND #PWR073
U 1 1 5C2BF9CA
P 1500 7200
F 0 "#PWR073" H 1500 6950 50  0001 C CNN
F 1 "GND" H 1505 7027 50  0000 C CNN
F 2 "" H 1500 7200 50  0001 C CNN
F 3 "" H 1500 7200 50  0001 C CNN
	1    1500 7200
	1    0    0    -1  
$EndComp
Text Label 3000 7550 2    50   ~ 0
SW_2_CTRL_1
Text Label 3000 6600 2    50   ~ 0
SW_1_CTRL_2
Wire Wire Line
	1200 6600 1200 7650
Wire Wire Line
	2200 7100 2300 7100
Wire Wire Line
	2300 7550 2300 7100
Wire Wire Line
	2300 7550 3000 7550
Wire Wire Line
	1200 7650 3000 7650
Text Label 3000 7650 2    50   ~ 0
SW_2_CTRL_2
Text Notes 750  5950 0    50   ~ 0
SW 1
Text Notes 800  6050 0    50   ~ 0
1
Text Notes 800  6150 0    50   ~ 0
2
Text Notes 800  6250 0    50   ~ 0
3
Text Notes 800  6350 0    50   ~ 0
4
Text Notes 1050 5950 0    50   ~ 0
CTRL 1
Text Notes 1400 5950 0    50   ~ 0
CTRL 2
Wire Notes Line
	1000 5900 1000 6350
Wire Notes Line
	1350 5900 1350 6350
Text Notes 1500 6050 0    50   ~ 0
0
Text Notes 1500 6250 0    50   ~ 0
0
Text Notes 1500 6150 0    50   ~ 0
1
Text Notes 1500 6350 0    50   ~ 0
1
Text Notes 1900 5950 0    50   ~ 0
SW 2
Text Notes 1950 6250 0    50   ~ 0
1
Text Notes 1950 6350 0    50   ~ 0
2
Text Notes 1950 6050 0    50   ~ 0
3
Text Notes 1950 6150 0    50   ~ 0
4
Text Notes 2200 5950 0    50   ~ 0
CTRL 1
Text Notes 2550 5950 0    50   ~ 0
CTRL 2
Wire Notes Line
	2150 5900 2150 6350
Wire Notes Line
	2500 5900 2500 6350
Text Notes 2650 6050 0    50   ~ 0
0
Text Notes 2650 6250 0    50   ~ 0
0
Text Notes 2650 6150 0    50   ~ 0
1
Text Notes 2650 6350 0    50   ~ 0
1
Wire Notes Line
	1850 5950 2850 5950
Wire Notes Line
	700  5950 1700 5950
Text Notes 1150 6050 0    50   ~ 0
0
Text Notes 1150 6150 0    50   ~ 0
0
Text Notes 1150 6250 0    50   ~ 0
1
Text Notes 1150 6350 0    50   ~ 0
1
Text Notes 2300 6050 0    50   ~ 0
1
Text Notes 2300 6150 0    50   ~ 0
1
Text Notes 2300 6250 0    50   ~ 0
0
Text Notes 2300 6350 0    50   ~ 0
0
Text Notes 950  5400 0    100  ~ 0
Switch Configuration\n
Text Notes 850  5750 0    50   ~ 0
74AHC1G04 is a not gate, used to allow the below \ntruth tables to be correct with only two control\nlines following the values in the first table
Wire Wire Line
	1200 6600 3000 6600
Wire Wire Line
	1400 7000 1400 6500
Wire Wire Line
	1400 6500 3000 6500
Text Label 6700 3650 2    50   ~ 0
SW_2_RF_1
Text Label 6700 4400 2    50   ~ 0
SW_2_RF_2
Wire Wire Line
	5300 2450 5250 2450
Wire Wire Line
	5250 2450 5250 2550
Wire Wire Line
	5300 2550 5250 2550
Connection ~ 5250 2550
Wire Wire Line
	5250 2550 5250 2600
$Comp
L power:GND #PWR077
U 1 1 5C3B9385
P 5250 2600
F 0 "#PWR077" H 5250 2350 50  0001 C CNN
F 1 "GND" H 5255 2427 50  0000 C CNN
F 2 "" H 5250 2600 50  0001 C CNN
F 3 "" H 5250 2600 50  0001 C CNN
	1    5250 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 3150 5250 3150
Wire Wire Line
	5250 3150 5250 3250
Wire Wire Line
	5300 3250 5250 3250
Connection ~ 5250 3250
Wire Wire Line
	5250 3250 5250 3300
$Comp
L power:GND #PWR078
U 1 1 5C3B9438
P 5250 3300
F 0 "#PWR078" H 5250 3050 50  0001 C CNN
F 1 "GND" H 5255 3127 50  0000 C CNN
F 2 "" H 5250 3300 50  0001 C CNN
F 3 "" H 5250 3300 50  0001 C CNN
	1    5250 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 3850 5250 3850
Wire Wire Line
	5250 3850 5250 3950
Wire Wire Line
	5300 3950 5250 3950
Connection ~ 5250 3950
Wire Wire Line
	5250 3950 5250 4000
$Comp
L power:GND #PWR079
U 1 1 5C3BCF2E
P 5250 4000
F 0 "#PWR079" H 5250 3750 50  0001 C CNN
F 1 "GND" H 5255 3827 50  0000 C CNN
F 2 "" H 5250 4000 50  0001 C CNN
F 3 "" H 5250 4000 50  0001 C CNN
	1    5250 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 4600 5250 4600
Wire Wire Line
	5250 4600 5250 4700
Wire Wire Line
	5300 4700 5250 4700
Connection ~ 5250 4700
Wire Wire Line
	5250 4700 5250 4750
$Comp
L power:GND #PWR080
U 1 1 5C3C0D3B
P 5250 4750
F 0 "#PWR080" H 5250 4500 50  0001 C CNN
F 1 "GND" H 5255 4577 50  0000 C CNN
F 2 "" H 5250 4750 50  0001 C CNN
F 3 "" H 5250 4750 50  0001 C CNN
	1    5250 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 1650 3250 1800
Wire Wire Line
	2500 2250 2600 2250
Wire Wire Line
	9100 2300 9200 2300
$Comp
L Device:C C47
U 1 1 5C3FF7F1
P 3400 1800
F 0 "C47" V 3250 1800 50  0000 C CNN
F 1 "10n" V 3550 1800 50  0000 C CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 3438 1650 50  0001 C CNN
F 3 "~" H 3400 1800 50  0001 C CNN
	1    3400 1800
	0    1    1    0   
$EndComp
Connection ~ 3250 1800
Wire Wire Line
	3250 1800 3250 1950
Text Notes 5300 1750 0    100  ~ 0
Filter Bank
Text Notes 3050 1350 0    100  ~ 0
Switch 1
Text Notes 8150 1400 0    100  ~ 0
Switch 2
Connection ~ 1200 6600
Connection ~ 1400 6500
Wire Wire Line
	1200 6600 850  6600
Wire Wire Line
	1400 6500 850  6500
Text HLabel 2500 2250 0    50   Input ~ 0
RF_IN
Text HLabel 9200 2300 2    50   Input ~ 0
RF_OUT
Text HLabel 850  6500 0    50   Input ~ 0
CTRL1
Text HLabel 850  6600 0    50   Input ~ 0
CTRL2
Wire Wire Line
	5000 2350 5000 2950
Wire Wire Line
	4050 2350 5000 2350
Wire Wire Line
	5000 2950 5300 2950
Wire Wire Line
	4850 2450 4850 3650
Wire Wire Line
	4050 2450 4850 2450
Wire Wire Line
	4850 3650 5300 3650
Wire Wire Line
	4700 2550 4700 4400
Wire Wire Line
	4050 2550 4700 2550
Wire Wire Line
	4700 4400 5300 4400
Wire Wire Line
	2600 2550 2050 2550
Wire Wire Line
	2600 2450 2050 2450
Text Label 2050 2550 0    50   ~ 0
SW_1_CTRL_2
Text Label 2050 2450 0    50   ~ 0
SW_1_CTRL_1
Wire Wire Line
	9100 2600 9650 2600
Wire Wire Line
	9100 2500 9650 2500
Text Label 9650 2600 2    50   ~ 0
SW_2_CTRL_2
Text Label 9650 2500 2    50   ~ 0
SW_2_CTRL_1
Wire Wire Line
	4050 2250 5300 2250
Wire Wire Line
	3000 3150 3000 3100
Wire Wire Line
	8700 3200 8700 3150
Wire Wire Line
	6800 2250 6800 2500
Wire Wire Line
	6800 2500 7650 2500
Wire Wire Line
	6150 2250 6800 2250
Wire Wire Line
	6800 2950 6800 2600
Wire Wire Line
	6800 2600 7650 2600
Wire Wire Line
	6150 2950 6800 2950
Wire Wire Line
	7000 3650 7000 2300
Wire Wire Line
	7000 2300 7650 2300
Wire Wire Line
	6150 3650 7000 3650
Wire Wire Line
	7200 2400 7200 4400
Wire Wire Line
	7200 2400 7650 2400
Wire Wire Line
	6150 4400 7200 4400
Text HLabel 3250 1650 1    50   Input ~ 0
3V3A
Text HLabel 8450 1700 1    50   Input ~ 0
3V3A
Text HLabel 2300 6850 2    50   Input ~ 0
3V3A
Wire Wire Line
	2300 6850 2250 6850
Wire Wire Line
	2250 6850 2250 7000
Wire Wire Line
	4300 6700 4200 6700
Wire Wire Line
	4300 7100 4200 7100
Wire Wire Line
	4200 7100 4200 7200
$Comp
L power:GND #PWR076
U 1 1 5CE265C0
P 4200 7200
F 0 "#PWR076" H 4200 6950 50  0001 C CNN
F 1 "GND" H 4205 7027 50  0000 C CNN
F 2 "" H 4200 7200 50  0001 C CNN
F 3 "" H 4200 7200 50  0001 C CNN
	1    4200 7200
	1    0    0    -1  
$EndComp
Text HLabel 4200 6500 1    50   Input ~ 0
3V3
Wire Wire Line
	4200 6500 4200 6700
Text HLabel 4250 6850 0    50   Input ~ 0
CTRL1
Text HLabel 4250 6950 0    50   Input ~ 0
CTRL2
Wire Wire Line
	4300 6850 4250 6850
Wire Wire Line
	4250 6950 4300 6950
Wire Wire Line
	5650 7250 5450 7250
Wire Wire Line
	5950 6650 6200 6650
Wire Wire Line
	5650 7050 5450 7050
Wire Wire Line
	5950 6850 6200 6850
Wire Wire Line
	5650 6850 5450 6850
Wire Wire Line
	5950 7050 6200 7050
$Comp
L Device:R R29
U 1 1 5CE52EA5
P 5800 6650
F 0 "R29" V 5850 6800 50  0000 C CNN
F 1 "470R" V 5750 6450 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5730 6650 50  0001 C CNN
F 3 "~" H 5800 6650 50  0001 C CNN
	1    5800 6650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5650 6650 5450 6650
Wire Wire Line
	5950 7250 6200 7250
Wire Wire Line
	4900 6750 5000 6750
Wire Wire Line
	5000 6750 5000 6650
Wire Wire Line
	5000 6650 5150 6650
Wire Wire Line
	4900 6850 5150 6850
Wire Wire Line
	4900 6950 5000 6950
Wire Wire Line
	5000 6950 5000 7050
Wire Wire Line
	5000 7050 5150 7050
Wire Wire Line
	4900 7050 4950 7050
Wire Wire Line
	4950 7050 4950 7250
Wire Wire Line
	4950 7250 5150 7250
Wire Wire Line
	6200 6650 6200 6850
Connection ~ 6200 6850
Wire Wire Line
	6200 6850 6200 7050
Connection ~ 6200 7050
Wire Wire Line
	6200 7050 6200 7250
Text HLabel 6200 6500 1    50   Input ~ 0
3V3
Wire Wire Line
	6200 6500 6200 6650
Connection ~ 6200 6650
$Comp
L Device:LED D7
U 1 1 5CE985A0
P 5300 6650
F 0 "D7" H 5200 6700 50  0000 C CNN
F 1 "LED" H 5450 6600 50  0000 C CNN
F 2 "LED_SMD:LED_0603_1608Metric" H 5300 6650 50  0001 C CNN
F 3 "~" H 5300 6650 50  0001 C CNN
	1    5300 6650
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D8
U 1 1 5CE98C5F
P 5300 6850
F 0 "D8" H 5200 6900 50  0000 C CNN
F 1 "LED" H 5450 6800 50  0000 C CNN
F 2 "LED_SMD:LED_0603_1608Metric" H 5300 6850 50  0001 C CNN
F 3 "~" H 5300 6850 50  0001 C CNN
	1    5300 6850
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D9
U 1 1 5CE99060
P 5300 7050
F 0 "D9" H 5200 7100 50  0000 C CNN
F 1 "LED" H 5450 7000 50  0000 C CNN
F 2 "LED_SMD:LED_0603_1608Metric" H 5300 7050 50  0001 C CNN
F 3 "~" H 5300 7050 50  0001 C CNN
	1    5300 7050
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D10
U 1 1 5CE99352
P 5300 7250
F 0 "D10" H 5200 7300 50  0000 C CNN
F 1 "LED" H 5450 7200 50  0000 C CNN
F 2 "LED_SMD:LED_0603_1608Metric" H 5300 7250 50  0001 C CNN
F 3 "~" H 5300 7250 50  0001 C CNN
	1    5300 7250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R30
U 1 1 5CE99B35
P 5800 6850
F 0 "R30" V 5850 7000 50  0000 C CNN
F 1 "470R" V 5750 6650 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5730 6850 50  0001 C CNN
F 3 "~" H 5800 6850 50  0001 C CNN
	1    5800 6850
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R31
U 1 1 5CE99DCF
P 5800 7050
F 0 "R31" V 5850 7200 50  0000 C CNN
F 1 "470R" V 5750 6850 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5730 7050 50  0001 C CNN
F 3 "~" H 5800 7050 50  0001 C CNN
	1    5800 7050
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R32
U 1 1 5CE99F86
P 5800 7250
F 0 "R32" V 5850 7400 50  0000 C CNN
F 1 "470R" V 5750 7050 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5730 7250 50  0001 C CNN
F 3 "~" H 5800 7250 50  0001 C CNN
	1    5800 7250
	0    -1   -1   0   
$EndComp
Text Notes 5350 6650 0    50   ~ 0
F1
Text Notes 5350 6850 0    50   ~ 0
F2
Text Notes 5350 7050 0    50   ~ 0
F3
Text Notes 5350 7250 0    50   ~ 0
F4
Text Notes 4550 6300 0    100  ~ 0
LED Filter Indicator
$Comp
L VNA_Symbols:PE42440 U11
U 1 1 5D163069
P 3350 2600
F 0 "U11" H 3375 3431 50  0000 C CNN
F 1 "PE42440" H 3375 3340 50  0000 C CNN
F 2 "" H 3050 3100 50  0001 C CNN
F 3 "" H 3050 3100 50  0001 C CNN
	1    3350 2600
	-1   0    0    -1  
$EndComp
$Comp
L VNA_Symbols:PE42440 U13
U 1 1 5D1646C5
P 8350 2650
F 0 "U13" H 8375 3481 50  0000 C CNN
F 1 "PE42440" H 8375 3390 50  0000 C CNN
F 2 "" H 8050 3150 50  0001 C CNN
F 3 "" H 8050 3150 50  0001 C CNN
	1    8350 2650
	1    0    0    -1  
$EndComp
$Comp
L VNA_Symbols:Filter_LFCN FL4
U 1 1 5D166665
P 5700 4500
F 0 "FL4" H 5725 4825 50  0000 C CNN
F 1 "LFCN-1000+" H 5725 4734 50  0000 C CNN
F 2 "" H 5700 4650 50  0001 C CNN
F 3 "" H 5700 4650 50  0001 C CNN
	1    5700 4500
	1    0    0    -1  
$EndComp
$Comp
L VNA_Symbols:Filter_LFCN FL3
U 1 1 5D167269
P 5700 3750
F 0 "FL3" H 5725 4075 50  0000 C CNN
F 1 "LFCN-400+" H 5725 3984 50  0000 C CNN
F 2 "" H 5700 3900 50  0001 C CNN
F 3 "" H 5700 3900 50  0001 C CNN
	1    5700 3750
	1    0    0    -1  
$EndComp
$Comp
L VNA_Symbols:Filter_LFCN FL2
U 1 1 5D167516
P 5700 3050
F 0 "FL2" H 5725 3375 50  0000 C CNN
F 1 "LFCN-225+" H 5725 3284 50  0000 C CNN
F 2 "" H 5700 3200 50  0001 C CNN
F 3 "" H 5700 3200 50  0001 C CNN
	1    5700 3050
	1    0    0    -1  
$EndComp
$Comp
L VNA_Symbols:Filter_LFCN FL1
U 1 1 5D1677E6
P 5700 2350
F 0 "FL1" H 5725 2675 50  0000 C CNN
F 1 "LFCN-105+" H 5725 2584 50  0000 C CNN
F 2 "" H 5700 2500 50  0001 C CNN
F 3 "" H 5700 2500 50  0001 C CNN
	1    5700 2350
	1    0    0    -1  
$EndComp
$Comp
L VNA_Symbols:SN74LVC1G139 U12
U 1 1 5D169358
P 4600 6900
F 0 "U12" H 4600 7325 50  0000 C CNN
F 1 "SN74LVC1G139" H 4600 7234 50  0000 C CNN
F 2 "" H 4700 7150 100 0001 C CNN
F 3 "" H 4700 7150 100 0001 C CNN
	1    4600 6900
	1    0    0    -1  
$EndComp
$Comp
L VNA_Symbols:74AHC1G04 U10
U 1 1 5D169DD1
P 1900 7050
F 0 "U10" H 1900 7325 50  0000 C CNN
F 1 "74AHC1G04" H 1900 7234 50  0000 C CNN
F 2 "" H 1850 7250 50  0001 C CNN
F 3 "" H 1850 7250 50  0001 C CNN
	1    1900 7050
	1    0    0    -1  
$EndComp
$EndSCHEMATC
