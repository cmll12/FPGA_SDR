// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1.2 (lin64) Build 2615518 Fri Aug  9 15:53:29 MDT 2019
// Date        : Wed Dec  4 13:46:00 2019
// Host        : eecs-digital-49 running 64-bit Ubuntu 14.04.6 LTS
// Command     : write_verilog -force -mode funcsim {/afs/athena.mit.edu/user/c/o/colinpc/6.111 Final
//               Project/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.srcs/sources_1/bd/fft_mag/ip/fft_mag_mult_gen_0_0/fft_mag_mult_gen_0_0_sim_netlist.v}
// Design      : fft_mag_mult_gen_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fft_mag_mult_gen_0_0,mult_gen_v12_0_15,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_15,Vivado 2019.1.2" *) 
(* NotValidForBitStream *)
module fft_mag_mult_gen_0_0
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
  fft_mag_mult_gen_0_0_mult_gen_v12_0_15 U0
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
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "mult_gen_v12_0_15" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module fft_mag_mult_gen_0_0_mult_gen_v12_0_15
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
  fft_mag_mult_gen_0_0_mult_gen_v12_0_15_viv i_mult
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
huY+oJDVrDICFFZlBXmbd5xV6LJaqD9D7Ge9MfUxBnBtq8wIwu/Fv28byx7UK2vcweOd52AGB64f
fpX8XBwgvVaPwEQ5IO06tN/vZSCTisc0tBpzto9YKeV2DjMNUZq+031ieiTtr80KDWVrq0gKPk08
2B0BhF9mS5pODPDvHLdfCKlwmlGRuaE/mzlJ5FprdwRHS8Ovq1syE7Eu1bt2+F/hohaUcnbmefB2
M2a5amnJTWwYiC2ecOQgcPuATyPRnLRCpkGXcwNOYREYkynVjYpHSdJdpMYovaAIvVXZ7WARSbzK
K6itUh8Z3b0FIMqmcDvAs75ZeVARereE53Xr8A==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
oTWemQDQB7U8wCcuPBi2DCBqmySC1dCEC2xq/LPZTMOypikTeM6mUENQ1obiYLiPgWavDx7q2uUn
4O8XB1xVFvBK/6r99i9bJ+xfEnxZ4q7/UH2Zj4sikLweJkIKPaU7uRUfwzi6L1g8unh78Vsr++hq
Sk+t8wwnBWDPuEL/qmXK0AHJuYolQScvTWND/IE7nKDcgxzQrwfy+lB+bPp6GikpzZsBNijGwV80
bbM5Cq7dgmXVL6nWaKt8V9ftB2o4/H+JNNQDWC4K3DqeOOwf63P+zIE/q4wmgPJoiN1XgcdHjmBm
ebxiEsI2m/YatE7xEMf1qu4noaYXkbe9c9FKjg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 7264)
`pragma protect data_block
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
qLC/gO5FciYs3qLn0Yc3iEzGpDZGj+nKXg==
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
