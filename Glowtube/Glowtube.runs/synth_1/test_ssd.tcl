# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
set_param simulator.modelsimInstallPath C:/modeltech_pe_10.4c/win32pe
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir D:/Program/vivado/SteinsGate0_GIT/Glowtube/Glowtube.cache/wt [current_project]
set_property parent.project_path D:/Program/vivado/SteinsGate0_GIT/Glowtube/Glowtube.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
read_verilog -library xil_defaultlib {
  D:/Program/vivado/SteinsGate0_GIT/Glowtube/Glowtube.srcs/sources_1/new/divider.v
  D:/Program/vivado/SteinsGate0_GIT/Glowtube/Glowtube.srcs/sources_1/new/speed_led_display.v
  D:/Program/vivado/SteinsGate0_GIT/Glowtube/Glowtube.srcs/sources_1/new/hex_to_bcd.v
  D:/Program/vivado/SteinsGate0_GIT/Glowtube/Glowtube.srcs/sources_1/new/seven_segment_display.v
  D:/Program/vivado/SteinsGate0_GIT/Glowtube/Glowtube.srcs/sources_1/new/display_seg.v
  D:/Program/vivado/SteinsGate0_GIT/Glowtube/Glowtube.srcs/sources_1/new/test_ssd.v
}
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc D:/Program/vivado/SteinsGate0_GIT/Glowtube/Glowtube.srcs/constrs_1/new/test_ssd.xdc
set_property used_in_implementation false [get_files D:/Program/vivado/SteinsGate0_GIT/Glowtube/Glowtube.srcs/constrs_1/new/test_ssd.xdc]


synth_design -top test_ssd -part xc7a100tcsg324-1


write_checkpoint -force -noxdef test_ssd.dcp

catch { report_utilization -file test_ssd_utilization_synth.rpt -pb test_ssd_utilization_synth.pb }
