// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1.2 (lin64) Build 2615518 Fri Aug  9 15:53:29 MDT 2019
// Date        : Wed Dec  4 13:46:14 2019
// Host        : eecs-digital-49 running 64-bit Ubuntu 14.04.6 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ fft_mag_cordic_0_0_stub.v
// Design      : fft_mag_cordic_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "cordic_v6_0_15,Vivado 2019.1.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(aclk, s_axis_cartesian_tvalid, 
  s_axis_cartesian_tuser, s_axis_cartesian_tlast, s_axis_cartesian_tdata, 
  m_axis_dout_tvalid, m_axis_dout_tuser, m_axis_dout_tlast, m_axis_dout_tdata)
/* synthesis syn_black_box black_box_pad_pin="aclk,s_axis_cartesian_tvalid,s_axis_cartesian_tuser[11:0],s_axis_cartesian_tlast,s_axis_cartesian_tdata[31:0],m_axis_dout_tvalid,m_axis_dout_tuser[11:0],m_axis_dout_tlast,m_axis_dout_tdata[23:0]" */;
  input aclk;
  input s_axis_cartesian_tvalid;
  input [11:0]s_axis_cartesian_tuser;
  input s_axis_cartesian_tlast;
  input [31:0]s_axis_cartesian_tdata;
  output m_axis_dout_tvalid;
  output [11:0]m_axis_dout_tuser;
  output m_axis_dout_tlast;
  output [23:0]m_axis_dout_tdata;
endmodule
