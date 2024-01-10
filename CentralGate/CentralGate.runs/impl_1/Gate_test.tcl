proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

start_step init_design
set rc [catch {
  create_msg_db init_design.pb
  set_param xicom.use_bs_reader 1
  set_param simulator.modelsimInstallPath C:/modeltech_pe_10.4c/win32pe
  set_property design_mode GateLvl [current_fileset]
  set_param project.singleFileAddWarning.threshold 0
  set_property webtalk.parent_dir D:/Program/vivado/SteinsGate0_GIT/CentralGate/CentralGate.cache/wt [current_project]
  set_property parent.project_path D:/Program/vivado/SteinsGate0_GIT/CentralGate/CentralGate.xpr [current_project]
  set_property ip_repo_paths d:/Program/vivado/SteinsGate0_GIT/CentralGate/CentralGate.cache/ip [current_project]
  set_property ip_output_repo d:/Program/vivado/SteinsGate0_GIT/CentralGate/CentralGate.cache/ip [current_project]
  set_property XPM_LIBRARIES XPM_MEMORY [current_project]
  add_files -quiet D:/Program/vivado/SteinsGate0_GIT/CentralGate/CentralGate.runs/synth_1/Gate_test.dcp
  add_files -quiet d:/Program/vivado/SteinsGate0_GIT/CentralGate/CentralGate.srcs/sources_1/ip/chara1_rom/chara1_rom.dcp
  set_property netlist_only true [get_files d:/Program/vivado/SteinsGate0_GIT/CentralGate/CentralGate.srcs/sources_1/ip/chara1_rom/chara1_rom.dcp]
  add_files -quiet d:/Program/vivado/SteinsGate0_GIT/CentralGate/CentralGate.srcs/sources_1/ip/chara2_rom/chara2_rom.dcp
  set_property netlist_only true [get_files d:/Program/vivado/SteinsGate0_GIT/CentralGate/CentralGate.srcs/sources_1/ip/chara2_rom/chara2_rom.dcp]
  add_files -quiet d:/Program/vivado/SteinsGate0_GIT/CentralGate/CentralGate.srcs/sources_1/ip/road1_rom/road1_rom.dcp
  set_property netlist_only true [get_files d:/Program/vivado/SteinsGate0_GIT/CentralGate/CentralGate.srcs/sources_1/ip/road1_rom/road1_rom.dcp]
  add_files -quiet d:/Program/vivado/SteinsGate0_GIT/CentralGate/CentralGate.srcs/sources_1/ip/satellite1_rom/satellite1_rom.dcp
  set_property netlist_only true [get_files d:/Program/vivado/SteinsGate0_GIT/CentralGate/CentralGate.srcs/sources_1/ip/satellite1_rom/satellite1_rom.dcp]
  add_files -quiet d:/Program/vivado/SteinsGate0_GIT/CentralGate/CentralGate.srcs/sources_1/ip/chris2_rom/chris2_rom.dcp
  set_property netlist_only true [get_files d:/Program/vivado/SteinsGate0_GIT/CentralGate/CentralGate.srcs/sources_1/ip/chris2_rom/chris2_rom.dcp]
  add_files -quiet d:/Program/vivado/SteinsGate0_GIT/CentralGate/CentralGate.srcs/sources_1/ip/chris1_rom/chris1_rom.dcp
  set_property netlist_only true [get_files d:/Program/vivado/SteinsGate0_GIT/CentralGate/CentralGate.srcs/sources_1/ip/chris1_rom/chris1_rom.dcp]
  add_files -quiet d:/Program/vivado/SteinsGate0_GIT/CentralGate/CentralGate.srcs/sources_1/ip/building1_rom/building1_rom.dcp
  set_property netlist_only true [get_files d:/Program/vivado/SteinsGate0_GIT/CentralGate/CentralGate.srcs/sources_1/ip/building1_rom/building1_rom.dcp]
  add_files -quiet d:/Program/vivado/SteinsGate0_GIT/CentralGate/CentralGate.srcs/sources_1/ip/building2_rom/building2_rom.dcp
  set_property netlist_only true [get_files d:/Program/vivado/SteinsGate0_GIT/CentralGate/CentralGate.srcs/sources_1/ip/building2_rom/building2_rom.dcp]
  read_xdc -mode out_of_context -ref chara1_rom -cells U0 d:/Program/vivado/SteinsGate0_GIT/CentralGate/CentralGate.srcs/sources_1/ip/chara1_rom/chara1_rom_ooc.xdc
  set_property processing_order EARLY [get_files d:/Program/vivado/SteinsGate0_GIT/CentralGate/CentralGate.srcs/sources_1/ip/chara1_rom/chara1_rom_ooc.xdc]
  read_xdc -mode out_of_context -ref chara2_rom -cells U0 d:/Program/vivado/SteinsGate0_GIT/CentralGate/CentralGate.srcs/sources_1/ip/chara2_rom/chara2_rom_ooc.xdc
  set_property processing_order EARLY [get_files d:/Program/vivado/SteinsGate0_GIT/CentralGate/CentralGate.srcs/sources_1/ip/chara2_rom/chara2_rom_ooc.xdc]
  read_xdc -mode out_of_context -ref road1_rom -cells U0 d:/Program/vivado/SteinsGate0_GIT/CentralGate/CentralGate.srcs/sources_1/ip/road1_rom/road1_rom_ooc.xdc
  set_property processing_order EARLY [get_files d:/Program/vivado/SteinsGate0_GIT/CentralGate/CentralGate.srcs/sources_1/ip/road1_rom/road1_rom_ooc.xdc]
  read_xdc -mode out_of_context -ref satellite1_rom -cells U0 d:/Program/vivado/SteinsGate0_GIT/CentralGate/CentralGate.srcs/sources_1/ip/satellite1_rom/satellite1_rom_ooc.xdc
  set_property processing_order EARLY [get_files d:/Program/vivado/SteinsGate0_GIT/CentralGate/CentralGate.srcs/sources_1/ip/satellite1_rom/satellite1_rom_ooc.xdc]
  read_xdc -mode out_of_context -ref chris2_rom -cells U0 d:/Program/vivado/SteinsGate0_GIT/CentralGate/CentralGate.srcs/sources_1/ip/chris2_rom/chris2_rom_ooc.xdc
  set_property processing_order EARLY [get_files d:/Program/vivado/SteinsGate0_GIT/CentralGate/CentralGate.srcs/sources_1/ip/chris2_rom/chris2_rom_ooc.xdc]
  read_xdc -mode out_of_context -ref chris1_rom -cells U0 d:/Program/vivado/SteinsGate0_GIT/CentralGate/CentralGate.srcs/sources_1/ip/chris1_rom/chris1_rom_ooc.xdc
  set_property processing_order EARLY [get_files d:/Program/vivado/SteinsGate0_GIT/CentralGate/CentralGate.srcs/sources_1/ip/chris1_rom/chris1_rom_ooc.xdc]
  read_xdc -mode out_of_context -ref building1_rom -cells U0 d:/Program/vivado/SteinsGate0_GIT/CentralGate/CentralGate.srcs/sources_1/ip/building1_rom/building1_rom_ooc.xdc
  set_property processing_order EARLY [get_files d:/Program/vivado/SteinsGate0_GIT/CentralGate/CentralGate.srcs/sources_1/ip/building1_rom/building1_rom_ooc.xdc]
  read_xdc -mode out_of_context -ref building2_rom -cells U0 d:/Program/vivado/SteinsGate0_GIT/CentralGate/CentralGate.srcs/sources_1/ip/building2_rom/building2_rom_ooc.xdc
  set_property processing_order EARLY [get_files d:/Program/vivado/SteinsGate0_GIT/CentralGate/CentralGate.srcs/sources_1/ip/building2_rom/building2_rom_ooc.xdc]
  read_xdc D:/Program/vivado/SteinsGate0_GIT/CentralGate/CentralGate.srcs/constraints/gate_test.xdc
  link_design -top Gate_test -part xc7a100tcsg324-1
  write_hwdef -file Gate_test.hwdef
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
}

start_step opt_design
set rc [catch {
  create_msg_db opt_design.pb
  opt_design 
  write_checkpoint -force Gate_test_opt.dcp
  report_drc -file Gate_test_drc_opted.rpt
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
}

start_step place_design
set rc [catch {
  create_msg_db place_design.pb
  implement_debug_core 
  place_design 
  write_checkpoint -force Gate_test_placed.dcp
  report_io -file Gate_test_io_placed.rpt
  report_utilization -file Gate_test_utilization_placed.rpt -pb Gate_test_utilization_placed.pb
  report_control_sets -verbose -file Gate_test_control_sets_placed.rpt
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
}

start_step route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force Gate_test_routed.dcp
  report_drc -file Gate_test_drc_routed.rpt -pb Gate_test_drc_routed.pb
  report_timing_summary -warn_on_violation -max_paths 10 -file Gate_test_timing_summary_routed.rpt -rpx Gate_test_timing_summary_routed.rpx
  report_power -file Gate_test_power_routed.rpt -pb Gate_test_power_summary_routed.pb -rpx Gate_test_power_routed.rpx
  report_route_status -file Gate_test_route_status.rpt -pb Gate_test_route_status.pb
  report_clock_utilization -file Gate_test_clock_utilization_routed.rpt
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
}

start_step write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  catch { write_mem_info -force Gate_test.mmi }
  write_bitstream -force Gate_test.bit 
  catch { write_sysdef -hwdef Gate_test.hwdef -bitfile Gate_test.bit -meminfo Gate_test.mmi -file Gate_test.sysdef }
  catch {write_debug_probes -quiet -force debug_nets}
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
}

