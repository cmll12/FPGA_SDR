onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib AM_FIR_Coeff_opt

do {wave.do}

view wave
view structure
view signals

do {AM_FIR_Coeff.udo}

run -all

quit -force
