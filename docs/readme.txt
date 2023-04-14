University of Maryland, Baltimore County 
CMPE/ENEE 491/691 
Hardware Security 
Spring 2023 
Lab 7: PUfs
Jordan Kieltyka

Prerequisites: Linux, NGSPICE, and GCC with C11 compiler

HSPICE PUFs Simulation:
    1) Ensure 'ALL_GATES_HSPICE.txt', 'trans_model_nk', and 'pufs.sp' are in the same directory on the cadence2 server.
    2) Run hspice -i pufs.sp -o pufs.lis
    3) Output of the simulation will be in 'pufs.lis'.

