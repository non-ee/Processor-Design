set search_path [concat "/usr/local/lib/hit18-lib/kyoto_lib/synopsys/" $search_path]
set LIB_MAX_FILE {HIT018.db}
set link_library $LIB_MAX_FILE
set target_library $LIB_MAX_FILE

##read_verilog module
analyze -format verilog top/top.v
elaborate top

current_design "top"
#read_verilog topmodule
##current_design "TOP_MODULE_NAME"
set_max_area 0
set_max_fanout 64 [current_design]

create_clock -period 4.00 clk
set_clock_uncertainty -setup 0.0 [get_clock clk]
set_clock_uncertainty -hold 0.0 [get_clock clk]
set_input_delay  0.0 -clock clk [remove_from_collection [all_inputs] clk]
set_output_delay 0.0 -clock clk [remove_from_collection [all_outputs] clk]

ungroup -all -flatten
compile
compile -map_effort high -area_effort high -incremental_mapping

# report_timing -path end -max_path 1
report_timing -max_path 1
report_area
report_power

write -hier -format verilog -output HOGEHOGE_PROC.vnet
write -hier -output HOGEHOGE_PROC.db

quit
