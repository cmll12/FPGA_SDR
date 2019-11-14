vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../FPGA_SDR_project.srcs/sources_1/ip/adc_ila/hdl/verilog" \
"../../../../FPGA_SDR_project.srcs/sources_1/ip/adc_ila/sim/adc_ila.v" \


vlog -work xil_defaultlib \
"glbl.v"

