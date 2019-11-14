onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+adc_ila -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.adc_ila xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {adc_ila.udo}

run -all

endsim

quit -force
