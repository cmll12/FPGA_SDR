onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+am_detect_ila -L xil_defaultlib -L xpm -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.am_detect_ila xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {am_detect_ila.udo}

run -all

endsim

quit -force
