vlib work
vlib activehdl

vlib activehdl/xil_defaultlib

vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../FPGA_SDR_project.srcs/sources_1/ip/adc_ila/hdl/verilog" \
"../../../../FPGA_SDR_project.srcs/sources_1/ip/adc_ila/sim/adc_ila.v" \


vlog -work xil_defaultlib \
"glbl.v"

