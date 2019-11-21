onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib sine_wave_opt

do {wave.do}

view wave
view structure
view signals

do {sine_wave.udo}

run -all

quit -force
