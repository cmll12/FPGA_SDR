# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param chipscope.maxJobs 1
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir /afs/athena.mit.edu/user/c/m/cmll/six_111/project/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.cache/wt [current_project]
set_property parent.project_path /afs/athena.mit.edu/user/c/m/cmll/six_111/project/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_FIFO XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo /afs/athena.mit.edu/user/c/m/cmll/six_111/project/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
add_files /afs/athena.mit.edu/user/c/m/cmll/six_111/sine_wave_12_bit.coe
read_verilog -library xil_defaultlib -sv {
  /afs/athena.mit.edu/user/c/m/cmll/six_111/project/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.srcs/sources_1/new/ADC_Interface.sv
  /afs/athena.mit.edu/user/c/m/cmll/six_111/project/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.srcs/sources_1/new/AM_BP_Filter.sv
  /afs/athena.mit.edu/user/c/m/cmll/six_111/project/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.srcs/sources_1/new/AM_audio_condition.sv
  /afs/athena.mit.edu/user/c/m/cmll/six_111/project/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.srcs/sources_1/new/DAC_stuff.sv
  /afs/athena.mit.edu/user/c/m/cmll/six_111/project/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.srcs/sources_1/new/FM_demod_stage_1.sv
  /afs/athena.mit.edu/user/c/m/cmll/six_111/project/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.srcs/sources_1/new/Local_Oscillator.sv
  /afs/athena.mit.edu/user/c/m/cmll/six_111/project/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.srcs/sources_1/new/Mixer.sv
  /afs/athena.mit.edu/user/c/m/cmll/six_111/project/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.srcs/sources_1/new/Peak_detect_hold.sv
  /afs/athena.mit.edu/user/c/m/cmll/six_111/project/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.srcs/sources_1/new/control_center_frequency.sv
  /afs/athena.mit.edu/user/c/m/cmll/six_111/project/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.srcs/sources_1/imports/imports/Modules/My_Modules/control_height.sv
  /afs/athena.mit.edu/user/c/m/cmll/six_111/project/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.srcs/sources_1/imports/imports/My_Modules/control_period.sv
  /afs/athena.mit.edu/user/c/m/cmll/six_111/project/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.srcs/sources_1/imports/imports/Modules/My_Modules/control_trigger_height.sv
  /afs/athena.mit.edu/user/c/m/cmll/six_111/project/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.srcs/sources_1/new/control_volume.sv
  /afs/athena.mit.edu/user/c/m/cmll/six_111/project/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.srcs/sources_1/imports/imports/Modules/Given_Modules/debounce.sv
  /afs/athena.mit.edu/user/c/m/cmll/six_111/project/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.srcs/sources_1/imports/imports/My_Modules/function_pixel_logic.sv
  /afs/athena.mit.edu/user/c/m/cmll/six_111/project/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.srcs/sources_1/imports/Modules/histogram.sv
  /afs/athena.mit.edu/user/c/m/cmll/six_111/project/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.srcs/sources_1/imports/Given_Modules/level_to_pulse.sv
  /afs/athena.mit.edu/user/c/m/cmll/six_111/project/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.srcs/sources_1/imports/Given_Modules/synchronize.sv
  /afs/athena.mit.edu/user/c/m/cmll/six_111/project/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.srcs/sources_1/imports/imports/Modules/My_Modules/trigger_buffer.sv
  /afs/athena.mit.edu/user/c/m/cmll/six_111/project/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.srcs/sources_1/imports/imports/Modules/Given_Modules/xvga.sv
  /afs/athena.mit.edu/user/c/m/cmll/six_111/project/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.srcs/sources_1/new/top_level.sv
}
read_verilog -library xil_defaultlib {
  /afs/athena.mit.edu/user/c/m/cmll/six_111/project/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.srcs/sources_1/imports/hdl/bram_to_fft.v
  /afs/athena.mit.edu/user/c/m/cmll/six_111/project/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.srcs/sources_1/imports/hdl/oversampler.v
}
add_files /afs/athena.mit.edu/user/c/m/cmll/six_111/project/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.srcs/sources_1/bd/fft_mag/fft_mag.bd
set_property used_in_implementation false [get_files -all /afs/athena.mit.edu/user/c/m/cmll/six_111/project/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.srcs/sources_1/bd/fft_mag/ip/fft_mag_axis_register_slice_2_0/fft_mag_axis_register_slice_2_0_clocks.xdc]
set_property used_in_implementation false [get_files -all /afs/athena.mit.edu/user/c/m/cmll/six_111/project/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.srcs/sources_1/bd/fft_mag/ip/fft_mag_axis_register_slice_2_0/fft_mag_axis_register_slice_2_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /afs/athena.mit.edu/user/c/m/cmll/six_111/project/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.srcs/sources_1/bd/fft_mag/ip/fft_mag_cordic_0_0/fft_mag_cordic_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /afs/athena.mit.edu/user/c/m/cmll/six_111/project/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.srcs/sources_1/bd/fft_mag/ip/fft_mag_mult_gen_0_0/fft_mag_mult_gen_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /afs/athena.mit.edu/user/c/m/cmll/six_111/project/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.srcs/sources_1/bd/fft_mag/ip/fft_mag_mult_gen_1_0/fft_mag_mult_gen_1_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /afs/athena.mit.edu/user/c/m/cmll/six_111/project/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.srcs/sources_1/bd/fft_mag/ip/fft_mag_xfft_0_0/fft_mag_xfft_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /afs/athena.mit.edu/user/c/m/cmll/six_111/project/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.srcs/sources_1/bd/fft_mag/fft_mag_ooc.xdc]

read_ip -quiet /afs/athena.mit.edu/user/c/m/cmll/six_111/project/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.srcs/sources_1/ip/sine_wave/sine_wave.xci
set_property used_in_implementation false [get_files -all /afs/athena.mit.edu/user/c/m/cmll/six_111/project/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.srcs/sources_1/ip/sine_wave/sine_wave_ooc.xdc]

read_ip -quiet /afs/athena.mit.edu/user/c/m/cmll/six_111/project/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xci
set_property used_in_implementation false [get_files -all /afs/athena.mit.edu/user/c/m/cmll/six_111/project/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_board.xdc]
set_property used_in_implementation false [get_files -all /afs/athena.mit.edu/user/c/m/cmll/six_111/project/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc]
set_property used_in_implementation false [get_files -all /afs/athena.mit.edu/user/c/m/cmll/six_111/project/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_ooc.xdc]

read_ip -quiet /afs/athena.mit.edu/user/c/m/cmll/six_111/project/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.srcs/sources_1/ip/frame_bram/frame_bram.xci
set_property used_in_implementation false [get_files -all /afs/athena.mit.edu/user/c/m/cmll/six_111/project/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.srcs/sources_1/ip/frame_bram/frame_bram_ooc.xdc]

read_ip -quiet /afs/athena.mit.edu/user/c/m/cmll/six_111/project/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.srcs/sources_1/ip/fft_bram/fft_bram.xci
set_property used_in_implementation false [get_files -all /afs/athena.mit.edu/user/c/m/cmll/six_111/project/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.srcs/sources_1/ip/fft_bram/fft_bram_ooc.xdc]

read_ip -quiet /afs/athena.mit.edu/user/c/m/cmll/six_111/project/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.srcs/sources_1/ip/histogram_bram/histogram_bram.xci
set_property used_in_implementation false [get_files -all /afs/athena.mit.edu/user/c/m/cmll/six_111/project/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.srcs/sources_1/ip/histogram_bram/histogram_bram_ooc.xdc]

read_ip -quiet /afs/athena.mit.edu/user/c/m/cmll/six_111/project/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.srcs/sources_1/ip/fm_stage_1_ila/fm_stage_1_ila.xci
set_property used_in_synthesis false [get_files -all /afs/athena.mit.edu/user/c/m/cmll/six_111/project/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.srcs/sources_1/ip/fm_stage_1_ila/ila_v6_2/constraints/ila_impl.xdc]
set_property used_in_implementation false [get_files -all /afs/athena.mit.edu/user/c/m/cmll/six_111/project/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.srcs/sources_1/ip/fm_stage_1_ila/ila_v6_2/constraints/ila_impl.xdc]
set_property used_in_implementation false [get_files -all /afs/athena.mit.edu/user/c/m/cmll/six_111/project/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.srcs/sources_1/ip/fm_stage_1_ila/ila_v6_2/constraints/ila.xdc]
set_property used_in_implementation false [get_files -all /afs/athena.mit.edu/user/c/m/cmll/six_111/project/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.srcs/sources_1/ip/fm_stage_1_ila/fm_stage_1_ila_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc /afs/athena.mit.edu/user/c/m/cmll/six_111/project/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.srcs/constrs_1/imports/6_111/nexys4_ddr_default.xdc
set_property used_in_implementation false [get_files /afs/athena.mit.edu/user/c/m/cmll/six_111/project/FPGA_SDR/FPGA_SDR_project/FPGA_SDR_project.srcs/constrs_1/imports/6_111/nexys4_ddr_default.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top top_level -part xc7a100tcsg324-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef top_level.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file top_level_utilization_synth.rpt -pb top_level_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
