// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1.2 (lin64) Build 2615518 Fri Aug  9 15:53:29 MDT 2019
// Date        : Tue Dec  3 22:13:21 2019
// Host        : eecs-digital-49 running 64-bit Ubuntu 14.04.6 LTS
// Command     : write_verilog -force -mode synth_stub {/afs/athena.mit.edu/user/c/o/colinpc/6.111 Final
//               Project/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.srcs/sources_1/ip/frame_bram/frame_bram_stub.v}
// Design      : frame_bram
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_3,Vivado 2019.1.2" *)
module frame_bram(clka, ena, wea, addra, dina, douta)
/* synthesis syn_black_box black_box_pad_pin="clka,ena,wea[0:0],addra[9:0],dina[11:0],douta[11:0]" */;
  input clka;
  input ena;
  input [0:0]wea;
  input [9:0]addra;
  input [11:0]dina;
  output [11:0]douta;
endmodule
