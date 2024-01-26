onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib chara1_rom_opt

do {wave.do}

view wave
view structure
view signals

do {chara1_rom.udo}

run -all

quit -force
