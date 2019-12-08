// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1.2 (lin64) Build 2615518 Fri Aug  9 15:53:29 MDT 2019
// Date        : Wed Dec  4 13:45:59 2019
// Host        : eecs-digital-49 running 64-bit Ubuntu 14.04.6 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ fft_mag_mult_gen_0_0_sim_netlist.v
// Design      : fft_mag_mult_gen_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fft_mag_mult_gen_0_0,mult_gen_v12_0_15,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_15,Vivado 2019.1.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (CLK,
    A,
    B,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF p_intf:b_intf:a_intf, ASSOCIATED_RESET sclr, ASSOCIATED_CLKEN ce, FREQ_HZ 104000000, PHASE 0.000, CLK_DOMAIN fft_mag_clk, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [15:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [15:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value data} bitwidth {attribs {resolve_type generated dependency bitwidth format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type generated dependency signed format bool minimum {} maximum {}} value TRUE}}}} DATA_WIDTH 32}" *) output [31:0]P;

  wire [15:0]A;
  wire [15:0]B;
  wire CLK;
  wire [31:0]P;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "16" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "16" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "31" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mult_gen_v12_0_15 U0
       (.A(A),
        .B(B),
        .CE(1'b1),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* C_A_TYPE = "0" *) (* C_A_WIDTH = "16" *) (* C_B_TYPE = "0" *) 
(* C_B_VALUE = "10000001" *) (* C_B_WIDTH = "16" *) (* C_CCM_IMP = "0" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "1" *) (* C_MODEL_TYPE = "0" *) 
(* C_MULT_TYPE = "1" *) (* C_OPTIMIZE_GOAL = "1" *) (* C_OUT_HIGH = "31" *) 
(* C_OUT_LOW = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) (* downgradeipidentifiedwarnings = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mult_gen_v12_0_15
   (CLK,
    A,
    B,
    CE,
    SCLR,
    ZERO_DETECT,
    P,
    PCASC);
  input CLK;
  input [15:0]A;
  input [15:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [31:0]P;
  output [47:0]PCASC;

  wire \<const0> ;
  wire [15:0]A;
  wire [15:0]B;
  wire CLK;
  wire [31:0]P;
  wire [47:0]NLW_i_mult_PCASC_UNCONNECTED;
  wire [1:0]NLW_i_mult_ZERO_DETECT_UNCONNECTED;

  assign PCASC[47] = \<const0> ;
  assign PCASC[46] = \<const0> ;
  assign PCASC[45] = \<const0> ;
  assign PCASC[44] = \<const0> ;
  assign PCASC[43] = \<const0> ;
  assign PCASC[42] = \<const0> ;
  assign PCASC[41] = \<const0> ;
  assign PCASC[40] = \<const0> ;
  assign PCASC[39] = \<const0> ;
  assign PCASC[38] = \<const0> ;
  assign PCASC[37] = \<const0> ;
  assign PCASC[36] = \<const0> ;
  assign PCASC[35] = \<const0> ;
  assign PCASC[34] = \<const0> ;
  assign PCASC[33] = \<const0> ;
  assign PCASC[32] = \<const0> ;
  assign PCASC[31] = \<const0> ;
  assign PCASC[30] = \<const0> ;
  assign PCASC[29] = \<const0> ;
  assign PCASC[28] = \<const0> ;
  assign PCASC[27] = \<const0> ;
  assign PCASC[26] = \<const0> ;
  assign PCASC[25] = \<const0> ;
  assign PCASC[24] = \<const0> ;
  assign PCASC[23] = \<const0> ;
  assign PCASC[22] = \<const0> ;
  assign PCASC[21] = \<const0> ;
  assign PCASC[20] = \<const0> ;
  assign PCASC[19] = \<const0> ;
  assign PCASC[18] = \<const0> ;
  assign PCASC[17] = \<const0> ;
  assign PCASC[16] = \<const0> ;
  assign PCASC[15] = \<const0> ;
  assign PCASC[14] = \<const0> ;
  assign PCASC[13] = \<const0> ;
  assign PCASC[12] = \<const0> ;
  assign PCASC[11] = \<const0> ;
  assign PCASC[10] = \<const0> ;
  assign PCASC[9] = \<const0> ;
  assign PCASC[8] = \<const0> ;
  assign PCASC[7] = \<const0> ;
  assign PCASC[6] = \<const0> ;
  assign PCASC[5] = \<const0> ;
  assign PCASC[4] = \<const0> ;
  assign PCASC[3] = \<const0> ;
  assign PCASC[2] = \<const0> ;
  assign PCASC[1] = \<const0> ;
  assign PCASC[0] = \<const0> ;
  assign ZERO_DETECT[1] = \<const0> ;
  assign ZERO_DETECT[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "16" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "16" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "31" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mult_gen_v12_0_15_viv i_mult
       (.A(A),
        .B(B),
        .CE(1'b0),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_i_mult_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_i_mult_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2019.1"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
o5Mi9l0Jf86XfwCztAM5di1ViendXj8AN0XF7bgVNhzn3jvKDvBwn+VUuLA9DsvKo4w2s+rcuYzW
JJ9Xg7XMuQ==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
SJ3ArCvXJy4E3dhxRCy9ejuLmyXyCVqwL+FFrWjQxYdW2HKfdlyzykYUoLs0uj3jMS1Y7qW3d7fi
rLXXg97Vkgx2LMUxd4cblHpsZAXTBMvt0tfj89xVBDYFmAae1UsI4p5sshugfGLejXAqIXh+2Iwf
Yc71o+6iY4IZsglZZ20=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
yFMD7zkj9jyca/GbVUMEG1HPXzz0xniiSgGJlEsHFukIOn37BECAc76XwOhJgVy2vV0f3ataWLdx
nsxAfVZWvWuygKEcJyItUhBs5v4V0U9SBwFv6xVP8yZBPvzhTgzkpIouOdq7mltGpGkSW5dGuTfV
pgXXBnjR+h/cjt7yBJ/Mxu7BjuiZz+W3ZD5NqUnm1RMhEuewvF0HGJ7Yk8g+uwlEKrcwu56NFk9R
429NruYOqo0bE6aTyAAjkD2d+1u/G2NycFXPcY0SAJmkigES7lmFxHQw6PhftsgFDqYywBDqWb8c
2u2rCPZxOq9hwQAJlypcOGWzIXePy5CXQhtswg==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
afVBtHtSg9xcHjSHvZeyxhQ7bhQ0V9GHWPKNC1/TgGiCz+A9XNf0YrDznrCTXa7mef/hJr2ko7OP
nzAkT1XMHCczRkJ6uI2x2zHnKvIV0d5HEYDvyl4nfS6WqvJ6IsyY8Kr4uWW6Z1dPEddElcc4wBr4
Kdfi0WpNjG+SJCNIn7XX2h3mA455xIamt1YF3WMVoX7/2hZK/u35rSSO9uMndJqBrvsIl4N+L/lW
y7Rp1fwPQSRmJOE79O2ZnC3b0qOlb7OMWidAPBAEKnt0xrAh1j7XPYOqDPKd6bf0qLkAe7aALCUw
IrghvehdA3QPalsTwJzXcw4iL5oV+eNP1CGwmQ==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2019_02", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ZRPA7IPjI1qA7VlE3E7uv1+AlA2zfmj7g8Gyd0YVQGvFiyioufu8YwT+m/L1j4VbrJ2Cu9YdfAEm
wCKO4fWS+EKEEvfYgc69oOlSkpJ/qCzfjmeQ7qJfbIBv1xmfxqxp4yi8TGbAWOxln0Sdfp3wZehb
vmuL+5sYz4Yg2BL6lUEriJn0zTqI/MQFSHmD/PD37J2OmRnGu5DgHILC9pLYxsoqQc/77TIjoLPk
DRWp2fVPU5WT7lnauz8AW+MYqBPNSfcQE0cH5CWLVKXklBtfasC1DkcrbHCcopmvU36P3fjp2J93
RZ9RYMKSj/wdPTse7d6LuvSF7l+2h4upnOPJYQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
OAflKm2mjYrCzVNeWb7pTFLBhsZMGP1+SK6AtHM6PB50a/jtR5NStzPve3QrViGYqRei3eAKbX6P
/mmXjMb6pq1yadp5PzjQNhQ4EcoxJGxfzW3jto7i8ul4Om+ruwpxZnziFXELQEmKL1jwAFVvFHzM
Ngx9iX/4q6irXVkjBLw=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
aVYh9g0H2Lc3NvB4zdzeOe2iiRym6dl5o/ZHg4OI2lQbSCqqtVAtjY/tP329vK4RDiwxetDdpZz2
PSYbS3FUdEbQD6RxxsEBAOuRQoEQKjWv7Q0DFBYWsaWQuH4wmqeIpEmw7kdw3MVhU8YZl0WWVjiv
vwJkAGLQ3wJHhE/LcnUZam/Z0eIZakmuIknld1Xpc4nF4BKgTZAM9ch/kgbxyOm8ED1qk+1ZchkV
10Vr120o/J5t38NJKM7Fhw/dQxPCDfkIV04Jb33CaaLc0hUdrrxMYEE/4+xCjcZ6sJ+ibqgTXYNm
m1cXmgb8W4APaItQNTrRlYlQWWpgTcSayJIjjA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
NBgbOeWKYKXDBqZzBC6GMvtLkFAX6vPF9aFQUTW2wPG/nb2EAnAxJB7JLfLKdhBYsUy1Eqjf2k4+
72wf2uqhkiv4u+x0a4lagCd3AO8mMeVxazSMX6mkSjoTWAIuLmuwKLFzJ0x3a+umFSVX+VhVj38n
7gd0Ni5/TKEfMyqnzAnIZrUveiU8X0pxW6WDYpA4xG6fMJ62D2gbwQZRCOK1XUBpGm4REg/roAlE
W2azG5Sb8BJ2eLrBVcVZtj4WVCzSvUCiDhVUdG/s4+yB6e4yU5UWbyd77JsqVsqAEbX8ng5M3ICK
vPAoAK/1YXK+rN2BcaNZsAPZBYdMGV5SLH7lPg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
V0vbsR4ddumrlgLd3IvradPSRxTC/O+C6xoC0zESTRb0218jg2ycsZWYvxv90R8n/IPj9geBx0GM
IyQOlHeLl0vyfQjGpeQk2squa6+zLlr126vjAQzSg5TYXGH4278gTeB/l2Eqb/BM5NXGmok6vla1
g+4BOgSvAy1/72ruLAx4B+LEc7IqJwGMsZeOW8FnFX1eSc1jTgwIvXRqhnxc4+q3dgVsZ65kkKGW
9MEMiHP9haW3O1vBUn4ZLjGoXRfXYdNy8rzQMa/qJ7TH76bx7C0B4MnD1KkLLwHHZj814RAnv4l2
KKW1ALm5I+OckXG4IGV6EGx95ptCvSD7hD30Fg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 7248)
`pragma protect data_block
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
o40BjInVXjc0
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
