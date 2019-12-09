onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib fm_stage_1_ila_opt

do {wave.do}

view wave
view structure
view signals

do {fm_stage_1_ila.udo}

run -all

quit -force
