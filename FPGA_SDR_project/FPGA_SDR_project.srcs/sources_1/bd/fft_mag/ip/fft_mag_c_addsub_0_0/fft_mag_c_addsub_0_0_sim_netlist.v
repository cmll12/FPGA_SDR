// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1.2 (lin64) Build 2615518 Fri Aug  9 15:53:29 MDT 2019
// Date        : Wed Dec  4 13:45:58 2019
// Host        : eecs-digital-49 running 64-bit Ubuntu 14.04.6 LTS
// Command     : write_verilog -force -mode funcsim {/afs/athena.mit.edu/user/c/o/colinpc/6.111 Final
//               Project/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.srcs/sources_1/bd/fft_mag/ip/fft_mag_c_addsub_0_0/fft_mag_c_addsub_0_0_sim_netlist.v}
// Design      : fft_mag_c_addsub_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fft_mag_c_addsub_0_0,c_addsub_v12_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_addsub_v12_0_13,Vivado 2019.1.2" *) 
(* NotValidForBitStream *)
module fft_mag_c_addsub_0_0
   (A,
    B,
    CE,
    S);
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value data} bitwidth {attribs {resolve_type generated dependency bitwidth format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type generated dependency signed format bool minimum {} maximum {}} value TRUE}}}} DATA_WIDTH 32}" *) input [31:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value data} bitwidth {attribs {resolve_type generated dependency bitwidth format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type generated dependency signed format bool minimum {} maximum {}} value TRUE}}}} DATA_WIDTH 32}" *) input [31:0]B;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_LOW" *) input CE;
  (* x_interface_info = "xilinx.com:signal:data:1.0 s_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME s_intf, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value data} bitwidth {attribs {resolve_type generated dependency bitwidth format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type generated dependency signed format bool minimum {} maximum {}} value TRUE}}}} DATA_WIDTH 32}" *) output [31:0]S;

  wire [31:0]A;
  wire [31:0]B;
  wire [31:0]S;
  wire NLW_U0_C_OUT_UNCONNECTED;

  (* C_BORROW_LOW = "1" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* c_a_type = "0" *) 
  (* c_a_width = "32" *) 
  (* c_add_mode = "0" *) 
  (* c_ainit_val = "0" *) 
  (* c_b_constant = "0" *) 
  (* c_b_type = "0" *) 
  (* c_b_value = "00000000000000000000000000000000" *) 
  (* c_b_width = "32" *) 
  (* c_bypass_low = "0" *) 
  (* c_has_bypass = "0" *) 
  (* c_has_c_in = "0" *) 
  (* c_has_c_out = "0" *) 
  (* c_has_ce = "1" *) 
  (* c_has_sclr = "0" *) 
  (* c_has_sinit = "0" *) 
  (* c_has_sset = "0" *) 
  (* c_latency = "0" *) 
  (* c_out_width = "32" *) 
  (* c_sinit_val = "0" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  fft_mag_c_addsub_0_0_c_addsub_v12_0_13 U0
       (.A(A),
        .ADD(1'b1),
        .B(B),
        .BYPASS(1'b0),
        .CE(1'b0),
        .CLK(1'b0),
        .C_IN(1'b0),
        .C_OUT(NLW_U0_C_OUT_UNCONNECTED),
        .S(S),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule

(* C_ADD_MODE = "0" *) (* C_AINIT_VAL = "0" *) (* C_A_TYPE = "0" *) 
(* C_A_WIDTH = "32" *) (* C_BORROW_LOW = "1" *) (* C_BYPASS_LOW = "0" *) 
(* C_B_CONSTANT = "0" *) (* C_B_TYPE = "0" *) (* C_B_VALUE = "00000000000000000000000000000000" *) 
(* C_B_WIDTH = "32" *) (* C_CE_OVERRIDES_BYPASS = "1" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_HAS_BYPASS = "0" *) (* C_HAS_CE = "1" *) (* C_HAS_C_IN = "0" *) 
(* C_HAS_C_OUT = "0" *) (* C_HAS_SCLR = "0" *) (* C_HAS_SINIT = "0" *) 
(* C_HAS_SSET = "0" *) (* C_IMPLEMENTATION = "0" *) (* C_LATENCY = "0" *) 
(* C_OUT_WIDTH = "32" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "c_addsub_v12_0_13" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module fft_mag_c_addsub_0_0_c_addsub_v12_0_13
   (A,
    B,
    CLK,
    ADD,
    C_IN,
    CE,
    BYPASS,
    SCLR,
    SSET,
    SINIT,
    C_OUT,
    S);
  input [31:0]A;
  input [31:0]B;
  input CLK;
  input ADD;
  input C_IN;
  input CE;
  input BYPASS;
  input SCLR;
  input SSET;
  input SINIT;
  output C_OUT;
  output [31:0]S;

  wire \<const0> ;
  wire [31:0]A;
  wire [31:0]B;
  wire [31:0]S;
  wire NLW_xst_addsub_C_OUT_UNCONNECTED;

  assign C_OUT = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_BORROW_LOW = "1" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* c_a_type = "0" *) 
  (* c_a_width = "32" *) 
  (* c_add_mode = "0" *) 
  (* c_ainit_val = "0" *) 
  (* c_b_constant = "0" *) 
  (* c_b_type = "0" *) 
  (* c_b_value = "00000000000000000000000000000000" *) 
  (* c_b_width = "32" *) 
  (* c_bypass_low = "0" *) 
  (* c_has_bypass = "0" *) 
  (* c_has_c_in = "0" *) 
  (* c_has_c_out = "0" *) 
  (* c_has_ce = "1" *) 
  (* c_has_sclr = "0" *) 
  (* c_has_sinit = "0" *) 
  (* c_has_sset = "0" *) 
  (* c_latency = "0" *) 
  (* c_out_width = "32" *) 
  (* c_sinit_val = "0" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  fft_mag_c_addsub_0_0_c_addsub_v12_0_13_viv xst_addsub
       (.A(A),
        .ADD(1'b0),
        .B(B),
        .BYPASS(1'b0),
        .CE(1'b0),
        .CLK(1'b0),
        .C_IN(1'b0),
        .C_OUT(NLW_xst_addsub_C_OUT_UNCONNECTED),
        .S(S),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2019.1"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
puzTlOQOrgzZiSsyy2QHI224uzEILIPOIK95RpyVNwh3735bBxWh7gVg//aWuLJkF/WxGfhPwLt2
rGJ38suGJA==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
nxNn6OgbzhaEOHmmfZA90k9PbAZ/CrE/6Deng4tMGd6UTBjv3LwrvPFJibJg3H/OacCePpf5RhU6
hNQaN1rzkx9lphQQCedfOkFgHTtE5EoojPa1eNHgwy+yJuvNzg69j1RcwVMMHu0gRmg4IAMxR+NX
TT0oQsvbK/qcYYW+ODA=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
XdeJlQVnhnFgNtdsIL0whgNCzBjcXH2+ZQOPQQaTwFqeqZvT9CzEEjV1jO06IK1UeaeoOb4N+are
bTzUARxJ9MbL+sGDzlSt1De2cF/hMZUra9fvHEfgi9mwK1W8eo1yQzbnch7cj79CkopcxGf8JSTN
gUiezW8H2NA4FhcbBDYMjuAZhZx7u+bDw3VoSNB3JE3vs1nGOyjGkY4JEeJuWvwYemgWQcqUBmMd
OFLZLBnh+gRAbSDoCaJ5r6nM40eMt+AqN3gNQaFHhvwZSv5mvV+abPmDRjk4Z5h1II5CVbrDt5Gu
dn7L64BtmEgFddW6366QgFSN/Tgl9ChXbCWSLg==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TXUDSxmNeSuIYWrnymNwlV7j5VW39J0rZVhf6YLniUMQc9aNs1WmN7PrPFFZU19I3q93SRPdEqaL
M0QtKYWkfLqIj51pSX1zn6d6XkADYyWGrJ/CaMbFGENkoON8mlTn/TidtSx8W+NWn/6oKD4qdlqH
/wrWtIw+c2etdxiXyjAc2a+l+z95Uk7rg4mjFfeOTfdhVy1ygQUJGaJEmhsmArmmlIP1igFHC/dF
Fr3RqrlSGK+SCj2BZn693lWDPayXTA5uO+esZEk18lfg/5QpOJLnzOls3xyiMn0M66NaBLULzkWA
OhPPbhA43RbWVNzSe/sb+e4ltim/vrDPViGSiA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2019_02", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
RLQOZocj2L6yLb0Ga9hrsoAm6s/jd4TXu75jSakrQvaakyFso3E5lilk4sQ4vw3MPSM5uOH3+mdo
KBaBBS21R7pur7bPSi2biPjYzymnFPYNmBm8eNtwL99MogaXoWGHbwdCclgXIHAAXdVI9cmZ10CI
mnBrsGipjZTUufBqo+3bhrt3enMebc0SO9VvJjACHUBOBhHoYasaPFp9D1pE9pRHwSXfkyenZgU3
n4uLWA16RNe4pe1ZwQPV6K3bLtBKnaifcDAKVPzHeh8Fdqz4eFNLC+McljqA3OHTJLMg9PeQRs2B
sbSSHuLM/5SuLuBV0R1ixw1kKmohV8TPU82mkg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
QqOgRrfR9NZ8Rg1deK8wJL3OWcWjhUa4iaSWvV85ZNafYHF9wZUga5M5TPbQu69DN9L6GvSIdgro
rz7e3Mh8Oaj7S18COVYR6yIvUIyU2lQOjhw3JtncTNv3a+ofOa4ebFMnyS56rOtdBVF0nXGQoY4/
QGh8m/DkTC35W0Pp9HY=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
DufzjtkczAXkqUCMRvgH4x2S9dpborMY0XXZpK+mEjcEPrTwAyeH+yCV7g8HtpDyKCTUWDl4lqza
zPizDWXu6kEFfZhSH4knTn0yJAAiupRWUg/vgZCX4dvHbJsVdcYV+xOHn5Dy5QSQrNnPJaJf95BE
4jR9va5Afcik8nInoBQzD9lkGdmTEqS1PvzMxJuVApLfsHx3e+H3zBb82ttEDZD8NBtl3pZcb3rZ
07wFyBrtpcavskiirU7UHZh+J28vxlKeFl0PKS7mla0HMwPPa/J8xnfMroNJD2zrXQXUnQULGO5y
LbLajQIriufLhWZhXsav6XlFu1ODtcO1cSZt3Q==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
O9laRJ27loYpuKKfOadPD0q1JI8RBDeEwn8Ij28WQi/KK9xxDg9lJ30hpFJc073xexLiGXs+R2cm
ChCR9TJufnIMf+MW3T5cxhtmYiCUcD2WLpnAgIIIqzWTgP4zcV7lHxVGRHBoT8DOoWp8kOfcXcmW
5FItVS7+49q3HJWxCIEWF8PLGhbazvrIEV8H+/af58H3gqVjOIPFqjohgFIeMvChP1/FR/i/+e7S
LLCzhbZUr5DxG+5MZqC7GKck9TXyRk829OuD5jxzTUQ7w2BX0aK0PSzPO5YjUjYDEmTk5j6tqAls
zSJT3FfF0rWSJR5bu5Pb6pIQMW11Cm2mr+k9wA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
YQnkec4jbfx3GHFTuy/0AUypSrBCGL10n14EPA4Z1S9BeYq1AISvYiCJSI7PchXn7HBqoNCaQJSM
FMRCOZSlNJAEruFHJX94Es5yMUSz5C0N/WgWO659LU0ax27qJc5Nrj7kAN6i15yecgjm4uLFD0EG
uMHyrbGplsM0IDWoGgcFocP1D0wnqwiOQnz8qNONas5RnBs/krOfkP+5E2Nwe2M/JiwdJepD0UHF
r8DkPhqf9eqBW8myFRgZ9jx/BGlDTepXSpBzL1DgcmakfBfMNESJYI7t771PVoisPOhqjsZK/9xb
KGZNeLTaxRXUHaq0p/79VyF6SflD0TspVlF1BA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 16400)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
