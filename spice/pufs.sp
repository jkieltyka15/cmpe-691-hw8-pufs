* puf simulation

******* library files *******
.INCLUDE 'trans_model_nk'
.INCLUDE 'ALL_GATES_HSPICE.txt'

******* simulation control options ********* 
.OPTION POST BRIEF PROBE ACCURATE INGOLD=2 MEASDGT=8

******* temperature *********
.TEMP 75

******* global node *********
.GLOBAL VDD

******* parameters *********
.PARAM LMIN=GAUSS(50E-09,0.1,3), LMIN_PV=GAUSS(50E-09,0.1,3), vth_pmos_pv=GAUSS(-0.3021,0.1,1), vth_nmos_pv=GAUSS(0.322,0.1,1), toxm_pmos_pv=GAUSS(1.26E-009,0.01,1), toxm_nmos_pv=GAUSS(1.14E-09,0.01,1)

******** BIG BUF MODEL ***********
* The subcircuit for BUF
.SUBCKT BUF_X3M
+ A
+ Z
+ VDD GND
M_i_2 GND A Z_neg GND NMOS_VTL_pv W=0.630000U L='LMIN_pv'
M_i_0 Z Z_neg GND GND NMOS_VTL_pv W=1.2450000U L='LMIN_pv'
M_i_10 VDD A Z_neg VDD PMOS_VTL_pv W=0.945000U L='LMIN_pv'
M_i_1 Z Z_neg VDD VDD PMOS_VTL_pv W=1.890000U L='LMIN_pv'
.ENDS

**** MULTIPLEXER *****************
.SUBCKT MUX2_X1 A B S Z VDD VSS
*.PININFO A:I B:I S:I Z:O VDD:P VSS:G
*.EQN Z=((S * B) + (A * !S))
M_i_10 VSS S x1 VSS NMOS_VTL_pv W=0.210000U L='LMIN_pv'
M_i_4 net_1 A VSS VSS NMOS_VTL_pv W=0.210000U L='LMIN_pv'
M_i_5 Z_neg x1 net_1 VSS NMOS_VTL_pv W=0.210000U L='LMIN_pv'
M_i_2 Z_neg S net_0 VSS NMOS_VTL_pv W=0.210000U L='LMIN_pv'
M_i_3 net_0 B VSS VSS NMOS_VTL_pv W=0.210000U L='LMIN_pv'
M_i_0 Z Z_neg VSS VSS NMOS_VTL_pv W=0.415000U L='LMIN_pv'
M_i_11 VDD S x1 VDD PMOS_VTL_pv W=0.315000U L='LMIN_pv'
M_i_8 VDD A net_2 VDD PMOS_VTL_pv W=0.315000U L='LMIN_pv'
M_i_6 net_2 S Z_neg VDD PMOS_VTL_pv W=0.315000U L='LMIN_pv'
M_i_9 net_3 x1 Z_neg VDD PMOS_VTL_pv W=0.315000U L='LMIN_pv'
M_i_7 VDD B net_3 VDD PMOS_VTL_pv W=0.315000U L='LMIN_pv'
M_i_1 Z Z_neg VDD VDD PMOS_VTL_pv W=0.630000U L='LMIN_pv'
.ENDS

*********** SR Latch************
.SUBCKT SR_LATCH SI RI Q QN VDDx GNDx
xNAND2_01 SI QN Q VDDx GNDx NAND2_X1
xNAND2_02 RI Q QN VDDx GNDx NAND2_X1
.ENDS

************************************************************************************************ PUF STAGE
.SUBCKT PUF_STAGE in_h in_l c_bit out_h out_l VDD VSS

xBUF_H1 in_h buf_h1_out VDD VSS BUF_X3M
xBUF_H0 in_h buf_h0_out VDD VSS BUF_X3M
xBUF_L1 in_l buf_l1_out VDD VSS BUF_X3M
xBUF_L0 in_l buf_l0_out VDD VSS BUF_X3M
xMUX_H buf_h1_out buf_l0_out c_bit out_h VDD VSS MUX2_X1
xMUX_L buf_l1_out buf_h0_out c_bit out_l VDD VSS MUX2_X1

.ENDS
************************************************************************************************ PUF STAGE

************************************************************************************************ ARBITER PUF
.SUBCKT ARBITER_PUF_X1 edge c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 q qn VDD VSS

* Buffer MUX Challenge Stages
xPUF_STAGE_0  edge    edge   c0  high_0  low_0  VDD VSS PUF_STAGE
xPUF_STAGE_1  high_0  low_0  c1  high_1  low_1  VDD VSS PUF_STAGE
xPUF_STAGE_2  high_1  low_1  c2  high_2  low_2  VDD VSS PUF_STAGE
xPUF_STAGE_3  high_2  low_2  c3  high_3  low_3  VDD VSS PUF_STAGE
xPUF_STAGE_4  high_3  low_3  c4  high_4  low_4  VDD VSS PUF_STAGE
xPUF_STAGE_5  high_4  low_4  c5  high_5  low_5  VDD VSS PUF_STAGE
xPUF_STAGE_6  high_5  low_5  c6  high_6  low_6  VDD VSS PUF_STAGE
xPUF_STAGE_7  high_6  low_6  c7  high_7  low_7  VDD VSS PUF_STAGE
xPUF_STAGE_8  high_7  low_7  c8  high_8  low_8  VDD VSS PUF_STAGE
xPUF_STAGE_9  high_8  low_8  c9  high_9  low_9  VDD VSS PUF_STAGE
xPUF_STAGE_10 high_9  low_9  c10 high_10 low_10 VDD VSS PUF_STAGE
xPUF_STAGE_11 high_10 low_10 c11 high_11 low_11 VDD VSS PUF_STAGE
xPUF_STAGE_12 high_11 low_11 c12 high_12 low_12 VDD VSS PUF_STAGE
xPUF_STAGE_13 high_12 low_12 c13 high_13 low_13 VDD VSS PUF_STAGE
xPUF_STAGE_14 high_13 low_13 c14 high_14 low_14 VDD VSS PUF_STAGE
xPUF_STAGE_15 high_14 low_14 c15 high_15 low_15 VDD VSS PUF_STAGE

* SR Latch
xBUF_H_SRL high_15 xBUF_H_SRL_out VDD VSS BUF_X3M
xBUF_L_SRL low_15  xBUF_L_SRL_out VDD VSS BUF_X3M
xSR_LATCH xBUF_H_SRL_out xBUF_L_SRL_out q qn VDD VSS SR_LATCH
CQ  q  VSS 100fF
CQN qn VSS 100fF
xBUF_Q  q  xBUF_Q_out  VDD VSS BUF_X3M
xBUF_QN qn xBUF_QN_out VDD VSS BUF_X3M

.ENDS
************************************************************************************************ ARBITER PUF

******* transient sweep ********* 
.TRAN 0.5n 75n START=0n SWEEP MONTE=8 FIRST=3

******* power source *******
Vin VDD GND 1.1

****** input signal *******
Vsig edge GND PULSE(0 1.1 0.3n 1p 1p 2.5n 5n)

******* challenge source *******
Vc0  c0  GND PWL(0n 1.1 5ns 1.1 5.1n 0 10n 0 10.1n 1.1 15n 1.1 15.1n 1.1 20n 1.1 20.1n 1.1 25n 1.1 25.1n 1.1 30n 1.1 30.1n 1.1 35n 1.1 35.1n 1.1 40n 1.1 40.1n 0 45n 0 45.1n 0 50n 0 50.1n 0 55n 0 55.1n 0 60n 0 60.1n 0 65n 0 65.1n 0 70n 0 70.1n 1.1 75n 1.1)
Vc1  c1  GND PWL(0n 1.1 5ns 1.1 5.1n 1.1 10n 1.1 10.1n 0 15n 0 15.1n 0 20n 0 20.1n 1.1 25n 1.1 25.1n 1.1 30n 1.1 30.1n 0 35n 0 35.1n 0 40n 0 40.1n 0 45n 0 45.1n 0 50n 0 50.1n 1.1 55n 1.1 55.1n 1.1 60n 1.1 60.1n 1.1 65n 1.1 65.1n 1.1 70n 1.1 70.1n 0 75n 0)
Vc2  c2  GND PWL(0n 0 5ns 0 5.1n 0 10n 0 10.1n 0 15n 0 15.1n 0 20n 0 20.1n 0 25n 0 25.1n 0 30n 0 30.1n 0 35n 0 35.1n 0 40n 0 40.1n 0 45n 0 45.1n 0 50n 0 50.1n 0 55n 0 55.1n 0 60n 0 60.1n 0 65n 0 65.1n 0 70n 0 70.1n 1.1 75n 1.1)
Vc3  c3  GND PWL(0n 0 5ns 0 5.1n 0 10n 0 10.1n 1.1 15n 1.1 15.1n 0 20n 0 20.1n 1.1 25n 1.1 25.1n 1.1 30n 1.1 30.1n 1.1 35n 1.1 35.1n 1.1 40n 1.1 40.1n 1.1 45n 1.1 45.1n 1.1 50n 1.1 50.1n 1.1 55n 1.1 55.1n 1.1 60n 1.1 60.1n 0 65n 0 65.1n 0 70n 0 70.1n 1.1 75n 1.1)
Vc4  c4  GND PWL(0n 0 5ns 0 5.1n 0 10n 0 10.1n 1.1 15n 1.1 15.1n 1.1 20n 1.1 20.1n 1.1 25n 1.1 25.1n 1.1 30n 1.1 30.1n 0 35n 0 35.1n 0 40n 0 40.1n 1.1 45n 1.1 45.1n 1.1 50n 1.1 50.1n 1.1 55n 1.1 55.1n 1.1 60n 1.1 60.1n 0 65n 0 65.1n 1.1 70n 1.1 70.1n 1.1 75n 1.1)
Vc5  c5  GND PWL(0n 1.1 5ns 1.1 5.1n 1.1 10n 1.1 10.1n 0 15n 0 15.1n 0 20n 0 20.1n 1.1 25n 1.1 25.1n 1.1 30n 1.1 30.1n 1.1 35n 1.1 35.1n 1.1 40n 1.1 40.1n 1.1 45n 1.1 45.1n 1.1 50n 1.1 50.1n 0 55n 0 55.1n 0 60n 0 60.1n 0 65n 0 65.1n 0 70n 0 70.1n 1.1 75n 1.1)
Vc6  c6  GND PWL(0n 0 5ns 0 5.1n 1.1 10n 1.1 10.1n 0 15n 0 15.1n 0 20n 0 20.1n 0 25n 0 25.1n 0 30n 0 30.1n 0 35n 0 35.1n 0 40n 0 40.1n 1.1 45n 1.1 45.1n 1.1 50n 1.1 50.1n 0 55n 0 55.1n 0 60n 0 60.1n 0 65n 0 65.1n 0 70n 0 70.1n 1.1 75n 1.1)
Vc7  c7  GND PWL(0n 1.1 5ns 1.1 5.1n 1.1 10n 1.1 10.1n 0 15n 0 15.1n 0 20n 0 20.1n 0 25n 0 25.1n 0 30n 0 30.1n 0 35n 0 35.1n 0 40n 0 40.1n 1.1 45n 1.1 45.1n 1.1 50n 1.1 50.1n 0 55n 0 55.1n 0 60n 0 60.1n 1.1 65n 1.1 65.1n 1.1 70n 1.1 70.1n 1.1 75n 1.1)
Vc8  c8  GND PWL(0n 0 5ns 0 5.1n 0 10n 0 10.1n 0 15n 0 15.1n 0 20n 0 20.1n 0 25n 0 25.1n 0 30n 0 30.1n 0 35n 0 35.1n 0 40n 0 40.1n 0 45n 0 45.1n 0 50n 0 50.1n 1.1 55n 1.1 55.1n 1.1 60n 1.1 60.1n 1.1 65n 1.1 65.1n 1.1 70n 1.1 70.1n 1.1 75n 1.1)
Vc9  c9  GND PWL(0n 1.1 5ns 1.1 5.1n 1.1 10n 1.1 10.1n 1.1 15n 1.1 15.1n 1.1 20n 1.1 20.1n 1.1 25n 1.1 25.1n 1.1 30n 1.1 30.1n 1.1 35n 1.1 35.1n 1.1 40n 1.1 40.1n 0 45n 0 45.1n 0 50n 0 50.1n 0 55n 0 55.1n 0 60n 0 60.1n 1.1 65n 1.1 65.1n 1.1 70n 1.1 70.1n 1.1 75n 1.1)
Vc10 c10 GND PWL(0n 1.1 5ns 1.1 5.1n 1.1 10n 1.1 10.1n 1.1 15n 1.1 15.1n 1.1 20n 1.1 20.1n 0 25n 0 25.1n 0 30n 0 30.1n 0 35n 0 35.1n 0 40n 0 40.1n 1.1 45n 1.1 45.1n 1.1 50n 1.1 50.1n 1.1 55n 1.1 55.1n 1.1 60n 1.1 60.1n 1.1 65n 1.1 65.1n 1.1 70n 1.1 70.1n 1.1 75n 1.1)
Vc11 c11 GND PWL(0n 0 5ns 0 5.1n 0 10n 0 10.1n 0 15n 0 15.1n 0 20n 0 20.1n 1.1 25n 1.1 25.1n 1.1 30n 1.1 30.1n 0 35n 0 35.1n 0 40n 0 40.1n 0 45n 0 45.1n 0 50n 0 50.1n 1.1 55n 1.1 55.1n 0 60n 0 60.1n 1.1 65n 1.1 65.1n 0 70n 0 70.1n 1.1 75n 1.1)
Vc12 c12 GND PWL(0n 1.1 5ns 1.1 5.1n 0 10n 0 10.1n 1.1 15n 1.1 15.1n 1.1 20n 1.1 20.1n 0 25n 0 25.1n 0 30n 0 30.1n 1.1 35n 1.1 35.1n 0 40n 0 40.1n 1.1 45n 1.1 45.1n 1.1 50n 1.1 50.1n 1.1 55n 1.1 55.1n 1.1 60n 1.1 60.1n 0 65n 0 65.1n 0 70n 0 70.1n 1.1 75n 1.1)
Vc13 c13 GND PWL(0n 1.1 5ns 1.1 5.1n 1.1 10n 1.1 10.1n 0 15n 0 15.1n 0 20n 0 20.1n 0 25n 0 25.1n 0 30n 0 30.1n 0 35n 0 35.1n 0 40n 0 40.1n 0 45n 0 45.1n 1.1 50n 1.1 50.1n 0 55n 0 55.1n 0 60n 0 60.1n 0 65n 0 65.1n 0 70n 0 70.1n 1.1 75n 1.1)
Vc14 c14 GND PWL(0n 1.1 5ns 1.1 5.1n 1.1 10n 1.1 10.1n 0 15n 0 15.1n 0 20n 0 20.1n 0 25n 0 25.1n 0 30n 0 30.1n 1.1 35n 1.1 35.1n 1.1 40n 1.1 40.1n 0 45n 0 45.1n 0 50n 0 50.1n 1.1 55n 1.1 55.1n 1.1 60n 1.1 60.1n 1.1 65n 1.1 65.1n 1.1 70n 1.1 70.1n 1.1 75n 1.1)
Vc15 c15 GND PWL(0n 1.1 5ns 1.1 5.1n 1.1 10n 1.1 10.1n 1.1 15n 1.1 15.1n 1.1 20n 1.1 20.1n 1.1 25n 1.1 25.1n 0 30n 0 30.1n 0 35n 0 35.1n 0 40n 0 40.1n 1.1 45n 1.1 45.1n 1.1 50n 1.1 50.1n 0 55n 0 55.1n 0 60n 0 60.1n 0 65n 0 65.1n 0 70n 0 70.1n 1.1 75n 1.1)

******* arbiter PUFs *******
xARBITER_PUF_0 edge c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 q0 qn0 VDD GND ARBITER_PUF_X1
xARBITER_PUF_1 edge c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 q1 qn1 VDD GND ARBITER_PUF_X1
xARBITER_PUF_2 edge c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 q2 qn2 VDD GND ARBITER_PUF_X1
xARBITER_PUF_3 edge c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 q3 qn3 VDD GND ARBITER_PUF_X1
xARBITER_PUF_4 edge c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 q4 qn4 VDD GND ARBITER_PUF_X1
xARBITER_PUF_5 edge c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 q5 qn5 VDD GND ARBITER_PUF_X1
xARBITER_PUF_6 edge c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 q6 qn6 VDD GND ARBITER_PUF_X1
xARBITER_PUF_7 edge c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 q7 qn7 VDD GND ARBITER_PUF_X1

******* analysis *******
.PRINT TRAN V(q0) V(q1) V(q2) V(q3) V(q4) V(q5) V(q6) V(q7)

.END
