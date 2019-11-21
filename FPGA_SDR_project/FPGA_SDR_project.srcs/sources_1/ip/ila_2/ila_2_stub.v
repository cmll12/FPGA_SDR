// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Thu Nov 21 17:12:01 2019
// Host        : CharlesPC running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub {c:/Users/Charles/Desktop/MIT/Fall 2019/6_111/FPGA SDR Final
//               Project/FPGA_SDR/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.srcs/sources_1/ip/ila_2/ila_2_stub.v}
// Design      : ila_2
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "ila,Vivado 2019.1" *)
module ila_2(clk, probe0, probe1, probe2, probe3)
/* synthesis syn_black_box black_box_pad_pin="clk,probe0[11:0],probe1[31:0],probe2[11:0],probe3[23:0]" */;
  input clk;
  input [11:0]probe0;
  input [31:0]probe1;
  input [11:0]probe2;
  input [23:0]probe3;
endmodule
