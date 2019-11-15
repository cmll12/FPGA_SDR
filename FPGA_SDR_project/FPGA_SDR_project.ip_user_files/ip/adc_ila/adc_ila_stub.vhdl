-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1.2 (lin64) Build 2615518 Fri Aug  9 15:53:29 MDT 2019
-- Date        : Thu Nov 14 23:36:36 2019
-- Host        : eecs-digital-49 running 64-bit Ubuntu 14.04.6 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /afs/athena.mit.edu/user/c/m/cmll/six_111/project/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.srcs/sources_1/ip/adc_ila_1/adc_ila_stub.vhdl
-- Design      : adc_ila
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity adc_ila is
  Port ( 
    clk : in STD_LOGIC;
    probe0 : in STD_LOGIC_VECTOR ( 12 downto 0 );
    probe1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe3 : in STD_LOGIC_VECTOR ( 11 downto 0 )
  );

end adc_ila;

architecture stub of adc_ila is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,probe0[12:0],probe1[0:0],probe2[0:0],probe3[11:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "ila,Vivado 2019.1.2";
begin
end;
