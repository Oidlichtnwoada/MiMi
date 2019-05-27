vlib work
vmap work work 

#compilation order is important!
vcom -work work ../src/core_pack.vhd
vcom -work work ../src/op_pack.vhd

vcom -work work ../src/alu.vhd

