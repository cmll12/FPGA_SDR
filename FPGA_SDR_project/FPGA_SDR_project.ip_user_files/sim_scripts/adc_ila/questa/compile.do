vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 "+incdir+../../../../FPGA_SDR_project.srcs/sources_1/ip/adc_ila/hdl/verilog" \
"../../../../FPGA_SDR_project.srcs/sources_1/ip/adc_ila/sim/adc_ila.v" \


vlog -work xil_defaultlib \
"glbl.v"

