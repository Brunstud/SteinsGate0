onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+chara2_rom -L unisims_ver -L unimacro_ver -L secureip -L xil_defaultlib -L xpm -O5 xil_defaultlib.chara2_rom xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {chara2_rom.udo}

run -all

endsim

quit -force
