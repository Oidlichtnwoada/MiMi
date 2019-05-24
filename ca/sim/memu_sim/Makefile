VCOM_ARGS=-2008 -work work -suppress 1236 -novopt
VSIM_ARGS=-msgmode both
VHDL_FILES = \
	../../src/core_pack.vhd\
	../../src/tb_pkg.vhd\
	../../src/memu.vhd\
	../../src/memu_pkg.vhd\
	../../src/op_pack.vhd
TB_FILES = \
	../../src/memu_tb.vhd
TIME_RESOLUTION = 1ps
TB = memu_tb
SIM_TIME = 1 sec
WAVE = ./wave.do
compile: 
	rm -f log
	vlib work | tee log
	for i in $(VHDL_FILES); do \
		vcom $(VCOM_ARGS) $$i | tee -a log;\
	done;
	for i in $(TB_FILES); do \
		vcom $(VCOM_ARGS) $$i | tee -a log;\
	done;
	@echo "--------------------------------------------------------------"
	@echo "--              Error and Warning Summary                   --"
	@echo "--------------------------------------------------------------"
	@cat log | grep 'Warning\|Error'
list_sources:
	@for i in $(VHDL_FILES); do \
		echo $$i;\
	done;
sim:
	vsim -do "vsim $(TB) -t $(TIME_RESOLUTION) $(VSIM_ARGS); run $(SIM_TIME); do $(WAVE)" 
clean:
	rm -f transcript
	rm -f vsim.wlf
	rm -f log
	rm -fr work
