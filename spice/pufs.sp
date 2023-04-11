* puf simulation

.INCLUDE 'trans_model_nk'
.INCLUDE 'gate.txt'

******* Temperature *********
.TEMP 45

******* Global Node *********
.GLOBAL VDD

******* Parameters *********
.PARAM LMIN_PV=GAUSS(50E-09,0.1,3), vth_pmos_pv=GAUSS(-0.3021,0.1,1), vth_nmos_pv=GAUSS(0.322,0.1,1), toxm_pmos_pv=GAUSS(1.26E-009,0.01,1), toxm_nmos_pv=GAUSS(1.14E-09,0.01,1)

******* Transient Analysis ********* 
.TRAN 2n 200n START=0n SWEEP MONTE=8 step=0.5ns

******* power source *******
Vin VDD GND 1.1

****** input signal *******
Vsig input_sig GND 1.1

******* challenge source *******
Vc0 challenge_0 GND PWL(0n 1.1 5ns 1.1 5.1n 0 10n 0 10.1n 1.1 15n 1.1 15.1n 1.1 20n 1.1 20.1n 1.1 25n 1.1 25.1n 1.1 30n 1.1 30.1n 1.1 35n 1.1 35.1n 1.1 40n 1.1 40.1n 0 45n 0 45.1n 0 50n 0 50.1n 0 55n 0 55.1n 0 60n 0 60.1n 0 65n 0 65.1n 0 70n 0 70.1n 1.1 75n 1.1)
Vc1 challenge_1 GND PWL(0n 1.1 5ns 1.1 5.1n 1.1 10n 1.1 10.1n 0 15n 0 15.1n 0 20n 0 20.1n 1.1 25n 1.1 25.1n 1.1 30n 1.1 30.1n 0 35n 0 35.1n 0 40n 0 40.1n 0 45n 0 45.1n 0 50n 0 50.1n 1.1 55n 1.1 55.1n 1.1 60n 1.1 60.1n 1.1 65n 1.1 65.1n 1.1 70n 1.1 70.1n 0 75n 0)
Vc2 challenge_2 GND PWL(0n 0 5ns 0 5.1n 0 10n 0 10.1n 0 15n 0 15.1n 0 20n 0 20.1n 0 25n 0 25.1n 0 30n 0 30.1n 0 35n 0 35.1n 0 40n 0 40.1n 0 45n 0 45.1n 0 50n 0 50.1n 0 55n 0 55.1n 0 60n 0 60.1n 0 65n 0 65.1n 0 70n 0 70.1n 1.1 75n 1.1)
Vc3 challenge_3 GND PWL(0n 0 5ns 0 5.1n 0 10n 0 10.1n 1.1 15n 1.1 15.1n 0 20n 0 20.1n 1.1 25n 1.1 25.1n 1.1 30n 1.1 30.1n 1.1 35n 1.1 35.1n 1.1 40n 1.1 40.1n 1.1 45n 1.1 45.1n 1.1 50n 1.1 50.1n 1.1 55n 1.1 55.1n 1.1 60n 1.1 60.1n 0 65n 0 65.1n 0 70n 0 70.1n 1.1 75n 1.1)
Vc4 challenge_4 GND PWL(0n 0 5ns 0 5.1n 0 10n 0 10.1n 1.1 15n 1.1 15.1n 1.1 20n 1.1 20.1n 1.1 25n 1.1 25.1n 1.1 30n 1.1 30.1n 0 35n 0 35.1n 0 40n 0 40.1n 1.1 45n 1.1 45.1n 1.1 50n 1.1 50.1n 1.1 55n 1.1 55.1n 1.1 60n 1.1 60.1n 0 65n 0 65.1n 1.1 70n 1.1 70.1n 1.1 75n 1.1)
Vc5 challenge_5 GND PWL(0n 1.1 5ns 1.1 5.1n 1.1 10n 1.1 10.1n 0 15n 0 15.1n 0 20n 0 20.1n 1.1 25n 1.1 25.1n 1.1 30n 1.1 30.1n 1.1 35n 1.1 35.1n 1.1 40n 1.1 40.1n 1.1 45n 1.1 45.1n 1.1 50n 1.1 50.1n 0 55n 0 55.1n 0 60n 0 60.1n 0 65n 0 65.1n 0 70n 0 70.1n 1.1 75n 1.1)
Vc6 challenge_6 GND PWL(0n 0 5ns 0 5.1n 1.1 10n 1.1 10.1n 0 15n 0 15.1n 0 20n 0 20.1n 0 25n 0 25.1n 0 30n 0 30.1n 0 35n 0 35.1n 0 40n 0 40.1n 1.1 45n 1.1 45.1n 1.1 50n 1.1 50.1n 0 55n 0 55.1n 0 60n 0 60.1n 0 65n 0 65.1n 0 70n 0 70.1n 1.1 75n 1.1)
Vc7 challenge_7 GND PWL(0n 1.1 5ns 1.1 5.1n 1.1 10n 1.1 10.1n 0 15n 0 15.1n 0 20n 0 20.1n 0 25n 0 25.1n 0 30n 0 30.1n 0 35n 0 35.1n 0 40n 0 40.1n 1.1 45n 1.1 45.1n 1.1 50n 1.1 50.1n 0 55n 0 55.1n 0 60n 0 60.1n 1.1 65n 1.1 65.1n 1.1 70n 1.1 70.1n 1.1 75n 1.1)
Vc8 challenge_8 GND PWL(0n 0 5ns 0 5.1n 0 10n 0 10.1n 0 15n 0 15.1n 0 20n 0 20.1n 0 25n 0 25.1n 0 30n 0 30.1n 0 35n 0 35.1n 0 40n 0 40.1n 0 45n 0 45.1n 0 50n 0 50.1n 1.1 55n 1.1 55.1n 1.1 60n 1.1 60.1n 1.1 65n 1.1 65.1n 1.1 70n 1.1 70.1n 1.1 75n 1.1)
Vc9 challenge_9 GND PWL(0n 1.1 5ns 1.1 5.1n 1.1 10n 1.1 10.1n 1.1 15n 1.1 15.1n 1.1 20n 1.1 20.1n 1.1 25n 1.1 25.1n 1.1 30n 1.1 30.1n 1.1 35n 1.1 35.1n 1.1 40n 1.1 40.1n 0 45n 0 45.1n 0 50n 0 50.1n 0 55n 0 55.1n 0 60n 0 60.1n 1.1 65n 1.1 65.1n 1.1 70n 1.1 70.1n 1.1 75n 1.1)
Vc10 challenge_10 GND PWL(0n 1.1 5ns 1.1 5.1n 1.1 10n 1.1 10.1n 1.1 15n 1.1 15.1n 1.1 20n 1.1 20.1n 0 25n 0 25.1n 0 30n 0 30.1n 0 35n 0 35.1n 0 40n 0 40.1n 1.1 45n 1.1 45.1n 1.1 50n 1.1 50.1n 1.1 55n 1.1 55.1n 1.1 60n 1.1 60.1n 1.1 65n 1.1 65.1n 1.1 70n 1.1 70.1n 1.1 75n 1.1)
Vc11 challenge_11 GND PWL(0n 0 5ns 0 5.1n 0 10n 0 10.1n 0 15n 0 15.1n 0 20n 0 20.1n 1.1 25n 1.1 25.1n 1.1 30n 1.1 30.1n 0 35n 0 35.1n 0 40n 0 40.1n 0 45n 0 45.1n 0 50n 0 50.1n 1.1 55n 1.1 55.1n 0 60n 0 60.1n 1.1 65n 1.1 65.1n 0 70n 0 70.1n 1.1 75n 1.1)
Vc12 challenge_12 GND PWL(0n 1.1 5ns 1.1 5.1n 0 10n 0 10.1n 1.1 15n 1.1 15.1n 1.1 20n 1.1 20.1n 0 25n 0 25.1n 0 30n 0 30.1n 1.1 35n 1.1 35.1n 0 40n 0 40.1n 1.1 45n 1.1 45.1n 1.1 50n 1.1 50.1n 1.1 55n 1.1 55.1n 1.1 60n 1.1 60.1n 0 65n 0 65.1n 0 70n 0 70.1n 1.1 75n 1.1)
Vc13 challenge_13 GND PWL(0n 1.1 5ns 1.1 5.1n 1.1 10n 1.1 10.1n 0 15n 0 15.1n 0 20n 0 20.1n 0 25n 0 25.1n 0 30n 0 30.1n 0 35n 0 35.1n 0 40n 0 40.1n 0 45n 0 45.1n 1.1 50n 1.1 50.1n 0 55n 0 55.1n 0 60n 0 60.1n 0 65n 0 65.1n 0 70n 0 70.1n 1.1 75n 1.1)
Vc14 challenge_14 GND PWL(0n 1.1 5ns 1.1 5.1n 1.1 10n 1.1 10.1n 0 15n 0 15.1n 0 20n 0 20.1n 0 25n 0 25.1n 0 30n 0 30.1n 1.1 35n 1.1 35.1n 1.1 40n 1.1 40.1n 0 45n 0 45.1n 0 50n 0 50.1n 1.1 55n 1.1 55.1n 1.1 60n 1.1 60.1n 1.1 65n 1.1 65.1n 1.1 70n 1.1 70.1n 1.1 75n 1.1)
Vc15 challenge_15 GND PWL(0n 1.1 5ns 1.1 5.1n 1.1 10n 1.1 10.1n 1.1 15n 1.1 15.1n 1.1 20n 1.1 20.1n 1.1 25n 1.1 25.1n 0 30n 0 30.1n 0 35n 0 35.1n 0 40n 0 40.1n 1.1 45n 1.1 45.1n 1.1 50n 1.1 50.1n 0 55n 0 55.1n 0 60n 0 60.1n 0 65n 0 65.1n 0 70n 0 70.1n 1.1 75n 1.1)

* challenge 0
xBUF_H_0_1 input_sig xBUF_H_0_1_out VDD GND BUF_X3M
xBUF_H_0_0 input_sig xBUF_H_0_0_out VDD GND BUF_X3M
xBUF_L_0_1 input_sig xBUF_L_0_1_out VDD GND BUF_X3M
xBUF_L_0_0 input_sig xBUF_L_0_0_out VDD GND BUF_X3M
xMUX2_H_0 xBUF_H_0_1_out xBUF_H_0_0_out challenge_0 xMUX2_H_0_out VDD GND MUX2_X1
xMUX2_L_0 xBUF_L_0_1_out xBUF_L_0_0_out challenge_0 xMUX2_L_0_out VDD GND MUX2_X1

* challenge 1
xBUF_H_1_1 xMUX2_H_0_out xBUF_H_1_1_out VDD GND BUF_X3M
xBUF_H_1_0 xMUX2_L_0_out xBUF_H_1_0_out VDD GND BUF_X3M
xBUF_L_1_1 xMUX2_L_0_out xBUF_L_1_1_out VDD GND BUF_X3M
xBUF_L_1_0 xMUX2_H_0_out xBUF_L_1_0_out VDD GND BUF_X3M
xMUX2_H_1 xBUF_H_1_1_out xBUF_H_1_0_out challenge_1 xMUX2_H_1_out VDD GND MUX2_X1
xMUX2_L_1 xBUF_L_1_1_out xBUF_L_1_0_out challenge_1 xMUX2_L_1_out VDD GND MUX2_X1

* challenge 2
xBUF_H_2_1 xMUX2_H_1_out xBUF_H_2_1_out VDD GND BUF_X3M
xBUF_H_2_0 xMUX2_L_1_out xBUF_H_2_0_out VDD GND BUF_X3M
xBUF_L_2_1 xMUX2_L_1_out xBUF_L_2_1_out VDD GND BUF_X3M
xBUF_L_2_0 xMUX2_H_1_out xBUF_L_2_0_out VDD GND BUF_X3M
xMUX2_H_2 xBUF_H_2_1_out xBUF_H_2_0_out challenge_2 xMUX2_H_2_out VDD GND MUX2_X1
xMUX2_L_2 xBUF_L_2_1_out xBUF_L_2_0_out challenge_2 xMUX2_L_2_out VDD GND MUX2_X1

* challenge 3
xBUF_H_3_1 xMUX2_H_2_out xBUF_H_3_1_out VDD GND BUF_X3M
xBUF_H_3_0 xMUX2_L_2_out xBUF_H_3_0_out VDD GND BUF_X3M
xBUF_L_3_1 xMUX2_L_2_out xBUF_L_3_1_out VDD GND BUF_X3M
xBUF_L_3_0 xMUX2_H_2_out xBUF_L_3_0_out VDD GND BUF_X3M
xMUX2_H_3 xBUF_H_3_1_out xBUF_H_3_0_out challenge_3 xMUX2_H_3_out VDD GND MUX2_X1
xMUX2_L_3 xBUF_L_3_1_out xBUF_L_3_0_out challenge_3 xMUX2_L_3_out VDD GND MUX2_X1

* challenge 4
xBUF_H_4_1 xMUX2_H_3_out xBUF_H_4_1_out VDD GND BUF_X3M
xBUF_H_4_0 xMUX2_L_3_out xBUF_H_4_0_out VDD GND BUF_X3M
xBUF_L_4_1 xMUX2_L_3_out xBUF_L_4_1_out VDD GND BUF_X3M
xBUF_L_4_0 xMUX2_H_3_out xBUF_L_4_0_out VDD GND BUF_X3M
xMUX2_H_4 xBUF_H_4_1_out xBUF_H_4_0_out challenge_4 xMUX2_H_4_out VDD GND MUX2_X1
xMUX2_L_4 xBUF_L_4_1_out xBUF_L_4_0_out challenge_4 xMUX2_L_4_out VDD GND MUX2_X1

* challenge 5
xBUF_H_5_1 xMUX2_H_4_out xBUF_H_5_1_out VDD GND BUF_X3M
xBUF_H_5_0 xMUX2_L_4_out xBUF_H_5_0_out VDD GND BUF_X3M
xBUF_L_5_1 xMUX2_L_4_out xBUF_L_5_1_out VDD GND BUF_X3M
xBUF_L_5_0 xMUX2_H_4_out xBUF_L_5_0_out VDD GND BUF_X3M
xMUX2_H_5 xBUF_H_5_1_out xBUF_H_5_0_out challenge_5 xMUX2_H_5_out VDD GND MUX2_X1
xMUX2_L_5 xBUF_L_5_1_out xBUF_L_5_0_out challenge_5 xMUX2_L_5_out VDD GND MUX2_X1

* challenge 6
xBUF_H_6_1 xMUX2_H_5_out xBUF_H_6_1_out VDD GND BUF_X3M
xBUF_H_6_0 xMUX2_L_5_out xBUF_H_6_0_out VDD GND BUF_X3M
xBUF_L_6_1 xMUX2_L_5_out xBUF_L_6_1_out VDD GND BUF_X3M
xBUF_L_6_0 xMUX2_H_5_out xBUF_L_6_0_out VDD GND BUF_X3M
xMUX2_H_6 xBUF_H_6_1_out xBUF_H_6_0_out challenge_6 xMUX2_H_6_out VDD GND MUX2_X1
xMUX2_L_6 xBUF_L_6_1_out xBUF_L_6_0_out challenge_6 xMUX2_L_6_out VDD GND MUX2_X1

* challenge 7
xBUF_H_7_1 xMUX2_H_6_out xBUF_H_7_1_out VDD GND BUF_X3M
xBUF_H_7_0 xMUX2_L_6_out xBUF_H_7_0_out VDD GND BUF_X3M
xBUF_L_7_1 xMUX2_L_6_out xBUF_L_7_1_out VDD GND BUF_X3M
xBUF_L_7_0 xMUX2_H_6_out xBUF_L_7_0_out VDD GND BUF_X3M
xMUX2_H_7 xBUF_H_7_1_out xBUF_H_7_0_out challenge_7 xMUX2_H_7_out VDD GND MUX2_X1
xMUX2_L_7 xBUF_L_7_1_out xBUF_L_7_0_out challenge_7 xMUX2_L_7_out VDD GND MUX2_X1

* challenge 8
xBUF_H_8_1 xMUX2_H_7_out xBUF_H_8_1_out VDD GND BUF_X3M
xBUF_H_8_0 xMUX2_L_7_out xBUF_H_8_0_out VDD GND BUF_X3M
xBUF_L_8_1 xMUX2_L_7_out xBUF_L_8_1_out VDD GND BUF_X3M
xBUF_L_8_0 xMUX2_H_7_out xBUF_L_8_0_out VDD GND BUF_X3M
xMUX2_H_8 xBUF_H_8_1_out xBUF_H_8_0_out challenge_8 xMUX2_H_8_out VDD GND MUX2_X1
xMUX2_L_8 xBUF_L_8_1_out xBUF_L_8_0_out challenge_8 xMUX2_L_8_out VDD GND MUX2_X1

* challenge 9
xBUF_H_9_1 xMUX2_H_8_out xBUF_H_9_1_out VDD GND BUF_X3M
xBUF_H_9_0 xMUX2_L_8_out xBUF_H_9_0_out VDD GND BUF_X3M
xBUF_L_9_1 xMUX2_L_8_out xBUF_L_9_1_out VDD GND BUF_X3M
xBUF_L_9_0 xMUX2_H_8_out xBUF_L_9_0_out VDD GND BUF_X3M
xMUX2_H_9 xBUF_H_9_1_out xBUF_H_9_0_out challenge_9 xMUX2_H_9_out VDD GND MUX2_X1
xMUX2_L_9 xBUF_L_9_1_out xBUF_L_9_0_out challenge_9 xMUX2_L_9_out VDD GND MUX2_X1

* challenge 10
xBUF_H_10_1 xMUX2_H_9_out xBUF_H_10_1_out VDD GND BUF_X3M
xBUF_H_10_0 xMUX2_L_9_out xBUF_H_10_0_out VDD GND BUF_X3M
xBUF_L_10_1 xMUX2_L_9_out xBUF_L_10_1_out VDD GND BUF_X3M
xBUF_L_10_0 xMUX2_H_9_out xBUF_L_10_0_out VDD GND BUF_X3M
xMUX2_H_10 xBUF_H_10_1_out xBUF_H_10_0_out challenge_10 xMUX2_H_10_out VDD GND MUX2_X1
xMUX2_L_10 xBUF_L_10_1_out xBUF_L_10_0_out challenge_10 xMUX2_L_10_out VDD GND MUX2_X1

* challenge 11
xBUF_H_11_1 xMUX2_H_10_out xBUF_H_11_1_out VDD GND BUF_X3M
xBUF_H_11_0 xMUX2_L_10_out xBUF_H_11_0_out VDD GND BUF_X3M
xBUF_L_11_1 xMUX2_L_10_out xBUF_L_11_1_out VDD GND BUF_X3M
xBUF_L_11_0 xMUX2_H_10_out xBUF_L_11_0_out VDD GND BUF_X3M
xMUX2_H_11 xBUF_H_11_1_out xBUF_H_11_0_out challenge_11 xMUX2_H_11_out VDD GND MUX2_X1
xMUX2_L_11 xBUF_L_11_1_out xBUF_L_11_0_out challenge_11 xMUX2_L_11_out VDD GND MUX2_X1

* challenge 12
xBUF_H_12_1 xMUX2_H_11_out xBUF_H_12_1_out VDD GND BUF_X3M
xBUF_H_12_0 xMUX2_L_11_out xBUF_H_12_0_out VDD GND BUF_X3M
xBUF_L_12_1 xMUX2_L_11_out xBUF_L_12_1_out VDD GND BUF_X3M
xBUF_L_12_0 xMUX2_H_11_out xBUF_L_12_0_out VDD GND BUF_X3M
xMUX2_H_12 xBUF_H_12_1_out xBUF_H_12_0_out challenge_12 xMUX2_H_12_out VDD GND MUX2_X1
xMUX2_L_12 xBUF_L_12_1_out xBUF_L_12_0_out challenge_12 xMUX2_L_12_out VDD GND MUX2_X1

* challenge 13
xBUF_H_13_1 xMUX2_H_12_out xBUF_H_13_1_out VDD GND BUF_X3M
xBUF_H_13_0 xMUX2_L_12_out xBUF_H_13_0_out VDD GND BUF_X3M
xBUF_L_13_1 xMUX2_L_12_out xBUF_L_13_1_out VDD GND BUF_X3M
xBUF_L_13_0 xMUX2_H_12_out xBUF_L_13_0_out VDD GND BUF_X3M
xMUX2_H_13 xBUF_H_13_1_out xBUF_H_13_0_out challenge_13 xMUX2_H_13_out VDD GND MUX2_X1
xMUX2_L_13 xBUF_L_13_1_out xBUF_L_13_0_out challenge_13 xMUX2_L_13_out VDD GND MUX2_X1

* challenge 14
xBUF_H_14_1 xMUX2_H_13_out xBUF_H_14_1_out VDD GND BUF_X3M
xBUF_H_14_0 xMUX2_L_13_out xBUF_H_14_0_out VDD GND BUF_X3M
xBUF_L_14_1 xMUX2_L_13_out xBUF_L_14_1_out VDD GND BUF_X3M
xBUF_L_14_0 xMUX2_H_13_out xBUF_L_14_0_out VDD GND BUF_X3M
xMUX2_H_14 xBUF_H_14_1_out xBUF_H_14_0_out challenge_14 xMUX2_H_14_out VDD GND MUX2_X1
xMUX2_L_14 xBUF_L_14_1_out xBUF_L_14_0_out challenge_14 xMUX2_L_14_out VDD GND MUX2_X1

* challenge 15
xBUF_H_15_1 xMUX2_H_14_out xBUF_H_15_1_out VDD GND BUF_X3M
xBUF_H_15_0 xMUX2_L_14_out xBUF_H_15_0_out VDD GND BUF_X3M
xBUF_L_15_1 xMUX2_L_14_out xBUF_L_15_1_out VDD GND BUF_X3M
xBUF_L_15_0 xMUX2_H_14_out xBUF_L_15_0_out VDD GND BUF_X3M
xMUX2_H_15 xBUF_H_15_1_out xBUF_H_15_0_out challenge_15 xMUX2_H_15_out VDD GND MUX2_X1
xMUX2_L_15 xBUF_L_15_1_out xBUF_L_15_0_out challenge_15 xMUX2_L_15_out VDD GND MUX2_X1

* SR Latch
xSR_LATCH xMUX2_H_15_out xMUX2_L_15_out xSR_LATCH_Q xSR_LATCH_QN VDD GND SR_LATCH
CQ xSR_LATCH_Q GND 10f
CQN xSR_LATCH_QN GND 10f
xBUF_Q xSR_LATCH_Q xBUF_Q_out VDD GND BUF_X3M
xBUF_QN xSR_LATCH_QN xBUF_Q_out VDD GND BUF_X3M

.END