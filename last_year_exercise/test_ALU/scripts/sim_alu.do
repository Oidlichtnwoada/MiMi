#first compile testbench ad utility package
vcom -work work tb/alu_tb_fileio.vhd

#start simulation
vsim -t ps work.alu_tb_fileio


