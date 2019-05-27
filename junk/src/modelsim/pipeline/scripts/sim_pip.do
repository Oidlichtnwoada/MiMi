#first compile testbench ad utility package
vcom -work work tb/pipeline_tb.vhd -2008

#start simulation
vsim -t ps work.pipeline_tb