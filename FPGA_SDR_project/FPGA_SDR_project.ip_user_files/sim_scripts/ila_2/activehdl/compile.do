vlib work
vlib activehdl

vlib activehdl/xil_defaultlib
vlib activehdl/xpm

vmap xil_defaultlib activehdl/xil_defaultlib
vmap xpm activehdl/xpm

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../FPGA_SDR_project.srcs/sources_1/ip/ila_2/hdl/verilog" \
"C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"C:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../FPGA_SDR_project.srcs/sources_1/ip/ila_2/hdl/verilog" \
"../../../../FPGA_SDR_project.srcs/sources_1/ip/ila_2/sim/ila_2.v" \

vlog -work xil_defaultlib \
"glbl.v"

