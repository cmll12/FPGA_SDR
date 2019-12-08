// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1.2 (lin64) Build 2615518 Fri Aug  9 15:53:29 MDT 2019
// Date        : Wed Dec  4 13:45:57 2019
// Host        : eecs-digital-49 running 64-bit Ubuntu 14.04.6 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ fft_mag_c_addsub_0_0_sim_netlist.v
// Design      : fft_mag_c_addsub_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fft_mag_c_addsub_0_0,c_addsub_v12_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_addsub_v12_0_13,Vivado 2019.1.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_addsub_v12_0_13 U0
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
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) (* downgradeipidentifiedwarnings = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_addsub_v12_0_13
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_addsub_v12_0_13_viv xst_addsub
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
PpNxdnWF9RE2C3V6eB4HR32Q3u/bliiHFA1pyuM7Ax9K9cM+9+Drq+NKTgbAuYb9QX7Ejpw+l4EX
gAemgKYQSwrs0IRwHENXT8PBqsW+SfeeXgJKn+I/KnkZy5jhwgjGoSVGXxVhAlP61Wh0Y5sn2oXs
mQicPPmCD8BRmxL3fEtrG2Vj1L8I+YU3hJI1ZhpPsh54L9uMT/Z6TnP7S3kyNokMitxQvWqWf4Gr
kYXGey2jhjdiySkaiCCmpOPp59eJZUgq96zt2kVMfV+egrY9wqR1Vb+l3+SmDPVpsuuRNj7Vp2gr
PxQ/UzBkF3j63LdXmyyyJaBiVSPmlVs00Tr8Pw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
jS4aPpIwNPtQeEA3Rxk5ARHF0UOxeXmLI2Y6DQZxA/N0hg4rZvtiBrx+EAdKBwZvyBK5Det8/t4L
D1kh6q6N+58iwoHL1JT1WJtT9VrdIJFTOeZhnkaewMQXrV1QVn7ShpCNSuPjSXhJpBBQb1VEY0ZM
UTInS7Xhjx5Cj1rFCMbwNNnuD/LHL1gNYOWZ9eI8nqH9vCKAqopi8vBLnzVmaiMgu7XEDhcOanI1
uSpJiZVrJDiRn+gLw5CPazEtZxKgj1hQMsPr4rYnIpLUM5xlLNmoceca3R8b4BWQKWG20CJxsM6W
RSmzXguuBoS8JBGs2SP6A7YYXmXKiXE1qNN2Mg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 16336)
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
