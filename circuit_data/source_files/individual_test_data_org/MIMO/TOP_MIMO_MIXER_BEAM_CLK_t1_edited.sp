** Generated for: hspiceD
** Generated on: Feb 23 17:17:31 2022
** Design library name: ALIGN_testcircuits
** Design cell name: TOP_MIMO_MIXER_BEAM_CLK_t1
** Design view name: schematic


** Library name: TO65_20200429
** Cell name: CAP_MIM_MOM_13pF
** View name: schematic
.subckt CAP_MIM_MOM_13pF bottom top
xc0 top bottom mimcap_sin lt=75e-6 wt=75e-6 mimflag=3 mf=1 mismatchflag=0
.ends CAP_MIM_MOM_13pF
** End of subcircuit definition.

** Library name: TO65_20200429
** Cell name: bottom_plate_4path_mixer_diff_end
** View name: schematic
.subckt bottom_plate_4path_mixer_diff_end clk0 clk90 clk180 clk270 _net1 _net0 vcmbias vdda_q
xi7 n5 _net0 CAP_MIM_MOM_13pF
xi3 n1 _net1 CAP_MIM_MOM_13pF
xi8 n6 _net0 CAP_MIM_MOM_13pF
xi9 n7 _net0 CAP_MIM_MOM_13pF
xi5 n3 _net1 CAP_MIM_MOM_13pF
xi4 n2 _net1 CAP_MIM_MOM_13pF
xi6 n4 _net1 CAP_MIM_MOM_13pF
xi10 n8 _net0 CAP_MIM_MOM_13pF
xm0 n1 clk0 n5 vcmbias nmos_rf lr=60e-9 wr=4e-6 nr=16 sigma=1 m=1 mismatchflag=0
xm1 n2 clk90 n6 vcmbias nmos_rf lr=60e-9 wr=4e-6 nr=16 sigma=1 m=1 mismatchflag=0
xm2 n3 clk180 n7 vcmbias nmos_rf lr=60e-9 wr=4e-6 nr=16 sigma=1 m=1 mismatchflag=0
xm3 n4 clk270 n8 vcmbias nmos_rf lr=60e-9 wr=4e-6 nr=16 sigma=1 m=1 mismatchflag=0
xm4 n1 clk0 vcmbias vcmbias nmos_rf lr=60e-9 wr=4e-6 nr=16 sigma=1 m=1 mismatchflag=0
xm5 n2 clk90 vcmbias vcmbias nmos_rf lr=60e-9 wr=4e-6 nr=16 sigma=1 m=1 mismatchflag=0
xm6 n3 clk180 vcmbias vcmbias nmos_rf lr=60e-9 wr=4e-6 nr=16 sigma=1 m=1 mismatchflag=0
xm7 n4 clk270 vcmbias vcmbias nmos_rf lr=60e-9 wr=4e-6 nr=16 sigma=1 m=1 mismatchflag=0
xm8 n5 clk0 vcmbias vcmbias nmos_rf lr=60e-9 wr=4e-6 nr=16 sigma=1 m=1 mismatchflag=0
xm9 n6 clk90 vcmbias vcmbias nmos_rf lr=60e-9 wr=4e-6 nr=16 sigma=1 m=1 mismatchflag=0
xm10 n7 clk180 vcmbias vcmbias nmos_rf lr=60e-9 wr=4e-6 nr=16 sigma=1 m=1 mismatchflag=0
xm11 n8 clk270 vcmbias vcmbias nmos_rf lr=60e-9 wr=4e-6 nr=16 sigma=1 m=1 mismatchflag=0
.ends bottom_plate_4path_mixer_diff_end
** End of subcircuit definition.

** Library name: TO65_20200429
** Cell name: MIMO_mixers_bottom_plate
** View name: schematic
.subckt MIMO_mixers_bottom_plate clk0 clk180 clk270 clk90 vcmbias vdda_q _net0 _net1 _net2 _net3 _net4 _net5 _net6 _net7
xi0 clk0 clk90 clk180 clk270 _net0 _net1 vcmbias vdda_q bottom_plate_4path_mixer_diff_end
xi1 clk0 clk90 clk180 clk270 _net2 _net3 vcmbias vdda_q bottom_plate_4path_mixer_diff_end
xi2 clk0 clk90 clk180 clk270 _net4 _net5 vcmbias vdda_q bottom_plate_4path_mixer_diff_end
xi3 clk0 clk90 clk180 clk270 _net6 _net7 vcmbias vdda_q bottom_plate_4path_mixer_diff_end
.ends MIMO_mixers_bottom_plate
** End of subcircuit definition.

** Library name: TO65_20200429
** Cell name: INVx4_8Phase
** View name: schematic
.subckt INVx4_8Phase in out vdd vss
xm1 out in vdd vdd pmos_rf lr=60e-9 wr=1.2e-6 nr=16 sigma=1 m=1 mismatchflag=0
xm0 out in vss vss nmos_rf lr=60e-9 wr=600e-9 nr=16 sigma=1 m=1 mismatchflag=0
.ends INVx4_8Phase
** End of subcircuit definition.

** Library name: TO65_20200429
** Cell name: CLK_BUFFER_4X
** View name: schematic
.subckt CLK_BUFFER_4X in out vdd vss
xi0<0> in net2 vdd vss INVx4_8Phase
xi0<1> in net2 vdd vss INVx4_8Phase
xi0<2> in net2 vdd vss INVx4_8Phase
xi0<3> in net2 vdd vss INVx4_8Phase
xi1<0> net2 out vdd vss INVx4_8Phase
xi1<1> net2 out vdd vss INVx4_8Phase
xi1<2> net2 out vdd vss INVx4_8Phase
xi1<3> net2 out vdd vss INVx4_8Phase
.ends CLK_BUFFER_4X
** End of subcircuit definition.

** Library name: ALIGN_testcircuits
** Cell name: MIMO_MIXER_CLK_BUFFER
** View name: schematic
.subckt MIMO_MIXER_CLK_BUFFER clk1 clk2 clk3 clk4 vcmbias vdda_q vddd vssd _net0 _net1 _net2 _net3 _net4 _net5 _net6 _net7
xi0 clk0 clk180 clk270 clk90 vcmbias vdda_q _net0 _net1 _net2 _net3 _net4 _net5 _net6 _net7 MIMO_mixers_bottom_plate
xi3<1> clk3 clk180 vddd vssd CLK_BUFFER_4X
xi3<0> clk3 clk180 vddd vssd CLK_BUFFER_4X
xi2<1> clk1 clk0 vddd vssd CLK_BUFFER_4X
xi2<0> clk1 clk0 vddd vssd CLK_BUFFER_4X
xi1<1> clk2 clk90 vddd vssd CLK_BUFFER_4X
xi1<0> clk2 clk90 vddd vssd CLK_BUFFER_4X
xi4<1> clk4 clk270 vddd vssd CLK_BUFFER_4X
xi4<0> clk4 clk270 vddd vssd CLK_BUFFER_4X
.ends MIMO_MIXER_CLK_BUFFER
** End of subcircuit definition.

** Library name: Tape_Jan20
** Cell name: INVx1_8Phase
** View name: schematic
.subckt INVx1_8Phase in out vdd vss
xm1 out in vdd vdd pmos_rf lr=60e-9 wr=1.2e-6 nr=4 sigma=1 m=1 mismatchflag=0
xm0 out in vss vss nmos_rf lr=60e-9 wr=600e-9 nr=4 sigma=1 m=1 mismatchflag=0
.ends INVx1_8Phase
** End of subcircuit definition.

** Library name: TO65_20200429
** Cell name: CLK_IO
** View name: schematic
.subckt CLK_IO inn inp outn outp vdd vss
xc0 net3 inp mimcap_sin lt=10e-6 wt=10e-6 mimflag=3 mf=1 mismatchflag=0
xc1 net2 inn mimcap_sin lt=10e-6 wt=10e-6 mimflag=3 mf=1 mismatchflag=0
**Series configuration of R2
xr2_1__dmy0  bias xr2_1__dmy0  rppolys l=12.465e-6 w=400e-9 m=1 mf=1 mismatchflag=0
xr2_2__dmy0  xr2_1__dmy0 xr2_2__dmy0  rppolys l=12.465e-6 w=400e-9 m=1 mf=1 mismatchflag=0
xr2_3__dmy0  xr2_2__dmy0 xr2_3__dmy0  rppolys l=12.465e-6 w=400e-9 m=1 mf=1 mismatchflag=0
xr2_4__dmy0  xr2_3__dmy0 xr2_4__dmy0  rppolys l=12.465e-6 w=400e-9 m=1 mf=1 mismatchflag=0
xr2_5__dmy0  xr2_4__dmy0 xr2_5__dmy0  rppolys l=12.465e-6 w=400e-9 m=1 mf=1 mismatchflag=0
xr2_6__dmy0  xr2_5__dmy0 xr2_6__dmy0  rppolys l=12.465e-6 w=400e-9 m=1 mf=1 mismatchflag=0
xr2_7__dmy0  xr2_6__dmy0 xr2_7__dmy0  rppolys l=12.465e-6 w=400e-9 m=1 mf=1 mismatchflag=0
xr2_8__dmy0  xr2_7__dmy0 xr2_8__dmy0  rppolys l=12.465e-6 w=400e-9 m=1 mf=1 mismatchflag=0
xr2_9__dmy0  xr2_8__dmy0 xr2_9__dmy0  rppolys l=12.465e-6 w=400e-9 m=1 mf=1 mismatchflag=0
xr2_10__dmy0  xr2_9__dmy0 xr2_10__dmy0  rppolys l=12.465e-6 w=400e-9 m=1 mf=1 mismatchflag=0
xr2_11__dmy0  xr2_10__dmy0 xr2_11__dmy0  rppolys l=12.465e-6 w=400e-9 m=1 mf=1 mismatchflag=0
xr2_12__dmy0  xr2_11__dmy0 xr2_12__dmy0  rppolys l=12.465e-6 w=400e-9 m=1 mf=1 mismatchflag=0
xr2_13__dmy0  xr2_12__dmy0 xr2_13__dmy0  rppolys l=12.465e-6 w=400e-9 m=1 mf=1 mismatchflag=0
xr2_14__dmy0  xr2_13__dmy0 xr2_14__dmy0  rppolys l=12.465e-6 w=400e-9 m=1 mf=1 mismatchflag=0
xr2_15__dmy0  xr2_14__dmy0 xr2_15__dmy0  rppolys l=12.465e-6 w=400e-9 m=1 mf=1 mismatchflag=0
xr2_16__dmy0  xr2_15__dmy0 xr2_16__dmy0  rppolys l=12.465e-6 w=400e-9 m=1 mf=1 mismatchflag=0
xr2_17__dmy0  xr2_16__dmy0 xr2_17__dmy0  rppolys l=12.465e-6 w=400e-9 m=1 mf=1 mismatchflag=0
xr2_18__dmy0  xr2_17__dmy0 net3  rppolys l=12.465e-6 w=400e-9 m=1 mf=1 mismatchflag=0
**End of R2

**Series configuration of R0
xr0_1__dmy0  net2 xr0_1__dmy0  rppolys l=12.465e-6 w=400e-9 m=1 mf=1 mismatchflag=0
xr0_2__dmy0  xr0_1__dmy0 xr0_2__dmy0  rppolys l=12.465e-6 w=400e-9 m=1 mf=1 mismatchflag=0
xr0_3__dmy0  xr0_2__dmy0 xr0_3__dmy0  rppolys l=12.465e-6 w=400e-9 m=1 mf=1 mismatchflag=0
xr0_4__dmy0  xr0_3__dmy0 xr0_4__dmy0  rppolys l=12.465e-6 w=400e-9 m=1 mf=1 mismatchflag=0
xr0_5__dmy0  xr0_4__dmy0 xr0_5__dmy0  rppolys l=12.465e-6 w=400e-9 m=1 mf=1 mismatchflag=0
xr0_6__dmy0  xr0_5__dmy0 xr0_6__dmy0  rppolys l=12.465e-6 w=400e-9 m=1 mf=1 mismatchflag=0
xr0_7__dmy0  xr0_6__dmy0 xr0_7__dmy0  rppolys l=12.465e-6 w=400e-9 m=1 mf=1 mismatchflag=0
xr0_8__dmy0  xr0_7__dmy0 xr0_8__dmy0  rppolys l=12.465e-6 w=400e-9 m=1 mf=1 mismatchflag=0
xr0_9__dmy0  xr0_8__dmy0 xr0_9__dmy0  rppolys l=12.465e-6 w=400e-9 m=1 mf=1 mismatchflag=0
xr0_10__dmy0  xr0_9__dmy0 xr0_10__dmy0  rppolys l=12.465e-6 w=400e-9 m=1 mf=1 mismatchflag=0
xr0_11__dmy0  xr0_10__dmy0 xr0_11__dmy0  rppolys l=12.465e-6 w=400e-9 m=1 mf=1 mismatchflag=0
xr0_12__dmy0  xr0_11__dmy0 xr0_12__dmy0  rppolys l=12.465e-6 w=400e-9 m=1 mf=1 mismatchflag=0
xr0_13__dmy0  xr0_12__dmy0 xr0_13__dmy0  rppolys l=12.465e-6 w=400e-9 m=1 mf=1 mismatchflag=0
xr0_14__dmy0  xr0_13__dmy0 xr0_14__dmy0  rppolys l=12.465e-6 w=400e-9 m=1 mf=1 mismatchflag=0
xr0_15__dmy0  xr0_14__dmy0 xr0_15__dmy0  rppolys l=12.465e-6 w=400e-9 m=1 mf=1 mismatchflag=0
xr0_16__dmy0  xr0_15__dmy0 xr0_16__dmy0  rppolys l=12.465e-6 w=400e-9 m=1 mf=1 mismatchflag=0
xr0_17__dmy0  xr0_16__dmy0 xr0_17__dmy0  rppolys l=12.465e-6 w=400e-9 m=1 mf=1 mismatchflag=0
xr0_18__dmy0  xr0_17__dmy0 bias  rppolys l=12.465e-6 w=400e-9 m=1 mf=1 mismatchflag=0
**End of R0

xi3 net1b outn vdd vss INVx1_8Phase
xi2 net1 outp vdd vss INVx1_8Phase
xi1 net2 net1b vdd vss INVx1_8Phase
xi0 net3 net1 vdd vss INVx1_8Phase
xm6 net1 net1b vss vss nmos_rf lr=60e-9 wr=600e-9 nr=1 sigma=1 m=1 mismatchflag=0
xm4 net1b net1 vss vss nmos_rf lr=60e-9 wr=600e-9 nr=1 sigma=1 m=1 mismatchflag=0
xm0 bias bias net026 vss nmos_rf lr=60e-9 wr=600e-9 nr=1 sigma=1 m=1 mismatchflag=0
xm2 net026 vdd vss vss nmos_rf lr=60e-9 wr=600e-9 nr=1 sigma=1 m=1 mismatchflag=0
xm7 net1 net1b vdd vdd pmos_rf lr=60e-9 wr=600e-9 nr=1 sigma=1 m=1 mismatchflag=0
xm5 net1b net1 vdd vdd pmos_rf lr=60e-9 wr=600e-9 nr=1 sigma=1 m=1 mismatchflag=0
xm3 net011 vss vdd vdd pmos_rf lr=60e-9 wr=1.5e-6 nr=1 sigma=1 m=1 mismatchflag=0
xm1 bias bias net011 vdd pmos_rf lr=60e-9 wr=1.5e-6 nr=1 sigma=1 m=1 mismatchflag=0
.ends CLK_IO
** End of subcircuit definition.

** Library name: TO65_20200429
** Cell name: INVx1_8Phase
** View name: schematic
.subckt INVx1_8Phase_schematic in out vdd vss
xm1 out in vdd vdd pmos_rf lr=60e-9 wr=1.2e-6 nr=4 sigma=1 m=1 mismatchflag=0
xm0 out in vss vss nmos_rf lr=60e-9 wr=600e-9 nr=4 sigma=1 m=1 mismatchflag=0
.ends INVx1_8Phase_schematic
** End of subcircuit definition.

** Library name: TO65_20200429
** Cell name: AND2
** View name: schematic
.subckt AND2 a b out vdd vss
xm4 net26 b vss vss nmos_rf lr=60e-9 wr=600e-9 nr=4 sigma=1 m=1 mismatchflag=0
xm6 out net21 vss vss nmos_rf lr=60e-9 wr=600e-9 nr=4 sigma=1 m=1 mismatchflag=0
xm5 net21 a net26 vss nmos_rf lr=60e-9 wr=600e-9 nr=4 sigma=1 m=1 mismatchflag=0
xm13 net21 b vdd vdd pmos_rf lr=60e-9 wr=1.2e-6 nr=4 sigma=1 m=1 mismatchflag=0
xm14 net21 a vdd vdd pmos_rf lr=60e-9 wr=1.2e-6 nr=4 sigma=1 m=1 mismatchflag=0
xm1 out net21 vdd vdd pmos_rf lr=60e-9 wr=1.2e-6 nr=4 sigma=1 m=1 mismatchflag=0
.ends AND2
** End of subcircuit definition.

** Library name: TO65_20200429
** Cell name: FF_DTG
** View name: schematic
.subckt FF_DTG clk clkb in out0 out90 out180 out270 set setb vdd vss
xm1 in setb vss vss nmos_rf lr=60e-9 wr=600e-9 nr=4 sigma=1 m=1 mismatchflag=0
xm2 net59 in vss vss nmos_rf lr=60e-9 wr=600e-9 nr=4 sigma=1 m=1 mismatchflag=0
xm3 net_l1 out90 vss vss nmos_rf lr=60e-9 wr=600e-9 nr=4 sigma=1 m=1 mismatchflag=0
xm5 net023 net_l1 vss vss nmos_rf lr=60e-9 wr=600e-9 nr=4 sigma=1 m=1 mismatchflag=0
xm14 net59 clkb out90 vss nmos_rf lr=60e-9 wr=600e-9 nr=4 sigma=1 m=1 mismatchflag=0
xm12 net_l1 clk out0 vss nmos_rf lr=60e-9 wr=600e-9 nr=4 sigma=1 m=1 mismatchflag=0
xm11 net023 clk out180 vss nmos_rf lr=60e-9 wr=600e-9 nr=4 sigma=1 m=1 mismatchflag=0
xm6 net026 net59 vss vss nmos_rf lr=60e-9 wr=600e-9 nr=4 sigma=1 m=1 mismatchflag=0
xm10 net026 clkb out270 vss nmos_rf lr=60e-9 wr=600e-9 nr=4 sigma=1 m=1 mismatchflag=0
xm20 out90 clk net59 vdd pmos_rf lr=60e-9 wr=1.2e-6 nr=4 sigma=1 m=1 mismatchflag=0
xm0 in set vdd vdd pmos_rf lr=60e-9 wr=1.2e-6 nr=4 sigma=1 m=1 mismatchflag=0
xm4 net59 in vdd vdd pmos_rf lr=60e-9 wr=1.2e-6 nr=4 sigma=1 m=1 mismatchflag=0
xm8 net023 net_l1 vdd vdd pmos_rf lr=60e-9 wr=1.2e-6 nr=4 sigma=1 m=1 mismatchflag=0
xm7 net_l1 out90 vdd vdd pmos_rf lr=60e-9 wr=1.2e-6 nr=4 sigma=1 m=1 mismatchflag=0
xm17 out0 clkb net_l1 vdd pmos_rf lr=60e-9 wr=1.2e-6 nr=4 sigma=1 m=1 mismatchflag=0
xm13 out270 clk net026 vdd pmos_rf lr=60e-9 wr=1.2e-6 nr=4 sigma=1 m=1 mismatchflag=0
xm16 out180 clkb net023 vdd pmos_rf lr=60e-9 wr=1.2e-6 nr=4 sigma=1 m=1 mismatchflag=0
xm9 net026 net59 vdd vdd pmos_rf lr=60e-9 wr=1.2e-6 nr=4 sigma=1 m=1 mismatchflag=0
.ends FF_DTG
** End of subcircuit definition.

** Library name: TO65_20200429
** Cell name: Divider
** View name: schematic
.subckt Divider clk clkb out<0> out<90> out<180> out<270> set setb vdd vss
xi0 clk clkb d<180> d<0> d<90> d<180> d<270> set setb vdd vss FF_DTG
xm3<0> out<0> net012<0> vss vss nmos_rf lr=60e-9 wr=600e-9 nr=4 sigma=1 m=1 mismatchflag=0
xm3<1> out<90> net012<1> vss vss nmos_rf lr=60e-9 wr=600e-9 nr=4 sigma=1 m=1 mismatchflag=0
xm3<2> out<180> net012<2> vss vss nmos_rf lr=60e-9 wr=600e-9 nr=4 sigma=1 m=1 mismatchflag=0
xm3<3> out<270> net012<3> vss vss nmos_rf lr=60e-9 wr=600e-9 nr=4 sigma=1 m=1 mismatchflag=0
xm2<0> net012<0> d<0> vss vss nmos_rf lr=60e-9 wr=600e-9 nr=4 sigma=1 m=1 mismatchflag=0
xm2<1> net012<1> d<90> vss vss nmos_rf lr=60e-9 wr=600e-9 nr=4 sigma=1 m=1 mismatchflag=0
xm2<2> net012<2> d<180> vss vss nmos_rf lr=60e-9 wr=600e-9 nr=4 sigma=1 m=1 mismatchflag=0
xm2<3> net012<3> d<270> vss vss nmos_rf lr=60e-9 wr=600e-9 nr=4 sigma=1 m=1 mismatchflag=0
xm0<0> net012<0> d<0> vdd vdd pmos_rf lr=60e-9 wr=1.2e-6 nr=4 sigma=1 m=1 mismatchflag=0
xm0<1> net012<1> d<90> vdd vdd pmos_rf lr=60e-9 wr=1.2e-6 nr=4 sigma=1 m=1 mismatchflag=0
xm0<2> net012<2> d<180> vdd vdd pmos_rf lr=60e-9 wr=1.2e-6 nr=4 sigma=1 m=1 mismatchflag=0
xm0<3> net012<3> d<270> vdd vdd pmos_rf lr=60e-9 wr=1.2e-6 nr=4 sigma=1 m=1 mismatchflag=0
xm1<0> out<0> net012<0> vdd vdd pmos_rf lr=60e-9 wr=1.2e-6 nr=4 sigma=1 m=1 mismatchflag=0
xm1<1> out<90> net012<1> vdd vdd pmos_rf lr=60e-9 wr=1.2e-6 nr=4 sigma=1 m=1 mismatchflag=0
xm1<2> out<180> net012<2> vdd vdd pmos_rf lr=60e-9 wr=1.2e-6 nr=4 sigma=1 m=1 mismatchflag=0
xm1<3> out<270> net012<3> vdd vdd pmos_rf lr=60e-9 wr=1.2e-6 nr=4 sigma=1 m=1 mismatchflag=0
.ends Divider
** End of subcircuit definition.

** Library name: TO65_20200429
** Cell name: 4Phase
** View name: schematic
.subckt TO65_20200429_4Phase_schematic clk clkb ph<0> ph<1> ph<2> ph<3> set setb vdd vss
xi27<0> d1<0> clkb ph<0> vdd vss AND2
xi27<1> d1<90> clk ph<1> vdd vss AND2
xi27<2> d1<180> clkb ph<2> vdd vss AND2
xi27<3> d1<270> clk ph<3> vdd vss AND2
xi17 clk clkb d1<0> d1<90> d1<180> d1<270> set setb vdd vss Divider
.ends TO65_20200429_4Phase_schematic
** End of subcircuit definition.

** Library name: TO65_20200429
** Cell name: CLK_DIST_NW1
** View name: schematic
.subckt CLK_DIST_NW1 clk clk0 clk180 clk270 clk90 clkb set setb vddd vssd
xi3 ph<3> net11 vddd vssd INVx1_8Phase_schematic
xi2 ph<2> net10 vddd vssd INVx1_8Phase_schematic
xi1 ph<1> net9 vddd vssd INVx1_8Phase_schematic
xi0 ph<0> net8 vddd vssd INVx1_8Phase_schematic
xi4 net8 clk0 vddd vssd INVx4_8Phase
xi5 net9 clk90 vddd vssd INVx4_8Phase
xi6 net10 clk180 vddd vssd INVx4_8Phase
xi7 net11 clk270 vddd vssd INVx4_8Phase
xi28 clk clkb ph<0> ph<1> ph<2> ph<3> set setb vddd vssd TO65_20200429_4Phase_schematic
.ends CLK_DIST_NW1
** End of subcircuit definition.

** Library name: TO65_20200429
** Cell name: CLK_DIST_NW2
** View name: schematic
.subckt CLK_DIST_NW2 clk clk0 clk180 clk270 clk90 clkb set setb vddd vssd
xi0 clk clk1 clk3 clk4 clk2 clkb set setb vddd vssd CLK_DIST_NW1
xi5 clk4 clk270 vddd vssd CLK_BUFFER_4X
xi4 clk3 clk180 vddd vssd CLK_BUFFER_4X
xi3 clk2 clk90 vddd vssd CLK_BUFFER_4X
xi1 clk1 clk0 vddd vssd CLK_BUFFER_4X
.ends CLK_DIST_NW2
** End of subcircuit definition.

** Library name: ALIGN_testcircuits
** Cell name: CLK_IO_DIST_NW1
** View name: schematic
.subckt CLK_IO_DIST_NW1 clk0 clk180 clk270 clk90 _net1 _net0 set vddd vssd
xi0 _net0 _net1 net15 net16 vddd vssd CLK_IO
xi1 net16 clk0 clk180 clk270 clk90 net15 set net14 vddd vssd CLK_DIST_NW2
xi2 set net14 vddd vssd INVx1_8Phase_schematic
.ends CLK_IO_DIST_NW1
** End of subcircuit definition.

** Library name: ALIGN_testcircuits
** Cell name: CLK4Phase_BUFFER_4X
** View name: schematic
.subckt CLK4Phase_BUFFER_4X clk1 clk1_buf clk2 clk2_buf clk3 clk3_buf clk4 clk4_buf vdd vss
xi4 clk3 clk3_buf vdd vss CLK_BUFFER_4X
xi3 clk4 clk4_buf vdd vss CLK_BUFFER_4X
xi2 clk2 clk2_buf vdd vss CLK_BUFFER_4X
xi0 clk1 clk1_buf vdd vss CLK_BUFFER_4X
.ends CLK4Phase_BUFFER_4X
** End of subcircuit definition.

** Library name: ALIGN_testcircuits
** Cell name: PMOS_BasebandAmp_1
** View name: schematic
.subckt PMOS_BasebandAmp_1 ibias in1 in2 out1 out2 vdd vss
xc0 out1 vss mimcap_sin lt=10e-6 wt=10e-6 mimflag=3 mf=1 mismatchflag=0
xc1 out2 vss mimcap_sin lt=10e-6 wt=10e-6 mimflag=3 mf=1 mismatchflag=0
xm6 out1 net011 vss vss nmos_rf lr=240e-9 wr=2e-6 nr=12 sigma=1 m=1 mismatchflag=0
xm1 out2 net011 vss vss nmos_rf lr=240e-9 wr=2e-6 nr=12 sigma=1 m=1 mismatchflag=0
xm5 ibias ibias vdd vdd pmos_rf lr=120e-9 wr=2e-6 nr=8 sigma=1 m=1 mismatchflag=0
xm3 out1 in1 net07 vdd pmos_rf lr=240e-9 wr=4e-6 nr=16 sigma=1 m=1 mismatchflag=0
xm2 out2 in2 net07 vdd pmos_rf lr=240e-9 wr=4e-6 nr=16 sigma=1 m=1 mismatchflag=0
xm4 net07 ibias vdd vdd pmos_rf lr=120e-9 wr=2e-6 nr=16 sigma=1 m=1 mismatchflag=0
**Series configuration of R3
xr3_1__dmy0  out1 xr3_1__dmy0  rppolys l=10e-6 w=600e-9 m=1 mf=1 mismatchflag=0
xr3_2__dmy0  xr3_1__dmy0 xr3_2__dmy0  rppolys l=10e-6 w=600e-9 m=1 mf=1 mismatchflag=0
xr3_3__dmy0  xr3_2__dmy0 xr3_3__dmy0  rppolys l=10e-6 w=600e-9 m=1 mf=1 mismatchflag=0
xr3_4__dmy0  xr3_3__dmy0 xr3_4__dmy0  rppolys l=10e-6 w=600e-9 m=1 mf=1 mismatchflag=0
xr3_5__dmy0  xr3_4__dmy0 xr3_5__dmy0  rppolys l=10e-6 w=600e-9 m=1 mf=1 mismatchflag=0
xr3_6__dmy0  xr3_5__dmy0 xr3_6__dmy0  rppolys l=10e-6 w=600e-9 m=1 mf=1 mismatchflag=0
xr3_7__dmy0  xr3_6__dmy0 xr3_7__dmy0  rppolys l=10e-6 w=600e-9 m=1 mf=1 mismatchflag=0
xr3_8__dmy0  xr3_7__dmy0 xr3_8__dmy0  rppolys l=10e-6 w=600e-9 m=1 mf=1 mismatchflag=0
xr3_9__dmy0  xr3_8__dmy0 xr3_9__dmy0  rppolys l=10e-6 w=600e-9 m=1 mf=1 mismatchflag=0
xr3_10__dmy0  xr3_9__dmy0 in1  rppolys l=10e-6 w=600e-9 m=1 mf=1 mismatchflag=0
**End of R3

**Series configuration of R1
xr1_1__dmy0  net011 xr1_1__dmy0  rppolys l=20e-6 w=600e-9 m=1 mf=1 mismatchflag=0
xr1_2__dmy0  xr1_1__dmy0 xr1_2__dmy0  rppolys l=20e-6 w=600e-9 m=1 mf=1 mismatchflag=0
xr1_3__dmy0  xr1_2__dmy0 xr1_3__dmy0  rppolys l=20e-6 w=600e-9 m=1 mf=1 mismatchflag=0
xr1_4__dmy0  xr1_3__dmy0 xr1_4__dmy0  rppolys l=20e-6 w=600e-9 m=1 mf=1 mismatchflag=0
xr1_5__dmy0  xr1_4__dmy0 xr1_5__dmy0  rppolys l=20e-6 w=600e-9 m=1 mf=1 mismatchflag=0
xr1_6__dmy0  xr1_5__dmy0 xr1_6__dmy0  rppolys l=20e-6 w=600e-9 m=1 mf=1 mismatchflag=0
xr1_7__dmy0  xr1_6__dmy0 xr1_7__dmy0  rppolys l=20e-6 w=600e-9 m=1 mf=1 mismatchflag=0
xr1_8__dmy0  xr1_7__dmy0 xr1_8__dmy0  rppolys l=20e-6 w=600e-9 m=1 mf=1 mismatchflag=0
xr1_9__dmy0  xr1_8__dmy0 xr1_9__dmy0  rppolys l=20e-6 w=600e-9 m=1 mf=1 mismatchflag=0
xr1_10__dmy0  xr1_9__dmy0 xr1_10__dmy0  rppolys l=20e-6 w=600e-9 m=1 mf=1 mismatchflag=0
xr1_11__dmy0  xr1_10__dmy0 xr1_11__dmy0  rppolys l=20e-6 w=600e-9 m=1 mf=1 mismatchflag=0
xr1_12__dmy0  xr1_11__dmy0 xr1_12__dmy0  rppolys l=20e-6 w=600e-9 m=1 mf=1 mismatchflag=0
xr1_13__dmy0  xr1_12__dmy0 xr1_13__dmy0  rppolys l=20e-6 w=600e-9 m=1 mf=1 mismatchflag=0
xr1_14__dmy0  xr1_13__dmy0 xr1_14__dmy0  rppolys l=20e-6 w=600e-9 m=1 mf=1 mismatchflag=0
xr1_15__dmy0  xr1_14__dmy0 xr1_15__dmy0  rppolys l=20e-6 w=600e-9 m=1 mf=1 mismatchflag=0
xr1_16__dmy0  xr1_15__dmy0 xr1_16__dmy0  rppolys l=20e-6 w=600e-9 m=1 mf=1 mismatchflag=0
xr1_17__dmy0  xr1_16__dmy0 xr1_17__dmy0  rppolys l=20e-6 w=600e-9 m=1 mf=1 mismatchflag=0
xr1_18__dmy0  xr1_17__dmy0 xr1_18__dmy0  rppolys l=20e-6 w=600e-9 m=1 mf=1 mismatchflag=0
xr1_19__dmy0  xr1_18__dmy0 xr1_19__dmy0  rppolys l=20e-6 w=600e-9 m=1 mf=1 mismatchflag=0
xr1_20__dmy0  xr1_19__dmy0 out2  rppolys l=20e-6 w=600e-9 m=1 mf=1 mismatchflag=0
**End of R1

**Series configuration of R0
xr0_1__dmy0  out1 xr0_1__dmy0  rppolys l=20e-6 w=600e-9 m=1 mf=1 mismatchflag=0
xr0_2__dmy0  xr0_1__dmy0 xr0_2__dmy0  rppolys l=20e-6 w=600e-9 m=1 mf=1 mismatchflag=0
xr0_3__dmy0  xr0_2__dmy0 xr0_3__dmy0  rppolys l=20e-6 w=600e-9 m=1 mf=1 mismatchflag=0
xr0_4__dmy0  xr0_3__dmy0 xr0_4__dmy0  rppolys l=20e-6 w=600e-9 m=1 mf=1 mismatchflag=0
xr0_5__dmy0  xr0_4__dmy0 xr0_5__dmy0  rppolys l=20e-6 w=600e-9 m=1 mf=1 mismatchflag=0
xr0_6__dmy0  xr0_5__dmy0 xr0_6__dmy0  rppolys l=20e-6 w=600e-9 m=1 mf=1 mismatchflag=0
xr0_7__dmy0  xr0_6__dmy0 xr0_7__dmy0  rppolys l=20e-6 w=600e-9 m=1 mf=1 mismatchflag=0
xr0_8__dmy0  xr0_7__dmy0 xr0_8__dmy0  rppolys l=20e-6 w=600e-9 m=1 mf=1 mismatchflag=0
xr0_9__dmy0  xr0_8__dmy0 xr0_9__dmy0  rppolys l=20e-6 w=600e-9 m=1 mf=1 mismatchflag=0
xr0_10__dmy0  xr0_9__dmy0 xr0_10__dmy0  rppolys l=20e-6 w=600e-9 m=1 mf=1 mismatchflag=0
xr0_11__dmy0  xr0_10__dmy0 xr0_11__dmy0  rppolys l=20e-6 w=600e-9 m=1 mf=1 mismatchflag=0
xr0_12__dmy0  xr0_11__dmy0 xr0_12__dmy0  rppolys l=20e-6 w=600e-9 m=1 mf=1 mismatchflag=0
xr0_13__dmy0  xr0_12__dmy0 xr0_13__dmy0  rppolys l=20e-6 w=600e-9 m=1 mf=1 mismatchflag=0
xr0_14__dmy0  xr0_13__dmy0 xr0_14__dmy0  rppolys l=20e-6 w=600e-9 m=1 mf=1 mismatchflag=0
xr0_15__dmy0  xr0_14__dmy0 xr0_15__dmy0  rppolys l=20e-6 w=600e-9 m=1 mf=1 mismatchflag=0
xr0_16__dmy0  xr0_15__dmy0 xr0_16__dmy0  rppolys l=20e-6 w=600e-9 m=1 mf=1 mismatchflag=0
xr0_17__dmy0  xr0_16__dmy0 xr0_17__dmy0  rppolys l=20e-6 w=600e-9 m=1 mf=1 mismatchflag=0
xr0_18__dmy0  xr0_17__dmy0 xr0_18__dmy0  rppolys l=20e-6 w=600e-9 m=1 mf=1 mismatchflag=0
xr0_19__dmy0  xr0_18__dmy0 xr0_19__dmy0  rppolys l=20e-6 w=600e-9 m=1 mf=1 mismatchflag=0
xr0_20__dmy0  xr0_19__dmy0 net011  rppolys l=20e-6 w=600e-9 m=1 mf=1 mismatchflag=0
**End of R0

**Series configuration of R2
xr2_1__dmy0  out2 xr2_1__dmy0  rppolys l=10e-6 w=600e-9 m=1 mf=1 mismatchflag=0
xr2_2__dmy0  xr2_1__dmy0 xr2_2__dmy0  rppolys l=10e-6 w=600e-9 m=1 mf=1 mismatchflag=0
xr2_3__dmy0  xr2_2__dmy0 xr2_3__dmy0  rppolys l=10e-6 w=600e-9 m=1 mf=1 mismatchflag=0
xr2_4__dmy0  xr2_3__dmy0 xr2_4__dmy0  rppolys l=10e-6 w=600e-9 m=1 mf=1 mismatchflag=0
xr2_5__dmy0  xr2_4__dmy0 xr2_5__dmy0  rppolys l=10e-6 w=600e-9 m=1 mf=1 mismatchflag=0
xr2_6__dmy0  xr2_5__dmy0 xr2_6__dmy0  rppolys l=10e-6 w=600e-9 m=1 mf=1 mismatchflag=0
xr2_7__dmy0  xr2_6__dmy0 xr2_7__dmy0  rppolys l=10e-6 w=600e-9 m=1 mf=1 mismatchflag=0
xr2_8__dmy0  xr2_7__dmy0 xr2_8__dmy0  rppolys l=10e-6 w=600e-9 m=1 mf=1 mismatchflag=0
xr2_9__dmy0  xr2_8__dmy0 xr2_9__dmy0  rppolys l=10e-6 w=600e-9 m=1 mf=1 mismatchflag=0
xr2_10__dmy0  xr2_9__dmy0 in2  rppolys l=10e-6 w=600e-9 m=1 mf=1 mismatchflag=0
**End of R2

.ends PMOS_BasebandAmp_1
** End of subcircuit definition.

** Library name: ALIGN_testcircuits
** Cell name: bottom_plate_4path_beamforming
** View name: schematic
.subckt bottom_plate_4path_beamforming clk_x1 clk_x1_b clk_x2 clk_x2_b clk_x3 clk_x3_b clk_x4 clk_x4_b ibias _net2 _net3 vcmbias vdda vssa _net15 _net10 _net14 _net8 _net13 _net6 _net12 _net4
xi0 ibias _net0 _net1 _net2 _net3 vdda vssa PMOS_BasebandAmp_1
xm15 _net4 clk_x4 _net5 _net5 nmos_rf lr=60e-9 wr=2e-6 nr=16 sigma=1 m=1 mismatchflag=0
xm14 _net6 clk_x3 _net7 _net7 nmos_rf lr=60e-9 wr=2e-6 nr=16 sigma=1 m=1 mismatchflag=0
xm13 _net8 clk_x2 _net9 _net9 nmos_rf lr=60e-9 wr=2e-6 nr=16 sigma=1 m=1 mismatchflag=0
xm12 _net10 clk_x1 _net11 _net11 nmos_rf lr=60e-9 wr=2e-6 nr=16 sigma=1 m=1 mismatchflag=0
xm11 _net12 clk_x4_b _net5 _net5 nmos_rf lr=60e-9 wr=2e-6 nr=16 sigma=1 m=1 mismatchflag=0
xm10 _net13 clk_x3_b _net7 _net7 nmos_rf lr=60e-9 wr=2e-6 nr=16 sigma=1 m=1 mismatchflag=0
xm9 _net14 clk_x2_b _net9 _net9 nmos_rf lr=60e-9 wr=2e-6 nr=16 sigma=1 m=1 mismatchflag=0
xm8 _net15 clk_x1_b _net11 _net11 nmos_rf lr=60e-9 wr=2e-6 nr=16 sigma=1 m=1 mismatchflag=0
xm7 _net4 clk_x4_b _net16 _net16 nmos_rf lr=60e-9 wr=2e-6 nr=16 sigma=1 m=1 mismatchflag=0
xm6 _net6 clk_x3_b _net17 _net17 nmos_rf lr=60e-9 wr=2e-6 nr=16 sigma=1 m=1 mismatchflag=0
xm5 _net8 clk_x2_b _net18 _net18 nmos_rf lr=60e-9 wr=2e-6 nr=16 sigma=1 m=1 mismatchflag=0
xm4 _net10 clk_x1_b _net19 _net19 nmos_rf lr=60e-9 wr=2e-6 nr=16 sigma=1 m=1 mismatchflag=0
xm3 _net12 clk_x4 _net16 _net16 nmos_rf lr=60e-9 wr=2e-6 nr=16 sigma=1 m=1 mismatchflag=0
xm2 _net13 clk_x3 _net17 _net17 nmos_rf lr=60e-9 wr=2e-6 nr=16 sigma=1 m=1 mismatchflag=0
xm1 _net14 clk_x2 _net18 _net18 nmos_rf lr=60e-9 wr=2e-6 nr=16 sigma=1 m=1 mismatchflag=0
xm0 _net15 clk_x1 _net19 _net19 nmos_rf lr=60e-9 wr=2e-6 nr=16 sigma=1 m=1 mismatchflag=0
**Series configuration of R18
xr18_1__dmy0  _net1 xr18_1__dmy0  rppolys l=10e-6 w=1e-6 m=1 mf=1 mismatchflag=0
xr18_2__dmy0  xr18_1__dmy0 xr18_2__dmy0  rppolys l=10e-6 w=1e-6 m=1 mf=1 mismatchflag=0
xr18_3__dmy0  xr18_2__dmy0 xr18_3__dmy0  rppolys l=10e-6 w=1e-6 m=1 mf=1 mismatchflag=0
xr18_4__dmy0  xr18_3__dmy0 xr18_4__dmy0  rppolys l=10e-6 w=1e-6 m=1 mf=1 mismatchflag=0
xr18_5__dmy0  xr18_4__dmy0 xr18_5__dmy0  rppolys l=10e-6 w=1e-6 m=1 mf=1 mismatchflag=0
xr18_6__dmy0  xr18_5__dmy0 xr18_6__dmy0  rppolys l=10e-6 w=1e-6 m=1 mf=1 mismatchflag=0
xr18_7__dmy0  xr18_6__dmy0 xr18_7__dmy0  rppolys l=10e-6 w=1e-6 m=1 mf=1 mismatchflag=0
xr18_8__dmy0  xr18_7__dmy0 _net3  rppolys l=10e-6 w=1e-6 m=1 mf=1 mismatchflag=0
**End of R18

**Series configuration of R16
xr16_1__dmy0  _net0 xr16_1__dmy0  rppolys l=10e-6 w=1e-6 m=1 mf=1 mismatchflag=0
xr16_2__dmy0  xr16_1__dmy0 xr16_2__dmy0  rppolys l=10e-6 w=1e-6 m=1 mf=1 mismatchflag=0
xr16_3__dmy0  xr16_2__dmy0 xr16_3__dmy0  rppolys l=10e-6 w=1e-6 m=1 mf=1 mismatchflag=0
xr16_4__dmy0  xr16_3__dmy0 xr16_4__dmy0  rppolys l=10e-6 w=1e-6 m=1 mf=1 mismatchflag=0
xr16_5__dmy0  xr16_4__dmy0 xr16_5__dmy0  rppolys l=10e-6 w=1e-6 m=1 mf=1 mismatchflag=0
xr16_6__dmy0  xr16_5__dmy0 xr16_6__dmy0  rppolys l=10e-6 w=1e-6 m=1 mf=1 mismatchflag=0
xr16_7__dmy0  xr16_6__dmy0 xr16_7__dmy0  rppolys l=10e-6 w=1e-6 m=1 mf=1 mismatchflag=0
xr16_8__dmy0  xr16_7__dmy0 _net2  rppolys l=10e-6 w=1e-6 m=1 mf=1 mismatchflag=0
**End of R16

xr11  _net5 _net0   rppolys l=14e-6 w=1e-6 m=1 mf=1 mismatchflag=0

xr10  _net7 _net0   rppolys l=14e-6 w=1e-6 m=1 mf=1 mismatchflag=0

xr9  _net9 _net0   rppolys l=14e-6 w=1e-6 m=1 mf=1 mismatchflag=0

xr8  _net11 _net0   rppolys l=14e-6 w=1e-6 m=1 mf=1 mismatchflag=0

xr3  _net16 _net1   rppolys l=14e-6 w=1e-6 m=1 mf=1 mismatchflag=0

xr2  _net17 _net1   rppolys l=14e-6 w=1e-6 m=1 mf=1 mismatchflag=0

xr1  _net18 _net1   rppolys l=14e-6 w=1e-6 m=1 mf=1 mismatchflag=0

xr0  _net19 _net1   rppolys l=14e-6 w=1e-6 m=1 mf=1 mismatchflag=0

xc8 _net1 _net3 mimcap_sin lt=32e-6 wt=32e-6 mimflag=3 mf=1 mismatchflag=0
xc9 _net0 _net2 mimcap_sin lt=32e-6 wt=32e-6 mimflag=3 mf=1 mismatchflag=0
xc4 _net11 vcmbias mimcap_sin lt=32e-6 wt=32e-6 mimflag=3 mf=1 mismatchflag=0
xc5 _net9 vcmbias mimcap_sin lt=32e-6 wt=32e-6 mimflag=3 mf=1 mismatchflag=0
xc7 _net5 vcmbias mimcap_sin lt=32e-6 wt=32e-6 mimflag=3 mf=1 mismatchflag=0
xc6 _net7 vcmbias mimcap_sin lt=32e-6 wt=32e-6 mimflag=3 mf=1 mismatchflag=0
xc2 _net17 vcmbias mimcap_sin lt=32e-6 wt=32e-6 mimflag=3 mf=1 mismatchflag=0
xc3 _net16 vcmbias mimcap_sin lt=32e-6 wt=32e-6 mimflag=3 mf=1 mismatchflag=0
xc1 _net19 vcmbias mimcap_sin lt=32e-6 wt=32e-6 mimflag=3 mf=1 mismatchflag=0
xc0 _net18 vcmbias mimcap_sin lt=32e-6 wt=32e-6 mimflag=3 mf=1 mismatchflag=0
.ends bottom_plate_4path_beamforming
** End of subcircuit definition.

** Library name: ALIGN_testcircuits
** Cell name: bottom_plate_4path_BB_beamformer
** View name: schematic
.subckt bottom_plate_4path_BB_beamformer _net18 _net19 _net0 _net1 _net20 _net21 _net2 _net3 _net22 _net23 _net4 _net5 _net24 _net25 _net6 _net7 _net27 _net26 _net9 _net8 vcmbias _net10 _net11 _net12 _net13 _net14 _net15 _net16 _net17 ibias<1> ibias<2> vdda_bb vssa_bb
xi1 _net0 _net1 _net2 _net3 _net4 _net5 _net6 _net7 ibias<2> _net8 _net9 vcmbias vdda_bb vssa_bb _net10 _net11 _net12 _net13 _net14 _net15 _net16 _net17 bottom_plate_4path_beamforming
xi0 _net18 _net19 _net20 _net21 _net22 _net23 _net24 _net25 ibias<1> _net26 _net27 vcmbias vdda_bb vssa_bb _net10 _net11 _net12 _net13 _net14 _net15 _net16 _net17 bottom_plate_4path_beamforming
.ends bottom_plate_4path_BB_beamformer
** End of subcircuit definition.

** Library name: ALIGN_testcircuits
** Cell name: MIMO_Beamformers_CLK_NW2
** View name: schematic
.subckt MIMO_Beamformers_CLK_NW2 clk0 clk180 clk270 clk90 _net14 _net15 _net16 _net17 _net2 _net3 _net4 _net5 _net22 _net23 _net24 _net25 _net18 _net19 _net20 _net21 _net0 _net1 set vcmbias vdda_bb vddd vssa_bb vssd _net6 _net7 _net8 _net9 _net10 _net11 _net12 _net13 ibias<1> ibias<2> ibias<3> ibias<4> ibias<5> ibias<6> ibias<7> ibias<8>
xi0 clk0 clk180 clk270 clk90 _net0 _net1 set vddd vssd CLK_IO_DIST_NW1
xi3 clk0 clk0_k23 clk90 clk90_k23 clk180 clk180_k23 clk270 clk270_k23 vddd vssd CLK4Phase_BUFFER_4X
xi2 clk0 clk0_k01 clk90 clk90_k01 clk180 clk180_k01 clk270 clk270_k01 vddd vssd CLK4Phase_BUFFER_4X
xi11 clk0_k01 clk180_k01 clk90_k01 clk270_k01 clk90_k01 clk270_k01 clk180_k01 clk0_k01 clk180_k01 clk0_k01 clk270_k01 clk90_k01 clk270_k01 clk90_k01 clk0_k01 clk180_k01 _net2 _net3 _net4 _net5 vcmbias _net6 _net7 _net8 _net9 _net10 _net11 _net12 _net13 ibias<3> ibias<4> vdda_bb vssa_bb bottom_plate_4path_BB_beamformer
xi9 clk0_k01 clk180_k01 clk90_k01 clk270_k01 clk0_k01 clk180_k01 clk90_k01 clk270_k01 clk0_k01 clk180_k01 clk90_k01 clk270_k01 clk0_k01 clk180_k01 clk90_k01 clk270_k01 _net14 _net15 _net16 _net17 vcmbias _net6 _net7 _net8 _net9 _net10 _net11 _net12 _net13 ibias<1> ibias<2> vdda_bb vssa_bb bottom_plate_4path_BB_beamformer
xi12 clk0_k23 clk180_k23 clk90_k23 clk270_k23 clk270_k23 clk90_k23 clk0_k23 clk180_k23 clk180_k23 clk0_k23 clk270_k23 clk90_k23 clk90_k23 clk270_k23 clk180_k23 clk0_k23 _net18 _net19 _net20 _net21 vcmbias _net6 _net7 _net8 _net9 _net10 _net11 _net12 _net13 ibias<7> ibias<8> vdda_bb vssa_bb bottom_plate_4path_BB_beamformer
xi10 clk0_k23 clk180_k23 clk90_k23 clk270_k23 clk180_k23 clk0_k23 clk270_k23 clk90_k23 clk0_k23 clk180_k23 clk90_k23 clk270_k23 clk180_k23 clk0_k23 clk270_k23 clk90_k23 _net22 _net23 _net24 _net25 vcmbias _net6 _net7 _net8 _net9 _net10 _net11 _net12 _net13 ibias<5> ibias<6> vdda_bb vssa_bb bottom_plate_4path_BB_beamformer
.ends MIMO_Beamformers_CLK_NW2
** End of subcircuit definition.

** Library name: ALIGN_testcircuits
** Cell name: TOP_MIMO_MIXER_BEAM_CLK_t1
** View name: schematic
xi1 clk0 clk90 clk180 clk270 vcmbias vdda_bb vddd vssd _net17 _net24 _net22 _net23 _net20 _net21 _net18 _net19 MIMO_MIXER_CLK_BUFFER
xi0 clk0 clk180 clk270 clk90 _net7 _net25 _net11 _net10 _net9 _net14 _net13 _net12 _net6 _net5 _net4 _net3 _net2 _net1 _net0 _net8 _net16 _net15 set vcmbias vdda_bb vddd vssa_bb vssd _net17 _net24 _net22 _net23 _net20 _net21 _net18 _net19 ibias<1> ibias<2> ibias<3> ibias<4> ibias<5> ibias<6> ibias<7> ibias<8> MIMO_Beamformers_CLK_NW2
.END
