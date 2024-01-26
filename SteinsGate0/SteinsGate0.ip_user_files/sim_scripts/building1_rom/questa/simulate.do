onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib building1_rom_opt

do {wave.do}

view wave
view structure
view signals

do {building1_rom.udo}

run -all

quit -force
