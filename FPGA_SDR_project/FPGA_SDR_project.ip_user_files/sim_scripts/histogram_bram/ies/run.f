-makelib ies_lib/xil_defaultlib -sv \
  "/var/local/xilinx-local/Vivado/2019.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "/var/local/xilinx-local/Vivado/2019.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
  "/var/local/xilinx-local/Vivado/2019.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "/var/local/xilinx-local/Vivado/2019.1/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/blk_mem_gen_v8_4_3 \
  "../../../ipstatic/simulation/blk_mem_gen_v8_4.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../FPGA_SDR_project.srcs/sources_1/ip/histogram_bram/sim/histogram_bram.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

