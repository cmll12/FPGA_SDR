vlib work
vlib riviera

vlib riviera/xil_defaultlib
vlib riviera/xpm

vmap xil_defaultlib riviera/xil_defaultlib
vmap xpm riviera/xpm

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../FPGA_SDR_project.srcs/sources_1/ip/am_bp_ila/hdl/verilog" \
"/var/local/xilinx-local/Vivado/2019.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/var/local/xilinx-local/Vivado/2019.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"/var/local/xilinx-local/Vivado/2019.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../FPGA_SDR_project.srcs/sources_1/ip/am_bp_ila/hdl/verilog" \
"../../../../FPGA_SDR_project.srcs/sources_1/ip/am_bp_ila/sim/am_bp_ila.v" \

vlog -work xil_defaultlib \
"glbl.v"

