onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib character0_rom_opt

do {wave.do}

view wave
view structure
view signals

do {character0_rom.udo}

run -all

quit -force
