VCOM_ARGS=-2008 -work work -suppress 1236 -novopt
VSIM_ARGS=-msgmode both

VHDL_FILES = \
	../math/math_pkg.vhd\
	../serial_port/serial_port.vho\
	../serial_port/serial_port_pkg.vhd\
	../top/src/pll.vhd\
	../top/src/pll_pkg.vhd\
	../snes_cntrl/src/snes_cntrl_pkg.vhd\
	../uart_snes_bridge/src/uart_snes_bridge.vhd\
	../uart_snes_bridge/src/uart_snes_bridge_pkg.vhd\
	../synchronizer/src/sync.vhd\
	../synchronizer/src/sync_pkg.vhd\
	../snes_cntrl/src/fake_snes_cntrl.vhd\
	../ram/src/dp_ram_1c1r1w.vhd\
	../ram/src/ram_pkg.vhd\
	../pong/src/pong_ball.vhd\
	../pong/src/pong_ball_pkg.vhd\
	../graphics_controller/src/graphics_controller_pkg.vhd\
	../audio_cntrl/src/audio_cntrl_pkg.vhd\
	../audio_cntrl/src/i2c_master.vhd\
	../graphics_controller/src/wb_arbiter/wb_arbiter.vhd\
	../graphics_controller/src/wb_arbiter/wb_arbiter_pkg.vhd\
	../graphics_controller/src/sram/sram_controller_wb.vhd\
	../graphics_controller/src/sram/sram_pkg.vhd\
	../graphics_controller/src/rasterizer/rasterizer_pkg.vhd\
	../graphics_controller/src/framereader/framereader_pkg.vhd\
	../graphics_controller/src/framereader/ltm_cntrl.vhd\
	../snes_cntrl/src/snes_cntrl.vhd\
	../graphics_controller/src/graphics_controller.vhd\
	../graphics_controller/src/rasterizer/rasterizer_fsm.vhd\
	../graphics_controller/src/rasterizer/fb_writer.vhd\
	../graphics_controller/src/rasterizer/rasterizer.vhd\
	../graphics_controller/src/framereader/framereader.vhd\
	../ram/src/fifo_1c1r1w.vhd\
	../pong/src/pong_pkg.vhd\
	../pong_ssd/src/pong_ssd_pkg.vhd\
	../pong/src/pong.vhd\
	../top/src/top.vhd\
	../pong_ssd/src/pong_ssd.vhd\
	../top/src/top_pkg.vhd\
	../top/tb/top_tb.vhd\		
TB_FILES = \
	../top/tb/top_tb.vhd
TIME_RESOLUTION = 1ps
TB = top_tb
SIM_TIME = 5 us
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
	vsim -do "vsim $(TB) -t $(TIME_RESOLUTION) $(VSIM_ARGS); do $(WAVE); run $(SIM_TIME)" 
clean:
	rm -f transcript
	rm -f vsim.wlf
	rm -f log
	rm -fr work
