onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib building2_rom_opt

do {wave.do}

view wave
view structure
view signals

do {building2_rom.udo}

run -all

quit -force
