vlib work
vmap work work 

#compilation order is important!
vcom -work work ../../core_pack.vhd -vmake
vcom -work work ../../op_pack.vhd -vmake
vcom -work work ../../imem_altera.vhd -vmake
vcom -work work ../../jmpu.vhd -2008 -vmake
vcom -work work ../../alu.vhd -2008 -vmake
vcom -work work ../../regfile.vhd -2008 -vmake
vcom -work work ../../memu.vhd -2008 -vmake
vcom -work work ../../fetch.vhd -2008 -vmake
vcom -work work ../../decode.vhd -2008 -vmake
vcom -work work ../../mem.vhd -2008 -vmake
vcom -work work ../../exec.vhd -2008 -vmake
vcom -work work ../../wb.vhd -2008 -vmake

vcom -work work ../../pipeline.vhd -2008 -vmake

