// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1.2 (lin64) Build 2615518 Fri Aug  9 15:53:29 MDT 2019
// Date        : Wed Dec  4 13:45:59 2019
// Host        : eecs-digital-49 running 64-bit Ubuntu 14.04.6 LTS
// Command     : write_verilog -force -mode funcsim -rename_top fft_mag_mult_gen_1_0 -prefix
//               fft_mag_mult_gen_1_0_ fft_mag_mult_gen_0_0_sim_netlist.v
// Design      : fft_mag_mult_gen_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fft_mag_mult_gen_0_0,mult_gen_v12_0_15,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_15,Vivado 2019.1.2" *) 
(* NotValidForBitStream *)
module fft_mag_mult_gen_1_0
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
  fft_mag_mult_gen_1_0_mult_gen_v12_0_15 U0
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
module fft_mag_mult_gen_1_0_mult_gen_v12_0_15
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
  fft_mag_mult_gen_1_0_mult_gen_v12_0_15_viv i_mult
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
VHI=
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
