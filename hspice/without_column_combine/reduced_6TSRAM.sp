
* reduced_6TSRAM 6T-SRAM + NOR
.op
.option post
.protect
* .lib '/cad/cell_lib/crn90g_3d3_lk_v1d2.l' tt
.lib '/afs/umich.edu/class/eecs598-002/SAED32/SAED32_EDK/tech/hspice/saed32nm.lib' tt
* .lib '/afs/umich.edu/class/eecs598-002/SAED32/SAED32_EDK/tech/hspice/saed32nm.lib' model_n18
.unprotect
* .global vdd vss


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
xmn4 2 in1 vss vss n18 w=1.2u L=200n
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


****************** instance name

.subckt sub_CIM pre0 pre1 pre2 pre3 pre4 pre5 pre6 pre7 d0_pre d1_pre d2_pre d3_pre d4_pre d5_pre d6_pre d7_pre wl0 wl1 wl2 wl3 we se in00 in01 in02 in03 in04 in05 in06 in07 in10 in11 in12 in13 in14 in15 in16 in17 in20 in21 in22 in23 in24 in25 in26 in27 in30 in31 in32 in33 in34 in35 in36 in37 out00 out01 out02 out03 out04 out05 out06 out07 out10 out11 out12 out13 out14 out15 out16 out17 out20 out21 out22 out23 out24 out25 out26 out27 out30 out31 out32 out33 out34 out35 out36 out37 dout0 dout1 dout2 dout3 dout4 dout5 dout6 dout7 vdd vss

Cg0 wl0 vss 472.44f
Cg1 wl1 vss 472.44f
Cg2 wl2 vss 472.44f
Cg3 wl3 vss 472.44f


Cd_bl0 bl0 vss 352.8f
Cd_blb0 blb0 vss 352.8f
Cd_bl1 bl1 vss 352.8f
Cd_blb1 blb1 vss 352.8f

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
x_buff_nor00 in00 in_b00 vdd vss inv_buf
x_buff_nor01 in01 in_b01 vdd vss inv_buf
x_buff_nor02 in02 in_b02 vdd vss inv_buf
x_buff_nor03 in03 in_b03 vdd vss inv_buf
x_buff_nor04 in04 in_b04 vdd vss inv_buf
x_buff_nor05 in05 in_b05 vdd vss inv_buf
x_buff_nor06 in06 in_b06 vdd vss inv_buf
x_buff_nor07 in07 in_b07 vdd vss inv_buf

x_buff_nor10 in10 in_b10 vdd vss inv_buf
x_buff_nor11 in11 in_b11 vdd vss inv_buf
x_buff_nor12 in12 in_b12 vdd vss inv_buf
x_buff_nor13 in13 in_b13 vdd vss inv_buf
x_buff_nor14 in14 in_b14 vdd vss inv_buf
x_buff_nor15 in15 in_b15 vdd vss inv_buf
x_buff_nor16 in16 in_b16 vdd vss inv_buf
x_buff_nor17 in17 in_b17 vdd vss inv_buf

x_buff_nor20 in20 in_b20 vdd vss inv_buf
x_buff_nor21 in21 in_b21 vdd vss inv_buf
x_buff_nor22 in22 in_b22 vdd vss inv_buf
x_buff_nor23 in23 in_b23 vdd vss inv_buf
x_buff_nor24 in24 in_b24 vdd vss inv_buf
x_buff_nor25 in25 in_b25 vdd vss inv_buf
x_buff_nor26 in26 in_b26 vdd vss inv_buf
x_buff_nor27 in27 in_b27 vdd vss inv_buf

x_buff_nor30 in30 in_b30 vdd vss inv_buf
x_buff_nor31 in31 in_b31 vdd vss inv_buf
x_buff_nor32 in32 in_b32 vdd vss inv_buf
x_buff_nor33 in33 in_b33 vdd vss inv_buf
x_buff_nor34 in34 in_b34 vdd vss inv_buf
x_buff_nor35 in35 in_b35 vdd vss inv_buf
x_buff_nor36 in36 in_b36 vdd vss inv_buf
x_buff_nor37 in37 in_b37 vdd vss inv_buf

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
.ends

x_sub_CIM0 pre_0_0 pre_1_0 pre_2_0 pre_3_0 pre_4_0 pre_5_0 pre_6_0 pre_7_0 pre_d0_0 pre_d1_0 pre_d2_0 pre_d3_0 pre_d4_0 pre_d5_0 pre_d6_0 pre_d7_0 wl_0 wl_1 wl_2 wl_3 w_en s_en in00_0 in01_0 in02_0 in03_0 in04_0 in05_0 in06_0 in07_0 in10_0 in11_0 in12_0 in13_0 in14_0 in15_0 in16_0 in17_0 in20_0 in21_0 in22_0 in23_0 in24_0 in25_0 in26_0 in27_0 in30_0 in31_0 in32_0 in33_0 in34_0 in35_0 in36_0 in37_0 out00_0 out01_0 out02_0 out03_0 out04_0 out05_0 out06_0 out07_0 out10_0 out11_0 out12_0 out13_0 out14_0 out15_0 out16_0 out17_0 out20_0 out21_0 out22_0 out23_0 out24_0 out25_0 out26_0 out27_0 out30_0 out31_0 out32_0 out33_0 out34_0 out35_0 out36_0 out37_0 dout_0_0 dout_1_0 dout_2_0 dout_3_0 dout_4_0 dout_5_0 dout_6_0 dout_7_0 vdd vss sub_CIM
x_sub_CIM1 pre_0_1 pre_1_1 pre_2_1 pre_3_1 pre_4_1 pre_5_1 pre_6_1 pre_7_1 pre_d0_1 pre_d1_1 pre_d2_1 pre_d3_1 pre_d4_1 pre_d5_1 pre_d6_1 pre_d7_1 wl_0 wl_1 wl_2 wl_3 w_en s_en in00_0 in01_0 in02_0 in03_0 in04_0 in05_0 in06_0 in07_0 in10_0 in11_0 in12_0 in13_0 in14_0 in15_0 in16_0 in17_0 in20_0 in21_0 in22_0 in23_0 in24_0 in25_0 in26_0 in27_0 in30_0 in31_0 in32_0 in33_0 in34_0 in35_0 in36_0 in37_0 out00_1 out01_1 out02_1 out03_1 out04_1 out05_1 out06_1 out07_1 out10_1 out11_1 out12_1 out13_1 out14_1 out15_1 out16_1 out17_1 out20_1 out21_1 out22_1 out23_1 out24_1 out25_1 out26_1 out27_1 out30_1 out31_1 out32_1 out33_1 out34_1 out35_1 out36_1 out37_1 dout_0_1 dout_1_1 dout_2_1 dout_3_1 dout_4_1 dout_5_1 dout_6_1 dout_7_1 vdd vss sub_CIM
x_sub_CIM2 pre_0_2 pre_1_2 pre_2_2 pre_3_2 pre_4_2 pre_5_2 pre_6_2 pre_7_2 pre_d0_2 pre_d1_2 pre_d2_2 pre_d3_2 pre_d4_2 pre_d5_2 pre_d6_2 pre_d7_2 wl_0 wl_1 wl_2 wl_3 w_en s_en in00_0 in01_0 in02_0 in03_0 in04_0 in05_0 in06_0 in07_0 in10_0 in11_0 in12_0 in13_0 in14_0 in15_0 in16_0 in17_0 in20_0 in21_0 in22_0 in23_0 in24_0 in25_0 in26_0 in27_0 in30_0 in31_0 in32_0 in33_0 in34_0 in35_0 in36_0 in37_0 out00_2 out01_2 out02_2 out03_2 out04_2 out05_2 out06_2 out07_2 out10_2 out11_2 out12_2 out13_2 out14_2 out15_2 out16_2 out17_2 out20_2 out21_2 out22_2 out23_2 out24_2 out25_2 out26_2 out27_2 out30_2 out31_2 out32_2 out33_2 out34_2 out35_2 out36_2 out37_2 dout_0_2 dout_1_2 dout_2_2 dout_3_2 dout_4_2 dout_5_2 dout_6_2 dout_7_2 vdd vss sub_CIM
x_sub_CIM3 pre_0_3 pre_1_3 pre_2_3 pre_3_3 pre_4_3 pre_5_3 pre_6_3 pre_7_3 pre_d0_3 pre_d1_3 pre_d2_3 pre_d3_3 pre_d4_3 pre_d5_3 pre_d6_3 pre_d7_3 wl_0 wl_1 wl_2 wl_3 w_en s_en in00_0 in01_0 in02_0 in03_0 in04_0 in05_0 in06_0 in07_0 in10_0 in11_0 in12_0 in13_0 in14_0 in15_0 in16_0 in17_0 in20_0 in21_0 in22_0 in23_0 in24_0 in25_0 in26_0 in27_0 in30_0 in31_0 in32_0 in33_0 in34_0 in35_0 in36_0 in37_0 out00_3 out01_3 out02_3 out03_3 out04_3 out05_3 out06_3 out07_3 out10_3 out11_3 out12_3 out13_3 out14_3 out15_3 out16_3 out17_3 out20_3 out21_3 out22_3 out23_3 out24_3 out25_3 out26_3 out27_3 out30_3 out31_3 out32_3 out33_3 out34_3 out35_3 out36_3 out37_3 dout_0_3 dout_1_3 dout_2_3 dout_3_3 dout_4_3 dout_5_3 dout_6_3 dout_7_3 vdd vss sub_CIM

* x_sub_CIM0 pre_0_0 pre_1_0 pre_2_0 pre_3_0 pre_4_0 pre_5_0 pre_6_0 pre_7_0 pre_d0_0 pre_d1_0 pre_d2_0 pre_d3_0 pre_d4_0 pre_d5_0 pre_d6_0 pre_d7_0 wl_0 wl_1 wl_2 wl_3 w_en s_en in00_0 in01_0 in02_0 in03_0 in04_0 in05_0 in06_0 in07_0 in10_0 in11_0 in12_0 in13_0 in14_0 in15_0 in16_0 in17_0 in20_0 in21_0 in22_0 in23_0 in24_0 in25_0 in26_0 in27_0 in30_0 in31_0 in32_0 in33_0 in34_0 in35_0 in36_0 in37_0 out00_0 out01_0 out02_0 out03_0 out04_0 out05_0 out06_0 out07_0 out10_0 out11_0 out12_0 out13_0 out14_0 out15_0 out16_0 out17_0 out20_0 out21_0 out22_0 out23_0 out24_0 out25_0 out26_0 out27_0 out30_0 out31_0 out32_0 out33_0 out34_0 out35_0 out36_0 out37_0 dout_0_0 dout_1_0 dout_2_0 dout_3_0 dout_4_0 dout_5_0 dout_6_0 dout_7_0 sub_CIM
* x_sub_CIM1 pre_0_1 pre_1_1 pre_2_1 pre_3_1 pre_4_1 pre_5_1 pre_6_1 pre_7_1 pre_d0_1 pre_d1_1 pre_d2_1 pre_d3_1 pre_d4_1 pre_d5_1 pre_d6_1 pre_d7_1 wl_0 wl_1 wl_2 wl_3 w_en s_en in00_1 in01_1 in02_1 in03_1 in04_1 in05_1 in06_1 in07_1 in10_1 in11_1 in12_1 in13_1 in14_1 in15_1 in16_1 in17_1 in20_1 in21_1 in22_1 in23_1 in24_1 in25_1 in26_1 in27_1 in30_1 in31_1 in32_1 in33_1 in34_1 in35_1 in36_1 in37_1 out00_1 out01_1 out02_1 out03_1 out04_1 out05_1 out06_1 out07_1 out10_1 out11_1 out12_1 out13_1 out14_1 out15_1 out16_1 out17_1 out20_1 out21_1 out22_1 out23_1 out24_1 out25_1 out26_1 out27_1 out30_1 out31_1 out32_1 out33_1 out34_1 out35_1 out36_1 out37_1 dout_0_1 dout_1_1 dout_2_1 dout_3_1 dout_4_1 dout_5_1 dout_6_1 dout_7_1 sub_CIM
* x_sub_CIM2 pre_0_2 pre_1_2 pre_2_2 pre_3_2 pre_4_2 pre_5_2 pre_6_2 pre_7_2 pre_d0_2 pre_d1_2 pre_d2_2 pre_d3_2 pre_d4_2 pre_d5_2 pre_d6_2 pre_d7_2 wl_0 wl_1 wl_2 wl_3 w_en s_en in00_2 in01_2 in02_2 in03_2 in04_2 in05_2 in06_2 in07_2 in10_2 in11_2 in12_2 in13_2 in14_2 in15_2 in16_2 in17_2 in20_2 in21_2 in22_2 in23_2 in24_2 in25_2 in26_2 in27_2 in30_2 in31_2 in32_2 in33_2 in34_2 in35_2 in36_2 in37_2 out00_2 out01_2 out02_2 out03_2 out04_2 out05_2 out06_2 out07_2 out10_2 out11_2 out12_2 out13_2 out14_2 out15_2 out16_2 out17_2 out20_2 out21_2 out22_2 out23_2 out24_2 out25_2 out26_2 out27_2 out30_2 out31_2 out32_2 out33_2 out34_2 out35_2 out36_2 out37_2 dout_0_2 dout_1_2 dout_2_2 dout_3_2 dout_4_2 dout_5_2 dout_6_2 dout_7_2 sub_CIM
* x_sub_CIM3 pre_0_3 pre_1_3 pre_2_3 pre_3_3 pre_4_3 pre_5_3 pre_6_3 pre_7_3 pre_d0_3 pre_d1_3 pre_d2_3 pre_d3_3 pre_d4_3 pre_d5_3 pre_d6_3 pre_d7_3 wl_0 wl_1 wl_2 wl_3 w_en s_en in00_3 in01_3 in02_3 in03_3 in04_3 in05_3 in06_3 in07_3 in10_3 in11_3 in12_3 in13_3 in14_3 in15_3 in16_3 in17_3 in20_3 in21_3 in22_3 in23_3 in24_3 in25_3 in26_3 in27_3 in30_3 in31_3 in32_3 in33_3 in34_3 in35_3 in36_3 in37_3 out00_3 out01_3 out02_3 out03_3 out04_3 out05_3 out06_3 out07_3 out10_3 out11_3 out12_3 out13_3 out14_3 out15_3 out16_3 out17_3 out20_3 out21_3 out22_3 out23_3 out24_3 out25_3 out26_3 out27_3 out30_3 out31_3 out32_3 out33_3 out34_3 out35_3 out36_3 out37_3 dout_0_3 dout_1_3 dout_2_3 dout_3_3 dout_4_3 dout_5_3 dout_6_3 dout_7_3 sub_CIM


*** Testben18 ***

Vdd vdd 0 dc 1.8v
Vss vss 0 dc 0v

*** Precharge
* Vpre0 pre0 0 PWL(0ns 0 16ns 0 16.02ns 1.8 32ns 1.8 32.02ns 0 48ns 0 48.02ns 1.8 64ns 1.8 64.02ns 0  96ns 0 96.02ns 1.8 112ns 1.8 112.02ns 0)
Vpre00 pre_0_0 0 PWL(0ns 0 5ns 0 5.02ns 1.8 10ns 1.8 10.02ns 0 15ns 0 15.02ns 1.8 20ns 1.8 20.02ns 0  25ns 0 25.02ns 1.8 30ns 1.8 30.02ns 0 35ns 0 35.02ns 1.8 40ns 1.8 40.02ns 0  45ns 0 45.02ns 1.8 50ns 1.8 50.02ns 0 55ns 0 55.02ns 1.8 60ns 1.8 60.02ns 0 65ns 0 65.02ns 1.8 70ns 1.8 70.02ns 0 75ns 0 75.02ns 1.8 80ns 1.8 80.02ns 0)
*  Vpre0 pre0 0 dc 1.8v
Vpre01 pre_1_0 0 PWL(0ns 0 5ns 0 5.02ns 1.8 10ns 1.8 10.02ns 0 15ns 0 15.02ns 1.8 20ns 1.8 20.02ns 0  25ns 0 25.02ns 1.8 30ns 1.8 30.02ns 0 35ns 0 35.02ns 1.8 40ns 1.8 40.02ns 0  45ns 0 45.02ns 1.8 50ns 1.8 50.02ns 0 55ns 0 55.02ns 1.8 60ns 1.8 60.02ns 0 65ns 0 65.02ns 1.8 70ns 1.8 70.02ns 0 75ns 0 75.02ns 1.8 80ns 1.8 80.02ns 0)
Vpre02 pre_2_0 0 PWL(0ns 0 5ns 0 5.02ns 1.8 10ns 1.8 10.02ns 0 15ns 0 15.02ns 1.8 20ns 1.8 20.02ns 0  25ns 0 25.02ns 1.8 30ns 1.8 30.02ns 0 35ns 0 35.02ns 1.8 40ns 1.8 40.02ns 0  45ns 0 45.02ns 1.8 50ns 1.8 50.02ns 0 55ns 0 55.02ns 1.8 60ns 1.8 60.02ns 0 65ns 0 65.02ns 1.8 70ns 1.8 70.02ns 0 75ns 0 75.02ns 1.8 80ns 1.8 80.02ns 0)
Vpre03 pre_3_0 0 PWL(0ns 0 5ns 0 5.02ns 1.8 10ns 1.8 10.02ns 0 15ns 0 15.02ns 1.8 20ns 1.8 20.02ns 0  25ns 0 25.02ns 1.8 30ns 1.8 30.02ns 0 35ns 0 35.02ns 1.8 40ns 1.8 40.02ns 0  45ns 0 45.02ns 1.8 50ns 1.8 50.02ns 0 55ns 0 55.02ns 1.8 60ns 1.8 60.02ns 0 65ns 0 65.02ns 1.8 70ns 1.8 70.02ns 0 75ns 0 75.02ns 1.8 80ns 1.8 80.02ns 0)
Vpre04 pre_4_0 0 PWL(0ns 0 5ns 0 5.02ns 1.8 10ns 1.8 10.02ns 0 15ns 0 15.02ns 1.8 20ns 1.8 20.02ns 0  25ns 0 25.02ns 1.8 30ns 1.8 30.02ns 0 35ns 0 35.02ns 1.8 40ns 1.8 40.02ns 0  45ns 0 45.02ns 1.8 50ns 1.8 50.02ns 0 55ns 0 55.02ns 1.8 60ns 1.8 60.02ns 0 65ns 0 65.02ns 1.8 70ns 1.8 70.02ns 0 75ns 0 75.02ns 1.8 80ns 1.8 80.02ns 0)
Vpre05 pre_5_0 0 PWL(0ns 0 5ns 0 5.02ns 1.8 10ns 1.8 10.02ns 0 15ns 0 15.02ns 1.8 20ns 1.8 20.02ns 0  25ns 0 25.02ns 1.8 30ns 1.8 30.02ns 0 35ns 0 35.02ns 1.8 40ns 1.8 40.02ns 0  45ns 0 45.02ns 1.8 50ns 1.8 50.02ns 0 55ns 0 55.02ns 1.8 60ns 1.8 60.02ns 0 65ns 0 65.02ns 1.8 70ns 1.8 70.02ns 0 75ns 0 75.02ns 1.8 80ns 1.8 80.02ns 0)
Vpre06 pre_6_0 0 PWL(0ns 0 5ns 0 5.02ns 1.8 10ns 1.8 10.02ns 0 15ns 0 15.02ns 1.8 20ns 1.8 20.02ns 0  25ns 0 25.02ns 1.8 30ns 1.8 30.02ns 0 35ns 0 35.02ns 1.8 40ns 1.8 40.02ns 0  45ns 0 45.02ns 1.8 50ns 1.8 50.02ns 0 55ns 0 55.02ns 1.8 60ns 1.8 60.02ns 0 65ns 0 65.02ns 1.8 70ns 1.8 70.02ns 0 75ns 0 75.02ns 1.8 80ns 1.8 80.02ns 0)
Vpre07 pre_7_0 0 PWL(0ns 0 5ns 0 5.02ns 1.8 10ns 1.8 10.02ns 0 15ns 0 15.02ns 1.8 20ns 1.8 20.02ns 0  25ns 0 25.02ns 1.8 30ns 1.8 30.02ns 0 35ns 0 35.02ns 1.8 40ns 1.8 40.02ns 0  45ns 0 45.02ns 1.8 50ns 1.8 50.02ns 0 55ns 0 55.02ns 1.8 60ns 1.8 60.02ns 0 65ns 0 65.02ns 1.8 70ns 1.8 70.02ns 0 75ns 0 75.02ns 1.8 80ns 1.8 80.02ns 0)

Vpre10 pre_0_1 0 PWL(0ns 0 5ns 0 5.02ns 1.8 10ns 1.8 10.02ns 0 15ns 0 15.02ns 1.8 20ns 1.8 20.02ns 0  25ns 0 25.02ns 1.8 30ns 1.8 30.02ns 0 35ns 0 35.02ns 1.8 40ns 1.8 40.02ns 0  45ns 0 45.02ns 1.8 50ns 1.8 50.02ns 0 55ns 0 55.02ns 1.8 60ns 1.8 60.02ns 0 65ns 0 65.02ns 1.8 70ns 1.8 70.02ns 0 75ns 0 75.02ns 1.8 80ns 1.8 80.02ns 0)
Vpre11 pre_1_1 0 PWL(0ns 0 5ns 0 5.02ns 1.8 10ns 1.8 10.02ns 0 15ns 0 15.02ns 1.8 20ns 1.8 20.02ns 0  25ns 0 25.02ns 1.8 30ns 1.8 30.02ns 0 35ns 0 35.02ns 1.8 40ns 1.8 40.02ns 0  45ns 0 45.02ns 1.8 50ns 1.8 50.02ns 0 55ns 0 55.02ns 1.8 60ns 1.8 60.02ns 0 65ns 0 65.02ns 1.8 70ns 1.8 70.02ns 0 75ns 0 75.02ns 1.8 80ns 1.8 80.02ns 0)
Vpre12 pre_2_1 0 PWL(0ns 0 5ns 0 5.02ns 1.8 10ns 1.8 10.02ns 0 15ns 0 15.02ns 1.8 20ns 1.8 20.02ns 0  25ns 0 25.02ns 1.8 30ns 1.8 30.02ns 0 35ns 0 35.02ns 1.8 40ns 1.8 40.02ns 0  45ns 0 45.02ns 1.8 50ns 1.8 50.02ns 0 55ns 0 55.02ns 1.8 60ns 1.8 60.02ns 0 65ns 0 65.02ns 1.8 70ns 1.8 70.02ns 0 75ns 0 75.02ns 1.8 80ns 1.8 80.02ns 0)
Vpre13 pre_3_1 0 PWL(0ns 0 5ns 0 5.02ns 1.8 10ns 1.8 10.02ns 0 15ns 0 15.02ns 1.8 20ns 1.8 20.02ns 0  25ns 0 25.02ns 1.8 30ns 1.8 30.02ns 0 35ns 0 35.02ns 1.8 40ns 1.8 40.02ns 0  45ns 0 45.02ns 1.8 50ns 1.8 50.02ns 0 55ns 0 55.02ns 1.8 60ns 1.8 60.02ns 0 65ns 0 65.02ns 1.8 70ns 1.8 70.02ns 0 75ns 0 75.02ns 1.8 80ns 1.8 80.02ns 0)
Vpre14 pre_4_1 0 PWL(0ns 0 5ns 0 5.02ns 1.8 10ns 1.8 10.02ns 0 15ns 0 15.02ns 1.8 20ns 1.8 20.02ns 0  25ns 0 25.02ns 1.8 30ns 1.8 30.02ns 0 35ns 0 35.02ns 1.8 40ns 1.8 40.02ns 0  45ns 0 45.02ns 1.8 50ns 1.8 50.02ns 0 55ns 0 55.02ns 1.8 60ns 1.8 60.02ns 0 65ns 0 65.02ns 1.8 70ns 1.8 70.02ns 0 75ns 0 75.02ns 1.8 80ns 1.8 80.02ns 0)
Vpre15 pre_5_1 0 PWL(0ns 0 5ns 0 5.02ns 1.8 10ns 1.8 10.02ns 0 15ns 0 15.02ns 1.8 20ns 1.8 20.02ns 0  25ns 0 25.02ns 1.8 30ns 1.8 30.02ns 0 35ns 0 35.02ns 1.8 40ns 1.8 40.02ns 0  45ns 0 45.02ns 1.8 50ns 1.8 50.02ns 0 55ns 0 55.02ns 1.8 60ns 1.8 60.02ns 0 65ns 0 65.02ns 1.8 70ns 1.8 70.02ns 0 75ns 0 75.02ns 1.8 80ns 1.8 80.02ns 0)
Vpre16 pre_6_1 0 PWL(0ns 0 5ns 0 5.02ns 1.8 10ns 1.8 10.02ns 0 15ns 0 15.02ns 1.8 20ns 1.8 20.02ns 0  25ns 0 25.02ns 1.8 30ns 1.8 30.02ns 0 35ns 0 35.02ns 1.8 40ns 1.8 40.02ns 0  45ns 0 45.02ns 1.8 50ns 1.8 50.02ns 0 55ns 0 55.02ns 1.8 60ns 1.8 60.02ns 0 65ns 0 65.02ns 1.8 70ns 1.8 70.02ns 0 75ns 0 75.02ns 1.8 80ns 1.8 80.02ns 0)
Vpre17 pre_7_1 0 PWL(0ns 0 5ns 0 5.02ns 1.8 10ns 1.8 10.02ns 0 15ns 0 15.02ns 1.8 20ns 1.8 20.02ns 0  25ns 0 25.02ns 1.8 30ns 1.8 30.02ns 0 35ns 0 35.02ns 1.8 40ns 1.8 40.02ns 0  45ns 0 45.02ns 1.8 50ns 1.8 50.02ns 0 55ns 0 55.02ns 1.8 60ns 1.8 60.02ns 0 65ns 0 65.02ns 1.8 70ns 1.8 70.02ns 0 75ns 0 75.02ns 1.8 80ns 1.8 80.02ns 0)

Vpre20 pre_0_2 0 PWL(0ns 0 5ns 0 5.02ns 1.8 10ns 1.8 10.02ns 0 15ns 0 15.02ns 1.8 20ns 1.8 20.02ns 0  25ns 0 25.02ns 1.8 30ns 1.8 30.02ns 0 35ns 0 35.02ns 1.8 40ns 1.8 40.02ns 0  45ns 0 45.02ns 1.8 50ns 1.8 50.02ns 0 55ns 0 55.02ns 1.8 60ns 1.8 60.02ns 0 65ns 0 65.02ns 1.8 70ns 1.8 70.02ns 0 75ns 0 75.02ns 1.8 80ns 1.8 80.02ns 0)
Vpre21 pre_1_2 0 PWL(0ns 0 5ns 0 5.02ns 1.8 10ns 1.8 10.02ns 0 15ns 0 15.02ns 1.8 20ns 1.8 20.02ns 0  25ns 0 25.02ns 1.8 30ns 1.8 30.02ns 0 35ns 0 35.02ns 1.8 40ns 1.8 40.02ns 0  45ns 0 45.02ns 1.8 50ns 1.8 50.02ns 0 55ns 0 55.02ns 1.8 60ns 1.8 60.02ns 0 65ns 0 65.02ns 1.8 70ns 1.8 70.02ns 0 75ns 0 75.02ns 1.8 80ns 1.8 80.02ns 0)
Vpre22 pre_2_2 0 PWL(0ns 0 5ns 0 5.02ns 1.8 10ns 1.8 10.02ns 0 15ns 0 15.02ns 1.8 20ns 1.8 20.02ns 0  25ns 0 25.02ns 1.8 30ns 1.8 30.02ns 0 35ns 0 35.02ns 1.8 40ns 1.8 40.02ns 0  45ns 0 45.02ns 1.8 50ns 1.8 50.02ns 0 55ns 0 55.02ns 1.8 60ns 1.8 60.02ns 0 65ns 0 65.02ns 1.8 70ns 1.8 70.02ns 0 75ns 0 75.02ns 1.8 80ns 1.8 80.02ns 0)
Vpre23 pre_3_2 0 PWL(0ns 0 5ns 0 5.02ns 1.8 10ns 1.8 10.02ns 0 15ns 0 15.02ns 1.8 20ns 1.8 20.02ns 0  25ns 0 25.02ns 1.8 30ns 1.8 30.02ns 0 35ns 0 35.02ns 1.8 40ns 1.8 40.02ns 0  45ns 0 45.02ns 1.8 50ns 1.8 50.02ns 0 55ns 0 55.02ns 1.8 60ns 1.8 60.02ns 0 65ns 0 65.02ns 1.8 70ns 1.8 70.02ns 0 75ns 0 75.02ns 1.8 80ns 1.8 80.02ns 0)
Vpre24 pre_4_2 0 PWL(0ns 0 5ns 0 5.02ns 1.8 10ns 1.8 10.02ns 0 15ns 0 15.02ns 1.8 20ns 1.8 20.02ns 0  25ns 0 25.02ns 1.8 30ns 1.8 30.02ns 0 35ns 0 35.02ns 1.8 40ns 1.8 40.02ns 0  45ns 0 45.02ns 1.8 50ns 1.8 50.02ns 0 55ns 0 55.02ns 1.8 60ns 1.8 60.02ns 0 65ns 0 65.02ns 1.8 70ns 1.8 70.02ns 0 75ns 0 75.02ns 1.8 80ns 1.8 80.02ns 0)
Vpre25 pre_5_2 0 PWL(0ns 0 5ns 0 5.02ns 1.8 10ns 1.8 10.02ns 0 15ns 0 15.02ns 1.8 20ns 1.8 20.02ns 0  25ns 0 25.02ns 1.8 30ns 1.8 30.02ns 0 35ns 0 35.02ns 1.8 40ns 1.8 40.02ns 0  45ns 0 45.02ns 1.8 50ns 1.8 50.02ns 0 55ns 0 55.02ns 1.8 60ns 1.8 60.02ns 0 65ns 0 65.02ns 1.8 70ns 1.8 70.02ns 0 75ns 0 75.02ns 1.8 80ns 1.8 80.02ns 0)
Vpre26 pre_6_2 0 PWL(0ns 0 5ns 0 5.02ns 1.8 10ns 1.8 10.02ns 0 15ns 0 15.02ns 1.8 20ns 1.8 20.02ns 0  25ns 0 25.02ns 1.8 30ns 1.8 30.02ns 0 35ns 0 35.02ns 1.8 40ns 1.8 40.02ns 0  45ns 0 45.02ns 1.8 50ns 1.8 50.02ns 0 55ns 0 55.02ns 1.8 60ns 1.8 60.02ns 0 65ns 0 65.02ns 1.8 70ns 1.8 70.02ns 0 75ns 0 75.02ns 1.8 80ns 1.8 80.02ns 0)
Vpre27 pre_7_2 0 PWL(0ns 0 5ns 0 5.02ns 1.8 10ns 1.8 10.02ns 0 15ns 0 15.02ns 1.8 20ns 1.8 20.02ns 0  25ns 0 25.02ns 1.8 30ns 1.8 30.02ns 0 35ns 0 35.02ns 1.8 40ns 1.8 40.02ns 0  45ns 0 45.02ns 1.8 50ns 1.8 50.02ns 0 55ns 0 55.02ns 1.8 60ns 1.8 60.02ns 0 65ns 0 65.02ns 1.8 70ns 1.8 70.02ns 0 75ns 0 75.02ns 1.8 80ns 1.8 80.02ns 0)

Vpre30 pre_0_3 0 PWL(0ns 0 5ns 0 5.02ns 1.8 10ns 1.8 10.02ns 0 15ns 0 15.02ns 1.8 20ns 1.8 20.02ns 0  25ns 0 25.02ns 1.8 30ns 1.8 30.02ns 0 35ns 0 35.02ns 1.8 40ns 1.8 40.02ns 0  45ns 0 45.02ns 1.8 50ns 1.8 50.02ns 0 55ns 0 55.02ns 1.8 60ns 1.8 60.02ns 0 65ns 0 65.02ns 1.8 70ns 1.8 70.02ns 0 75ns 0 75.02ns 1.8 80ns 1.8 80.02ns 0)
Vpre31 pre_1_3 0 PWL(0ns 0 5ns 0 5.02ns 1.8 10ns 1.8 10.02ns 0 15ns 0 15.02ns 1.8 20ns 1.8 20.02ns 0  25ns 0 25.02ns 1.8 30ns 1.8 30.02ns 0 35ns 0 35.02ns 1.8 40ns 1.8 40.02ns 0  45ns 0 45.02ns 1.8 50ns 1.8 50.02ns 0 55ns 0 55.02ns 1.8 60ns 1.8 60.02ns 0 65ns 0 65.02ns 1.8 70ns 1.8 70.02ns 0 75ns 0 75.02ns 1.8 80ns 1.8 80.02ns 0)
Vpre32 pre_2_3 0 PWL(0ns 0 5ns 0 5.02ns 1.8 10ns 1.8 10.02ns 0 15ns 0 15.02ns 1.8 20ns 1.8 20.02ns 0  25ns 0 25.02ns 1.8 30ns 1.8 30.02ns 0 35ns 0 35.02ns 1.8 40ns 1.8 40.02ns 0  45ns 0 45.02ns 1.8 50ns 1.8 50.02ns 0 55ns 0 55.02ns 1.8 60ns 1.8 60.02ns 0 65ns 0 65.02ns 1.8 70ns 1.8 70.02ns 0 75ns 0 75.02ns 1.8 80ns 1.8 80.02ns 0)
Vpre33 pre_3_3 0 PWL(0ns 0 5ns 0 5.02ns 1.8 10ns 1.8 10.02ns 0 15ns 0 15.02ns 1.8 20ns 1.8 20.02ns 0  25ns 0 25.02ns 1.8 30ns 1.8 30.02ns 0 35ns 0 35.02ns 1.8 40ns 1.8 40.02ns 0  45ns 0 45.02ns 1.8 50ns 1.8 50.02ns 0 55ns 0 55.02ns 1.8 60ns 1.8 60.02ns 0 65ns 0 65.02ns 1.8 70ns 1.8 70.02ns 0 75ns 0 75.02ns 1.8 80ns 1.8 80.02ns 0)
Vpre34 pre_4_3 0 PWL(0ns 0 5ns 0 5.02ns 1.8 10ns 1.8 10.02ns 0 15ns 0 15.02ns 1.8 20ns 1.8 20.02ns 0  25ns 0 25.02ns 1.8 30ns 1.8 30.02ns 0 35ns 0 35.02ns 1.8 40ns 1.8 40.02ns 0  45ns 0 45.02ns 1.8 50ns 1.8 50.02ns 0 55ns 0 55.02ns 1.8 60ns 1.8 60.02ns 0 65ns 0 65.02ns 1.8 70ns 1.8 70.02ns 0 75ns 0 75.02ns 1.8 80ns 1.8 80.02ns 0)
Vpre35 pre_5_3 0 PWL(0ns 0 5ns 0 5.02ns 1.8 10ns 1.8 10.02ns 0 15ns 0 15.02ns 1.8 20ns 1.8 20.02ns 0  25ns 0 25.02ns 1.8 30ns 1.8 30.02ns 0 35ns 0 35.02ns 1.8 40ns 1.8 40.02ns 0  45ns 0 45.02ns 1.8 50ns 1.8 50.02ns 0 55ns 0 55.02ns 1.8 60ns 1.8 60.02ns 0 65ns 0 65.02ns 1.8 70ns 1.8 70.02ns 0 75ns 0 75.02ns 1.8 80ns 1.8 80.02ns 0)
Vpre36 pre_6_3 0 PWL(0ns 0 5ns 0 5.02ns 1.8 10ns 1.8 10.02ns 0 15ns 0 15.02ns 1.8 20ns 1.8 20.02ns 0  25ns 0 25.02ns 1.8 30ns 1.8 30.02ns 0 35ns 0 35.02ns 1.8 40ns 1.8 40.02ns 0  45ns 0 45.02ns 1.8 50ns 1.8 50.02ns 0 55ns 0 55.02ns 1.8 60ns 1.8 60.02ns 0 65ns 0 65.02ns 1.8 70ns 1.8 70.02ns 0 75ns 0 75.02ns 1.8 80ns 1.8 80.02ns 0)
Vpre37 pre_7_3 0 PWL(0ns 0 5ns 0 5.02ns 1.8 10ns 1.8 10.02ns 0 15ns 0 15.02ns 1.8 20ns 1.8 20.02ns 0  25ns 0 25.02ns 1.8 30ns 1.8 30.02ns 0 35ns 0 35.02ns 1.8 40ns 1.8 40.02ns 0  45ns 0 45.02ns 1.8 50ns 1.8 50.02ns 0 55ns 0 55.02ns 1.8 60ns 1.8 60.02ns 0 65ns 0 65.02ns 1.8 70ns 1.8 70.02ns 0 75ns 0 75.02ns 1.8 80ns 1.8 80.02ns 0)


*** WL
* Vwl0 wl0 0 PWL(0ns 1.8 80ns 1.8 80.02ns 0 160ns 0 160.02ns 1.8 320ns 1.8 320.02ns 0 480ns 0 480.02ns 1.8 640ns 1.8 640.02ns 0 800ns 0 800.02ns 1.8 960ns 1.8 960.02ns 0 1120ns 0 1120.02ns 1.8 1280ns 1.8 1280.02ns 0)
Vwl0 wl_0 0 PWL(0ns 0 5ns 0 5.02ns 1.8 10ns 1.8 10.02ns 0 45ns 0 45.02ns 1.8 50ns 1.8 50.02ns 0)
Vwl1 wl_1 0 PWL(0ns 0 15ns 0 15.02ns 1.8 20ns 1.8 20.02ns 0 55ns 0 55.02ns 1.8 60ns 1.8 60.02ns 0)
Vwl2 wl_2 0 PWL(0ns 0 25ns 0 25.02ns 1.8 30ns 1.8 30.02ns 0 65ns 0 65.02ns 1.8 70ns 1.8 70.02ns 0)
Vwl3 wl_3 0 PWL(0ns 0 35ns 0 35.02ns 1.8 40ns 1.8 40.02ns 0 75ns 0 75.02ns 1.8 80ns 1.8 80.02ns 0)

*** You should only modify from here
*** Data in (Weight)

Vd00 pre_d0_0 0 PWL(0ns 0 5ns 0 5.02ns 1.8 10ns 1.8 10.02ns 0 15ns 0 15.02ns 1.8 20ns 1.8 20.02ns 0 25ns 0 25.02ns 1.8 30ns 1.8 30.02ns 0 35ns 0 35.02ns 1.8 40ns 1.8 40.02ns 0 )
* Vd0 d0_pre 0 dc 0V
* write 0 -> write 1
* Vd0 d0_pre 0 PWL(0ns 0 160ns 0 160.02ns 0 320ns 0 320.02ns 0 800ns 0 800.02ns 1.8 960ns 1.8 960.02ns 0)
Vd01 pre_d1_0 0 PWL(0ns 0 0.85ns 0 0.87ns 1.8 1.7ns 1.8 1.72ns 0 2.55ns 0 2.57ns   0 3.4ns   0 3.42ns 0  4.25ns 0 4.27ns   0 5.1ns   0 5.12ns 0 5.95ns 0 5.97ns 1.8 6.8ns 1.8 6.82ns 0)     
Vd02 pre_d2_0 0 PWL(0ns 0 0.85ns 0 0.87ns 1.8 1.7ns 1.8 1.72ns 0 2.55ns 0 2.57ns 1.8 3.4ns 1.8 3.42ns 0  4.25ns 0 4.27ns 1.8 5.1ns 1.8 5.12ns 0 5.95ns 0 5.97ns 1.8 6.8ns 1.8 6.82ns 0)     
Vd03 pre_d3_0 0 PWL(0ns 0 0.85ns 0 0.87ns   0 1.7ns   0 1.72ns 0 2.55ns 0 2.57ns   0 3.4ns   0 3.42ns 0  4.25ns 0 4.27ns 1.8 5.1ns 1.8 5.12ns 0 5.95ns 0 5.97ns 1.8 6.8ns 1.8 6.82ns 0)     
Vd04 pre_d4_0 0 PWL(0ns 0 0.85ns 0 0.87ns 1.8 1.7ns 1.8 1.72ns 0 2.55ns 0 2.57ns   0 3.4ns 1.8 3.42ns 0  4.25ns 0 4.27ns   0 5.1ns   0 5.12ns 0 5.95ns 0 5.97ns 1.8 6.8ns 1.8 6.82ns 0)     
Vd05 pre_d5_0 0 PWL(0ns 0 0.85ns 0 0.87ns   0 1.7ns   0 1.72ns 0 2.55ns 0 2.57ns 1.8 3.4ns 1.8 3.42ns 0  4.25ns 0 4.27ns 1.8 5.1ns 1.8 5.12ns 0 5.95ns 0 5.97ns   0 6.8ns   0 6.82ns 0)     
Vd06 pre_d6_0 0 PWL(0ns 0 0.85ns 0 0.87ns 1.8 1.7ns 1.8 1.72ns 0 2.55ns 0 2.57ns 1.8 3.4ns 1.8 3.42ns 0  4.25ns 0 4.27ns 1.8 5.1ns 1.8 5.12ns 0 5.95ns 0 5.97ns 1.8 6.8ns 1.8 6.82ns 0)     
Vd07 pre_d7_0 0 PWL(0ns 0 0.85ns 0 0.87ns 1.8 1.7ns 1.8 1.72ns 0 2.55ns 0 2.57ns   0 3.4ns   0 3.42ns 0  4.25ns 0 4.27ns   0 5.1ns   0 5.12ns 0 5.95ns 0 5.97ns 1.8 6.8ns 1.8 6.82ns 0)

Vd10 pre_d0_1 0 PWL(0ns 0 0.85ns 0 0.87ns 1.8 1.7ns 1.8 1.72ns 0 2.55ns 0 2.57ns 1.8 3.4ns 1.8 3.42ns 0  4.25ns 0 4.27ns 1.8 5.1ns 1.8 5.12ns 0 5.95ns 0 5.97ns 1.8 6.8ns 1.8 6.82ns 0)
Vd11 pre_d1_1 0 PWL(0ns 0 0.85ns 0 0.87ns 1.8 1.7ns 1.8 1.72ns 0 2.55ns 0 2.57ns   0 3.4ns   0 3.42ns 0  4.25ns 0 4.27ns 1.8 5.1ns 1.8 5.12ns 0 5.95ns 0 5.97ns   0 6.8ns   0 6.82ns 0)
Vd13 pre_d3_1 0 PWL(0ns 0 0.85ns 0 0.87ns 1.8 1.7ns 1.8 1.72ns 0 2.55ns 0 2.57ns 1.8 3.4ns 1.8 3.42ns 0  4.25ns 0 4.27ns 1.8 5.1ns 1.8 5.12ns 0 5.95ns 0 5.97ns 1.8 6.8ns 1.8 6.82ns 0)
Vd14 pre_d4_1 0 PWL(0ns 0 0.85ns 0 0.87ns   0 1.7ns 1.8 1.72ns 0 2.55ns 0 2.57ns   0 3.4ns   0 3.42ns 0  4.25ns 0 4.27ns   0 5.1ns   0 5.12ns 0 5.95ns 0 5.97ns 1.8 6.8ns 1.8 6.82ns 0)
Vd15 pre_d5_1 0 PWL(0ns 0 0.85ns 0 0.87ns 1.8 1.7ns 1.8 1.72ns 0 2.55ns 0 2.57ns 1.8 3.4ns 1.8 3.42ns 0  4.25ns 0 4.27ns 1.8 5.1ns 1.8 5.12ns 0 5.95ns 0 5.97ns   0 6.8ns   0 6.82ns 0)
Vd16 pre_d6_1 0 PWL(0ns 0 0.85ns 0 0.87ns   0 1.7ns 1.8 1.72ns 0 2.55ns 0 2.57ns   0 3.4ns   0 3.42ns 0  4.25ns 0 4.27ns 1.8 5.1ns 1.8 5.12ns 0 5.95ns 0 5.97ns 1.8 6.8ns 1.8 6.82ns 0)
Vd17 pre_d7_1 0 PWL(0ns 0 0.85ns 0 0.87ns 1.8 1.7ns 1.8 1.72ns 0 2.55ns 0 2.57ns 1.8 3.4ns 1.8 3.42ns 0  4.25ns 0 4.27ns 1.8 5.1ns 1.8 5.12ns 0 5.95ns 0 5.97ns   0 6.8ns   0 6.82ns 0)

Vd20 pre_d0_2 0 PWL(0ns 0 0.85ns 0 0.87ns 1.8 1.7ns 1.8 1.72ns 0 2.55ns 0 2.57ns   0 3.4ns   0 3.42ns 0  4.25ns 0 4.27ns 1.8 5.1ns 1.8 5.12ns 0 5.95ns 0 5.97ns 1.8 6.8ns 1.8 6.82ns 0)
Vd21 pre_d1_2 0 PWL(0ns 0 0.85ns 0 0.87ns 1.8 1.7ns 1.8 1.72ns 0 2.55ns 0 2.57ns 1.8 3.4ns 1.8 3.42ns 0  4.25ns 0 4.27ns   0 5.1ns   0 5.12ns 0 5.95ns 0 5.97ns   0 6.8ns   0 6.82ns 0)
Vd23 pre_d3_2 0 PWL(0ns 0 0.85ns 0 0.87ns   0 1.7ns   0 1.72ns 0 2.55ns 0 2.57ns 1.8 3.4ns 1.8 3.42ns 0  4.25ns 0 4.27ns 1.8 5.1ns 1.8 5.12ns 0 5.95ns 0 5.97ns 1.8 6.8ns 1.8 6.82ns 0)
Vd24 pre_d4_2 0 PWL(0ns 0 0.85ns 0 0.87ns   0 1.7ns   0 1.72ns 0 2.55ns 0 2.57ns 1.8 3.4ns 1.8 3.42ns 0  4.25ns 0 4.27ns 1.8 5.1ns 1.8 5.12ns 0 5.95ns 0 5.97ns 1.8 6.8ns 1.8 6.82ns 0)
Vd25 pre_d5_2 0 PWL(0ns 0 0.85ns 0 0.87ns   0 1.7ns   0 1.72ns 0 2.55ns 0 2.57ns 1.8 3.4ns 1.8 3.42ns 0  4.25ns 0 4.27ns 1.8 5.1ns 1.8 5.12ns 0 5.95ns 0 5.97ns   0 6.8ns   0 6.82ns 0)
Vd26 pre_d6_2 0 PWL(0ns 0 0.85ns 0 0.87ns 1.8 1.7ns 1.8 1.72ns 0 2.55ns 0 2.57ns   0 3.4ns   0 3.42ns 0  4.25ns 0 4.27ns   0 5.1ns   0 5.12ns 0 5.95ns 0 5.97ns 1.8 6.8ns 1.8 6.82ns 0)
Vd27 pre_d7_2 0 PWL(0ns 0 0.85ns 0 0.87ns 1.8 1.7ns 1.8 1.72ns 0 2.55ns 0 2.57ns 1.8 3.4ns 1.8 3.42ns 0  4.25ns 0 4.27ns 1.8 5.1ns 1.8 5.12ns 0 5.95ns 0 5.97ns 1.8 6.8ns 1.8 6.82ns 0)

Vd30 pre_d0_3 0 PWL(0ns 0 0.85ns 0 0.87ns   0 1.7ns   0 1.72ns 0 2.55ns 0 2.57ns 1.8 3.4ns 1.8 3.42ns 0  4.25ns 0 4.27ns 1.8 5.1ns 1.8 5.12ns 0 5.95ns 0 5.97ns   0 6.8ns   0 6.82ns 0)
Vd31 pre_d1_3 0 PWL(0ns 0 0.85ns 0 0.87ns 1.8 1.7ns 1.8 1.72ns 0 2.55ns 0 2.57ns 1.8 3.4ns 1.8 3.42ns 0  4.25ns 0 4.27ns 1.8 5.1ns 1.8 5.12ns 0 5.95ns 0 5.97ns 1.8 6.8ns 1.8 6.82ns 0)
Vd33 pre_d3_3 0 PWL(0ns 0 0.85ns 0 0.87ns 1.8 1.7ns 1.8 1.72ns 0 2.55ns 0 2.57ns 1.8 3.4ns 1.8 3.42ns 0  4.25ns 0 4.27ns   0 5.1ns   0 5.12ns 0 5.95ns 0 5.97ns 1.8 6.8ns 1.8 6.82ns 0)
Vd34 pre_d4_3 0 PWL(0ns 0 0.85ns 0 0.87ns 1.8 1.7ns 1.8 1.72ns 0 2.55ns 0 2.57ns 1.8 3.4ns 1.8 3.42ns 0  4.25ns 0 4.27ns 1.8 5.1ns 1.8 5.12ns 0 5.95ns 0 5.97ns 1.8 6.8ns 1.8 6.82ns 0)
Vd35 pre_d5_3 0 PWL(0ns 0 0.85ns 0 0.87ns 1.8 1.7ns 1.8 1.72ns 0 2.55ns 0 2.57ns   0 3.4ns   0 3.42ns 0  4.25ns 0 4.27ns 1.8 5.1ns 1.8 5.12ns 0 5.95ns 0 5.97ns   0 6.8ns   0 6.82ns 0)
Vd36 pre_d6_3 0 PWL(0ns 0 0.85ns 0 0.87ns   0 1.7ns   0 1.72ns 0 2.55ns 0 2.57ns 1.8 3.4ns 1.8 3.42ns 0  4.25ns 0 4.27ns   0 5.1ns   0 5.12ns 0 5.95ns 0 5.97ns 1.8 6.8ns 1.8 6.82ns 0)
Vd37 pre_d7_3 0 PWL(0ns 0 0.85ns 0 0.87ns 1.8 1.7ns 1.8 1.72ns 0 2.55ns 0 2.57ns   0 3.4ns   0 3.42ns 0  4.25ns 0 4.27ns 1.8 5.1ns 1.8 5.12ns 0 5.95ns 0 5.97ns   0 6.8ns   0 6.82ns  0


*** Modify end


*** Write enable/ SA enable
* Vwe we 0 PWL(0ns 0 160ns 0 160.02ns 1.8 320ns 1.8 320.02ns 0 800ns 0 800.02ns 1.8 960ns 1.8 960.02ns 0)
Vwe w_en 0 PWL(0ns 0 5ns 0 5.02ns 1.8 10ns 1.8 10.02ns 0 15ns 0 15.02ns 1.8 20ns 1.8 20.02ns 0  25ns 0 25.02ns 1.8 30ns 1.8 30.02ns 0 35ns 0 35.02ns 1.8 40ns 1.8 40.02ns 0)
* Vse se 0 PWL(0ns 0 48ns 0 48.02ns 1.8 64ns 1.8 64.02ns 0  96ns 0 96.02ns 1.8 112ns 1.8 112.02ns 0)
Vse s_en 0 PWL(0ns 0 45ns 0 45.02ns 1.8 50ns 1.8 50.02ns 0 55ns 0 55.02ns 1.8 60ns 1.8 60.02ns 0 65ns 0 65.02ns 1.8 70ns 1.8 70.02ns 0 75ns 0 75.02ns 1.8 80ns 1.8 80.02ns 0)

* Vin00 in00 0 PWL(0ns 0 80ns 0 80.02ns 1.8 96ns 1.8)
* ^__-- 0 --> 1
* Vin00 in00 0 PWL(0ns 1.8 800ns 1.8 800.02ns 0 960ns 0)
* ^__-- 1 --> 0


*** You should only modify from here
*** IN (data would do convolution with W)

Vin00_0 in00_0 0 PWL(0ns 0 14.45ns 0 14.47ns   0 15.3ns   0 15.32ns 0 16.15ns 0 16.17ns 1.8 17ns 1.8 17.02ns 0 17.85ns 0 17.87ns   0 18.7ns   0 18.72ns 0 19.55ns 0 19.57ns   0 20.4ns   0 20.42ns 0 21.25ns 0 21.27ns 1.8 22.1ns 1.8 22.12ns 0 22.95ns 0 22.97ns 1.8 23.8ns 1.8 23.82ns 0 24.65ns 0 24.67ns   0 25.5ns   0 25.52ns 0 26.35ns 0 26.37ns 1.8 27.1ns 1.8 27.12ns 0)
Vin01_0 in01_0 0 PWL(0ns 0 14.45ns 0 14.47ns 1.8 15.3ns 1.8 15.32ns 0 16.15ns 0 16.17ns   0 17ns   0 17.02ns 0 17.85ns 0 17.87ns 1.8 18.7ns 1.8 18.72ns 0 19.55ns 0 19.57ns 1.8 20.4ns 1.8 20.42ns 0 21.25ns 0 21.27ns   0 22.1ns   0 22.12ns 0 22.95ns 0 22.97ns 1.8 23.8ns 1.8 23.82ns 0 24.65ns 0 24.67ns 1.8 25.5ns 1.8 25.52ns 0 26.35ns 0 26.37ns 1.8 27.1ns 1.8 27.12ns 0)
Vin02_0 in02_0 0 PWL(0ns 0 14.45ns 0 14.47ns 1.8 15.3ns 1.8 15.32ns 0 16.15ns 0 16.17ns 1.8 17ns 1.8 17.02ns 0 17.85ns 0 17.87ns   0 18.7ns   0 18.72ns 0 19.55ns 0 19.57ns   0 20.4ns   0 20.42ns 0 21.25ns 0 21.27ns 1.8 22.1ns 1.8 22.12ns 0 22.95ns 0 22.97ns 1.8 23.8ns 1.8 23.82ns 0 24.65ns 0 24.67ns   0 25.5ns   0 25.52ns 0 26.35ns 0 26.37ns 1.8 27.1ns 1.8 27.12ns 0)
Vin03_0 in03_0 0 PWL(0ns 0 14.45ns 0 14.47ns 1.8 15.3ns 1.8 15.32ns 0 16.15ns 0 16.17ns 1.8 17ns 1.8 17.02ns 0 17.85ns 0 17.87ns 1.8 18.7ns 1.8 18.72ns 0 19.55ns 0 19.57ns 1.8 20.4ns 1.8 20.42ns 0 21.25ns 0 21.27ns 1.8 22.1ns 1.8 22.12ns 0 22.95ns 0 22.97ns 1.8 23.8ns 1.8 23.82ns 0 24.65ns 0 24.67ns 1.8 25.5ns 1.8 25.52ns 0 26.35ns 0 26.37ns   0 27.1ns   0 27.12ns 0)
Vin04_0 in04_0 0 PWL(0ns 0 14.45ns 0 14.47ns   0 15.3ns   0 15.32ns 0 16.15ns 0 16.17ns 1.8 17ns 1.8 17.02ns 0 17.85ns 0 17.87ns 1.8 18.7ns 1.8 18.72ns 0 19.55ns 0 19.57ns 1.8 20.4ns 1.8 20.42ns 0 21.25ns 0 21.27ns 1.8 22.1ns 1.8 22.12ns 0 22.95ns 0 22.97ns 1.8 23.8ns 1.8 23.82ns 0 24.65ns 0 24.67ns 1.8 25.5ns 1.8 25.52ns 0 26.35ns 0 26.37ns 1.8 27.1ns 1.8 27.12ns 0)
Vin05_0 in05_0 0 PWL(0ns 0 14.45ns 0 14.47ns 1.8 15.3ns 1.8 15.32ns 0 16.15ns 0 16.17ns 1.8 17ns 1.8 17.02ns 0 17.85ns 0 17.87ns   0 18.7ns   0 18.72ns 0 19.55ns 0 19.57ns 1.8 20.4ns 1.8 20.42ns 0 21.25ns 0 21.27ns   0 22.1ns   0 22.12ns 0 22.95ns 0 22.97ns   0 23.8ns   0 23.82ns 0 24.65ns 0 24.67ns 1.8 25.5ns 1.8 25.52ns 0 26.35ns 0 26.37ns 1.8 27.1ns 1.8 27.12ns 0)
Vin06_0 in06_0 0 PWL(0ns 0 14.45ns 0 14.47ns 1.8 15.3ns 1.8 15.32ns 0 16.15ns 0 16.17ns   0 17ns   0 17.02ns 0 17.85ns 0 17.87ns 1.8 18.7ns 1.8 18.72ns 0 19.55ns 0 19.57ns 1.8 20.4ns 1.8 20.42ns 0 21.25ns 0 21.27ns 1.8 22.1ns 1.8 22.12ns 0 22.95ns 0 22.97ns 1.8 23.8ns 1.8 23.82ns 0 24.65ns 0 24.67ns 1.8 25.5ns 1.8 25.52ns 0 26.35ns 0 26.37ns 1.8 27.1ns 1.8 27.12ns 0)
Vin07_0 in07_0 0 PWL(0ns 0 14.45ns 0 14.47ns 1.8 15.3ns 1.8 15.32ns 0 16.15ns 0 16.17ns 1.8 17ns 1.8 17.02ns 0 17.85ns 0 17.87ns 1.8 18.7ns 1.8 18.72ns 0 19.55ns 0 19.57ns   0 20.4ns   0 20.42ns 0 21.25ns 0 21.27ns 1.8 22.1ns 1.8 22.12ns 0 22.95ns 0 22.97ns   0 23.8ns   0 23.82ns 0 24.65ns 0 24.67ns 1.8 25.5ns 1.8 25.52ns 0 26.35ns 0 26.37ns   0 27.1ns   0 27.12ns 0)

Vin10_0 in10_0 0 PWL(0ns 0 14.45ns 0 14.47ns   0 15.3ns   0 15.32ns 0 16.15ns 0 16.17ns   0 17ns   0 17.02ns 0 17.85ns 0 17.87ns   0 18.7ns   0 18.72ns 0 19.55ns 0 19.57ns   0 20.4ns   0 20.42ns 0 21.25ns 0 21.27ns 1.8 22.1ns 1.8 22.12ns 0 22.95ns 0 22.97ns 1.8 23.8ns 1.8 23.82ns 0 24.65ns 0 24.67ns 1.8 25.5ns 1.8 25.52ns 0 26.35ns 0 26.37ns 1.8 27.1ns 1.8 27.12ns 0)
Vin11_0 in11_0 0 PWL(0ns 0 14.45ns 0 14.47ns 1.8 15.3ns 1.8 15.32ns 0 16.15ns 0 16.17ns 1.8 17ns 1.8 17.02ns 0 17.85ns 0 17.87ns 1.8 18.7ns 1.8 18.72ns 0 19.55ns 0 19.57ns   0 20.4ns   0 20.42ns 0 21.25ns 0 21.27ns   0 22.1ns   0 22.12ns 0 22.95ns 0 22.97ns 1.8 23.8ns 1.8 23.82ns 0 24.65ns 0 24.67ns 1.8 25.5ns 1.8 25.52ns 0 26.35ns 0 26.37ns 1.8 27.1ns 1.8 27.12ns 0)
Vin12_0 in12_0 0 PWL(0ns 0 14.45ns 0 14.47ns 1.8 15.3ns 1.8 15.32ns 0 16.15ns 0 16.17ns   0 17ns   0 17.02ns 0 17.85ns 0 17.87ns 1.8 18.7ns 1.8 18.72ns 0 19.55ns 0 19.57ns   0 20.4ns   0 20.42ns 0 21.25ns 0 21.27ns 1.8 22.1ns 1.8 22.12ns 0 22.95ns 0 22.97ns 1.8 23.8ns 1.8 23.82ns 0 24.65ns 0 24.67ns 1.8 25.5ns 1.8 25.52ns 0 26.35ns 0 26.37ns 1.8 27.1ns 1.8 27.12ns 0)
Vin13_0 in13_0 0 PWL(0ns 0 14.45ns 0 14.47ns 1.8 15.3ns 1.8 15.32ns 0 16.15ns 0 16.17ns 1.8 17ns 1.8 17.02ns 0 17.85ns 0 17.87ns   0 18.7ns   0 18.72ns 0 19.55ns 0 19.57ns   0 20.4ns   0 20.42ns 0 21.25ns 0 21.27ns 1.8 22.1ns 1.8 22.12ns 0 22.95ns 0 22.97ns 1.8 23.8ns 1.8 23.82ns 0 24.65ns 0 24.67ns 1.8 25.5ns 1.8 25.52ns 0 26.35ns 0 26.37ns 1.8 27.1ns 1.8 27.12ns 0)
Vin14_0 in14_0 0 PWL(0ns 0 14.45ns 0 14.47ns   0 15.3ns   0 15.32ns 0 16.15ns 0 16.17ns 1.8 17ns 1.8 17.02ns 0 17.85ns 0 17.87ns 1.8 18.7ns 1.8 18.72ns 0 19.55ns 0 19.57ns   0 20.4ns   0 20.42ns 0 21.25ns 0 21.27ns   0 22.1ns   0 22.12ns 0 22.95ns 0 22.97ns 1.8 23.8ns 1.8 23.82ns 0 24.65ns 0 24.67ns   0 25.5ns   0 25.52ns 0 26.35ns 0 26.37ns   0 27.1ns   0 27.12ns 0)
Vin15_0 in15_0 0 PWL(0ns 0 14.45ns 0 14.47ns 1.8 15.3ns 1.8 15.32ns 0 16.15ns 0 16.17ns   0 17ns   0 17.02ns 0 17.85ns 0 17.87ns 1.8 18.7ns 1.8 18.72ns 0 19.55ns 0 19.57ns   0 20.4ns   0 20.42ns 0 21.25ns 0 21.27ns   0 22.1ns   0 22.12ns 0 22.95ns 0 22.97ns 1.8 23.8ns 1.8 23.82ns 0 24.65ns 0 24.67ns 1.8 25.5ns 1.8 25.52ns 0 26.35ns 0 26.37ns 1.8 27.1ns 1.8 27.12ns 0)
Vin16_0 in16_0 0 PWL(0ns 0 14.45ns 0 14.47ns 1.8 15.3ns 1.8 15.32ns 0 16.15ns 0 16.17ns 1.8 17ns 1.8 17.02ns 0 17.85ns 0 17.87ns 1.8 18.7ns 1.8 18.72ns 0 19.55ns 0 19.57ns   0 20.4ns   0 20.42ns 0 21.25ns 0 21.27ns 1.8 22.1ns 1.8 22.12ns 0 22.95ns 0 22.97ns 1.8 23.8ns 1.8 23.82ns 0 24.65ns 0 24.67ns 1.8 25.5ns 1.8 25.52ns 0 26.35ns 0 26.37ns 1.8 27.1ns 1.8 27.12ns 0)
Vin17_0 in17_0 0 PWL(0ns 0 14.45ns 0 14.47ns 1.8 15.3ns 1.8 15.32ns 0 16.15ns 0 16.17ns 1.8 17ns 1.8 17.02ns 0 17.85ns 0 17.87ns   0 18.7ns   0 18.72ns 0 19.55ns 0 19.57ns   0 20.4ns   0 20.42ns 0 21.25ns 0 21.27ns 1.8 22.1ns 1.8 22.12ns 0 22.95ns 0 22.97ns 1.8 23.8ns 1.8 23.82ns 0 24.65ns 0 24.67ns 1.8 25.5ns 1.8 25.52ns 0 26.35ns 0 26.37ns 1.8 27.1ns 1.8 27.12ns 0)

Vin20_0 in20_0 0 PWL(0ns 0 14.45ns 0 14.47ns 1.8 15.3ns 1.8 15.32ns 0 16.15ns 0 16.17ns 1.8 17ns 1.8 17.02ns 0 17.85ns 0 17.87ns   0 18.7ns   0 18.72ns 0 19.55ns 0 19.57ns 1.8 20.4ns 1.8 20.42ns 0 21.25ns 0 21.27ns   0 22.1ns   0 22.12ns 0 22.95ns 0 22.97ns   0 23.8ns   0 23.82ns 0 24.65ns 0 24.67ns 1.8 25.5ns 1.8 25.52ns 0 26.35ns 0 26.37ns   0 27.1ns   0 27.12ns 0)
Vin21_0 in21_0 0 PWL(0ns 0 14.45ns 0 14.47ns 1.8 15.3ns 1.8 15.32ns 0 16.15ns 0 16.17ns 1.8 17ns 1.8 17.02ns 0 17.85ns 0 17.87ns 1.8 18.7ns 1.8 18.72ns 0 19.55ns 0 19.57ns 1.8 20.4ns 1.8 20.42ns 0 21.25ns 0 21.27ns 1.8 22.1ns 1.8 22.12ns 0 22.95ns 0 22.97ns 1.8 23.8ns 1.8 23.82ns 0 24.65ns 0 24.67ns 1.8 25.5ns 1.8 25.52ns 0 26.35ns 0 26.37ns 1.8 27.1ns 1.8 27.12ns 0)
Vin22_0 in22_0 0 PWL(0ns 0 14.45ns 0 14.47ns 1.8 15.3ns 1.8 15.32ns 0 16.15ns 0 16.17ns   0 17ns   0 17.02ns 0 17.85ns 0 17.87ns 1.8 18.7ns 1.8 18.72ns 0 19.55ns 0 19.57ns 1.8 20.4ns 1.8 20.42ns 0 21.25ns 0 21.27ns 1.8 22.1ns 1.8 22.12ns 0 22.95ns 0 22.97ns 1.8 23.8ns 1.8 23.82ns 0 24.65ns 0 24.67ns   0 25.5ns   0 25.52ns 0 26.35ns 0 26.37ns 1.8 27.1ns 1.8 27.12ns 0)
Vin23_0 in23_0 0 PWL(0ns 0 14.45ns 0 14.47ns 1.8 15.3ns 1.8 15.32ns 0 16.15ns 0 16.17ns 1.8 17ns 1.8 17.02ns 0 17.85ns 0 17.87ns   0 18.7ns   0 18.72ns 0 19.55ns 0 19.57ns 1.8 20.4ns 1.8 20.42ns 0 21.25ns 0 21.27ns   0 22.1ns   0 22.12ns 0 22.95ns 0 22.97ns 1.8 23.8ns 1.8 23.82ns 0 24.65ns 0 24.67ns 1.8 25.5ns 1.8 25.52ns 0 26.35ns 0 26.37ns 1.8 27.1ns 1.8 27.12ns 0)
Vin24_0 in24_0 0 PWL(0ns 0 14.45ns 0 14.47ns   0 15.3ns   0 15.32ns 0 16.15ns 0 16.17ns   0 17ns   0 17.02ns 0 17.85ns 0 17.87ns 1.8 18.7ns 1.8 18.72ns 0 19.55ns 0 19.57ns 1.8 20.4ns 1.8 20.42ns 0 21.25ns 0 21.27ns 1.8 22.1ns 1.8 22.12ns 0 22.95ns 0 22.97ns   0 23.8ns   0 23.82ns 0 24.65ns 0 24.67ns 1.8 25.5ns 1.8 25.52ns 0 26.35ns 0 26.37ns   0 27.1ns   0 27.12ns 0)
Vin25_0 in25_0 0 PWL(0ns 0 14.45ns 0 14.47ns   0 15.3ns   0 15.32ns 0 16.15ns 0 16.17ns 1.8 17ns 1.8 17.02ns 0 17.85ns 0 17.87ns   0 18.7ns   0 18.72ns 0 19.55ns 0 19.57ns 1.8 20.4ns 1.8 20.42ns 0 21.25ns 0 21.27ns 1.8 22.1ns 1.8 22.12ns 0 22.95ns 0 22.97ns 1.8 23.8ns 1.8 23.82ns 0 24.65ns 0 24.67ns   0 25.5ns   0 25.52ns 0 26.35ns 0 26.37ns   0 27.1ns   0 27.12ns 0)
Vin26_0 in26_0 0 PWL(0ns 0 14.45ns 0 14.47ns   0 15.3ns   0 15.32ns 0 16.15ns 0 16.17ns   0 17ns   0 17.02ns 0 17.85ns 0 17.87ns 1.8 18.7ns 1.8 18.72ns 0 19.55ns 0 19.57ns   0 20.4ns   0 20.42ns 0 21.25ns 0 21.27ns 1.8 22.1ns 1.8 22.12ns 0 22.95ns 0 22.97ns 1.8 23.8ns 1.8 23.82ns 0 24.65ns 0 24.67ns 1.8 25.5ns 1.8 25.52ns 0 26.35ns 0 26.37ns 1.8 27.1ns 1.8 27.12ns 0)
Vin27_0 in27_0 0 PWL(0ns 0 14.45ns 0 14.47ns   0 15.3ns   0 15.32ns 0 16.15ns 0 16.17ns 1.8 17ns 1.8 17.02ns 0 17.85ns 0 17.87ns 1.8 18.7ns 1.8 18.72ns 0 19.55ns 0 19.57ns 1.8 20.4ns 1.8 20.42ns 0 21.25ns 0 21.27ns   0 22.1ns   0 22.12ns 0 22.95ns 0 22.97ns 1.8 23.8ns 1.8 23.82ns 0 24.65ns 0 24.67ns 1.8 25.5ns 1.8 25.52ns 0 26.35ns 0 26.37ns 1.8 27.1ns 1.8 27.12ns 0)

Vin30_0 in30_0 0 PWL(0ns 0 14.45ns 0 14.47ns   0 15.3ns   0 15.32ns 0 16.15ns 0 16.17ns 1.8 17ns 1.8 17.02ns 0 17.85ns 0 17.87ns 1.8 18.7ns 1.8 18.72ns 0 19.55ns 0 19.57ns 1.8 20.4ns 1.8 20.42ns 0 21.25ns 0 21.27ns 1.8 22.1ns 1.8 22.12ns 0 22.95ns 0 22.97ns   0 23.8ns   0 23.82ns 0 24.65ns 0 24.67ns   0 25.5ns   0 25.52ns 0 26.35ns 0 26.37ns 1.8 27.1ns 1.8 27.12ns 0)
Vin31_0 in31_0 0 PWL(0ns 0 14.45ns 0 14.47ns   0 15.3ns   0 15.32ns 0 16.15ns 0 16.17ns   0 17ns   0 17.02ns 0 17.85ns 0 17.87ns 1.8 18.7ns 1.8 18.72ns 0 19.55ns 0 19.57ns 1.8 20.4ns 1.8 20.42ns 0 21.25ns 0 21.27ns 1.8 22.1ns 1.8 22.12ns 0 22.95ns 0 22.97ns   0 23.8ns   0 23.82ns 0 24.65ns 0 24.67ns   0 25.5ns   0 25.52ns 0 26.35ns 0 26.37ns 1.8 27.1ns 1.8 27.12ns 0)
Vin32_0 in32_0 0 PWL(0ns 0 14.45ns 0 14.47ns   0 15.3ns   0 15.32ns 0 16.15ns 0 16.17ns   0 17ns   0 17.02ns 0 17.85ns 0 17.87ns   0 18.7ns   0 18.72ns 0 19.55ns 0 19.57ns 1.8 20.4ns 1.8 20.42ns 0 21.25ns 0 21.27ns 1.8 22.1ns 1.8 22.12ns 0 22.95ns 0 22.97ns 1.8 23.8ns 1.8 23.82ns 0 24.65ns 0 24.67ns 1.8 25.5ns 1.8 25.52ns 0 26.35ns 0 26.37ns 1.8 27.1ns 1.8 27.12ns 0)
Vin33_0 in33_0 0 PWL(0ns 0 14.45ns 0 14.47ns 1.8 15.3ns 1.8 15.32ns 0 16.15ns 0 16.17ns 1.8 17ns 1.8 17.02ns 0 17.85ns 0 17.87ns   0 18.7ns   0 18.72ns 0 19.55ns 0 19.57ns 1.8 20.4ns 1.8 20.42ns 0 21.25ns 0 21.27ns 1.8 22.1ns 1.8 22.12ns 0 22.95ns 0 22.97ns 1.8 23.8ns 1.8 23.82ns 0 24.65ns 0 24.67ns 1.8 25.5ns 1.8 25.52ns 0 26.35ns 0 26.37ns   0 27.1ns   0 27.12ns 0)
Vin34_0 in34_0 0 PWL(0ns 0 14.45ns 0 14.47ns 1.8 15.3ns 1.8 15.32ns 0 16.15ns 0 16.17ns 1.8 17ns 1.8 17.02ns 0 17.85ns 0 17.87ns   0 18.7ns   0 18.72ns 0 19.55ns 0 19.57ns 1.8 20.4ns 1.8 20.42ns 0 21.25ns 0 21.27ns 1.8 22.1ns 1.8 22.12ns 0 22.95ns 0 22.97ns 1.8 23.8ns 1.8 23.82ns 0 24.65ns 0 24.67ns 1.8 25.5ns 1.8 25.52ns 0 26.35ns 0 26.37ns 1.8 27.1ns 1.8 27.12ns 0)
Vin35_0 in35_0 0 PWL(0ns 0 14.45ns 0 14.47ns 1.8 15.3ns 1.8 15.32ns 0 16.15ns 0 16.17ns 1.8 17ns 1.8 17.02ns 0 17.85ns 0 17.87ns   0 18.7ns   0 18.72ns 0 19.55ns 0 19.57ns   0 20.4ns   0 20.42ns 0 21.25ns 0 21.27ns   0 22.1ns   0 22.12ns 0 22.95ns 0 22.97ns 1.8 23.8ns 1.8 23.82ns 0 24.65ns 0 24.67ns 1.8 25.5ns 1.8 25.52ns 0 26.35ns 0 26.37ns 1.8 27.1ns 1.8 27.12ns 0)
Vin36_0 in36_0 0 PWL(0ns 0 14.45ns 0 14.47ns 1.8 15.3ns 1.8 15.32ns 0 16.15ns 0 16.17ns 1.8 17ns 1.8 17.02ns 0 17.85ns 0 17.87ns 1.8 18.7ns 1.8 18.72ns 0 19.55ns 0 19.57ns 1.8 20.4ns 1.8 20.42ns 0 21.25ns 0 21.27ns   0 22.1ns   0 22.12ns 0 22.95ns 0 22.97ns 1.8 23.8ns 1.8 23.82ns 0 24.65ns 0 24.67ns 1.8 25.5ns 1.8 25.52ns 0 26.35ns 0 26.37ns 1.8 27.1ns 1.8 27.12ns 0)
Vin37_0 in37_0 0 PWL(0ns 0 14.45ns 0 14.47ns 1.8 15.3ns 1.8 15.32ns 0 16.15ns 0 16.17ns 1.8 17ns 1.8 17.02ns 0 17.85ns 0 17.87ns 1.8 18.7ns 1.8 18.72ns 0 19.55ns 0 19.57ns 1.8 20.4ns 1.8 20.42ns 0 21.25ns 0 21.27ns   0 22.1ns   0 22.12ns 0 22.95ns 0 22.97ns   0 23.8ns   0 23.82ns 0 24.65ns 0 24.67ns 1.8 25.5ns 1.8 25.52ns 0 26.35ns 0 26.37ns   0 27.1ns   0 27.12ns 0)


*** Modify end


* Vin00_1 in00_1 0 dc 1.8v
* Vin01_1 in01_1 0 dc 0v
* Vin02_1 in02_1 0 dc 0v
* Vin03_1 in03_1 0 dc 0v
* Vin04_1 in04_1 0 dc 0v
* Vin05_1 in05_1 0 dc 0v
* Vin06_1 in06_1 0 dc 0v
* Vin07_1 in07_1 0 dc 0v

* Vin10_1 in10_1 0 dc 1.8v
* Vin11_1 in11_1 0 dc 0v
* Vin12_1 in12_1 0 dc 0v
* Vin13_1 in13_1 0 dc 0v
* Vin14_1 in14_1 0 dc 0v
* Vin15_1 in15_1 0 dc 0v
* Vin16_1 in16_1 0 dc 0v
* Vin17_1 in17_1 0 dc 0v

* Vin20_1 in20_1 0 dc 0v
* Vin21_1 in21_1 0 dc 0v
* Vin22_1 in22_1 0 dc 0v
* Vin23_1 in23_1 0 dc 0v
* Vin24_1 in24_1 0 dc 0v
* Vin25_1 in25_1 0 dc 0v
* Vin26_1 in26_1 0 dc 0v
* Vin27_1 in27_1 0 dc 0v

* Vin30_1 in30_1 0 dc 0v
* Vin31_1 in31_1 0 dc 0v
* Vin32_1 in32_1 0 dc 0v
* Vin33_1 in33_1 0 dc 0v
* Vin34_1 in34_1 0 dc 0v
* Vin35_1 in35_1 0 dc 0v
* Vin36_1 in36_1 0 dc 0v
* Vin37_1 in37_1 0 dc 0v

* Vin00_2 in00_2 0 dc 1.8v
* Vin01_2 in01_2 0 dc 0v
* Vin02_2 in02_2 0 dc 0v
* Vin03_2 in03_2 0 dc 0v
* Vin04_2 in04_2 0 dc 0v
* Vin05_2 in05_2 0 dc 0v
* Vin06_2 in06_2 0 dc 0v
* Vin07_2 in07_2 0 dc 0v

* Vin10_2 in10_2 0 dc 1.8v
* Vin11_2 in11_2 0 dc 0v
* Vin12_2 in12_2 0 dc 0v
* Vin13_2 in13_2 0 dc 0v
* Vin14_2 in14_2 0 dc 0v
* Vin15_2 in15_2 0 dc 0v
* Vin16_2 in16_2 0 dc 0v
* Vin17_2 in17_2 0 dc 0v

* Vin20_2 in20_2 0 dc 0v
* Vin21_2 in21_2 0 dc 0v
* Vin22_2 in22_2 0 dc 0v
* Vin23_2 in23_2 0 dc 0v
* Vin24_2 in24_2 0 dc 0v
* Vin25_2 in25_2 0 dc 0v
* Vin26_2 in26_2 0 dc 0v
* Vin27_2 in27_2 0 dc 0v

* Vin30_2 in30_2 0 dc 0v
* Vin31_2 in31_2 0 dc 0v
* Vin32_2 in32_2 0 dc 0v
* Vin33_2 in33_2 0 dc 0v
* Vin34_2 in34_2 0 dc 0v
* Vin35_2 in35_2 0 dc 0v
* Vin36_2 in36_2 0 dc 0v
* Vin37_2 in37_2 0 dc 0v


* Vin00_3 in00_3 0 dc 1.8v
* Vin01_3 in01_3 0 dc 0v
* Vin02_3 in02_3 0 dc 0v
* Vin03_3 in03_3 0 dc 0v
* Vin04_3 in04_3 0 dc 0v
* Vin05_3 in05_3 0 dc 0v
* Vin06_3 in06_3 0 dc 0v
* Vin07_3 in07_3 0 dc 0v

* Vin10_3 in10_3 0 dc 1.8v
* Vin11_3 in11_3 0 dc 0v
* Vin12_3 in12_3 0 dc 0v
* Vin13_3 in13_3 0 dc 0v
* Vin14_3 in14_3 0 dc 0v
* Vin15_3 in15_3 0 dc 0v
* Vin16_3 in16_3 0 dc 0v
* Vin17_3 in17_3 0 dc 0v

* Vin20_3 in20_3 0 dc 0v
* Vin21_3 in21_3 0 dc 0v
* Vin22_3 in22_3 0 dc 0v
* Vin23_3 in23_3 0 dc 0v
* Vin24_3 in24_3 0 dc 0v
* Vin25_3 in25_3 0 dc 0v
* Vin26_3 in26_3 0 dc 0v
* Vin27_3 in27_3 0 dc 0v

* Vin30_3 in30_3 0 dc 0v
* Vin31_3 in31_3 0 dc 0v
* Vin32_3 in32_3 0 dc 0v
* Vin33_3 in33_3 0 dc 0v
* Vin34_3 in34_3 0 dc 0v
* Vin35_3 in35_3 0 dc 0v
* Vin36_3 in36_3 0 dc 0v
* Vin37_3 in37_3 0 dc 0v

.meas tran pwr avg power from=14.45ns to=35ns

* .option measform=3
.option post

.tran 0.1ns 35ns
* .probe tran pwr_bl = par'abs(V(bl)*i(x2.mn3))'
* .probe tran pwr_blb = par'abs(V(blb)*i(x2.mn4))'
.end

