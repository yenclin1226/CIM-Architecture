
* reduced_6TSRAM 6T-SRAM + NOR
.op
.option post
.protect
* .lib '/cad/cell_lib/crn90g_3d3_lk_v1d2.l' tt
.lib '/afs/umich.edu/class/eecs598-002/SAED32/SAED32_EDK/tech/hspice/saed32nm.lib' tt
* .lib '/afs/umich.edu/class/eecs598-002/SAED32/SAED32_EDK/tech/hspice/saed32nm.lib' model_n18
.unprotect
.global vdd vss


.subckt cell bl blb wl q qb vdd vss
xmp1 vdd qb q vdd p18 w=1.2u l=200n
xmp2 vdd q  qb  vdd p18 w=1.2u l=200n
xmn1 q qb vss vss n18 w=3u l=200n
xmn2 qb q vss vss n18 w=3u l=200n
xmn3 bl  wl q vss n18 w=2u l=200n
xmn4 blb wl qb vss n18 w=2u l=200n
.ends

.subckt precharge bl blb pre vdd
xmp1 vdd pre bl vdd p18 w=1.2u l=200n m=5
xmp2 vdd pre blb vdd p18 w=1.2u l=200n m=5
.ends

.subckt inv in out vdd vss
xmp1 out in vdd vdd p18 w=2.4u l=200n
xmn1 out in vss vss n18 w=1.2u l=200n
.ends

.subckt inv_buf in out vdd vss
xmp1 out in vdd vdd p18 w=4.8u l=400n
xmn1 out in vss vss n18 w=2.4u l=400n
.ends


.subckt write in bl blb we vdd vss
x1 in in1 vdd vss inv  
xmn1 blb we 1 vss n18 w=1.2u L=200n
xmn2 bl we 2 vss n18 w=1.2u L=200n
xmn3 1 in vss vss n18 w=1.2u L=200n
xmxn4 2 in1 vss vss n18 w=1.2u L=200n
.ends


.subckt SA  bl blb se out vdd vss
x1 y out vdd vss inv
xmp7 vdd n1 n1 vdd p18 w=2.4u l=200n
xmp8 vdd n1 y vdd p18 w=2.4u l=200n
xmn9 n1 blb n2 vss n18 w=1.2u l=200n
xmn10 y bl n2 vss n18 w=1.2u l=200n
xmn11 n2 se vss vss n18 w=1.2u l=200n
.ends


.subckt NOR a b out vdd vss
xmp1 vdd a n1 vdd p18 w=2.4u l=0.2u
xmp2 n1 b out vdd p18 w=2.4u l=0.2u

xmn1 out a vss vss n18 w=1.2u l=0.2u
xmn2 out b vss vss n18 w=1.2u l=0.2u
.ends

.subckt Buffer in out vdd vss
xinv1 in tmp vdd vss inv_buf
xinv2 tmp out vdd vss inv_buf
.ends

Cg0 wl0 vss 47.244f
Cg1 wl1 vss 47.244f
Cg2 wl2 vss 47.244f
Cg3 wl3 vss 47.244f


Cd_bl0 bl0 vss 35.28f
Cd_blb0 blb0 vss 35.28f
Cd_bl1 bl1 vss 35.28f
Cd_blb1 blb1 vss 35.28f


****************** instance name

x_buff0 d0_pre d0 vdd vss Buffer
x_buff1 d1_pre d1 vdd vss Buffer
x_buff2 d2_pre d2 vdd vss Buffer
x_buff3 d3_pre d3 vdd vss Buffer
x_buff4 d4_pre d4 vdd vss Buffer
x_buff5 d5_pre d5 vdd vss Buffer
x_buff6 d6_pre d6 vdd vss Buffer
x_buff7 d7_pre d7 vdd vss Buffer

*precharge circuit
x_pre0 bl0 blb0 pre0 vdd precharge
x_pre1 bl1 blb1 pre1 vdd precharge
x_pre2 bl2 blb2 pre2 vdd precharge
x_pre3 bl3 blb3 pre3 vdd precharge
x_pre4 bl4 blb4 pre4 vdd precharge
x_pre5 bl5 blb5 pre5 vdd precharge
x_pre6 bl6 blb6 pre6 vdd precharge
x_pre7 bl7 blb7 pre7 vdd precharge

*SRAM cells
x_ram00 bl0 blb0 wl0 q00 qb00 vdd vss cell
* x_ram00 bl0 blb0 wl0 q00 qb00 vdd vss cell_def2
x_ram01 bl1 blb1 wl0 q01 qb01 vdd vss cell
x_ram02 bl2 blb2 wl0 q02 qb02 vdd vss cell
x_ram03 bl3 blb3 wl0 q03 qb03 vdd vss cell
x_ram04 bl4 blb4 wl0 q04 qb04 vdd vss cell
x_ram05 bl5 blb5 wl0 q05 qb05 vdd vss cell
x_ram06 bl6 blb6 wl0 q06 qb06 vdd vss cell
x_ram07 bl7 blb7 wl0 q07 qb07 vdd vss cell

x_ram10 bl0 blb0 wl1 q10 qb10 vdd vss cell
x_ram11 bl1 blb1 wl1 q11 qb11 vdd vss cell
x_ram12 bl2 blb2 wl1 q12 qb12 vdd vss cell
x_ram13 bl3 blb3 wl1 q13 qb13 vdd vss cell
x_ram14 bl4 blb4 wl1 q14 qb14 vdd vss cell
x_ram15 bl5 blb5 wl1 q15 qb15 vdd vss cell
x_ram16 bl6 blb6 wl1 q16 qb16 vdd vss cell
x_ram17 bl7 blb7 wl1 q17 qb17 vdd vss cell

x_ram20 bl0 blb0 wl2 q20 qb20 vdd vss cell
x_ram21 bl1 blb1 wl2 q21 qb21 vdd vss cell
x_ram22 bl2 blb2 wl2 q22 qb22 vdd vss cell
x_ram23 bl3 blb3 wl2 q23 qb23 vdd vss cell
x_ram24 bl4 blb4 wl2 q24 qb24 vdd vss cell
x_ram25 bl5 blb5 wl2 q25 qb25 vdd vss cell
x_ram26 bl6 blb6 wl2 q26 qb26 vdd vss cell
x_ram27 bl7 blb7 wl2 q27 qb27 vdd vss cell

x_ram30 bl0 blb0 wl3 q30 qb30 vdd vss cell
x_ram31 bl1 blb1 wl3 q31 qb31 vdd vss cell
x_ram32 bl2 blb2 wl3 q32 qb32 vdd vss cell
x_ram33 bl3 blb3 wl3 q33 qb33 vdd vss cell
x_ram34 bl4 blb4 wl3 q34 qb34 vdd vss cell
x_ram35 bl5 blb5 wl3 q35 qb35 vdd vss cell
x_ram36 bl6 blb6 wl3 q36 qb36 vdd vss cell
x_ram37 bl7 blb7 wl3 q37 qb37 vdd vss cell

*NOR buffers
x_buff_nor00 in00_0 in_b00 vdd vss inv_buf
x_buff_nor01 in01_0 in_b01 vdd vss inv_buf
x_buff_nor02 in02_0 in_b02 vdd vss inv_buf
x_buff_nor03 in03_0 in_b03 vdd vss inv_buf
x_buff_nor04 in04_0 in_b04 vdd vss inv_buf
x_buff_nor05 in05_0 in_b05 vdd vss inv_buf
x_buff_nor06 in06_0 in_b06 vdd vss inv_buf
x_buff_nor07 in07_0 in_b07 vdd vss inv_buf

x_buff_nor10 in10_0 in_b10 vdd vss inv_buf
x_buff_nor11 in11_0 in_b11 vdd vss inv_buf
x_buff_nor12 in12_0 in_b12 vdd vss inv_buf
x_buff_nor13 in13_0 in_b13 vdd vss inv_buf
x_buff_nor14 in14_0 in_b14 vdd vss inv_buf
x_buff_nor15 in15_0 in_b15 vdd vss inv_buf
x_buff_nor16 in16_0 in_b16 vdd vss inv_buf
x_buff_nor17 in17_0 in_b17 vdd vss inv_buf

x_buff_nor20 in20_0 in_b20 vdd vss inv_buf
x_buff_nor21 in21_0 in_b21 vdd vss inv_buf
x_buff_nor22 in22_0 in_b22 vdd vss inv_buf
x_buff_nor23 in23_0 in_b23 vdd vss inv_buf
x_buff_nor24 in24_0 in_b24 vdd vss inv_buf
x_buff_nor25 in25_0 in_b25 vdd vss inv_buf
x_buff_nor26 in26_0 in_b26 vdd vss inv_buf
x_buff_nor27 in27_0 in_b27 vdd vss inv_buf

x_buff_nor30 in30_0 in_b30 vdd vss inv_buf
x_buff_nor31 in31_0 in_b31 vdd vss inv_buf
x_buff_nor32 in32_0 in_b32 vdd vss inv_buf
x_buff_nor33 in33_0 in_b33 vdd vss inv_buf
x_buff_nor34 in34_0 in_b34 vdd vss inv_buf
x_buff_nor35 in35_0 in_b35 vdd vss inv_buf
x_buff_nor36 in36_0 in_b36 vdd vss inv_buf
x_buff_nor37 in37_0 in_b37 vdd vss inv_buf

*NOR gates
x_nor00 qb00 in_b00 out00 vdd vss NOR
x_nor01 qb01 in_b01 out01 vdd vss NOR
x_nor02 qb02 in_b02 out02 vdd vss NOR
x_nor03 qb03 in_b03 out03 vdd vss NOR
x_nor04 qb04 in_b04 out04 vdd vss NOR
x_nor05 qb05 in_b05 out05 vdd vss NOR
x_nor06 qb06 in_b06 out06 vdd vss NOR
x_nor07 qb07 in_b07 out07 vdd vss NOR

x_nor10 qb10 in_b10 out10 vdd vss NOR
x_nor11 qb11 in_b11 out11 vdd vss NOR
x_nor12 qb12 in_b12 out12 vdd vss NOR
x_nor13 qb13 in_b13 out13 vdd vss NOR
x_nor14 qb14 in_b14 out14 vdd vss NOR
x_nor15 qb15 in_b15 out15 vdd vss NOR
x_nor16 qb16 in_b16 out16 vdd vss NOR
x_nor17 qb17 in_b17 out17 vdd vss NOR

x_nor20 qb20 in_b20 out20 vdd vss NOR
x_nor21 qb21 in_b21 out21 vdd vss NOR
x_nor22 qb22 in_b22 out22 vdd vss NOR
x_nor23 qb23 in_b23 out23 vdd vss NOR
x_nor24 qb24 in_b24 out24 vdd vss NOR
x_nor25 qb25 in_b25 out25 vdd vss NOR
x_nor26 qb26 in_b26 out26 vdd vss NOR
x_nor27 qb27 in_b27 out27 vdd vss NOR

x_nor30 qb30 in_b30 out30 vdd vss NOR
x_nor31 qb31 in_b31 out31 vdd vss NOR
x_nor32 qb32 in_b32 out32 vdd vss NOR
x_nor33 qb33 in_b33 out33 vdd vss NOR
x_nor34 qb34 in_b34 out34 vdd vss NOR
x_nor35 qb35 in_b35 out35 vdd vss NOR
x_nor36 qb36 in_b36 out36 vdd vss NOR
x_nor37 qb37 in_b37 out37 vdd vss NOR

*write cuircuit
x_write0 d0 bl0 blb0 we vdd vss write
x_write1 d1 bl1 blb1 we vdd vss write
x_write2 d2 bl2 blb2 we vdd vss write
x_write3 d3 bl3 blb3 we vdd vss write
x_write4 d4 bl4 blb4 we vdd vss write
x_write5 d5 bl5 blb5 we vdd vss write
x_write6 d6 bl6 blb6 we vdd vss write
x_write7 d7 bl7 blb7 we vdd vss write

*SA circuit
x_SA0 bl0 blb0 se dout0 vdd vss SA
x_SA1 bl1 blb1 se dout1 vdd vss SA
x_SA2 bl2 blb2 se dout2 vdd vss SA
x_SA3 bl3 blb3 se dout3 vdd vss SA
x_SA4 bl4 blb4 se dout4 vdd vss SA
x_SA5 bl5 blb5 se dout5 vdd vss SA
x_SA6 bl6 blb6 se dout6 vdd vss SA
x_SA7 bl7 blb7 se dout7 vdd vss SA

*** Testben18 ***

Vdd vdd 0 dc 1.8v
Vss vss 0 dc 0v

*** Precharge
* Vpre0 pre0 0 PWL(0ns 0 16ns 0 16.02ns 1.8 32ns 1.8 32.02ns 0 48ns 0 48.02ns 1.8 64ns 1.8 64.02ns 0  96ns 0 96.02ns 1.8 112ns 1.8 112.02ns 0)
Vpre00 pre0 0 PWL(0ns 0 0.85ns 0 0.87ns 1.8 1.7ns 1.8 1.72ns 0 2.55ns 0 2.57ns 1.8 3.4ns 1.8 3.42ns 0  4.25ns 0 4.27ns 1.8 5.1ns 1.8 5.12ns 0 5.95ns 0 5.97ns 1.8 6.8ns 1.8 6.82ns 0  7.65ns 0 7.67ns 1.8 8.5ns 1.8 8.52ns 0 9.35ns 0 9.37ns 1.8 10.2ns 1.8 10.22ns 0 11.05ns 0 11.07ns 1.8 11.9ns 1.8 11.92ns 0 12.75ns 0 12.77ns 1.8 13.6ns 1.8 13.62ns 0)
*  Vpre0 pre0 0 dc 1.8v
Vpre01 pre1 0 PWL(0ns 0 0.85ns 0 0.87ns 1.8 1.7ns 1.8 1.72ns 0 2.55ns 0 2.57ns 1.8 3.4ns 1.8 3.42ns 0  4.25ns 0 4.27ns 1.8 5.1ns 1.8 5.12ns 0 5.95ns 0 5.97ns 1.8 6.8ns 1.8 6.82ns 0  7.65ns 0 7.67ns 1.8 8.5ns 1.8 8.52ns 0 9.35ns 0 9.37ns 1.8 10.2ns 1.8 10.22ns 0 11.05ns 0 11.07ns 1.8 11.9ns 1.8 11.92ns 0 12.75ns 0 12.77ns 1.8 13.6ns 1.8 13.62ns 0)
Vpre02 pre2 0 PWL(0ns 0 0.85ns 0 0.87ns 1.8 1.7ns 1.8 1.72ns 0 2.55ns 0 2.57ns 1.8 3.4ns 1.8 3.42ns 0  4.25ns 0 4.27ns 1.8 5.1ns 1.8 5.12ns 0 5.95ns 0 5.97ns 1.8 6.8ns 1.8 6.82ns 0  7.65ns 0 7.67ns 1.8 8.5ns 1.8 8.52ns 0 9.35ns 0 9.37ns 1.8 10.2ns 1.8 10.22ns 0 11.05ns 0 11.07ns 1.8 11.9ns 1.8 11.92ns 0 12.75ns 0 12.77ns 1.8 13.6ns 1.8 13.62ns 0)
Vpre03 pre3 0 PWL(0ns 0 0.85ns 0 0.87ns 1.8 1.7ns 1.8 1.72ns 0 2.55ns 0 2.57ns 1.8 3.4ns 1.8 3.42ns 0  4.25ns 0 4.27ns 1.8 5.1ns 1.8 5.12ns 0 5.95ns 0 5.97ns 1.8 6.8ns 1.8 6.82ns 0  7.65ns 0 7.67ns 1.8 8.5ns 1.8 8.52ns 0 9.35ns 0 9.37ns 1.8 10.2ns 1.8 10.22ns 0 11.05ns 0 11.07ns 1.8 11.9ns 1.8 11.92ns 0 12.75ns 0 12.77ns 1.8 13.6ns 1.8 13.62ns 0)
Vpre04 pre4 0 PWL(0ns 0 0.85ns 0 0.87ns 1.8 1.7ns 1.8 1.72ns 0 2.55ns 0 2.57ns 1.8 3.4ns 1.8 3.42ns 0  4.25ns 0 4.27ns 1.8 5.1ns 1.8 5.12ns 0 5.95ns 0 5.97ns 1.8 6.8ns 1.8 6.82ns 0  7.65ns 0 7.67ns 1.8 8.5ns 1.8 8.52ns 0 9.35ns 0 9.37ns 1.8 10.2ns 1.8 10.22ns 0 11.05ns 0 11.07ns 1.8 11.9ns 1.8 11.92ns 0 12.75ns 0 12.77ns 1.8 13.6ns 1.8 13.62ns 0)
Vpre05 pre5 0 PWL(0ns 0 0.85ns 0 0.87ns 1.8 1.7ns 1.8 1.72ns 0 2.55ns 0 2.57ns 1.8 3.4ns 1.8 3.42ns 0  4.25ns 0 4.27ns 1.8 5.1ns 1.8 5.12ns 0 5.95ns 0 5.97ns 1.8 6.8ns 1.8 6.82ns 0  7.65ns 0 7.67ns 1.8 8.5ns 1.8 8.52ns 0 9.35ns 0 9.37ns 1.8 10.2ns 1.8 10.22ns 0 11.05ns 0 11.07ns 1.8 11.9ns 1.8 11.92ns 0 12.75ns 0 12.77ns 1.8 13.6ns 1.8 13.62ns 0)
Vpre06 pre6 0 PWL(0ns 0 0.85ns 0 0.87ns 1.8 1.7ns 1.8 1.72ns 0 2.55ns 0 2.57ns 1.8 3.4ns 1.8 3.42ns 0  4.25ns 0 4.27ns 1.8 5.1ns 1.8 5.12ns 0 5.95ns 0 5.97ns 1.8 6.8ns 1.8 6.82ns 0  7.65ns 0 7.67ns 1.8 8.5ns 1.8 8.52ns 0 9.35ns 0 9.37ns 1.8 10.2ns 1.8 10.22ns 0 11.05ns 0 11.07ns 1.8 11.9ns 1.8 11.92ns 0 12.75ns 0 12.77ns 1.8 13.6ns 1.8 13.62ns 0)
Vpre07 pre7 0 PWL(0ns 0 0.85ns 0 0.87ns 1.8 1.7ns 1.8 1.72ns 0 2.55ns 0 2.57ns 1.8 3.4ns 1.8 3.42ns 0  4.25ns 0 4.27ns 1.8 5.1ns 1.8 5.12ns 0 5.95ns 0 5.97ns 1.8 6.8ns 1.8 6.82ns 0  7.65ns 0 7.67ns 1.8 8.5ns 1.8 8.52ns 0 9.35ns 0 9.37ns 1.8 10.2ns 1.8 10.22ns 0 11.05ns 0 11.07ns 1.8 11.9ns 1.8 11.92ns 0 12.75ns 0 12.77ns 1.8 13.6ns 1.8 13.62ns 0)


*** WL
* Vwl0 wl0 0 PWL(0ns 1.8 80ns 1.8 80.02ns 0 110.2ns 0 110.22ns 1.8 320ns 1.8 320.02ns 0 480ns 0 480.02ns 1.8 640ns 1.8 640.02ns 0 800ns 0 800.02ns 1.8 910.2ns 1.8 910.22ns 0 1120ns 0 1120.02ns 1.8 1280ns 1.8 1280.02ns 0)
Vwl0 wl0 0 PWL(0ns 0 0.85ns 0 0.87ns 1.8 1.7ns 1.8 1.72ns 0 7.65ns 0 7.67ns 1.8 8.5ns 1.8 8.52ns 0)
Vwl1 wl1 0 PWL(0ns 0 2.55ns 0 2.57ns 1.8 3.4ns 1.8 3.42ns 0 9.35ns 0 9.37ns 1.8 10.2ns 1.8 10.22ns 0)
Vwl2 wl2 0 PWL(0ns 0 4.25ns 0 4.27ns 1.8 5.1ns 1.8 5.12ns 0 11.05ns 0 11.07ns 1.8 11.9ns 1.8 11.92ns 0)
Vwl3 wl3 0 PWL(0ns 0 5.95ns 0 5.97ns 1.8 6.8ns 1.8 6.82ns 0 12.75ns 0 12.77ns 1.8 13.6ns 1.8 13.62ns 0)

*** You should only modify from here
*** Data in (Weight)

Vd00 d0_pre 0 PWL(0ns 0 0.85ns 0 0.87ns 1.8 1.7ns 1.8 1.72ns 0 2.55ns 0 2.57ns 1.8 3.4ns 1.8 3.42ns 0  4.25ns 0 4.27ns 1.8 5.1ns 1.8 5.12ns 0 5.95ns 0 5.97ns 1.8 6.8ns 1.8 6.82ns 0)
* Vd0 d0_pre 0 PWL(0ns 0 14.45ns 0 14.47ns 1.8 15.3ns 1.8 15.32ns 0 16.15ns 0 16.17ns 1.8 17ns 1.8 17.02ns 0 17.85ns 0 17.87ns 1.8 18.7ns 1.8 18.72ns 0 19.55ns 0 19.57ns 1.8 20.4ns 1.8 20.42ns 0 21.25ns 0 21.27ns 1.8 22.1ns 1.8 22.12ns 0 22.95ns 0 22.97ns 1.8 23.8ns 1.8 23.82ns 0 24.65ns 0 24.67ns 1.8 25.5ns 1.8 25.52ns 0 26.35ns 0 26.37ns 1.8 27.1ns 1.8 27.12ns 0)
* write 0 -> write 1

Vd02 d1_pre 0 PWL(0ns 0 0.85ns 0 0.87ns 1.8 1.7ns 1.8 1.72ns 0 2.55ns 0 2.57ns   0 3.4ns   0 3.42ns 0  4.25ns 0 4.27ns 1.8 5.1ns 1.8 5.12ns 0 5.95ns 0 5.97ns   0 6.8ns   0 6.82ns 0)
Vd01 d2_pre 0 PWL(0ns 0 0.85ns 0 0.87ns   0 1.7ns   0 1.72ns 0 2.55ns 0 2.57ns 1.8 3.4ns 1.8 3.42ns 0  4.25ns 0 4.27ns   0 5.1ns   0 5.12ns 0 5.95ns 0 5.97ns 1.8 6.8ns 1.8 6.82ns 0)
Vd03 d3_pre 0 PWL(0ns 0 0.85ns 0 0.87ns 1.8 1.7ns 1.8 1.72ns 0 2.55ns 0 2.57ns   0 3.4ns   0 3.42ns 0  4.25ns 0 4.27ns   0 5.1ns   0 5.12ns 0 5.95ns 0 5.97ns   0 6.8ns   0 6.82ns 0)
Vd04 d4_pre 0 PWL(0ns 0 0.85ns 0 0.87ns 1.8 1.7ns 1.8 1.72ns 0 2.55ns 0 2.57ns 1.8 3.4ns 1.8 3.42ns 0  4.25ns 0 4.27ns 1.8 5.1ns 1.8 5.12ns 0 5.95ns 0 5.97ns 1.8 6.8ns 1.8 6.82ns 0)
Vd05 d5_pre 0 PWL(0ns 0 0.85ns 0 0.87ns   0 1.7ns   0 1.72ns 0 2.55ns 0 2.57ns   0 3.4ns   0 3.42ns 0  4.25ns 0 4.27ns 1.8 5.1ns 1.8 5.12ns 0 5.95ns 0 5.97ns   0 6.8ns   0 6.82ns 0)
Vd06 d6_pre 0 PWL(0ns 0 0.85ns 0 0.87ns 1.8 1.7ns 1.8 1.72ns 0 2.55ns 0 2.57ns 1.8 3.4ns 1.8 3.42ns 0  4.25ns 0 4.27ns   0 5.1ns   0 5.12ns 0 5.95ns 0 5.97ns 1.8 6.8ns 1.8 6.82ns 0)
Vd07 d7_pre 0 PWL(0ns 0 0.85ns 0 0.87ns   0 1.7ns   0 1.72ns 0 2.55ns 0 2.57ns   0 3.4ns   0 3.42ns 0  4.25ns 0 4.27ns   0 5.1ns   0 5.12ns 0 5.95ns 0 5.97ns   0 6.8ns   0 6.82ns 0)

*** Modify end


*** You should only modify from here

*** IN (data would do convolution with W)
* Vin00 in00 0 PWL(0ns 0 80ns 0 80.02ns 1.8 96ns 1.8)
* ^__-- 0 --> 1
* Vin00 in00 0 PWL(0ns 1.8 800ns 1.8 800.02ns 0 960ns 0)
* ^__-- 1 --> 0

Vin00_0 in00_0 0 PWL(0ns 0 14.45ns 0 14.47ns   0 15.3ns   0 15.32ns 0 16.15ns 0 16.17ns   0 17ns   0 17.02ns 0 17.85ns 0 17.87ns 1.8 18.7ns 1.8 18.72ns 0 19.55ns 0 19.57ns 1.8 20.4ns 1.8 20.42ns 0 21.25ns 0 21.27ns   0 22.1ns   0 22.12ns 0 22.95ns 0 22.97ns 1.8 23.8ns 1.8 23.82ns 0 24.65ns 0 24.67ns   0 25.5ns   0 25.52ns 0 26.35ns 0 26.37ns 1.8 27.1ns 1.8 27.12ns 0)
Vin01_0 in01_0 0 PWL(0ns 0 14.45ns 0 14.47ns 1.8 15.3ns 1.8 15.32ns 0 16.15ns 0 16.17ns 1.8 17ns 1.8 17.02ns 0 17.85ns 0 17.87ns 1.8 18.7ns 1.8 18.72ns 0 19.55ns 0 19.57ns 1.8 20.4ns 1.8 20.42ns 0 21.25ns 0 21.27ns   0 22.1ns   0 22.12ns 0 22.95ns 0 22.97ns 1.8 23.8ns 1.8 23.82ns 0 24.65ns 0 24.67ns 1.8 25.5ns 1.8 25.52ns 0 26.35ns 0 26.37ns 1.8 27.1ns 1.8 27.12ns 0)
Vin02_0 in02_0 0 PWL(0ns 0 14.45ns 0 14.47ns 1.8 15.3ns 1.8 15.32ns 0 16.15ns 0 16.17ns   0 17ns   0 17.02ns 0 17.85ns 0 17.87ns   0 18.7ns   0 18.72ns 0 19.55ns 0 19.57ns   0 20.4ns   0 20.42ns 0 21.25ns 0 21.27ns   0 22.1ns   0 22.12ns 0 22.95ns 0 22.97ns 1.8 23.8ns 1.8 23.82ns 0 24.65ns 0 24.67ns   0 25.5ns   0 25.52ns 0 26.35ns 0 26.37ns   0 27.1ns   0 27.12ns 0)
Vin03_0 in03_0 0 PWL(0ns 0 14.45ns 0 14.47ns   0 15.3ns   0 15.32ns 0 16.15ns 0 16.17ns 1.8 17ns 1.8 17.02ns 0 17.85ns 0 17.87ns   0 18.7ns   0 18.72ns 0 19.55ns 0 19.57ns 1.8 20.4ns 1.8 20.42ns 0 21.25ns 0 21.27ns 1.8 22.1ns 1.8 22.12ns 0 22.95ns 0 22.97ns   0 23.8ns   0 23.82ns 0 24.65ns 0 24.67ns   0 25.5ns   0 25.52ns 0 26.35ns 0 26.37ns   0 27.1ns   0 27.12ns 0)
Vin04_0 in04_0 0 PWL(0ns 0 14.45ns 0 14.47ns   0 15.3ns   0 15.32ns 0 16.15ns 0 16.17ns   0 17ns   0 17.02ns 0 17.85ns 0 17.87ns   0 18.7ns   0 18.72ns 0 19.55ns 0 19.57ns   0 20.4ns   0 20.42ns 0 21.25ns 0 21.27ns 1.8 22.1ns 1.8 22.12ns 0 22.95ns 0 22.97ns 1.8 23.8ns 1.8 23.82ns 0 24.65ns 0 24.67ns 1.8 25.5ns 1.8 25.52ns 0 26.35ns 0 26.37ns 1.8 27.1ns 1.8 27.12ns 0)
Vin05_0 in05_0 0 PWL(0ns 0 14.45ns 0 14.47ns   0 15.3ns   0 15.32ns 0 16.15ns 0 16.17ns 1.8 17ns 1.8 17.02ns 0 17.85ns 0 17.87ns   0 18.7ns   0 18.72ns 0 19.55ns 0 19.57ns 1.8 20.4ns 1.8 20.42ns 0 21.25ns 0 21.27ns   0 22.1ns   0 22.12ns 0 22.95ns 0 22.97ns   0 23.8ns   0 23.82ns 0 24.65ns 0 24.67ns 1.8 25.5ns 1.8 25.52ns 0 26.35ns 0 26.37ns   0 27.1ns   0 27.12ns 0)
Vin06_0 in06_0 0 PWL(0ns 0 14.45ns 0 14.47ns 1.8 15.3ns 1.8 15.32ns 0 16.15ns 0 16.17ns   0 17ns   0 17.02ns 0 17.85ns 0 17.87ns 1.8 18.7ns 1.8 18.72ns 0 19.55ns 0 19.57ns   0 20.4ns   0 20.42ns 0 21.25ns 0 21.27ns 1.8 22.1ns 1.8 22.12ns 0 22.95ns 0 22.97ns 1.8 23.8ns 1.8 23.82ns 0 24.65ns 0 24.67ns 1.8 25.5ns 1.8 25.52ns 0 26.35ns 0 26.37ns 1.8 27.1ns 1.8 27.12ns 0)
Vin07_0 in07_0 0 PWL(0ns 0 14.45ns 0 14.47ns   0 15.3ns   0 15.32ns 0 16.15ns 0 16.17ns   0 17ns   0 17.02ns 0 17.85ns 0 17.87ns 1.8 18.7ns 1.8 18.72ns 0 19.55ns 0 19.57ns 1.8 20.4ns 1.8 20.42ns 0 21.25ns 0 21.27ns   0 22.1ns   0 22.12ns 0 22.95ns 0 22.97ns   0 23.8ns   0 23.82ns 0 24.65ns 0 24.67ns 1.8 25.5ns 1.8 25.52ns 0 26.35ns 0 26.37ns   0 27.1ns   0 27.12ns 0)

Vin10_0 in10_0 0 PWL(0ns 0 14.45ns 0 14.47ns 1.8 15.3ns 1.8 15.32ns 0 16.15ns 0 16.17ns   0 17ns   0 17.02ns 0 17.85ns 0 17.87ns   0 18.7ns   0 18.72ns 0 19.55ns 0 19.57ns 1.8 20.4ns 1.8 20.42ns 0 21.25ns 0 21.27ns   0 22.1ns   0 22.12ns 0 22.95ns 0 22.97ns 1.8 23.8ns 1.8 23.82ns 0 24.65ns 0 24.67ns   0 25.5ns   0 25.52ns 0 26.35ns 0 26.37ns   0 27.1ns   0 27.12ns 0)
Vin11_0 in11_0 0 PWL(0ns 0 14.45ns 0 14.47ns 1.8 15.3ns 1.8 15.32ns 0 16.15ns 0 16.17ns 1.8 17ns 1.8 17.02ns 0 17.85ns 0 17.87ns   0 18.7ns   0 18.72ns 0 19.55ns 0 19.57ns 1.8 20.4ns 1.8 20.42ns 0 21.25ns 0 21.27ns   0 22.1ns   0 22.12ns 0 22.95ns 0 22.97ns 1.8 23.8ns 1.8 23.82ns 0 24.65ns 0 24.67ns   0 25.5ns   0 25.52ns 0 26.35ns 0 26.37ns 1.8 27.1ns 1.8 27.12ns 0)
Vin12_0 in12_0 0 PWL(0ns 0 14.45ns 0 14.47ns   0 15.3ns   0 15.32ns 0 16.15ns 0 16.17ns   0 17ns   0 17.02ns 0 17.85ns 0 17.87ns 1.8 18.7ns 1.8 18.72ns 0 19.55ns 0 19.57ns   0 20.4ns   0 20.42ns 0 21.25ns 0 21.27ns 1.8 22.1ns 1.8 22.12ns 0 22.95ns 0 22.97ns   0 23.8ns   0 23.82ns 0 24.65ns 0 24.67ns 1.8 25.5ns 1.8 25.52ns 0 26.35ns 0 26.37ns 1.8 27.1ns 1.8 27.12ns 0)
Vin13_0 in13_0 0 PWL(0ns 0 14.45ns 0 14.47ns   0 15.3ns   0 15.32ns 0 16.15ns 0 16.17ns 1.8 17ns 1.8 17.02ns 0 17.85ns 0 17.87ns   0 18.7ns   0 18.72ns 0 19.55ns 0 19.57ns   0 20.4ns   0 20.42ns 0 21.25ns 0 21.27ns 1.8 22.1ns 1.8 22.12ns 0 22.95ns 0 22.97ns   0 23.8ns   0 23.82ns 0 24.65ns 0 24.67ns 1.8 25.5ns 1.8 25.52ns 0 26.35ns 0 26.37ns   0 27.1ns   0 27.12ns 0)
Vin14_0 in14_0 0 PWL(0ns 0 14.45ns 0 14.47ns 1.8 15.3ns 1.8 15.32ns 0 16.15ns 0 16.17ns   0 17ns   0 17.02ns 0 17.85ns 0 17.87ns 1.8 18.7ns 1.8 18.72ns 0 19.55ns 0 19.57ns 1.8 20.4ns 1.8 20.42ns 0 21.25ns 0 21.27ns   0 22.1ns   0 22.12ns 0 22.95ns 0 22.97ns 1.8 23.8ns 1.8 23.82ns 0 24.65ns 0 24.67ns   0 25.5ns   0 25.52ns 0 26.35ns 0 26.37ns   0 27.1ns   0 27.12ns 0)
Vin15_0 in15_0 0 PWL(0ns 0 14.45ns 0 14.47ns   0 15.3ns   0 15.32ns 0 16.15ns 0 16.17ns 1.8 17ns 1.8 17.02ns 0 17.85ns 0 17.87ns   0 18.7ns   0 18.72ns 0 19.55ns 0 19.57ns   0 20.4ns   0 20.42ns 0 21.25ns 0 21.27ns   0 22.1ns   0 22.12ns 0 22.95ns 0 22.97ns   0 23.8ns   0 23.82ns 0 24.65ns 0 24.67ns 1.8 25.5ns 1.8 25.52ns 0 26.35ns 0 26.37ns 1.8 27.1ns 1.8 27.12ns 0)
Vin16_0 in16_0 0 PWL(0ns 0 14.45ns 0 14.47ns 1.8 15.3ns 1.8 15.32ns 0 16.15ns 0 16.17ns   0 17ns   0 17.02ns 0 17.85ns 0 17.87ns 1.8 18.7ns 1.8 18.72ns 0 19.55ns 0 19.57ns   0 20.4ns   0 20.42ns 0 21.25ns 0 21.27ns 1.8 22.1ns 1.8 22.12ns 0 22.95ns 0 22.97ns 1.8 23.8ns 1.8 23.82ns 0 24.65ns 0 24.67ns 1.8 25.5ns 1.8 25.52ns 0 26.35ns 0 26.37ns   0 27.1ns   0 27.12ns 0)
Vin17_0 in17_0 0 PWL(0ns 0 14.45ns 0 14.47ns 1.8 15.3ns 1.8 15.32ns 0 16.15ns 0 16.17ns 1.8 17ns 1.8 17.02ns 0 17.85ns 0 17.87ns   0 18.7ns   0 18.72ns 0 19.55ns 0 19.57ns 1.8 20.4ns 1.8 20.42ns 0 21.25ns 0 21.27ns 1.8 22.1ns 1.8 22.12ns 0 22.95ns 0 22.97ns   0 23.8ns   0 23.82ns 0 24.65ns 0 24.67ns   0 25.5ns   0 25.52ns 0 26.35ns 0 26.37ns 1.8 27.1ns 1.8 27.12ns 0)

Vin20_0 in20_0 0 PWL(0ns 0 14.45ns 0 14.47ns 1.8 15.3ns 1.8 15.32ns 0 16.15ns 0 16.17ns   0 17ns   0 17.02ns 0 17.85ns 0 17.87ns   0 18.7ns   0 18.72ns 0 19.55ns 0 19.57ns   0 20.4ns   0 20.42ns 0 21.25ns 0 21.27ns   0 22.1ns   0 22.12ns 0 22.95ns 0 22.97ns   0 23.8ns   0 23.82ns 0 24.65ns 0 24.67ns 1.8 25.5ns 1.8 25.52ns 0 26.35ns 0 26.37ns   0 27.1ns   0 27.12ns 0)
Vin21_0 in21_0 0 PWL(0ns 0 14.45ns 0 14.47ns 1.8 15.3ns 1.8 15.32ns 0 16.15ns 0 16.17ns 1.8 17ns 1.8 17.02ns 0 17.85ns 0 17.87ns   0 18.7ns   0 18.72ns 0 19.55ns 0 19.57ns 1.8 20.4ns 1.8 20.42ns 0 21.25ns 0 21.27ns 1.8 22.1ns 1.8 22.12ns 0 22.95ns 0 22.97ns 1.8 23.8ns 1.8 23.82ns 0 24.65ns 0 24.67ns 1.8 25.5ns 1.8 25.52ns 0 26.35ns 0 26.37ns   0 27.1ns   0 27.12ns 0)
Vin22_0 in22_0 0 PWL(0ns 0 14.45ns 0 14.47ns 1.8 15.3ns 1.8 15.32ns 0 16.15ns 0 16.17ns   0 17ns   0 17.02ns 0 17.85ns 0 17.87ns 1.8 18.7ns 1.8 18.72ns 0 19.55ns 0 19.57ns   0 20.4ns   0 20.42ns 0 21.25ns 0 21.27ns 1.8 22.1ns 1.8 22.12ns 0 22.95ns 0 22.97ns 1.8 23.8ns 1.8 23.82ns 0 24.65ns 0 24.67ns 1.8 25.5ns 1.8 25.52ns 0 26.35ns 0 26.37ns 1.8 27.1ns 1.8 27.12ns 0)
Vin23_0 in23_0 0 PWL(0ns 0 14.45ns 0 14.47ns   0 15.3ns   0 15.32ns 0 16.15ns 0 16.17ns   0 17ns   0 17.02ns 0 17.85ns 0 17.87ns   0 18.7ns   0 18.72ns 0 19.55ns 0 19.57ns 1.8 20.4ns 1.8 20.42ns 0 21.25ns 0 21.27ns   0 22.1ns   0 22.12ns 0 22.95ns 0 22.97ns   0 23.8ns   0 23.82ns 0 24.65ns 0 24.67ns   0 25.5ns   0 25.52ns 0 26.35ns 0 26.37ns   0 27.1ns   0 27.12ns 0)
Vin24_0 in24_0 0 PWL(0ns 0 14.45ns 0 14.47ns 1.8 15.3ns 1.8 15.32ns 0 16.15ns 0 16.17ns   0 17ns   0 17.02ns 0 17.85ns 0 17.87ns 1.8 18.7ns 1.8 18.72ns 0 19.55ns 0 19.57ns   0 20.4ns   0 20.42ns 0 21.25ns 0 21.27ns 1.8 22.1ns 1.8 22.12ns 0 22.95ns 0 22.97ns   0 23.8ns   0 23.82ns 0 24.65ns 0 24.67ns 1.8 25.5ns 1.8 25.52ns 0 26.35ns 0 26.37ns   0 27.1ns   0 27.12ns 0)
Vin25_0 in25_0 0 PWL(0ns 0 14.45ns 0 14.47ns   0 15.3ns   0 15.32ns 0 16.15ns 0 16.17ns 1.8 17ns 1.8 17.02ns 0 17.85ns 0 17.87ns   0 18.7ns   0 18.72ns 0 19.55ns 0 19.57ns 1.8 20.4ns 1.8 20.42ns 0 21.25ns 0 21.27ns 1.8 22.1ns 1.8 22.12ns 0 22.95ns 0 22.97ns 1.8 23.8ns 1.8 23.82ns 0 24.65ns 0 24.67ns   0 25.5ns   0 25.52ns 0 26.35ns 0 26.37ns   0 27.1ns   0 27.12ns 0)
Vin26_0 in26_0 0 PWL(0ns 0 14.45ns 0 14.47ns   0 15.3ns   0 15.32ns 0 16.15ns 0 16.17ns 1.8 17ns 1.8 17.02ns 0 17.85ns 0 17.87ns 1.8 18.7ns 1.8 18.72ns 0 19.55ns 0 19.57ns 1.8 20.4ns 1.8 20.42ns 0 21.25ns 0 21.27ns   0 22.1ns   0 22.12ns 0 22.95ns 0 22.97ns   0 23.8ns   0 23.82ns 0 24.65ns 0 24.67ns   0 25.5ns   0 25.52ns 0 26.35ns 0 26.37ns 1.8 27.1ns 1.8 27.12ns 0)
Vin27_0 in27_0 0 PWL(0ns 0 14.45ns 0 14.47ns   0 15.3ns   0 15.32ns 0 16.15ns 0 16.17ns   0 17ns   0 17.02ns 0 17.85ns 0 17.87ns   0 18.7ns   0 18.72ns 0 19.55ns 0 19.57ns   0 20.4ns   0 20.42ns 0 21.25ns 0 21.27ns 1.8 22.1ns 1.8 22.12ns 0 22.95ns 0 22.97ns 1.8 23.8ns 1.8 23.82ns 0 24.65ns 0 24.67ns 1.8 25.5ns 1.8 25.52ns 0 26.35ns 0 26.37ns   0 27.1ns   0 27.12ns 0)

Vin30_0 in30_0 0 PWL(0ns 0 14.45ns 0 14.47ns 1.8 15.3ns 1.8 15.32ns 0 16.15ns 0 16.17ns 1.8 17ns 1.8 17.02ns 0 17.85ns 0 17.87ns   0 18.7ns   0 18.72ns 0 19.55ns 0 19.57ns   0 20.4ns   0 20.42ns 0 21.25ns 0 21.27ns   0 22.1ns   0 22.12ns 0 22.95ns 0 22.97ns   0 23.8ns   0 23.82ns 0 24.65ns 0 24.67ns   0 25.5ns   0 25.52ns 0 26.35ns 0 26.37ns   0 27.1ns   0 27.12ns 0)
Vin31_0 in31_0 0 PWL(0ns 0 14.45ns 0 14.47ns   0 15.3ns   0 15.32ns 0 16.15ns 0 16.17ns   0 17ns   0 17.02ns 0 17.85ns 0 17.87ns 1.8 18.7ns 1.8 18.72ns 0 19.55ns 0 19.57ns 1.8 20.4ns 1.8 20.42ns 0 21.25ns 0 21.27ns 1.8 22.1ns 1.8 22.12ns 0 22.95ns 0 22.97ns   0 23.8ns   0 23.82ns 0 24.65ns 0 24.67ns 1.8 25.5ns 1.8 25.52ns 0 26.35ns 0 26.37ns 1.8 27.1ns 1.8 27.12ns 0)
Vin32_0 in32_0 0 PWL(0ns 0 14.45ns 0 14.47ns 1.8 15.3ns 1.8 15.32ns 0 16.15ns 0 16.17ns   0 17ns   0 17.02ns 0 17.85ns 0 17.87ns   0 18.7ns   0 18.72ns 0 19.55ns 0 19.57ns   0 20.4ns   0 20.42ns 0 21.25ns 0 21.27ns 1.8 22.1ns 1.8 22.12ns 0 22.95ns 0 22.97ns 1.8 23.8ns 1.8 23.82ns 0 24.65ns 0 24.67ns 1.8 25.5ns 1.8 25.52ns 0 26.35ns 0 26.37ns   0 27.1ns   0 27.12ns 0)
Vin33_0 in33_0 0 PWL(0ns 0 14.45ns 0 14.47ns 1.8 15.3ns 1.8 15.32ns 0 16.15ns 0 16.17ns 1.8 17ns 1.8 17.02ns 0 17.85ns 0 17.87ns   0 18.7ns   0 18.72ns 0 19.55ns 0 19.57ns   0 20.4ns   0 20.42ns 0 21.25ns 0 21.27ns 1.8 22.1ns 1.8 22.12ns 0 22.95ns 0 22.97ns   0 23.8ns   0 23.82ns 0 24.65ns 0 24.67ns 1.8 25.5ns 1.8 25.52ns 0 26.35ns 0 26.37ns   0 27.1ns   0 27.12ns 0)
Vin34_0 in34_0 0 PWL(0ns 0 14.45ns 0 14.47ns 1.8 15.3ns 1.8 15.32ns 0 16.15ns 0 16.17ns   0 17ns   0 17.02ns 0 17.85ns 0 17.87ns   0 18.7ns   0 18.72ns 0 19.55ns 0 19.57ns 1.8 20.4ns 1.8 20.42ns 0 21.25ns 0 21.27ns 1.8 22.1ns 1.8 22.12ns 0 22.95ns 0 22.97ns 1.8 23.8ns 1.8 23.82ns 0 24.65ns 0 24.67ns   0 25.5ns   0 25.52ns 0 26.35ns 0 26.37ns 1.8 27.1ns 1.8 27.12ns 0)
Vin35_0 in35_0 0 PWL(0ns 0 14.45ns 0 14.47ns   0 15.3ns   0 15.32ns 0 16.15ns 0 16.17ns   0 17ns   0 17.02ns 0 17.85ns 0 17.87ns 1.8 18.7ns 1.8 18.72ns 0 19.55ns 0 19.57ns   0 20.4ns   0 20.42ns 0 21.25ns 0 21.27ns   0 22.1ns   0 22.12ns 0 22.95ns 0 22.97ns 1.8 23.8ns 1.8 23.82ns 0 24.65ns 0 24.67ns 1.8 25.5ns 1.8 25.52ns 0 26.35ns 0 26.37ns 1.8 27.1ns 1.8 27.12ns 0)
Vin36_0 in36_0 0 PWL(0ns 0 14.45ns 0 14.47ns   0 15.3ns   0 15.32ns 0 16.15ns 0 16.17ns 1.8 17ns 1.8 17.02ns 0 17.85ns 0 17.87ns   0 18.7ns   0 18.72ns 0 19.55ns 0 19.57ns   0 20.4ns   0 20.42ns 0 21.25ns 0 21.27ns 1.8 22.1ns 1.8 22.12ns 0 22.95ns 0 22.97ns 1.8 23.8ns 1.8 23.82ns 0 24.65ns 0 24.67ns   0 25.5ns   0 25.52ns 0 26.35ns 0 26.37ns 1.8 27.1ns 1.8 27.12ns 0)
Vin37_0 in37_0 0 PWL(0ns 0 14.45ns 0 14.47ns   0 15.3ns   0 15.32ns 0 16.15ns 0 16.17ns 1.8 17ns 1.8 17.02ns 0 17.85ns 0 17.87ns 1.8 18.7ns 1.8 18.72ns 0 19.55ns 0 19.57ns 1.8 20.4ns 1.8 20.42ns 0 21.25ns 0 21.27ns   0 22.1ns   0 22.12ns 0 22.95ns 0 22.97ns   0 23.8ns   0 23.82ns 0 24.65ns 0 24.67ns   0 25.5ns   0 25.52ns 0 26.35ns 0 26.37ns   0 27.1ns   0 27.12ns 0)

*** modify end


*** Write enable/ SA enable
* Vwe we 0 PWL(0ns 0 110.2ns 0 110.22ns 1.8 320ns 1.8 320.02ns 0 800ns 0 800.02ns 1.8 910.2ns 1.8 910.22ns 0)
Vwe we 0 PWL(0ns 0 0.85ns 0 0.87ns 1.8 1.7ns 1.8 1.72ns 0 2.55ns 0 2.57ns 1.8 3.4ns 1.8 3.42ns 0  4.25ns 0 4.27ns 1.8 5.1ns 1.8 5.12ns 0 5.95ns 0 5.97ns 1.8 6.8ns 1.8 6.82ns 0)
* Vse se 0 PWL(0ns 0 48ns 0 48.02ns 1.8 64ns 1.8 64.02ns 0  96ns 0 96.02ns 1.8 112ns 1.8 112.02ns 0)
Vse se 0 PWL(0ns 0 7.65ns 0 7.67ns 1.8 8.5ns 1.8 8.52ns 0 9.35ns 0 9.37ns 1.8 10.2ns 1.8 10.22ns 0 11.05ns 0 11.07ns 1.8 11.9ns 1.8 11.92ns 0 12.75ns 0 12.77ns 1.8 13.6ns 1.8 13.62ns 0)

.meas tran pwr avg power from=14.45ns to=35ns

* .option measform=3
.option post

.tran 0.1ns 35ns
* .probe tran pwr_bl = par'abs(V(bl)*i(x2.mn3))'
* .probe tran pwr_blb = par'abs(V(blb)*i(x2.mn4))'
.end

