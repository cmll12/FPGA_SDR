-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1.2 (lin64) Build 2615518 Fri Aug  9 15:53:29 MDT 2019
-- Date        : Sun Dec  1 19:13:18 2019
-- Host        : eecs-digital-49 running 64-bit Ubuntu 14.04.6 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /afs/athena.mit.edu/user/c/m/cmll/six_111/project/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.srcs/sources_1/ip/ila_0/ila_0_stub.vhdl
-- Design      : ila_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ila_0 is
  Port ( 
    clk : in STD_LOGIC;
    probe0 : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );

end ila_0;

architecture stub of ila_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,probe0[7:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "ila,Vivado 2019.1.2";
begin
end;
