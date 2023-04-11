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
.TRAN 2n 200n START=0n SWEEP MONTE=8 step = 5ns

VDD pos_rail GND 5
Vsig input_sig GND 3

* challenge 0
xBUF_H_0_1 input_sig xBUF_H_0_1_out pos_rail GND BUF_X3M
xBUF_H_0_0 input_sig xBUF_H_0_0_out pos_rail GND BUF_X3M
xBUF_L_0_1 input_sig xBUF_L_0_1_out pos_rail GND BUF_X3M
xBUF_L_0_0 input_sig xBUF_L_0_0_out pos_rail GND BUF_X3M
xMUX2_H_0 xBUF_H_0_1_out xBUF_H_0_0_out challenge_0 xMUX2_H_0_out pos_rail GND MUX2_X1
xMUX2_L_0 xBUF_L_0_1_out xBUF_L_0_0_out challenge_0 xMUX2_L_0_out pos_rail GND MUX2_X1

* challenge 1
xBUF_H_1_1 xMUX2_H_0_out xBUF_H_1_1_out pos_rail GND BUF_X3M
xBUF_H_1_0 xMUX2_L_0_out xBUF_H_1_0_out pos_rail GND BUF_X3M
xBUF_L_1_1 xMUX2_L_0_out xBUF_L_1_1_out pos_rail GND BUF_X3M
xBUF_L_1_0 xMUX2_H_0_out xBUF_L_1_0_out pos_rail GND BUF_X3M
xMUX2_H_1 xBUF_H_1_1_out xBUF_H_1_0_out challenge_1 xMUX2_H_1_out pos_rail GND MUX2_X1
xMUX2_L_1 xBUF_L_1_1_out xBUF_L_1_0_out challenge_1 xMUX2_L_1_out pos_rail GND MUX2_X1

* challenge 2
xBUF_H_2_1 xMUX2_H_1_out xBUF_H_2_1_out pos_rail GND BUF_X3M
xBUF_H_2_0 xMUX2_L_1_out xBUF_H_2_0_out pos_rail GND BUF_X3M
xBUF_L_2_1 xMUX2_L_1_out xBUF_L_2_1_out pos_rail GND BUF_X3M
xBUF_L_2_0 xMUX2_H_1_out xBUF_L_2_0_out pos_rail GND BUF_X3M
xMUX2_H_2 xBUF_H_2_1_out xBUF_H_2_0_out challenge_2 xMUX2_H_2_out pos_rail GND MUX2_X1
xMUX2_L_2 xBUF_L_2_1_out xBUF_L_2_0_out challenge_2 xMUX2_L_2_out pos_rail GND MUX2_X1

* challenge 3
xBUF_H_3_1 xMUX2_H_2_out xBUF_H_3_1_out pos_rail GND BUF_X3M
xBUF_H_3_0 xMUX2_L_2_out xBUF_H_3_0_out pos_rail GND BUF_X3M
xBUF_L_3_1 xMUX2_L_2_out xBUF_L_3_1_out pos_rail GND BUF_X3M
xBUF_L_3_0 xMUX2_H_2_out xBUF_L_3_0_out pos_rail GND BUF_X3M
xMUX2_H_3 xBUF_H_3_1_out xBUF_H_3_0_out challenge_3 xMUX2_H_3_out pos_rail GND MUX2_X1
xMUX2_L_3 xBUF_L_3_1_out xBUF_L_3_0_out challenge_3 xMUX2_L_3_out pos_rail GND MUX2_X1

* challenge 4
xBUF_H_4_1 xMUX2_H_3_out xBUF_H_4_1_out pos_rail GND BUF_X3M
xBUF_H_4_0 xMUX2_L_3_out xBUF_H_4_0_out pos_rail GND BUF_X3M
xBUF_L_4_1 xMUX2_L_3_out xBUF_L_4_1_out pos_rail GND BUF_X3M
xBUF_L_4_0 xMUX2_H_3_out xBUF_L_4_0_out pos_rail GND BUF_X3M
xMUX2_H_4 xBUF_H_4_1_out xBUF_H_4_0_out challenge_4 xMUX2_H_4_out pos_rail GND MUX2_X1
xMUX2_L_4 xBUF_L_4_1_out xBUF_L_4_0_out challenge_4 xMUX2_L_4_out pos_rail GND MUX2_X1

* challenge 5
xBUF_H_5_1 xMUX2_H_4_out xBUF_H_5_1_out pos_rail GND BUF_X3M
xBUF_H_5_0 xMUX2_L_4_out xBUF_H_5_0_out pos_rail GND BUF_X3M
xBUF_L_5_1 xMUX2_L_4_out xBUF_L_5_1_out pos_rail GND BUF_X3M
xBUF_L_5_0 xMUX2_H_4_out xBUF_L_5_0_out pos_rail GND BUF_X3M
xMUX2_H_5 xBUF_H_5_1_out xBUF_H_5_0_out challenge_5 xMUX2_H_5_out pos_rail GND MUX2_X1
xMUX2_L_5 xBUF_L_5_1_out xBUF_L_5_0_out challenge_5 xMUX2_L_5_out pos_rail GND MUX2_X1

* challenge 6
xBUF_H_6_1 xMUX2_H_5_out xBUF_H_6_1_out pos_rail GND BUF_X3M
xBUF_H_6_0 xMUX2_L_5_out xBUF_H_6_0_out pos_rail GND BUF_X3M
xBUF_L_6_1 xMUX2_L_5_out xBUF_L_6_1_out pos_rail GND BUF_X3M
xBUF_L_6_0 xMUX2_H_5_out xBUF_L_6_0_out pos_rail GND BUF_X3M
xMUX2_H_6 xBUF_H_6_1_out xBUF_H_6_0_out challenge_6 xMUX2_H_6_out pos_rail GND MUX2_X1
xMUX2_L_6 xBUF_L_6_1_out xBUF_L_6_0_out challenge_6 xMUX2_L_6_out pos_rail GND MUX2_X1

* challenge 7
xBUF_H_7_1 xMUX2_H_6_out xBUF_H_7_1_out pos_rail GND BUF_X3M
xBUF_H_7_0 xMUX2_L_6_out xBUF_H_7_0_out pos_rail GND BUF_X3M
xBUF_L_7_1 xMUX2_L_6_out xBUF_L_7_1_out pos_rail GND BUF_X3M
xBUF_L_7_0 xMUX2_H_6_out xBUF_L_7_0_out pos_rail GND BUF_X3M
xMUX2_H_7 xBUF_H_7_1_out xBUF_H_7_0_out challenge_7 xMUX2_H_7_out pos_rail GND MUX2_X1
xMUX2_L_7 xBUF_L_7_1_out xBUF_L_7_0_out challenge_7 xMUX2_L_7_out pos_rail GND MUX2_X1

* challenge 8
xBUF_H_8_1 xMUX2_H_7_out xBUF_H_8_1_out pos_rail GND BUF_X3M
xBUF_H_8_0 xMUX2_L_7_out xBUF_H_8_0_out pos_rail GND BUF_X3M
xBUF_L_8_1 xMUX2_L_7_out xBUF_L_8_1_out pos_rail GND BUF_X3M
xBUF_L_8_0 xMUX2_H_7_out xBUF_L_8_0_out pos_rail GND BUF_X3M
xMUX2_H_8 xBUF_H_8_1_out xBUF_H_8_0_out challenge_8 xMUX2_H_8_out pos_rail GND MUX2_X1
xMUX2_L_8 xBUF_L_8_1_out xBUF_L_8_0_out challenge_8 xMUX2_L_8_out pos_rail GND MUX2_X1

* challenge 9
xBUF_H_9_1 xMUX2_H_8_out xBUF_H_9_1_out pos_rail GND BUF_X3M
xBUF_H_9_0 xMUX2_L_8_out xBUF_H_9_0_out pos_rail GND BUF_X3M
xBUF_L_9_1 xMUX2_L_8_out xBUF_L_9_1_out pos_rail GND BUF_X3M
xBUF_L_9_0 xMUX2_H_8_out xBUF_L_9_0_out pos_rail GND BUF_X3M
xMUX2_H_9 xBUF_H_9_1_out xBUF_H_9_0_out challenge_9 xMUX2_H_9_out pos_rail GND MUX2_X1
xMUX2_L_9 xBUF_L_9_1_out xBUF_L_9_0_out challenge_9 xMUX2_L_9_out pos_rail GND MUX2_X1

* challenge 10
xBUF_H_10_1 xMUX2_H_9_out xBUF_H_10_1_out pos_rail GND BUF_X3M
xBUF_H_10_0 xMUX2_L_9_out xBUF_H_10_0_out pos_rail GND BUF_X3M
xBUF_L_10_1 xMUX2_L_9_out xBUF_L_10_1_out pos_rail GND BUF_X3M
xBUF_L_10_0 xMUX2_H_9_out xBUF_L_10_0_out pos_rail GND BUF_X3M
xMUX2_H_10 xBUF_H_10_1_out xBUF_H_10_0_out challenge_10 xMUX2_H_10_out pos_rail GND MUX2_X1
xMUX2_L_10 xBUF_L_10_1_out xBUF_L_10_0_out challenge_10 xMUX2_L_10_out pos_rail GND MUX2_X1

* challenge 11
xBUF_H_11_1 xMUX2_H_10_out xBUF_H_11_1_out pos_rail GND BUF_X3M
xBUF_H_11_0 xMUX2_L_10_out xBUF_H_11_0_out pos_rail GND BUF_X3M
xBUF_L_11_1 xMUX2_L_10_out xBUF_L_11_1_out pos_rail GND BUF_X3M
xBUF_L_11_0 xMUX2_H_10_out xBUF_L_11_0_out pos_rail GND BUF_X3M
xMUX2_H_11 xBUF_H_11_1_out xBUF_H_11_0_out challenge_11 xMUX2_H_11_out pos_rail GND MUX2_X1
xMUX2_L_11 xBUF_L_11_1_out xBUF_L_11_0_out challenge_11 xMUX2_L_11_out pos_rail GND MUX2_X1

* challenge 12
xBUF_H_12_1 xMUX2_H_11_out xBUF_H_12_1_out pos_rail GND BUF_X3M
xBUF_H_12_0 xMUX2_L_11_out xBUF_H_12_0_out pos_rail GND BUF_X3M
xBUF_L_12_1 xMUX2_L_11_out xBUF_L_12_1_out pos_rail GND BUF_X3M
xBUF_L_12_0 xMUX2_H_11_out xBUF_L_12_0_out pos_rail GND BUF_X3M
xMUX2_H_12 xBUF_H_12_1_out xBUF_H_12_0_out challenge_12 xMUX2_H_12_out pos_rail GND MUX2_X1
xMUX2_L_12 xBUF_L_12_1_out xBUF_L_12_0_out challenge_12 xMUX2_L_12_out pos_rail GND MUX2_X1

* challenge 13
xBUF_H_13_1 xMUX2_H_12_out xBUF_H_13_1_out pos_rail GND BUF_X3M
xBUF_H_13_0 xMUX2_L_12_out xBUF_H_13_0_out pos_rail GND BUF_X3M
xBUF_L_13_1 xMUX2_L_12_out xBUF_L_13_1_out pos_rail GND BUF_X3M
xBUF_L_13_0 xMUX2_H_12_out xBUF_L_13_0_out pos_rail GND BUF_X3M
xMUX2_H_13 xBUF_H_13_1_out xBUF_H_13_0_out challenge_13 xMUX2_H_13_out pos_rail GND MUX2_X1
xMUX2_L_13 xBUF_L_13_1_out xBUF_L_13_0_out challenge_13 xMUX2_L_13_out pos_rail GND MUX2_X1

* challenge 14
xBUF_H_14_1 xMUX2_H_13_out xBUF_H_14_1_out pos_rail GND BUF_X3M
xBUF_H_14_0 xMUX2_L_13_out xBUF_H_14_0_out pos_rail GND BUF_X3M
xBUF_L_14_1 xMUX2_L_13_out xBUF_L_14_1_out pos_rail GND BUF_X3M
xBUF_L_14_0 xMUX2_H_13_out xBUF_L_14_0_out pos_rail GND BUF_X3M
xMUX2_H_14 xBUF_H_14_1_out xBUF_H_14_0_out challenge_14 xMUX2_H_14_out pos_rail GND MUX2_X1
xMUX2_L_14 xBUF_L_14_1_out xBUF_L_14_0_out challenge_14 xMUX2_L_14_out pos_rail GND MUX2_X1

* challenge 15
xBUF_H_15_1 xMUX2_H_14_out xBUF_H_15_1_out pos_rail GND BUF_X3M
xBUF_H_15_0 xMUX2_L_14_out xBUF_H_15_0_out pos_rail GND BUF_X3M
xBUF_L_15_1 xMUX2_L_14_out xBUF_L_15_1_out pos_rail GND BUF_X3M
xBUF_L_15_0 xMUX2_H_14_out xBUF_L_15_0_out pos_rail GND BUF_X3M
xMUX2_H_15 xBUF_H_15_1_out xBUF_H_15_0_out challenge_15 xMUX2_H_15_out pos_rail GND MUX2_X1
xMUX2_L_15 xBUF_L_15_1_out xBUF_L_15_0_out challenge_15 xMUX2_L_15_out pos_rail GND MUX2_X1

* SR Latch
xSR_LATCH xMUX2_H_15_out xMUX2_L_15_out xSR_LATCH_Q xSR_LATCH_QN pos_rail GND SR_LATCH
CQ xSR_LATCH_Q GND 10f
CQN xSR_LATCH_QN GND 10f
xBUF_Q xSR_LATCH_Q xBUF_Q_out pos_rail GND BUF_X3M
xBUF_QN xSR_LATCH_QN xBUF_Q_out pos_rail GND BUF_X3M

.END