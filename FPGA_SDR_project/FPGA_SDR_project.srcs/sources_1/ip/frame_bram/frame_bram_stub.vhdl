-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1.2 (lin64) Build 2615518 Fri Aug  9 15:53:29 MDT 2019
-- Date        : Tue Dec  3 22:13:21 2019
-- Host        : eecs-digital-49 running 64-bit Ubuntu 14.04.6 LTS
-- Command     : write_vhdl -force -mode synth_stub {/afs/athena.mit.edu/user/c/o/colinpc/6.111 Final
--               Project/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.srcs/sources_1/ip/frame_bram/frame_bram_stub.vhdl}
-- Design      : frame_bram
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity frame_bram is
  Port ( 
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 0 to 0 );
    addra : in STD_LOGIC_VECTOR ( 9 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 11 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 11 downto 0 )
  );

end frame_bram;

architecture stub of frame_bram is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clka,ena,wea[0:0],addra[9:0],dina[11:0],douta[11:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "blk_mem_gen_v8_4_3,Vivado 2019.1.2";
begin
end;