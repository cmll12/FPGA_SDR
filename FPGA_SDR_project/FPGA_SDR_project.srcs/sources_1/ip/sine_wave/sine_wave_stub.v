// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Thu Nov 21 14:53:48 2019
// Host        : CharlesPC running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub {c:/Users/Charles/Desktop/MIT/Fall 2019/6_111/FPGA SDR Final
//               Project/FPGA_SDR/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.srcs/sources_1/ip/sine_wave/sine_wave_stub.v}
// Design      : sine_wave
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_3,Vivado 2019.1" *)
module sine_wave(clka, addra, douta)
/* synthesis syn_black_box black_box_pad_pin="clka,addra[7:0],douta[11:0]" */;
  input clka;
  input [7:0]addra;
  output [11:0]douta;
endmodule
