######################################################################
#
# File name : Gate_logic_tb_simulate.do
# Created on: Tue Dec 26 21:53:31 +0800 2023
#
# Auto generated by Vivado for 'behavioral' simulation
#
######################################################################
vsim -voptargs="+acc" -L unisims_ver -L unimacro_ver -L secureip -L xil_defaultlib -lib xil_defaultlib xil_defaultlib.Gate_logic_tb xil_defaultlib.glbl

do {Gate_logic_tb_wave.do}

view wave
view structure
view signals

do {Gate_logic_tb.udo}

run 1000ns
