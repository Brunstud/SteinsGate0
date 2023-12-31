onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L unisims_ver -L unimacro_ver -L secureip -L xil_defaultlib -L xpm -L blk_mem_gen_v8_3_3 -lib xil_defaultlib xil_defaultlib.character0_rom xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {character0_rom.udo}

run -all

quit -force
