-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
-- Date        : Thu Nov 21 17:12:01 2019
-- Host        : CharlesPC running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub {c:/Users/Charles/Desktop/MIT/Fall 2019/6_111/FPGA SDR Final
--               Project/FPGA_SDR/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.srcs/sources_1/ip/ila_2/ila_2_stub.vhdl}
-- Design      : ila_2
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ila_2 is
  Port ( 
    clk : in STD_LOGIC;
    probe0 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    probe1 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe2 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    probe3 : in STD_LOGIC_VECTOR ( 23 downto 0 )
  );

end ila_2;

architecture stub of ila_2 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,probe0[11:0],probe1[31:0],probe2[11:0],probe3[23:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "ila,Vivado 2019.1";
begin
end;
