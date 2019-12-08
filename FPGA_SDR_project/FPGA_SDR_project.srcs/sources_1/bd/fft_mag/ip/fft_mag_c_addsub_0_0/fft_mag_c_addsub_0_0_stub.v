// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1.2 (lin64) Build 2615518 Fri Aug  9 15:53:29 MDT 2019
// Date        : Wed Dec  4 13:45:58 2019
// Host        : eecs-digital-49 running 64-bit Ubuntu 14.04.6 LTS
// Command     : write_verilog -force -mode synth_stub {/afs/athena.mit.edu/user/c/o/colinpc/6.111 Final
//               Project/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.srcs/sources_1/bd/fft_mag/ip/fft_mag_c_addsub_0_0/fft_mag_c_addsub_0_0_stub.v}
// Design      : fft_mag_c_addsub_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "c_addsub_v12_0_13,Vivado 2019.1.2" *)
module fft_mag_c_addsub_0_0(A, B, CE, S)
/* synthesis syn_black_box black_box_pad_pin="A[31:0],B[31:0],CE,S[31:0]" */;
  input [31:0]A;
  input [31:0]B;
  input CE;
  output [31:0]S;
endmodule
