-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1.2 (lin64) Build 2615518 Fri Aug  9 15:53:29 MDT 2019
-- Date        : Sun Dec  8 14:12:06 2019
-- Host        : eecs-digital-49 running 64-bit Ubuntu 14.04.6 LTS
-- Command     : write_vhdl -force -mode synth_stub -rename_top fm_stage_1_ila -prefix
--               fm_stage_1_ila_ fm_stage_1_ila_stub.vhdl
-- Design      : fm_stage_1_ila
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fm_stage_1_ila is
  Port ( 
    clk : in STD_LOGIC;
    probe0 : in STD_LOGIC_VECTOR ( 33 downto 0 );
    probe1 : in STD_LOGIC_VECTOR ( 33 downto 0 )
  );

end fm_stage_1_ila;

architecture stub of fm_stage_1_ila is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,probe0[33:0],probe1[33:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "ila,Vivado 2019.1.2";
begin
end;
