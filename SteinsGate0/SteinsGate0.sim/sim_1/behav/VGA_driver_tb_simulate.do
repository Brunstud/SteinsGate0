######################################################################
#
# File name : VGA_driver_tb_simulate.do
# Created on: Sat Dec 23 13:05:17 +0800 2023
#
# Auto generated by Vivado for 'behavioral' simulation
#
######################################################################
vsim -voptargs="+acc" -L unisims_ver -L unimacro_ver -L secureip -L xil_defaultlib -lib xil_defaultlib xil_defaultlib.VGA_driver_tb xil_defaultlib.glbl

do {VGA_driver_tb_wave.do}

view wave
view structure
view signals

do {VGA_driver_tb.udo}

run 1000ns