// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1.2 (lin64) Build 2615518 Fri Aug  9 15:53:29 MDT 2019
// Date        : Sun Dec  8 14:12:06 2019
// Host        : eecs-digital-49 running 64-bit Ubuntu 14.04.6 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top fm_stage_1_ila -prefix
//               fm_stage_1_ila_ fm_stage_1_ila_stub.v
// Design      : fm_stage_1_ila
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "ila,Vivado 2019.1.2" *)
module fm_stage_1_ila(clk, probe0, probe1)
/* synthesis syn_black_box black_box_pad_pin="clk,probe0[33:0],probe1[33:0]" */;
  input clk;
  input [33:0]probe0;
  input [33:0]probe1;
endmodule