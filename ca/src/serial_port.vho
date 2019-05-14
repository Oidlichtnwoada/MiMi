-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 18.1.0 Build 625 09/12/2018 SJ Standard Edition"

-- DATE "02/11/2019 15:29:08"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_F4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_E2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_P3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_N7,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	serial_port IS
    PORT (
	clk : IN std_logic;
	res_n : IN std_logic;
	rx : IN std_logic;
	tx : OUT std_logic;
	tx_data : IN std_logic_vector(7 DOWNTO 0);
	tx_wr : IN std_logic;
	tx_free : OUT std_logic;
	rx_rd : IN std_logic;
	rx_data : OUT std_logic_vector(7 DOWNTO 0);
	rx_empty : OUT std_logic;
	rx_full : OUT std_logic
	);
END serial_port;

-- Design Ports Information
-- tx	=>  Location: PIN_G9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tx_free	=>  Location: PIN_A12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_data[0]	=>  Location: PIN_E14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_data[1]	=>  Location: PIN_J14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_data[2]	=>  Location: PIN_J12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_data[3]	=>  Location: PIN_D12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_data[4]	=>  Location: PIN_F14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_data[5]	=>  Location: PIN_H14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_data[6]	=>  Location: PIN_B11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_data[7]	=>  Location: PIN_J13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_empty	=>  Location: PIN_C15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_full	=>  Location: PIN_A11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_Y2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- res_n	=>  Location: PIN_Y1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tx_wr	=>  Location: PIN_G14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_rd	=>  Location: PIN_F15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tx_data[0]	=>  Location: PIN_C13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tx_data[1]	=>  Location: PIN_C14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tx_data[2]	=>  Location: PIN_B17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tx_data[3]	=>  Location: PIN_E15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx	=>  Location: PIN_G12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tx_data[4]	=>  Location: PIN_D15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tx_data[5]	=>  Location: PIN_D14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tx_data[6]	=>  Location: PIN_D13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tx_data[7]	=>  Location: PIN_C12,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF serial_port IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_res_n : std_logic;
SIGNAL ww_rx : std_logic;
SIGNAL ww_tx : std_logic;
SIGNAL ww_tx_data : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_tx_wr : std_logic;
SIGNAL ww_tx_free : std_logic;
SIGNAL ww_rx_rd : std_logic;
SIGNAL ww_rx_data : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_rx_empty : std_logic;
SIGNAL ww_rx_full : std_logic;
SIGNAL \receiver_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\ : std_logic_vector(35 DOWNTO 0);
SIGNAL \receiver_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \receiver_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \receiver_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\ : std_logic_vector(35 DOWNTO 0);
SIGNAL \transmitter_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\ : std_logic_vector(35 DOWNTO 0);
SIGNAL \transmitter_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \transmitter_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \transmitter_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\ : std_logic_vector(35 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \res_n~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \tx~output_o\ : std_logic;
SIGNAL \tx_free~output_o\ : std_logic;
SIGNAL \rx_data[0]~output_o\ : std_logic;
SIGNAL \rx_data[1]~output_o\ : std_logic;
SIGNAL \rx_data[2]~output_o\ : std_logic;
SIGNAL \rx_data[3]~output_o\ : std_logic;
SIGNAL \rx_data[4]~output_o\ : std_logic;
SIGNAL \rx_data[5]~output_o\ : std_logic;
SIGNAL \rx_data[6]~output_o\ : std_logic;
SIGNAL \rx_data[7]~output_o\ : std_logic;
SIGNAL \rx_empty~output_o\ : std_logic;
SIGNAL \rx_full~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \transmitter_inst|clk_cnt[0]~13_combout\ : std_logic;
SIGNAL \res_n~input_o\ : std_logic;
SIGNAL \res_n~inputclkctrl_outclk\ : std_logic;
SIGNAL \transmitter_inst|Selector7~0_combout\ : std_logic;
SIGNAL \transmitter_inst|transmitter_state.TRANSMIT_STOP~q\ : std_logic;
SIGNAL \tx_wr~input_o\ : std_logic;
SIGNAL \transmitter_fifo|read_address[0]~0_combout\ : std_logic;
SIGNAL \transmitter_fifo|rd_int~combout\ : std_logic;
SIGNAL \transmitter_fifo|Add0~1_combout\ : std_logic;
SIGNAL \transmitter_fifo|Add0~0_combout\ : std_logic;
SIGNAL \transmitter_fifo|Equal0~0_combout\ : std_logic;
SIGNAL \transmitter_fifo|Add0~2_combout\ : std_logic;
SIGNAL \transmitter_fifo|write_address[0]~0_combout\ : std_logic;
SIGNAL \transmitter_fifo|Add1~0_combout\ : std_logic;
SIGNAL \transmitter_fifo|full_next~0_combout\ : std_logic;
SIGNAL \transmitter_fifo|full_next~1_combout\ : std_logic;
SIGNAL \transmitter_fifo|full_next~2_combout\ : std_logic;
SIGNAL \transmitter_fifo|full_next~3_combout\ : std_logic;
SIGNAL \transmitter_fifo|full_int~q\ : std_logic;
SIGNAL \transmitter_fifo|wr_int~combout\ : std_logic;
SIGNAL \transmitter_fifo|Add1~2_combout\ : std_logic;
SIGNAL \transmitter_fifo|Add1~1_combout\ : std_logic;
SIGNAL \transmitter_fifo|Equal0~1_combout\ : std_logic;
SIGNAL \transmitter_fifo|empty_next~0_combout\ : std_logic;
SIGNAL \transmitter_fifo|empty_next~1_combout\ : std_logic;
SIGNAL \transmitter_fifo|empty_next~2_combout\ : std_logic;
SIGNAL \transmitter_fifo|empty_int~q\ : std_logic;
SIGNAL \transmitter_inst|Selector1~0_combout\ : std_logic;
SIGNAL \transmitter_inst|transmitter_state.NEW_DATA~q\ : std_logic;
SIGNAL \transmitter_inst|Selector2~0_combout\ : std_logic;
SIGNAL \transmitter_inst|transmitter_state.SEND_START_BIT~q\ : std_logic;
SIGNAL \transmitter_inst|Selector3~0_combout\ : std_logic;
SIGNAL \transmitter_inst|transmitter_state.TRANSMIT_FIRST~q\ : std_logic;
SIGNAL \transmitter_inst|Selector4~0_combout\ : std_logic;
SIGNAL \transmitter_inst|transmitter_state.TRANSMIT~q\ : std_logic;
SIGNAL \transmitter_inst|Selector31~0_combout\ : std_logic;
SIGNAL \transmitter_inst|Selector30~0_combout\ : std_logic;
SIGNAL \transmitter_inst|LessThan0~0_combout\ : std_logic;
SIGNAL \transmitter_inst|Selector5~0_combout\ : std_logic;
SIGNAL \transmitter_inst|Selector5~1_combout\ : std_logic;
SIGNAL \transmitter_inst|transmitter_state.TRANSMIT_NEXT~q\ : std_logic;
SIGNAL \transmitter_inst|Selector29~0_combout\ : std_logic;
SIGNAL \transmitter_inst|Selector6~0_combout\ : std_logic;
SIGNAL \transmitter_inst|transmitter_state.TRANSMIT_STOP_NEXT~q\ : std_logic;
SIGNAL \transmitter_inst|WideOr0~0_combout\ : std_logic;
SIGNAL \transmitter_inst|clk_cnt[0]~14\ : std_logic;
SIGNAL \transmitter_inst|clk_cnt[1]~15_combout\ : std_logic;
SIGNAL \transmitter_inst|clk_cnt[1]~16\ : std_logic;
SIGNAL \transmitter_inst|clk_cnt[2]~17_combout\ : std_logic;
SIGNAL \transmitter_inst|clk_cnt[2]~18\ : std_logic;
SIGNAL \transmitter_inst|clk_cnt[3]~19_combout\ : std_logic;
SIGNAL \transmitter_inst|clk_cnt[3]~20\ : std_logic;
SIGNAL \transmitter_inst|clk_cnt[4]~21_combout\ : std_logic;
SIGNAL \transmitter_inst|clk_cnt[4]~22\ : std_logic;
SIGNAL \transmitter_inst|clk_cnt[5]~23_combout\ : std_logic;
SIGNAL \transmitter_inst|clk_cnt[5]~24\ : std_logic;
SIGNAL \transmitter_inst|clk_cnt[6]~25_combout\ : std_logic;
SIGNAL \transmitter_inst|clk_cnt[6]~26\ : std_logic;
SIGNAL \transmitter_inst|clk_cnt[7]~27_combout\ : std_logic;
SIGNAL \transmitter_inst|Equal0~1_combout\ : std_logic;
SIGNAL \transmitter_inst|Equal0~0_combout\ : std_logic;
SIGNAL \transmitter_inst|clk_cnt[7]~28\ : std_logic;
SIGNAL \transmitter_inst|clk_cnt[8]~29_combout\ : std_logic;
SIGNAL \transmitter_inst|clk_cnt[8]~30\ : std_logic;
SIGNAL \transmitter_inst|clk_cnt[9]~31_combout\ : std_logic;
SIGNAL \transmitter_inst|clk_cnt[9]~32\ : std_logic;
SIGNAL \transmitter_inst|clk_cnt[10]~33_combout\ : std_logic;
SIGNAL \transmitter_inst|clk_cnt[10]~34\ : std_logic;
SIGNAL \transmitter_inst|clk_cnt[11]~35_combout\ : std_logic;
SIGNAL \transmitter_inst|clk_cnt[11]~36\ : std_logic;
SIGNAL \transmitter_inst|clk_cnt[12]~37_combout\ : std_logic;
SIGNAL \transmitter_inst|Equal0~2_combout\ : std_logic;
SIGNAL \transmitter_inst|Equal0~3_combout\ : std_logic;
SIGNAL \transmitter_inst|Selector0~0_combout\ : std_logic;
SIGNAL \transmitter_inst|transmitter_state.IDLE~q\ : std_logic;
SIGNAL \transmitter_fifo|memory_inst|ram_rtl_0_bypass[12]~feeder_combout\ : std_logic;
SIGNAL \transmitter_fifo|memory_inst|ram_rtl_0_bypass[7]~feeder_combout\ : std_logic;
SIGNAL \transmitter_fifo|memory_inst|ram~24_combout\ : std_logic;
SIGNAL \transmitter_fifo|memory_inst|ram_rtl_0_bypass[2]~0_combout\ : std_logic;
SIGNAL \transmitter_fifo|memory_inst|ram_rtl_0_bypass[1]~feeder_combout\ : std_logic;
SIGNAL \transmitter_fifo|memory_inst|ram~23_combout\ : std_logic;
SIGNAL \transmitter_fifo|memory_inst|ram~25_combout\ : std_logic;
SIGNAL \transmitter_fifo|memory_inst|ram~13feeder_combout\ : std_logic;
SIGNAL \transmitter_fifo|memory_inst|ram~13_q\ : std_logic;
SIGNAL \tx_data[1]~input_o\ : std_logic;
SIGNAL \transmitter_fifo|memory_inst|ram~29_combout\ : std_logic;
SIGNAL \transmitter_fifo|memory_inst|ram~30_combout\ : std_logic;
SIGNAL \transmitter_fifo|memory_inst|ram~15_q\ : std_logic;
SIGNAL \tx_data[0]~input_o\ : std_logic;
SIGNAL \transmitter_fifo|read_address[0]~_wirecell_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \tx_data[2]~input_o\ : std_logic;
SIGNAL \tx_data[3]~input_o\ : std_logic;
SIGNAL \tx_data[4]~input_o\ : std_logic;
SIGNAL \tx_data[5]~input_o\ : std_logic;
SIGNAL \tx_data[6]~input_o\ : std_logic;
SIGNAL \tx_data[7]~input_o\ : std_logic;
SIGNAL \transmitter_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a1\ : std_logic;
SIGNAL \transmitter_fifo|memory_inst|ram~27_combout\ : std_logic;
SIGNAL \transmitter_fifo|memory_inst|ram_rtl_0_bypass[11]~feeder_combout\ : std_logic;
SIGNAL \transmitter_fifo|memory_inst|ram~28_combout\ : std_logic;
SIGNAL \transmitter_fifo|memory_inst|ram_rtl_0_bypass[14]~feeder_combout\ : std_logic;
SIGNAL \transmitter_fifo|memory_inst|ram~16_q\ : std_logic;
SIGNAL \transmitter_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a2\ : std_logic;
SIGNAL \transmitter_fifo|memory_inst|ram~31_combout\ : std_logic;
SIGNAL \transmitter_fifo|memory_inst|ram~32_combout\ : std_logic;
SIGNAL \transmitter_fifo|memory_inst|ram_rtl_0_bypass[18]~feeder_combout\ : std_logic;
SIGNAL \transmitter_fifo|memory_inst|ram~18_q\ : std_logic;
SIGNAL \transmitter_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a4\ : std_logic;
SIGNAL \transmitter_fifo|memory_inst|ram~35_combout\ : std_logic;
SIGNAL \transmitter_fifo|memory_inst|ram~36_combout\ : std_logic;
SIGNAL \transmitter_fifo|memory_inst|ram_rtl_0_bypass[19]~feeder_combout\ : std_logic;
SIGNAL \transmitter_fifo|memory_inst|ram~19_q\ : std_logic;
SIGNAL \transmitter_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a5\ : std_logic;
SIGNAL \transmitter_fifo|memory_inst|ram~37_combout\ : std_logic;
SIGNAL \transmitter_fifo|memory_inst|ram_rtl_0_bypass[20]~feeder_combout\ : std_logic;
SIGNAL \transmitter_fifo|memory_inst|ram~38_combout\ : std_logic;
SIGNAL \transmitter_fifo|memory_inst|ram~21_q\ : std_logic;
SIGNAL \transmitter_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a7\ : std_logic;
SIGNAL \transmitter_fifo|memory_inst|ram~41_combout\ : std_logic;
SIGNAL \transmitter_fifo|memory_inst|ram_rtl_0_bypass[24]~feeder_combout\ : std_logic;
SIGNAL \transmitter_fifo|memory_inst|ram_rtl_0_bypass[23]~feeder_combout\ : std_logic;
SIGNAL \transmitter_fifo|memory_inst|ram~42_combout\ : std_logic;
SIGNAL \transmitter_inst|transmit_data[7]~1_combout\ : std_logic;
SIGNAL \transmitter_fifo|memory_inst|ram_rtl_0_bypass[22]~feeder_combout\ : std_logic;
SIGNAL \transmitter_fifo|memory_inst|ram_rtl_0_bypass[21]~feeder_combout\ : std_logic;
SIGNAL \transmitter_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a6\ : std_logic;
SIGNAL \transmitter_fifo|memory_inst|ram~20_q\ : std_logic;
SIGNAL \transmitter_fifo|memory_inst|ram~39_combout\ : std_logic;
SIGNAL \transmitter_fifo|memory_inst|ram~40_combout\ : std_logic;
SIGNAL \transmitter_inst|Selector22~0_combout\ : std_logic;
SIGNAL \transmitter_inst|transmit_data[0]~0_combout\ : std_logic;
SIGNAL \transmitter_inst|Selector23~0_combout\ : std_logic;
SIGNAL \transmitter_inst|Selector24~0_combout\ : std_logic;
SIGNAL \transmitter_fifo|memory_inst|ram_rtl_0_bypass[16]~feeder_combout\ : std_logic;
SIGNAL \transmitter_fifo|memory_inst|ram_rtl_0_bypass[15]~feeder_combout\ : std_logic;
SIGNAL \transmitter_fifo|memory_inst|ram~17_q\ : std_logic;
SIGNAL \transmitter_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a3\ : std_logic;
SIGNAL \transmitter_fifo|memory_inst|ram~33_combout\ : std_logic;
SIGNAL \transmitter_fifo|memory_inst|ram~34_combout\ : std_logic;
SIGNAL \transmitter_inst|Selector25~0_combout\ : std_logic;
SIGNAL \transmitter_inst|Selector26~0_combout\ : std_logic;
SIGNAL \transmitter_inst|Selector27~0_combout\ : std_logic;
SIGNAL \transmitter_fifo|memory_inst|ram_rtl_0_bypass[10]~feeder_combout\ : std_logic;
SIGNAL \transmitter_fifo|memory_inst|ram~14_q\ : std_logic;
SIGNAL \transmitter_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a0~portbdataout\ : std_logic;
SIGNAL \transmitter_fifo|memory_inst|ram~22_combout\ : std_logic;
SIGNAL \transmitter_fifo|memory_inst|ram~26_combout\ : std_logic;
SIGNAL \transmitter_inst|Selector28~0_combout\ : std_logic;
SIGNAL \transmitter_inst|Selector21~0_combout\ : std_logic;
SIGNAL \transmitter_inst|Selector21~1_combout\ : std_logic;
SIGNAL \rx~input_o\ : std_logic;
SIGNAL \rx_sync_inst|sync[1]~0_combout\ : std_logic;
SIGNAL \receiver_inst|data_int[7]~1_combout\ : std_logic;
SIGNAL \receiver_inst|clk_cnt[0]~13_combout\ : std_logic;
SIGNAL \receiver_inst|clk_cnt[0]~14\ : std_logic;
SIGNAL \receiver_inst|clk_cnt[1]~15_combout\ : std_logic;
SIGNAL \receiver_inst|Selector3~2_combout\ : std_logic;
SIGNAL \receiver_inst|Selector1~0_combout\ : std_logic;
SIGNAL \receiver_inst|Selector1~1_combout\ : std_logic;
SIGNAL \receiver_inst|receiver_state.WAIT_START_BIT~q\ : std_logic;
SIGNAL \receiver_inst|Selector8~0_combout\ : std_logic;
SIGNAL \receiver_inst|Selector9~0_combout\ : std_logic;
SIGNAL \receiver_inst|Selector9~1_combout\ : std_logic;
SIGNAL \receiver_inst|Selector10~0_combout\ : std_logic;
SIGNAL \receiver_inst|Selector10~1_combout\ : std_logic;
SIGNAL \receiver_inst|Selector6~0_combout\ : std_logic;
SIGNAL \receiver_inst|Selector6~1_combout\ : std_logic;
SIGNAL \receiver_inst|receiver_state.WAIT_STOP_BIT~q\ : std_logic;
SIGNAL \receiver_inst|Selector7~0_combout\ : std_logic;
SIGNAL \receiver_inst|receiver_state.MIDDLE_OF_STOP_BIT~q\ : std_logic;
SIGNAL \receiver_inst|Selector0~0_combout\ : std_logic;
SIGNAL \receiver_inst|receiver_state.IDLE~q\ : std_logic;
SIGNAL \receiver_inst|clk_cnt[12]~17_combout\ : std_logic;
SIGNAL \receiver_inst|clk_cnt[1]~16\ : std_logic;
SIGNAL \receiver_inst|clk_cnt[2]~18_combout\ : std_logic;
SIGNAL \receiver_inst|clk_cnt[2]~19\ : std_logic;
SIGNAL \receiver_inst|clk_cnt[3]~20_combout\ : std_logic;
SIGNAL \receiver_inst|clk_cnt[3]~21\ : std_logic;
SIGNAL \receiver_inst|clk_cnt[4]~22_combout\ : std_logic;
SIGNAL \receiver_inst|Selector2~4_combout\ : std_logic;
SIGNAL \receiver_inst|Selector2~5_combout\ : std_logic;
SIGNAL \receiver_inst|WideOr0~0_combout\ : std_logic;
SIGNAL \receiver_inst|Selector4~0_combout\ : std_logic;
SIGNAL \receiver_inst|Selector4~1_combout\ : std_logic;
SIGNAL \receiver_inst|receiver_state.WAIT_DATA_BIT~q\ : std_logic;
SIGNAL \receiver_inst|clk_cnt[4]~23\ : std_logic;
SIGNAL \receiver_inst|clk_cnt[5]~24_combout\ : std_logic;
SIGNAL \receiver_inst|clk_cnt[5]~25\ : std_logic;
SIGNAL \receiver_inst|clk_cnt[6]~26_combout\ : std_logic;
SIGNAL \receiver_inst|clk_cnt[6]~27\ : std_logic;
SIGNAL \receiver_inst|clk_cnt[7]~28_combout\ : std_logic;
SIGNAL \receiver_inst|clk_cnt[7]~29\ : std_logic;
SIGNAL \receiver_inst|clk_cnt[8]~30_combout\ : std_logic;
SIGNAL \receiver_inst|clk_cnt[8]~31\ : std_logic;
SIGNAL \receiver_inst|clk_cnt[9]~32_combout\ : std_logic;
SIGNAL \receiver_inst|clk_cnt[9]~33\ : std_logic;
SIGNAL \receiver_inst|clk_cnt[10]~34_combout\ : std_logic;
SIGNAL \receiver_inst|clk_cnt[10]~35\ : std_logic;
SIGNAL \receiver_inst|clk_cnt[11]~36_combout\ : std_logic;
SIGNAL \receiver_inst|clk_cnt[11]~37\ : std_logic;
SIGNAL \receiver_inst|clk_cnt[12]~38_combout\ : std_logic;
SIGNAL \receiver_inst|Selector2~6_combout\ : std_logic;
SIGNAL \receiver_inst|Equal1~2_combout\ : std_logic;
SIGNAL \receiver_inst|Equal1~1_combout\ : std_logic;
SIGNAL \receiver_inst|Selector2~7_combout\ : std_logic;
SIGNAL \receiver_inst|Selector2~8_combout\ : std_logic;
SIGNAL \receiver_inst|receiver_state.GOTO_MIDDLE_OF_START_BIT~q\ : std_logic;
SIGNAL \receiver_inst|Selector2~0_combout\ : std_logic;
SIGNAL \receiver_inst|Selector2~1_combout\ : std_logic;
SIGNAL \receiver_inst|Selector2~2_combout\ : std_logic;
SIGNAL \receiver_inst|Selector2~3_combout\ : std_logic;
SIGNAL \receiver_inst|Selector3~3_combout\ : std_logic;
SIGNAL \receiver_inst|receiver_state.MIDDLE_OF_START_BIT~q\ : std_logic;
SIGNAL \receiver_inst|WideOr2~combout\ : std_logic;
SIGNAL \receiver_inst|Equal1~0_combout\ : std_logic;
SIGNAL \receiver_inst|Equal1~3_combout\ : std_logic;
SIGNAL \receiver_inst|Selector5~0_combout\ : std_logic;
SIGNAL \receiver_inst|receiver_state.MIDDLE_OF_DATA_BIT~q\ : std_logic;
SIGNAL \receiver_inst|data_int[0]~0_combout\ : std_logic;
SIGNAL \receiver_inst|data_int[5]~feeder_combout\ : std_logic;
SIGNAL \receiver_inst|data_int[3]~feeder_combout\ : std_logic;
SIGNAL \receiver_inst|data_int[2]~feeder_combout\ : std_logic;
SIGNAL \receiver_inst|data_int[1]~feeder_combout\ : std_logic;
SIGNAL \receiver_inst|data_int[0]~feeder_combout\ : std_logic;
SIGNAL \receiver_inst|data_out[0]~0_combout\ : std_logic;
SIGNAL \receiver_fifo|memory_inst|ram_rtl_0_bypass[10]~feeder_combout\ : std_logic;
SIGNAL \receiver_inst|data_new~feeder_combout\ : std_logic;
SIGNAL \receiver_inst|data_new~q\ : std_logic;
SIGNAL \receiver_fifo|write_address[0]~0_combout\ : std_logic;
SIGNAL \receiver_fifo|Add1~2_combout\ : std_logic;
SIGNAL \receiver_fifo|Add1~0_combout\ : std_logic;
SIGNAL \receiver_fifo|Add1~1_combout\ : std_logic;
SIGNAL \receiver_fifo|read_address[0]~0_combout\ : std_logic;
SIGNAL \receiver_fifo|Add0~1_combout\ : std_logic;
SIGNAL \receiver_fifo|empty_next~0_combout\ : std_logic;
SIGNAL \receiver_fifo|Add0~0_combout\ : std_logic;
SIGNAL \receiver_fifo|Equal0~0_combout\ : std_logic;
SIGNAL \receiver_fifo|empty_next~1_combout\ : std_logic;
SIGNAL \rx_rd~input_o\ : std_logic;
SIGNAL \receiver_fifo|empty_next~2_combout\ : std_logic;
SIGNAL \receiver_fifo|empty_int~q\ : std_logic;
SIGNAL \receiver_fifo|rd_int~combout\ : std_logic;
SIGNAL \receiver_fifo|Add0~2_combout\ : std_logic;
SIGNAL \receiver_fifo|full_next~0_combout\ : std_logic;
SIGNAL \receiver_fifo|full_next~1_combout\ : std_logic;
SIGNAL \receiver_fifo|full_next~2_combout\ : std_logic;
SIGNAL \receiver_fifo|full_next~3_combout\ : std_logic;
SIGNAL \receiver_fifo|full_int~q\ : std_logic;
SIGNAL \receiver_fifo|wr_int~combout\ : std_logic;
SIGNAL \receiver_fifo|memory_inst|ram_rtl_0_bypass[0]~feeder_combout\ : std_logic;
SIGNAL \receiver_fifo|memory_inst|ram_rtl_0_bypass[8]~feeder_combout\ : std_logic;
SIGNAL \receiver_fifo|memory_inst|ram~24_combout\ : std_logic;
SIGNAL \receiver_fifo|memory_inst|ram_rtl_0_bypass[2]~0_combout\ : std_logic;
SIGNAL \receiver_fifo|memory_inst|ram_rtl_0_bypass[3]~feeder_combout\ : std_logic;
SIGNAL \receiver_fifo|memory_inst|ram~23_combout\ : std_logic;
SIGNAL \receiver_fifo|memory_inst|ram~25_combout\ : std_logic;
SIGNAL \receiver_fifo|memory_inst|ram~13feeder_combout\ : std_logic;
SIGNAL \receiver_fifo|memory_inst|ram~13_q\ : std_logic;
SIGNAL \receiver_fifo|memory_inst|ram~41_combout\ : std_logic;
SIGNAL \receiver_fifo|memory_inst|ram~42_combout\ : std_logic;
SIGNAL \receiver_fifo|memory_inst|ram~14_q\ : std_logic;
SIGNAL \receiver_fifo|read_address[0]~_wirecell_combout\ : std_logic;
SIGNAL \receiver_inst|data_out[1]~feeder_combout\ : std_logic;
SIGNAL \receiver_inst|data_out[2]~feeder_combout\ : std_logic;
SIGNAL \receiver_inst|data_out[3]~feeder_combout\ : std_logic;
SIGNAL \receiver_inst|data_out[4]~feeder_combout\ : std_logic;
SIGNAL \receiver_inst|data_out[6]~feeder_combout\ : std_logic;
SIGNAL \receiver_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a0~portbdataout\ : std_logic;
SIGNAL \receiver_fifo|memory_inst|ram~22_combout\ : std_logic;
SIGNAL \receiver_fifo|memory_inst|ram~26_combout\ : std_logic;
SIGNAL \receiver_fifo|memory_inst|ram_rtl_0_bypass[12]~feeder_combout\ : std_logic;
SIGNAL \receiver_fifo|memory_inst|ram~15_q\ : std_logic;
SIGNAL \receiver_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a1\ : std_logic;
SIGNAL \receiver_fifo|memory_inst|ram~27_combout\ : std_logic;
SIGNAL \receiver_fifo|memory_inst|ram~28_combout\ : std_logic;
SIGNAL \receiver_fifo|memory_inst|ram_rtl_0_bypass[14]~feeder_combout\ : std_logic;
SIGNAL \receiver_fifo|memory_inst|ram_rtl_0_bypass[13]~feeder_combout\ : std_logic;
SIGNAL \receiver_fifo|memory_inst|ram~16_q\ : std_logic;
SIGNAL \receiver_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a2\ : std_logic;
SIGNAL \receiver_fifo|memory_inst|ram~29_combout\ : std_logic;
SIGNAL \receiver_fifo|memory_inst|ram~30_combout\ : std_logic;
SIGNAL \receiver_fifo|memory_inst|ram~17_q\ : std_logic;
SIGNAL \receiver_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a3\ : std_logic;
SIGNAL \receiver_fifo|memory_inst|ram~31_combout\ : std_logic;
SIGNAL \receiver_fifo|memory_inst|ram_rtl_0_bypass[16]~feeder_combout\ : std_logic;
SIGNAL \receiver_fifo|memory_inst|ram_rtl_0_bypass[15]~feeder_combout\ : std_logic;
SIGNAL \receiver_fifo|memory_inst|ram~32_combout\ : std_logic;
SIGNAL \receiver_fifo|memory_inst|ram_rtl_0_bypass[18]~feeder_combout\ : std_logic;
SIGNAL \receiver_fifo|memory_inst|ram_rtl_0_bypass[17]~feeder_combout\ : std_logic;
SIGNAL \receiver_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a4\ : std_logic;
SIGNAL \receiver_fifo|memory_inst|ram~18_q\ : std_logic;
SIGNAL \receiver_fifo|memory_inst|ram~33_combout\ : std_logic;
SIGNAL \receiver_fifo|memory_inst|ram~34_combout\ : std_logic;
SIGNAL \receiver_fifo|memory_inst|ram_rtl_0_bypass[20]~feeder_combout\ : std_logic;
SIGNAL \receiver_fifo|memory_inst|ram~19_q\ : std_logic;
SIGNAL \receiver_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a5\ : std_logic;
SIGNAL \receiver_fifo|memory_inst|ram~35_combout\ : std_logic;
SIGNAL \receiver_fifo|memory_inst|ram~36_combout\ : std_logic;
SIGNAL \receiver_fifo|memory_inst|ram_rtl_0_bypass[22]~feeder_combout\ : std_logic;
SIGNAL \receiver_fifo|memory_inst|ram_rtl_0_bypass[21]~feeder_combout\ : std_logic;
SIGNAL \receiver_fifo|memory_inst|ram~20_q\ : std_logic;
SIGNAL \receiver_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a6\ : std_logic;
SIGNAL \receiver_fifo|memory_inst|ram~37_combout\ : std_logic;
SIGNAL \receiver_fifo|memory_inst|ram~38_combout\ : std_logic;
SIGNAL \receiver_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a7\ : std_logic;
SIGNAL \receiver_fifo|memory_inst|ram~21_q\ : std_logic;
SIGNAL \receiver_fifo|memory_inst|ram~39_combout\ : std_logic;
SIGNAL \receiver_fifo|memory_inst|ram_rtl_0_bypass[24]~feeder_combout\ : std_logic;
SIGNAL \receiver_fifo|memory_inst|ram_rtl_0_bypass[23]~feeder_combout\ : std_logic;
SIGNAL \receiver_fifo|memory_inst|ram~40_combout\ : std_logic;
SIGNAL \receiver_inst|bit_cnt\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \rx_sync_inst|sync\ : std_logic_vector(1 TO 2);
SIGNAL \receiver_inst|data_int\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \receiver_inst|data_out\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \transmitter_fifo|memory_inst|ram_rtl_0_bypass\ : std_logic_vector(0 TO 24);
SIGNAL \receiver_fifo|write_address\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \receiver_inst|clk_cnt\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \transmitter_inst|transmit_data\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \transmitter_fifo|read_address\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \receiver_fifo|memory_inst|rd1_data\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \transmitter_fifo|memory_inst|rd1_data\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \transmitter_inst|bit_cnt\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \transmitter_fifo|write_address\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \transmitter_inst|clk_cnt\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \receiver_fifo|memory_inst|ram_rtl_0_bypass\ : std_logic_vector(0 TO 24);
SIGNAL \receiver_fifo|read_address\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \receiver_fifo|ALT_INV_empty_int~q\ : std_logic;
SIGNAL \transmitter_fifo|ALT_INV_full_int~q\ : std_logic;
SIGNAL \transmitter_fifo|ALT_INV_rd_int~combout\ : std_logic;
SIGNAL \receiver_fifo|ALT_INV_rd_int~combout\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_clk <= clk;
ww_res_n <= res_n;
ww_rx <= rx;
tx <= ww_tx;
ww_tx_data <= tx_data;
ww_tx_wr <= tx_wr;
tx_free <= ww_tx_free;
ww_rx_rd <= rx_rd;
rx_data <= ww_rx_data;
rx_empty <= ww_rx_empty;
rx_full <= ww_rx_full;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\receiver_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
\receiver_inst|data_out\(7) & \receiver_inst|data_out\(6) & \receiver_inst|data_out\(5) & \receiver_inst|data_out\(4) & \receiver_inst|data_out\(3) & \receiver_inst|data_out\(2) & \receiver_inst|data_out\(1) & \receiver_inst|data_out\(0));

\receiver_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\receiver_fifo|write_address\(3) & \receiver_fifo|write_address\(2) & \receiver_fifo|write_address\(1) & \receiver_fifo|write_address\(0));

\receiver_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\ <= (\receiver_fifo|Add0~0_combout\ & \receiver_fifo|Add0~2_combout\ & \receiver_fifo|Add0~1_combout\ & \receiver_fifo|read_address[0]~_wirecell_combout\);

\receiver_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a0~portbdataout\ <= \receiver_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(0);
\receiver_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a1\ <= \receiver_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(1);
\receiver_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a2\ <= \receiver_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(2);
\receiver_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a3\ <= \receiver_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(3);
\receiver_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a4\ <= \receiver_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(4);
\receiver_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a5\ <= \receiver_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(5);
\receiver_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a6\ <= \receiver_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(6);
\receiver_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a7\ <= \receiver_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(7);

\transmitter_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& \tx_data[7]~input_o\ & \tx_data[6]~input_o\ & \tx_data[5]~input_o\ & \tx_data[4]~input_o\ & \tx_data[3]~input_o\ & \tx_data[2]~input_o\ & \tx_data[1]~input_o\ & \tx_data[0]~input_o\);

\transmitter_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\transmitter_fifo|write_address\(3) & \transmitter_fifo|write_address\(2) & \transmitter_fifo|write_address\(1) & \transmitter_fifo|write_address\(0));

\transmitter_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\ <= (\transmitter_fifo|Add0~2_combout\ & \transmitter_fifo|Add0~0_combout\ & \transmitter_fifo|Add0~1_combout\ & \transmitter_fifo|read_address[0]~_wirecell_combout\);

\transmitter_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a0~portbdataout\ <= \transmitter_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(0);
\transmitter_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a1\ <= \transmitter_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(1);
\transmitter_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a2\ <= \transmitter_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(2);
\transmitter_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a3\ <= \transmitter_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(3);
\transmitter_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a4\ <= \transmitter_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(4);
\transmitter_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a5\ <= \transmitter_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(5);
\transmitter_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a6\ <= \transmitter_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(6);
\transmitter_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a7\ <= \transmitter_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(7);

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);

\res_n~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \res_n~input_o\);
\receiver_fifo|ALT_INV_empty_int~q\ <= NOT \receiver_fifo|empty_int~q\;
\transmitter_fifo|ALT_INV_full_int~q\ <= NOT \transmitter_fifo|full_int~q\;
\transmitter_fifo|ALT_INV_rd_int~combout\ <= NOT \transmitter_fifo|rd_int~combout\;
\receiver_fifo|ALT_INV_rd_int~combout\ <= NOT \receiver_fifo|rd_int~combout\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X13_Y73_N23
\tx~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \transmitter_inst|Selector21~1_combout\,
	devoe => ww_devoe,
	o => \tx~output_o\);

-- Location: IOOBUF_X47_Y73_N2
\tx_free~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \transmitter_fifo|ALT_INV_full_int~q\,
	devoe => ww_devoe,
	o => \tx_free~output_o\);

-- Location: IOOBUF_X45_Y73_N9
\rx_data[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \receiver_fifo|memory_inst|rd1_data\(0),
	devoe => ww_devoe,
	o => \rx_data[0]~output_o\);

-- Location: IOOBUF_X49_Y73_N23
\rx_data[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \receiver_fifo|memory_inst|rd1_data\(1),
	devoe => ww_devoe,
	o => \rx_data[1]~output_o\);

-- Location: IOOBUF_X40_Y73_N9
\rx_data[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \receiver_fifo|memory_inst|rd1_data\(2),
	devoe => ww_devoe,
	o => \rx_data[2]~output_o\);

-- Location: IOOBUF_X52_Y73_N23
\rx_data[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \receiver_fifo|memory_inst|rd1_data\(3),
	devoe => ww_devoe,
	o => \rx_data[3]~output_o\);

-- Location: IOOBUF_X45_Y73_N2
\rx_data[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \receiver_fifo|memory_inst|rd1_data\(4),
	devoe => ww_devoe,
	o => \rx_data[4]~output_o\);

-- Location: IOOBUF_X49_Y73_N16
\rx_data[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \receiver_fifo|memory_inst|rd1_data\(5),
	devoe => ww_devoe,
	o => \rx_data[5]~output_o\);

-- Location: IOOBUF_X42_Y73_N9
\rx_data[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \receiver_fifo|memory_inst|rd1_data\(6),
	devoe => ww_devoe,
	o => \rx_data[6]~output_o\);

-- Location: IOOBUF_X40_Y73_N2
\rx_data[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \receiver_fifo|memory_inst|rd1_data\(7),
	devoe => ww_devoe,
	o => \rx_data[7]~output_o\);

-- Location: IOOBUF_X58_Y73_N16
\rx_empty~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \receiver_fifo|ALT_INV_empty_int~q\,
	devoe => ww_devoe,
	o => \rx_empty~output_o\);

-- Location: IOOBUF_X42_Y73_N2
\rx_full~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \receiver_fifo|full_int~q\,
	devoe => ww_devoe,
	o => \rx_full~output_o\);

-- Location: IOIBUF_X0_Y36_N15
\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G4
\clk~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: LCCOMB_X47_Y63_N4
\transmitter_inst|clk_cnt[0]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_inst|clk_cnt[0]~13_combout\ = \transmitter_inst|clk_cnt\(0) $ (VCC)
-- \transmitter_inst|clk_cnt[0]~14\ = CARRY(\transmitter_inst|clk_cnt\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \transmitter_inst|clk_cnt\(0),
	datad => VCC,
	combout => \transmitter_inst|clk_cnt[0]~13_combout\,
	cout => \transmitter_inst|clk_cnt[0]~14\);

-- Location: IOIBUF_X0_Y36_N22
\res_n~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_res_n,
	o => \res_n~input_o\);

-- Location: CLKCTRL_G3
\res_n~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \res_n~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \res_n~inputclkctrl_outclk\);

-- Location: LCCOMB_X48_Y63_N2
\transmitter_inst|Selector7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_inst|Selector7~0_combout\ = (\transmitter_inst|transmitter_state.TRANSMIT_STOP_NEXT~q\) # ((!\transmitter_inst|Equal0~3_combout\ & \transmitter_inst|transmitter_state.TRANSMIT_STOP~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \transmitter_inst|Equal0~3_combout\,
	datac => \transmitter_inst|transmitter_state.TRANSMIT_STOP~q\,
	datad => \transmitter_inst|transmitter_state.TRANSMIT_STOP_NEXT~q\,
	combout => \transmitter_inst|Selector7~0_combout\);

-- Location: FF_X48_Y63_N3
\transmitter_inst|transmitter_state.TRANSMIT_STOP\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_inst|Selector7~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_inst|transmitter_state.TRANSMIT_STOP~q\);

-- Location: IOIBUF_X47_Y73_N15
\tx_wr~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_tx_wr,
	o => \tx_wr~input_o\);

-- Location: LCCOMB_X50_Y63_N18
\transmitter_fifo|read_address[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_fifo|read_address[0]~0_combout\ = !\transmitter_fifo|read_address\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \transmitter_fifo|read_address\(0),
	combout => \transmitter_fifo|read_address[0]~0_combout\);

-- Location: LCCOMB_X49_Y63_N26
\transmitter_fifo|rd_int\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_fifo|rd_int~combout\ = (\transmitter_inst|transmitter_state.NEW_DATA~q\ & \transmitter_fifo|empty_int~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \transmitter_inst|transmitter_state.NEW_DATA~q\,
	datad => \transmitter_fifo|empty_int~q\,
	combout => \transmitter_fifo|rd_int~combout\);

-- Location: FF_X50_Y63_N19
\transmitter_fifo|read_address[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_fifo|read_address[0]~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \transmitter_fifo|rd_int~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_fifo|read_address\(0));

-- Location: LCCOMB_X50_Y63_N26
\transmitter_fifo|Add0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_fifo|Add0~1_combout\ = \transmitter_fifo|read_address\(0) $ (\transmitter_fifo|read_address\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \transmitter_fifo|read_address\(0),
	datad => \transmitter_fifo|read_address\(1),
	combout => \transmitter_fifo|Add0~1_combout\);

-- Location: FF_X50_Y63_N25
\transmitter_fifo|read_address[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \transmitter_fifo|Add0~1_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \transmitter_fifo|rd_int~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_fifo|read_address\(1));

-- Location: LCCOMB_X50_Y63_N4
\transmitter_fifo|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_fifo|Add0~0_combout\ = \transmitter_fifo|read_address\(2) $ (((\transmitter_fifo|read_address\(0) & \transmitter_fifo|read_address\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \transmitter_fifo|read_address\(0),
	datac => \transmitter_fifo|read_address\(2),
	datad => \transmitter_fifo|read_address\(1),
	combout => \transmitter_fifo|Add0~0_combout\);

-- Location: FF_X50_Y63_N5
\transmitter_fifo|read_address[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_fifo|Add0~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \transmitter_fifo|rd_int~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_fifo|read_address\(2));

-- Location: LCCOMB_X49_Y63_N22
\transmitter_fifo|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_fifo|Equal0~0_combout\ = (\transmitter_fifo|read_address\(0) & \transmitter_fifo|read_address\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \transmitter_fifo|read_address\(0),
	datad => \transmitter_fifo|read_address\(2),
	combout => \transmitter_fifo|Equal0~0_combout\);

-- Location: LCCOMB_X50_Y63_N22
\transmitter_fifo|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_fifo|Add0~2_combout\ = \transmitter_fifo|read_address\(3) $ (((\transmitter_fifo|read_address\(0) & (\transmitter_fifo|read_address\(2) & \transmitter_fifo|read_address\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \transmitter_fifo|read_address\(0),
	datab => \transmitter_fifo|read_address\(2),
	datac => \transmitter_fifo|read_address\(3),
	datad => \transmitter_fifo|read_address\(1),
	combout => \transmitter_fifo|Add0~2_combout\);

-- Location: FF_X50_Y63_N23
\transmitter_fifo|read_address[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_fifo|Add0~2_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \transmitter_fifo|rd_int~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_fifo|read_address\(3));

-- Location: LCCOMB_X49_Y63_N6
\transmitter_fifo|write_address[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_fifo|write_address[0]~0_combout\ = !\transmitter_fifo|write_address\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \transmitter_fifo|write_address\(0),
	combout => \transmitter_fifo|write_address[0]~0_combout\);

-- Location: FF_X49_Y63_N3
\transmitter_fifo|write_address[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_fifo|Add1~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \transmitter_fifo|wr_int~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_fifo|write_address\(2));

-- Location: LCCOMB_X49_Y63_N2
\transmitter_fifo|Add1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_fifo|Add1~0_combout\ = \transmitter_fifo|write_address\(2) $ (((\transmitter_fifo|write_address\(0) & \transmitter_fifo|write_address\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \transmitter_fifo|write_address\(0),
	datac => \transmitter_fifo|write_address\(2),
	datad => \transmitter_fifo|write_address\(1),
	combout => \transmitter_fifo|Add1~0_combout\);

-- Location: LCCOMB_X49_Y63_N8
\transmitter_fifo|full_next~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_fifo|full_next~0_combout\ = (\transmitter_fifo|read_address\(0) & (!\transmitter_fifo|write_address\(0) & (\transmitter_fifo|write_address\(1) $ (!\transmitter_fifo|read_address\(1))))) # (!\transmitter_fifo|read_address\(0) & 
-- (\transmitter_fifo|write_address\(0) & (\transmitter_fifo|write_address\(1) $ (\transmitter_fifo|read_address\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001100000100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \transmitter_fifo|write_address\(1),
	datab => \transmitter_fifo|read_address\(0),
	datac => \transmitter_fifo|write_address\(0),
	datad => \transmitter_fifo|read_address\(1),
	combout => \transmitter_fifo|full_next~0_combout\);

-- Location: LCCOMB_X49_Y63_N20
\transmitter_fifo|full_next~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_fifo|full_next~1_combout\ = (\transmitter_fifo|full_next~0_combout\ & (\transmitter_fifo|Add1~0_combout\ $ (!\transmitter_fifo|read_address\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \transmitter_fifo|Add1~0_combout\,
	datac => \transmitter_fifo|full_next~0_combout\,
	datad => \transmitter_fifo|read_address\(2),
	combout => \transmitter_fifo|full_next~1_combout\);

-- Location: LCCOMB_X49_Y63_N24
\transmitter_fifo|full_next~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_fifo|full_next~2_combout\ = (\tx_wr~input_o\ & (\transmitter_fifo|full_next~1_combout\ & (\transmitter_fifo|Add1~1_combout\ $ (!\transmitter_fifo|read_address\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tx_wr~input_o\,
	datab => \transmitter_fifo|full_next~1_combout\,
	datac => \transmitter_fifo|Add1~1_combout\,
	datad => \transmitter_fifo|read_address\(3),
	combout => \transmitter_fifo|full_next~2_combout\);

-- Location: LCCOMB_X49_Y63_N0
\transmitter_fifo|full_next~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_fifo|full_next~3_combout\ = (\transmitter_fifo|full_next~2_combout\) # ((!\transmitter_inst|transmitter_state.NEW_DATA~q\ & \transmitter_fifo|full_int~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \transmitter_inst|transmitter_state.NEW_DATA~q\,
	datac => \transmitter_fifo|full_int~q\,
	datad => \transmitter_fifo|full_next~2_combout\,
	combout => \transmitter_fifo|full_next~3_combout\);

-- Location: FF_X49_Y63_N1
\transmitter_fifo|full_int\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_fifo|full_next~3_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_fifo|full_int~q\);

-- Location: LCCOMB_X49_Y63_N4
\transmitter_fifo|wr_int\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_fifo|wr_int~combout\ = (\tx_wr~input_o\ & !\transmitter_fifo|full_int~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tx_wr~input_o\,
	datad => \transmitter_fifo|full_int~q\,
	combout => \transmitter_fifo|wr_int~combout\);

-- Location: FF_X49_Y63_N7
\transmitter_fifo|write_address[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_fifo|write_address[0]~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \transmitter_fifo|wr_int~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_fifo|write_address\(0));

-- Location: LCCOMB_X49_Y63_N12
\transmitter_fifo|Add1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_fifo|Add1~2_combout\ = \transmitter_fifo|write_address\(0) $ (\transmitter_fifo|write_address\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \transmitter_fifo|write_address\(0),
	datac => \transmitter_fifo|write_address\(1),
	combout => \transmitter_fifo|Add1~2_combout\);

-- Location: FF_X49_Y63_N13
\transmitter_fifo|write_address[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_fifo|Add1~2_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \transmitter_fifo|wr_int~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_fifo|write_address\(1));

-- Location: LCCOMB_X49_Y63_N14
\transmitter_fifo|Add1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_fifo|Add1~1_combout\ = \transmitter_fifo|write_address\(3) $ (((\transmitter_fifo|write_address\(1) & (\transmitter_fifo|write_address\(0) & \transmitter_fifo|write_address\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \transmitter_fifo|write_address\(1),
	datab => \transmitter_fifo|write_address\(0),
	datac => \transmitter_fifo|write_address\(3),
	datad => \transmitter_fifo|write_address\(2),
	combout => \transmitter_fifo|Add1~1_combout\);

-- Location: FF_X49_Y63_N15
\transmitter_fifo|write_address[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_fifo|Add1~1_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \transmitter_fifo|wr_int~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_fifo|write_address\(3));

-- Location: LCCOMB_X49_Y63_N16
\transmitter_fifo|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_fifo|Equal0~1_combout\ = \transmitter_fifo|read_address\(3) $ (\transmitter_fifo|write_address\(3) $ (((\transmitter_fifo|Equal0~0_combout\ & \transmitter_fifo|read_address\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \transmitter_fifo|Equal0~0_combout\,
	datab => \transmitter_fifo|read_address\(3),
	datac => \transmitter_fifo|write_address\(3),
	datad => \transmitter_fifo|read_address\(1),
	combout => \transmitter_fifo|Equal0~1_combout\);

-- Location: LCCOMB_X49_Y63_N28
\transmitter_fifo|empty_next~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_fifo|empty_next~0_combout\ = (\transmitter_fifo|read_address\(0) & (!\transmitter_fifo|write_address\(0) & (\transmitter_fifo|write_address\(1) $ (\transmitter_fifo|read_address\(1))))) # (!\transmitter_fifo|read_address\(0) & 
-- (\transmitter_fifo|write_address\(0) & (\transmitter_fifo|write_address\(1) $ (!\transmitter_fifo|read_address\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010010000011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \transmitter_fifo|write_address\(1),
	datab => \transmitter_fifo|read_address\(0),
	datac => \transmitter_fifo|write_address\(0),
	datad => \transmitter_fifo|read_address\(1),
	combout => \transmitter_fifo|empty_next~0_combout\);

-- Location: LCCOMB_X49_Y63_N18
\transmitter_fifo|empty_next~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_fifo|empty_next~1_combout\ = (!\transmitter_fifo|Equal0~1_combout\ & (\transmitter_fifo|empty_next~0_combout\ & (\transmitter_fifo|Add0~0_combout\ $ (!\transmitter_fifo|write_address\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \transmitter_fifo|Equal0~1_combout\,
	datab => \transmitter_fifo|empty_next~0_combout\,
	datac => \transmitter_fifo|Add0~0_combout\,
	datad => \transmitter_fifo|write_address\(2),
	combout => \transmitter_fifo|empty_next~1_combout\);

-- Location: LCCOMB_X49_Y63_N10
\transmitter_fifo|empty_next~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_fifo|empty_next~2_combout\ = (\tx_wr~input_o\) # ((\transmitter_fifo|empty_int~q\ & ((!\transmitter_fifo|empty_next~1_combout\) # (!\transmitter_inst|transmitter_state.NEW_DATA~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tx_wr~input_o\,
	datab => \transmitter_inst|transmitter_state.NEW_DATA~q\,
	datac => \transmitter_fifo|empty_int~q\,
	datad => \transmitter_fifo|empty_next~1_combout\,
	combout => \transmitter_fifo|empty_next~2_combout\);

-- Location: FF_X49_Y63_N11
\transmitter_fifo|empty_int\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_fifo|empty_next~2_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_fifo|empty_int~q\);

-- Location: LCCOMB_X48_Y63_N24
\transmitter_inst|Selector1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_inst|Selector1~0_combout\ = (\transmitter_fifo|empty_int~q\ & (((\transmitter_inst|Equal0~3_combout\ & \transmitter_inst|transmitter_state.TRANSMIT_STOP~q\)) # (!\transmitter_inst|transmitter_state.IDLE~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \transmitter_inst|Equal0~3_combout\,
	datab => \transmitter_inst|transmitter_state.TRANSMIT_STOP~q\,
	datac => \transmitter_fifo|empty_int~q\,
	datad => \transmitter_inst|transmitter_state.IDLE~q\,
	combout => \transmitter_inst|Selector1~0_combout\);

-- Location: FF_X48_Y63_N25
\transmitter_inst|transmitter_state.NEW_DATA\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_inst|Selector1~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_inst|transmitter_state.NEW_DATA~q\);

-- Location: LCCOMB_X48_Y63_N4
\transmitter_inst|Selector2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_inst|Selector2~0_combout\ = (\transmitter_inst|transmitter_state.NEW_DATA~q\) # ((!\transmitter_inst|Equal0~3_combout\ & \transmitter_inst|transmitter_state.SEND_START_BIT~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \transmitter_inst|Equal0~3_combout\,
	datac => \transmitter_inst|transmitter_state.SEND_START_BIT~q\,
	datad => \transmitter_inst|transmitter_state.NEW_DATA~q\,
	combout => \transmitter_inst|Selector2~0_combout\);

-- Location: FF_X48_Y63_N5
\transmitter_inst|transmitter_state.SEND_START_BIT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_inst|Selector2~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_inst|transmitter_state.SEND_START_BIT~q\);

-- Location: LCCOMB_X48_Y63_N8
\transmitter_inst|Selector3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_inst|Selector3~0_combout\ = (\transmitter_inst|transmitter_state.SEND_START_BIT~q\ & \transmitter_inst|Equal0~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \transmitter_inst|transmitter_state.SEND_START_BIT~q\,
	datac => \transmitter_inst|Equal0~3_combout\,
	combout => \transmitter_inst|Selector3~0_combout\);

-- Location: FF_X48_Y63_N9
\transmitter_inst|transmitter_state.TRANSMIT_FIRST\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_inst|Selector3~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_inst|transmitter_state.TRANSMIT_FIRST~q\);

-- Location: LCCOMB_X48_Y63_N0
\transmitter_inst|Selector4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_inst|Selector4~0_combout\ = (\transmitter_inst|transmitter_state.TRANSMIT_NEXT~q\) # ((\transmitter_inst|transmitter_state.TRANSMIT_FIRST~q\) # ((!\transmitter_inst|Equal0~3_combout\ & \transmitter_inst|transmitter_state.TRANSMIT~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \transmitter_inst|Equal0~3_combout\,
	datab => \transmitter_inst|transmitter_state.TRANSMIT_NEXT~q\,
	datac => \transmitter_inst|transmitter_state.TRANSMIT~q\,
	datad => \transmitter_inst|transmitter_state.TRANSMIT_FIRST~q\,
	combout => \transmitter_inst|Selector4~0_combout\);

-- Location: FF_X48_Y63_N1
\transmitter_inst|transmitter_state.TRANSMIT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_inst|Selector4~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_inst|transmitter_state.TRANSMIT~q\);

-- Location: LCCOMB_X48_Y63_N30
\transmitter_inst|Selector31~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_inst|Selector31~0_combout\ = (\transmitter_inst|transmitter_state.TRANSMIT_NEXT~q\ & (!\transmitter_inst|bit_cnt\(0))) # (!\transmitter_inst|transmitter_state.TRANSMIT_NEXT~q\ & (\transmitter_inst|bit_cnt\(0) & 
-- !\transmitter_inst|transmitter_state.TRANSMIT_FIRST~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \transmitter_inst|transmitter_state.TRANSMIT_NEXT~q\,
	datac => \transmitter_inst|bit_cnt\(0),
	datad => \transmitter_inst|transmitter_state.TRANSMIT_FIRST~q\,
	combout => \transmitter_inst|Selector31~0_combout\);

-- Location: FF_X48_Y63_N31
\transmitter_inst|bit_cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_inst|Selector31~0_combout\,
	ena => \res_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_inst|bit_cnt\(0));

-- Location: LCCOMB_X48_Y63_N28
\transmitter_inst|Selector30~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_inst|Selector30~0_combout\ = (\transmitter_inst|transmitter_state.TRANSMIT_NEXT~q\ & (\transmitter_inst|bit_cnt\(0) $ ((\transmitter_inst|bit_cnt\(1))))) # (!\transmitter_inst|transmitter_state.TRANSMIT_NEXT~q\ & 
-- (((\transmitter_inst|bit_cnt\(1) & !\transmitter_inst|transmitter_state.TRANSMIT_FIRST~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \transmitter_inst|bit_cnt\(0),
	datab => \transmitter_inst|transmitter_state.TRANSMIT_NEXT~q\,
	datac => \transmitter_inst|bit_cnt\(1),
	datad => \transmitter_inst|transmitter_state.TRANSMIT_FIRST~q\,
	combout => \transmitter_inst|Selector30~0_combout\);

-- Location: FF_X48_Y63_N29
\transmitter_inst|bit_cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_inst|Selector30~0_combout\,
	ena => \res_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_inst|bit_cnt\(1));

-- Location: LCCOMB_X48_Y63_N16
\transmitter_inst|LessThan0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_inst|LessThan0~0_combout\ = (\transmitter_inst|bit_cnt\(1) & \transmitter_inst|bit_cnt\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \transmitter_inst|bit_cnt\(1),
	datac => \transmitter_inst|bit_cnt\(0),
	combout => \transmitter_inst|LessThan0~0_combout\);

-- Location: LCCOMB_X48_Y63_N10
\transmitter_inst|Selector5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_inst|Selector5~0_combout\ = (\transmitter_inst|bit_cnt\(2) & (!\transmitter_inst|LessThan0~0_combout\ & ((!\transmitter_inst|transmitter_state.TRANSMIT_STOP~q\) # (!\transmitter_fifo|empty_int~q\)))) # (!\transmitter_inst|bit_cnt\(2) & 
-- (((!\transmitter_inst|transmitter_state.TRANSMIT_STOP~q\) # (!\transmitter_fifo|empty_int~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011101110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \transmitter_inst|bit_cnt\(2),
	datab => \transmitter_inst|LessThan0~0_combout\,
	datac => \transmitter_fifo|empty_int~q\,
	datad => \transmitter_inst|transmitter_state.TRANSMIT_STOP~q\,
	combout => \transmitter_inst|Selector5~0_combout\);

-- Location: LCCOMB_X48_Y63_N18
\transmitter_inst|Selector5~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_inst|Selector5~1_combout\ = (\transmitter_inst|transmitter_state.TRANSMIT~q\ & (\transmitter_inst|Equal0~3_combout\ & \transmitter_inst|Selector5~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \transmitter_inst|transmitter_state.TRANSMIT~q\,
	datac => \transmitter_inst|Equal0~3_combout\,
	datad => \transmitter_inst|Selector5~0_combout\,
	combout => \transmitter_inst|Selector5~1_combout\);

-- Location: FF_X48_Y63_N19
\transmitter_inst|transmitter_state.TRANSMIT_NEXT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_inst|Selector5~1_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_inst|transmitter_state.TRANSMIT_NEXT~q\);

-- Location: LCCOMB_X48_Y63_N26
\transmitter_inst|Selector29~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_inst|Selector29~0_combout\ = (\transmitter_inst|transmitter_state.TRANSMIT_NEXT~q\ & (\transmitter_inst|LessThan0~0_combout\ $ ((\transmitter_inst|bit_cnt\(2))))) # (!\transmitter_inst|transmitter_state.TRANSMIT_NEXT~q\ & 
-- (((\transmitter_inst|bit_cnt\(2) & !\transmitter_inst|transmitter_state.TRANSMIT_FIRST~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \transmitter_inst|transmitter_state.TRANSMIT_NEXT~q\,
	datab => \transmitter_inst|LessThan0~0_combout\,
	datac => \transmitter_inst|bit_cnt\(2),
	datad => \transmitter_inst|transmitter_state.TRANSMIT_FIRST~q\,
	combout => \transmitter_inst|Selector29~0_combout\);

-- Location: FF_X48_Y63_N27
\transmitter_inst|bit_cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_inst|Selector29~0_combout\,
	ena => \res_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_inst|bit_cnt\(2));

-- Location: LCCOMB_X48_Y63_N12
\transmitter_inst|Selector6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_inst|Selector6~0_combout\ = (\transmitter_inst|bit_cnt\(2) & (\transmitter_inst|LessThan0~0_combout\ & (\transmitter_inst|Equal0~3_combout\ & \transmitter_inst|transmitter_state.TRANSMIT~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \transmitter_inst|bit_cnt\(2),
	datab => \transmitter_inst|LessThan0~0_combout\,
	datac => \transmitter_inst|Equal0~3_combout\,
	datad => \transmitter_inst|transmitter_state.TRANSMIT~q\,
	combout => \transmitter_inst|Selector6~0_combout\);

-- Location: FF_X48_Y63_N13
\transmitter_inst|transmitter_state.TRANSMIT_STOP_NEXT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_inst|Selector6~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_inst|transmitter_state.TRANSMIT_STOP_NEXT~q\);

-- Location: LCCOMB_X48_Y63_N22
\transmitter_inst|WideOr0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_inst|WideOr0~0_combout\ = (\transmitter_inst|transmitter_state.TRANSMIT_STOP_NEXT~q\) # ((\transmitter_inst|transmitter_state.NEW_DATA~q\) # ((\transmitter_inst|transmitter_state.TRANSMIT_NEXT~q\) # 
-- (\transmitter_inst|transmitter_state.TRANSMIT_FIRST~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \transmitter_inst|transmitter_state.TRANSMIT_STOP_NEXT~q\,
	datab => \transmitter_inst|transmitter_state.NEW_DATA~q\,
	datac => \transmitter_inst|transmitter_state.TRANSMIT_NEXT~q\,
	datad => \transmitter_inst|transmitter_state.TRANSMIT_FIRST~q\,
	combout => \transmitter_inst|WideOr0~0_combout\);

-- Location: FF_X47_Y63_N5
\transmitter_inst|clk_cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_inst|clk_cnt[0]~13_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \transmitter_inst|WideOr0~0_combout\,
	ena => \transmitter_inst|transmitter_state.IDLE~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_inst|clk_cnt\(0));

-- Location: LCCOMB_X47_Y63_N6
\transmitter_inst|clk_cnt[1]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_inst|clk_cnt[1]~15_combout\ = (\transmitter_inst|clk_cnt\(1) & (!\transmitter_inst|clk_cnt[0]~14\)) # (!\transmitter_inst|clk_cnt\(1) & ((\transmitter_inst|clk_cnt[0]~14\) # (GND)))
-- \transmitter_inst|clk_cnt[1]~16\ = CARRY((!\transmitter_inst|clk_cnt[0]~14\) # (!\transmitter_inst|clk_cnt\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \transmitter_inst|clk_cnt\(1),
	datad => VCC,
	cin => \transmitter_inst|clk_cnt[0]~14\,
	combout => \transmitter_inst|clk_cnt[1]~15_combout\,
	cout => \transmitter_inst|clk_cnt[1]~16\);

-- Location: FF_X47_Y63_N7
\transmitter_inst|clk_cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_inst|clk_cnt[1]~15_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \transmitter_inst|WideOr0~0_combout\,
	ena => \transmitter_inst|transmitter_state.IDLE~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_inst|clk_cnt\(1));

-- Location: LCCOMB_X47_Y63_N8
\transmitter_inst|clk_cnt[2]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_inst|clk_cnt[2]~17_combout\ = (\transmitter_inst|clk_cnt\(2) & (\transmitter_inst|clk_cnt[1]~16\ $ (GND))) # (!\transmitter_inst|clk_cnt\(2) & (!\transmitter_inst|clk_cnt[1]~16\ & VCC))
-- \transmitter_inst|clk_cnt[2]~18\ = CARRY((\transmitter_inst|clk_cnt\(2) & !\transmitter_inst|clk_cnt[1]~16\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \transmitter_inst|clk_cnt\(2),
	datad => VCC,
	cin => \transmitter_inst|clk_cnt[1]~16\,
	combout => \transmitter_inst|clk_cnt[2]~17_combout\,
	cout => \transmitter_inst|clk_cnt[2]~18\);

-- Location: FF_X47_Y63_N9
\transmitter_inst|clk_cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_inst|clk_cnt[2]~17_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \transmitter_inst|WideOr0~0_combout\,
	ena => \transmitter_inst|transmitter_state.IDLE~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_inst|clk_cnt\(2));

-- Location: LCCOMB_X47_Y63_N10
\transmitter_inst|clk_cnt[3]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_inst|clk_cnt[3]~19_combout\ = (\transmitter_inst|clk_cnt\(3) & (!\transmitter_inst|clk_cnt[2]~18\)) # (!\transmitter_inst|clk_cnt\(3) & ((\transmitter_inst|clk_cnt[2]~18\) # (GND)))
-- \transmitter_inst|clk_cnt[3]~20\ = CARRY((!\transmitter_inst|clk_cnt[2]~18\) # (!\transmitter_inst|clk_cnt\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \transmitter_inst|clk_cnt\(3),
	datad => VCC,
	cin => \transmitter_inst|clk_cnt[2]~18\,
	combout => \transmitter_inst|clk_cnt[3]~19_combout\,
	cout => \transmitter_inst|clk_cnt[3]~20\);

-- Location: FF_X47_Y63_N11
\transmitter_inst|clk_cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_inst|clk_cnt[3]~19_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \transmitter_inst|WideOr0~0_combout\,
	ena => \transmitter_inst|transmitter_state.IDLE~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_inst|clk_cnt\(3));

-- Location: LCCOMB_X47_Y63_N12
\transmitter_inst|clk_cnt[4]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_inst|clk_cnt[4]~21_combout\ = (\transmitter_inst|clk_cnt\(4) & (\transmitter_inst|clk_cnt[3]~20\ $ (GND))) # (!\transmitter_inst|clk_cnt\(4) & (!\transmitter_inst|clk_cnt[3]~20\ & VCC))
-- \transmitter_inst|clk_cnt[4]~22\ = CARRY((\transmitter_inst|clk_cnt\(4) & !\transmitter_inst|clk_cnt[3]~20\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \transmitter_inst|clk_cnt\(4),
	datad => VCC,
	cin => \transmitter_inst|clk_cnt[3]~20\,
	combout => \transmitter_inst|clk_cnt[4]~21_combout\,
	cout => \transmitter_inst|clk_cnt[4]~22\);

-- Location: FF_X47_Y63_N13
\transmitter_inst|clk_cnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_inst|clk_cnt[4]~21_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \transmitter_inst|WideOr0~0_combout\,
	ena => \transmitter_inst|transmitter_state.IDLE~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_inst|clk_cnt\(4));

-- Location: LCCOMB_X47_Y63_N14
\transmitter_inst|clk_cnt[5]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_inst|clk_cnt[5]~23_combout\ = (\transmitter_inst|clk_cnt\(5) & (!\transmitter_inst|clk_cnt[4]~22\)) # (!\transmitter_inst|clk_cnt\(5) & ((\transmitter_inst|clk_cnt[4]~22\) # (GND)))
-- \transmitter_inst|clk_cnt[5]~24\ = CARRY((!\transmitter_inst|clk_cnt[4]~22\) # (!\transmitter_inst|clk_cnt\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \transmitter_inst|clk_cnt\(5),
	datad => VCC,
	cin => \transmitter_inst|clk_cnt[4]~22\,
	combout => \transmitter_inst|clk_cnt[5]~23_combout\,
	cout => \transmitter_inst|clk_cnt[5]~24\);

-- Location: FF_X47_Y63_N15
\transmitter_inst|clk_cnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_inst|clk_cnt[5]~23_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \transmitter_inst|WideOr0~0_combout\,
	ena => \transmitter_inst|transmitter_state.IDLE~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_inst|clk_cnt\(5));

-- Location: LCCOMB_X47_Y63_N16
\transmitter_inst|clk_cnt[6]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_inst|clk_cnt[6]~25_combout\ = (\transmitter_inst|clk_cnt\(6) & (\transmitter_inst|clk_cnt[5]~24\ $ (GND))) # (!\transmitter_inst|clk_cnt\(6) & (!\transmitter_inst|clk_cnt[5]~24\ & VCC))
-- \transmitter_inst|clk_cnt[6]~26\ = CARRY((\transmitter_inst|clk_cnt\(6) & !\transmitter_inst|clk_cnt[5]~24\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \transmitter_inst|clk_cnt\(6),
	datad => VCC,
	cin => \transmitter_inst|clk_cnt[5]~24\,
	combout => \transmitter_inst|clk_cnt[6]~25_combout\,
	cout => \transmitter_inst|clk_cnt[6]~26\);

-- Location: FF_X47_Y63_N17
\transmitter_inst|clk_cnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_inst|clk_cnt[6]~25_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \transmitter_inst|WideOr0~0_combout\,
	ena => \transmitter_inst|transmitter_state.IDLE~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_inst|clk_cnt\(6));

-- Location: LCCOMB_X47_Y63_N18
\transmitter_inst|clk_cnt[7]~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_inst|clk_cnt[7]~27_combout\ = (\transmitter_inst|clk_cnt\(7) & (!\transmitter_inst|clk_cnt[6]~26\)) # (!\transmitter_inst|clk_cnt\(7) & ((\transmitter_inst|clk_cnt[6]~26\) # (GND)))
-- \transmitter_inst|clk_cnt[7]~28\ = CARRY((!\transmitter_inst|clk_cnt[6]~26\) # (!\transmitter_inst|clk_cnt\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \transmitter_inst|clk_cnt\(7),
	datad => VCC,
	cin => \transmitter_inst|clk_cnt[6]~26\,
	combout => \transmitter_inst|clk_cnt[7]~27_combout\,
	cout => \transmitter_inst|clk_cnt[7]~28\);

-- Location: FF_X47_Y63_N19
\transmitter_inst|clk_cnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_inst|clk_cnt[7]~27_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \transmitter_inst|WideOr0~0_combout\,
	ena => \transmitter_inst|transmitter_state.IDLE~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_inst|clk_cnt\(7));

-- Location: LCCOMB_X47_Y63_N2
\transmitter_inst|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_inst|Equal0~1_combout\ = (\transmitter_inst|clk_cnt\(4) & (!\transmitter_inst|clk_cnt\(7) & (!\transmitter_inst|clk_cnt\(5) & \transmitter_inst|clk_cnt\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \transmitter_inst|clk_cnt\(4),
	datab => \transmitter_inst|clk_cnt\(7),
	datac => \transmitter_inst|clk_cnt\(5),
	datad => \transmitter_inst|clk_cnt\(6),
	combout => \transmitter_inst|Equal0~1_combout\);

-- Location: LCCOMB_X47_Y63_N0
\transmitter_inst|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_inst|Equal0~0_combout\ = (\transmitter_inst|clk_cnt\(1) & (\transmitter_inst|clk_cnt\(2) & (!\transmitter_inst|clk_cnt\(0) & !\transmitter_inst|clk_cnt\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \transmitter_inst|clk_cnt\(1),
	datab => \transmitter_inst|clk_cnt\(2),
	datac => \transmitter_inst|clk_cnt\(0),
	datad => \transmitter_inst|clk_cnt\(3),
	combout => \transmitter_inst|Equal0~0_combout\);

-- Location: LCCOMB_X47_Y63_N20
\transmitter_inst|clk_cnt[8]~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_inst|clk_cnt[8]~29_combout\ = (\transmitter_inst|clk_cnt\(8) & (\transmitter_inst|clk_cnt[7]~28\ $ (GND))) # (!\transmitter_inst|clk_cnt\(8) & (!\transmitter_inst|clk_cnt[7]~28\ & VCC))
-- \transmitter_inst|clk_cnt[8]~30\ = CARRY((\transmitter_inst|clk_cnt\(8) & !\transmitter_inst|clk_cnt[7]~28\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \transmitter_inst|clk_cnt\(8),
	datad => VCC,
	cin => \transmitter_inst|clk_cnt[7]~28\,
	combout => \transmitter_inst|clk_cnt[8]~29_combout\,
	cout => \transmitter_inst|clk_cnt[8]~30\);

-- Location: FF_X47_Y63_N21
\transmitter_inst|clk_cnt[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_inst|clk_cnt[8]~29_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \transmitter_inst|WideOr0~0_combout\,
	ena => \transmitter_inst|transmitter_state.IDLE~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_inst|clk_cnt\(8));

-- Location: LCCOMB_X47_Y63_N22
\transmitter_inst|clk_cnt[9]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_inst|clk_cnt[9]~31_combout\ = (\transmitter_inst|clk_cnt\(9) & (!\transmitter_inst|clk_cnt[8]~30\)) # (!\transmitter_inst|clk_cnt\(9) & ((\transmitter_inst|clk_cnt[8]~30\) # (GND)))
-- \transmitter_inst|clk_cnt[9]~32\ = CARRY((!\transmitter_inst|clk_cnt[8]~30\) # (!\transmitter_inst|clk_cnt\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \transmitter_inst|clk_cnt\(9),
	datad => VCC,
	cin => \transmitter_inst|clk_cnt[8]~30\,
	combout => \transmitter_inst|clk_cnt[9]~31_combout\,
	cout => \transmitter_inst|clk_cnt[9]~32\);

-- Location: FF_X47_Y63_N23
\transmitter_inst|clk_cnt[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_inst|clk_cnt[9]~31_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \transmitter_inst|WideOr0~0_combout\,
	ena => \transmitter_inst|transmitter_state.IDLE~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_inst|clk_cnt\(9));

-- Location: LCCOMB_X47_Y63_N24
\transmitter_inst|clk_cnt[10]~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_inst|clk_cnt[10]~33_combout\ = (\transmitter_inst|clk_cnt\(10) & (\transmitter_inst|clk_cnt[9]~32\ $ (GND))) # (!\transmitter_inst|clk_cnt\(10) & (!\transmitter_inst|clk_cnt[9]~32\ & VCC))
-- \transmitter_inst|clk_cnt[10]~34\ = CARRY((\transmitter_inst|clk_cnt\(10) & !\transmitter_inst|clk_cnt[9]~32\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \transmitter_inst|clk_cnt\(10),
	datad => VCC,
	cin => \transmitter_inst|clk_cnt[9]~32\,
	combout => \transmitter_inst|clk_cnt[10]~33_combout\,
	cout => \transmitter_inst|clk_cnt[10]~34\);

-- Location: FF_X47_Y63_N25
\transmitter_inst|clk_cnt[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_inst|clk_cnt[10]~33_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \transmitter_inst|WideOr0~0_combout\,
	ena => \transmitter_inst|transmitter_state.IDLE~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_inst|clk_cnt\(10));

-- Location: LCCOMB_X47_Y63_N26
\transmitter_inst|clk_cnt[11]~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_inst|clk_cnt[11]~35_combout\ = (\transmitter_inst|clk_cnt\(11) & (!\transmitter_inst|clk_cnt[10]~34\)) # (!\transmitter_inst|clk_cnt\(11) & ((\transmitter_inst|clk_cnt[10]~34\) # (GND)))
-- \transmitter_inst|clk_cnt[11]~36\ = CARRY((!\transmitter_inst|clk_cnt[10]~34\) # (!\transmitter_inst|clk_cnt\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \transmitter_inst|clk_cnt\(11),
	datad => VCC,
	cin => \transmitter_inst|clk_cnt[10]~34\,
	combout => \transmitter_inst|clk_cnt[11]~35_combout\,
	cout => \transmitter_inst|clk_cnt[11]~36\);

-- Location: FF_X47_Y63_N27
\transmitter_inst|clk_cnt[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_inst|clk_cnt[11]~35_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \transmitter_inst|WideOr0~0_combout\,
	ena => \transmitter_inst|transmitter_state.IDLE~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_inst|clk_cnt\(11));

-- Location: LCCOMB_X47_Y63_N28
\transmitter_inst|clk_cnt[12]~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_inst|clk_cnt[12]~37_combout\ = \transmitter_inst|clk_cnt[11]~36\ $ (!\transmitter_inst|clk_cnt\(12))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \transmitter_inst|clk_cnt\(12),
	cin => \transmitter_inst|clk_cnt[11]~36\,
	combout => \transmitter_inst|clk_cnt[12]~37_combout\);

-- Location: FF_X47_Y63_N29
\transmitter_inst|clk_cnt[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_inst|clk_cnt[12]~37_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \transmitter_inst|WideOr0~0_combout\,
	ena => \transmitter_inst|transmitter_state.IDLE~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_inst|clk_cnt\(12));

-- Location: LCCOMB_X47_Y63_N30
\transmitter_inst|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_inst|Equal0~2_combout\ = (!\transmitter_inst|clk_cnt\(11) & (!\transmitter_inst|clk_cnt\(8) & (!\transmitter_inst|clk_cnt\(9) & \transmitter_inst|clk_cnt\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \transmitter_inst|clk_cnt\(11),
	datab => \transmitter_inst|clk_cnt\(8),
	datac => \transmitter_inst|clk_cnt\(9),
	datad => \transmitter_inst|clk_cnt\(10),
	combout => \transmitter_inst|Equal0~2_combout\);

-- Location: LCCOMB_X47_Y64_N8
\transmitter_inst|Equal0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_inst|Equal0~3_combout\ = (\transmitter_inst|Equal0~1_combout\ & (\transmitter_inst|Equal0~0_combout\ & (\transmitter_inst|clk_cnt\(12) & \transmitter_inst|Equal0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \transmitter_inst|Equal0~1_combout\,
	datab => \transmitter_inst|Equal0~0_combout\,
	datac => \transmitter_inst|clk_cnt\(12),
	datad => \transmitter_inst|Equal0~2_combout\,
	combout => \transmitter_inst|Equal0~3_combout\);

-- Location: LCCOMB_X48_Y63_N20
\transmitter_inst|Selector0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_inst|Selector0~0_combout\ = (\transmitter_fifo|empty_int~q\) # ((\transmitter_inst|transmitter_state.IDLE~q\ & ((!\transmitter_inst|transmitter_state.TRANSMIT_STOP~q\) # (!\transmitter_inst|Equal0~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \transmitter_inst|Equal0~3_combout\,
	datab => \transmitter_fifo|empty_int~q\,
	datac => \transmitter_inst|transmitter_state.IDLE~q\,
	datad => \transmitter_inst|transmitter_state.TRANSMIT_STOP~q\,
	combout => \transmitter_inst|Selector0~0_combout\);

-- Location: FF_X48_Y63_N21
\transmitter_inst|transmitter_state.IDLE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_inst|Selector0~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_inst|transmitter_state.IDLE~q\);

-- Location: LCCOMB_X52_Y62_N12
\transmitter_fifo|memory_inst|ram_rtl_0_bypass[12]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_fifo|memory_inst|ram_rtl_0_bypass[12]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \transmitter_fifo|memory_inst|ram_rtl_0_bypass[12]~feeder_combout\);

-- Location: FF_X52_Y62_N13
\transmitter_fifo|memory_inst|ram_rtl_0_bypass[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_fifo|memory_inst|ram_rtl_0_bypass[12]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_fifo|memory_inst|ram_rtl_0_bypass\(12));

-- Location: FF_X50_Y63_N31
\transmitter_fifo|memory_inst|ram_rtl_0_bypass[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \transmitter_fifo|Add0~2_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \transmitter_fifo|rd_int~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_fifo|memory_inst|ram_rtl_0_bypass\(8));

-- Location: LCCOMB_X50_Y63_N28
\transmitter_fifo|memory_inst|ram_rtl_0_bypass[7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_fifo|memory_inst|ram_rtl_0_bypass[7]~feeder_combout\ = \transmitter_fifo|write_address\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \transmitter_fifo|write_address\(3),
	combout => \transmitter_fifo|memory_inst|ram_rtl_0_bypass[7]~feeder_combout\);

-- Location: FF_X50_Y63_N29
\transmitter_fifo|memory_inst|ram_rtl_0_bypass[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_fifo|memory_inst|ram_rtl_0_bypass[7]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_fifo|memory_inst|ram_rtl_0_bypass\(7));

-- Location: FF_X50_Y63_N9
\transmitter_fifo|memory_inst|ram_rtl_0_bypass[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \transmitter_fifo|Add0~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \transmitter_fifo|rd_int~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_fifo|memory_inst|ram_rtl_0_bypass\(6));

-- Location: FF_X50_Y63_N11
\transmitter_fifo|memory_inst|ram_rtl_0_bypass[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \transmitter_fifo|write_address\(2),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_fifo|memory_inst|ram_rtl_0_bypass\(5));

-- Location: LCCOMB_X50_Y63_N8
\transmitter_fifo|memory_inst|ram~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_fifo|memory_inst|ram~24_combout\ = (\transmitter_fifo|memory_inst|ram_rtl_0_bypass\(8) & (\transmitter_fifo|memory_inst|ram_rtl_0_bypass\(7) & (\transmitter_fifo|memory_inst|ram_rtl_0_bypass\(6) $ 
-- (!\transmitter_fifo|memory_inst|ram_rtl_0_bypass\(5))))) # (!\transmitter_fifo|memory_inst|ram_rtl_0_bypass\(8) & (!\transmitter_fifo|memory_inst|ram_rtl_0_bypass\(7) & (\transmitter_fifo|memory_inst|ram_rtl_0_bypass\(6) $ 
-- (!\transmitter_fifo|memory_inst|ram_rtl_0_bypass\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000000001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \transmitter_fifo|memory_inst|ram_rtl_0_bypass\(8),
	datab => \transmitter_fifo|memory_inst|ram_rtl_0_bypass\(7),
	datac => \transmitter_fifo|memory_inst|ram_rtl_0_bypass\(6),
	datad => \transmitter_fifo|memory_inst|ram_rtl_0_bypass\(5),
	combout => \transmitter_fifo|memory_inst|ram~24_combout\);

-- Location: FF_X50_Y63_N17
\transmitter_fifo|memory_inst|ram_rtl_0_bypass[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \transmitter_fifo|wr_int~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_fifo|memory_inst|ram_rtl_0_bypass\(0));

-- Location: LCCOMB_X50_Y63_N6
\transmitter_fifo|memory_inst|ram_rtl_0_bypass[2]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_fifo|memory_inst|ram_rtl_0_bypass[2]~0_combout\ = !\transmitter_fifo|read_address\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \transmitter_fifo|read_address\(0),
	combout => \transmitter_fifo|memory_inst|ram_rtl_0_bypass[2]~0_combout\);

-- Location: FF_X50_Y63_N7
\transmitter_fifo|memory_inst|ram_rtl_0_bypass[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_fifo|memory_inst|ram_rtl_0_bypass[2]~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \transmitter_fifo|rd_int~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_fifo|memory_inst|ram_rtl_0_bypass\(2));

-- Location: FF_X50_Y63_N3
\transmitter_fifo|memory_inst|ram_rtl_0_bypass[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \transmitter_fifo|write_address\(1),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_fifo|memory_inst|ram_rtl_0_bypass\(3));

-- Location: FF_X50_Y63_N13
\transmitter_fifo|memory_inst|ram_rtl_0_bypass[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \transmitter_fifo|Add0~1_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \transmitter_fifo|rd_int~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_fifo|memory_inst|ram_rtl_0_bypass\(4));

-- Location: LCCOMB_X50_Y63_N0
\transmitter_fifo|memory_inst|ram_rtl_0_bypass[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_fifo|memory_inst|ram_rtl_0_bypass[1]~feeder_combout\ = \transmitter_fifo|write_address\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \transmitter_fifo|write_address\(0),
	combout => \transmitter_fifo|memory_inst|ram_rtl_0_bypass[1]~feeder_combout\);

-- Location: FF_X50_Y63_N1
\transmitter_fifo|memory_inst|ram_rtl_0_bypass[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_fifo|memory_inst|ram_rtl_0_bypass[1]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_fifo|memory_inst|ram_rtl_0_bypass\(1));

-- Location: LCCOMB_X50_Y63_N12
\transmitter_fifo|memory_inst|ram~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_fifo|memory_inst|ram~23_combout\ = (\transmitter_fifo|memory_inst|ram_rtl_0_bypass\(2) & (\transmitter_fifo|memory_inst|ram_rtl_0_bypass\(1) & (\transmitter_fifo|memory_inst|ram_rtl_0_bypass\(3) $ 
-- (!\transmitter_fifo|memory_inst|ram_rtl_0_bypass\(4))))) # (!\transmitter_fifo|memory_inst|ram_rtl_0_bypass\(2) & (!\transmitter_fifo|memory_inst|ram_rtl_0_bypass\(1) & (\transmitter_fifo|memory_inst|ram_rtl_0_bypass\(3) $ 
-- (!\transmitter_fifo|memory_inst|ram_rtl_0_bypass\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \transmitter_fifo|memory_inst|ram_rtl_0_bypass\(2),
	datab => \transmitter_fifo|memory_inst|ram_rtl_0_bypass\(3),
	datac => \transmitter_fifo|memory_inst|ram_rtl_0_bypass\(4),
	datad => \transmitter_fifo|memory_inst|ram_rtl_0_bypass\(1),
	combout => \transmitter_fifo|memory_inst|ram~23_combout\);

-- Location: LCCOMB_X50_Y63_N16
\transmitter_fifo|memory_inst|ram~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_fifo|memory_inst|ram~25_combout\ = (\transmitter_fifo|memory_inst|ram~24_combout\ & (\transmitter_fifo|memory_inst|ram_rtl_0_bypass\(0) & \transmitter_fifo|memory_inst|ram~23_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \transmitter_fifo|memory_inst|ram~24_combout\,
	datac => \transmitter_fifo|memory_inst|ram_rtl_0_bypass\(0),
	datad => \transmitter_fifo|memory_inst|ram~23_combout\,
	combout => \transmitter_fifo|memory_inst|ram~25_combout\);

-- Location: LCCOMB_X49_Y62_N2
\transmitter_fifo|memory_inst|ram~13feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_fifo|memory_inst|ram~13feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \transmitter_fifo|memory_inst|ram~13feeder_combout\);

-- Location: FF_X49_Y62_N3
\transmitter_fifo|memory_inst|ram~13\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_fifo|memory_inst|ram~13feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \transmitter_fifo|rd_int~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_fifo|memory_inst|ram~13_q\);

-- Location: IOIBUF_X52_Y73_N1
\tx_data[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_tx_data(1),
	o => \tx_data[1]~input_o\);

-- Location: LCCOMB_X49_Y63_N30
\transmitter_fifo|memory_inst|ram~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_fifo|memory_inst|ram~29_combout\ = (\tx_wr~input_o\ & (!\transmitter_fifo|full_int~q\ & (!\transmitter_fifo|write_address\(3) & !\transmitter_fifo|write_address\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tx_wr~input_o\,
	datab => \transmitter_fifo|full_int~q\,
	datac => \transmitter_fifo|write_address\(3),
	datad => \transmitter_fifo|write_address\(2),
	combout => \transmitter_fifo|memory_inst|ram~29_combout\);

-- Location: LCCOMB_X50_Y63_N30
\transmitter_fifo|memory_inst|ram~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_fifo|memory_inst|ram~30_combout\ = (!\transmitter_fifo|write_address\(0) & (!\transmitter_fifo|write_address\(1) & \transmitter_fifo|memory_inst|ram~29_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \transmitter_fifo|write_address\(0),
	datab => \transmitter_fifo|write_address\(1),
	datad => \transmitter_fifo|memory_inst|ram~29_combout\,
	combout => \transmitter_fifo|memory_inst|ram~30_combout\);

-- Location: FF_X50_Y62_N21
\transmitter_fifo|memory_inst|ram~15\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \tx_data[1]~input_o\,
	sload => VCC,
	ena => \transmitter_fifo|memory_inst|ram~30_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_fifo|memory_inst|ram~15_q\);

-- Location: IOIBUF_X54_Y73_N1
\tx_data[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_tx_data(0),
	o => \tx_data[0]~input_o\);

-- Location: LCCOMB_X50_Y63_N20
\transmitter_fifo|read_address[0]~_wirecell\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_fifo|read_address[0]~_wirecell_combout\ = !\transmitter_fifo|read_address\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \transmitter_fifo|read_address\(0),
	combout => \transmitter_fifo|read_address[0]~_wirecell_combout\);

-- Location: LCCOMB_X50_Y62_N30
\~QUARTUS_CREATED_GND~I\ : cycloneive_lcell_comb
-- Equation(s):
-- \~QUARTUS_CREATED_GND~I_combout\ = GND

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \~QUARTUS_CREATED_GND~I_combout\);

-- Location: IOIBUF_X60_Y73_N8
\tx_data[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_tx_data(2),
	o => \tx_data[2]~input_o\);

-- Location: IOIBUF_X58_Y73_N8
\tx_data[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_tx_data(3),
	o => \tx_data[3]~input_o\);

-- Location: IOIBUF_X58_Y73_N22
\tx_data[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_tx_data(4),
	o => \tx_data[4]~input_o\);

-- Location: IOIBUF_X52_Y73_N8
\tx_data[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_tx_data(5),
	o => \tx_data[5]~input_o\);

-- Location: IOIBUF_X54_Y73_N8
\tx_data[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_tx_data(6),
	o => \tx_data[6]~input_o\);

-- Location: IOIBUF_X52_Y73_N15
\tx_data[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_tx_data(7),
	o => \tx_data[7]~input_o\);

-- Location: M9K_X51_Y63_N0
\transmitter_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a0\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => X"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/serial_port.ram0_dp_ram_1c1r1w_e3f5f569.hdl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "fifo_1c1r1w:transmitter_fifo|dp_ram_1c1r1w:memory_inst|altsyncram:ram_rtl_0|altsyncram_4pn1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 4,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 36,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 15,
	port_a_logical_ram_depth => 16,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 4,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 36,
	port_b_first_address => 0,
	port_b_first_bit_number => 0,
	port_b_last_address => 15,
	port_b_logical_ram_depth => 16,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "new_data_with_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \transmitter_fifo|wr_int~combout\,
	portbre => VCC,
	portbaddrstall => \transmitter_fifo|ALT_INV_rd_int~combout\,
	clk0 => \clk~inputclkctrl_outclk\,
	portadatain => \transmitter_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\,
	portaaddr => \transmitter_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\,
	portbaddr => \transmitter_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \transmitter_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\);

-- Location: LCCOMB_X50_Y62_N20
\transmitter_fifo|memory_inst|ram~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_fifo|memory_inst|ram~27_combout\ = (\transmitter_fifo|memory_inst|ram~13_q\ & ((\transmitter_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a1\))) # (!\transmitter_fifo|memory_inst|ram~13_q\ & (\transmitter_fifo|memory_inst|ram~15_q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \transmitter_fifo|memory_inst|ram~13_q\,
	datac => \transmitter_fifo|memory_inst|ram~15_q\,
	datad => \transmitter_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a1\,
	combout => \transmitter_fifo|memory_inst|ram~27_combout\);

-- Location: LCCOMB_X52_Y62_N10
\transmitter_fifo|memory_inst|ram_rtl_0_bypass[11]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_fifo|memory_inst|ram_rtl_0_bypass[11]~feeder_combout\ = \tx_data[1]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \tx_data[1]~input_o\,
	combout => \transmitter_fifo|memory_inst|ram_rtl_0_bypass[11]~feeder_combout\);

-- Location: FF_X52_Y62_N11
\transmitter_fifo|memory_inst|ram_rtl_0_bypass[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_fifo|memory_inst|ram_rtl_0_bypass[11]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_fifo|memory_inst|ram_rtl_0_bypass\(11));

-- Location: LCCOMB_X52_Y62_N16
\transmitter_fifo|memory_inst|ram~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_fifo|memory_inst|ram~28_combout\ = (\transmitter_fifo|memory_inst|ram_rtl_0_bypass\(12) & ((\transmitter_fifo|memory_inst|ram~25_combout\ & ((\transmitter_fifo|memory_inst|ram_rtl_0_bypass\(11)))) # 
-- (!\transmitter_fifo|memory_inst|ram~25_combout\ & (\transmitter_fifo|memory_inst|ram~27_combout\)))) # (!\transmitter_fifo|memory_inst|ram_rtl_0_bypass\(12) & (((\transmitter_fifo|memory_inst|ram_rtl_0_bypass\(11)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \transmitter_fifo|memory_inst|ram_rtl_0_bypass\(12),
	datab => \transmitter_fifo|memory_inst|ram~25_combout\,
	datac => \transmitter_fifo|memory_inst|ram~27_combout\,
	datad => \transmitter_fifo|memory_inst|ram_rtl_0_bypass\(11),
	combout => \transmitter_fifo|memory_inst|ram~28_combout\);

-- Location: FF_X52_Y62_N17
\transmitter_fifo|memory_inst|rd1_data[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_fifo|memory_inst|ram~28_combout\,
	ena => \transmitter_fifo|rd_int~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_fifo|memory_inst|rd1_data\(1));

-- Location: LCCOMB_X48_Y62_N2
\transmitter_fifo|memory_inst|ram_rtl_0_bypass[14]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_fifo|memory_inst|ram_rtl_0_bypass[14]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \transmitter_fifo|memory_inst|ram_rtl_0_bypass[14]~feeder_combout\);

-- Location: FF_X48_Y62_N3
\transmitter_fifo|memory_inst|ram_rtl_0_bypass[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_fifo|memory_inst|ram_rtl_0_bypass[14]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_fifo|memory_inst|ram_rtl_0_bypass\(14));

-- Location: FF_X50_Y62_N9
\transmitter_fifo|memory_inst|ram~16\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \tx_data[2]~input_o\,
	sload => VCC,
	ena => \transmitter_fifo|memory_inst|ram~30_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_fifo|memory_inst|ram~16_q\);

-- Location: LCCOMB_X50_Y62_N8
\transmitter_fifo|memory_inst|ram~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_fifo|memory_inst|ram~31_combout\ = (\transmitter_fifo|memory_inst|ram~13_q\ & ((\transmitter_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a2\))) # (!\transmitter_fifo|memory_inst|ram~13_q\ & (\transmitter_fifo|memory_inst|ram~16_q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \transmitter_fifo|memory_inst|ram~13_q\,
	datac => \transmitter_fifo|memory_inst|ram~16_q\,
	datad => \transmitter_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a2\,
	combout => \transmitter_fifo|memory_inst|ram~31_combout\);

-- Location: FF_X50_Y62_N7
\transmitter_fifo|memory_inst|ram_rtl_0_bypass[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \tx_data[2]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_fifo|memory_inst|ram_rtl_0_bypass\(13));

-- Location: LCCOMB_X49_Y62_N6
\transmitter_fifo|memory_inst|ram~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_fifo|memory_inst|ram~32_combout\ = (\transmitter_fifo|memory_inst|ram_rtl_0_bypass\(14) & ((\transmitter_fifo|memory_inst|ram~25_combout\ & ((\transmitter_fifo|memory_inst|ram_rtl_0_bypass\(13)))) # 
-- (!\transmitter_fifo|memory_inst|ram~25_combout\ & (\transmitter_fifo|memory_inst|ram~31_combout\)))) # (!\transmitter_fifo|memory_inst|ram_rtl_0_bypass\(14) & (((\transmitter_fifo|memory_inst|ram_rtl_0_bypass\(13)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \transmitter_fifo|memory_inst|ram_rtl_0_bypass\(14),
	datab => \transmitter_fifo|memory_inst|ram~25_combout\,
	datac => \transmitter_fifo|memory_inst|ram~31_combout\,
	datad => \transmitter_fifo|memory_inst|ram_rtl_0_bypass\(13),
	combout => \transmitter_fifo|memory_inst|ram~32_combout\);

-- Location: FF_X49_Y62_N7
\transmitter_fifo|memory_inst|rd1_data[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_fifo|memory_inst|ram~32_combout\,
	ena => \transmitter_fifo|rd_int~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_fifo|memory_inst|rd1_data\(2));

-- Location: LCCOMB_X48_Y62_N14
\transmitter_fifo|memory_inst|ram_rtl_0_bypass[18]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_fifo|memory_inst|ram_rtl_0_bypass[18]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \transmitter_fifo|memory_inst|ram_rtl_0_bypass[18]~feeder_combout\);

-- Location: FF_X48_Y62_N15
\transmitter_fifo|memory_inst|ram_rtl_0_bypass[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_fifo|memory_inst|ram_rtl_0_bypass[18]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_fifo|memory_inst|ram_rtl_0_bypass\(18));

-- Location: FF_X50_Y62_N25
\transmitter_fifo|memory_inst|ram~18\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \tx_data[4]~input_o\,
	sload => VCC,
	ena => \transmitter_fifo|memory_inst|ram~30_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_fifo|memory_inst|ram~18_q\);

-- Location: LCCOMB_X50_Y62_N24
\transmitter_fifo|memory_inst|ram~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_fifo|memory_inst|ram~35_combout\ = (\transmitter_fifo|memory_inst|ram~13_q\ & ((\transmitter_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a4\))) # (!\transmitter_fifo|memory_inst|ram~13_q\ & (\transmitter_fifo|memory_inst|ram~18_q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \transmitter_fifo|memory_inst|ram~13_q\,
	datac => \transmitter_fifo|memory_inst|ram~18_q\,
	datad => \transmitter_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a4\,
	combout => \transmitter_fifo|memory_inst|ram~35_combout\);

-- Location: FF_X50_Y62_N31
\transmitter_fifo|memory_inst|ram_rtl_0_bypass[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \tx_data[4]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_fifo|memory_inst|ram_rtl_0_bypass\(17));

-- Location: LCCOMB_X49_Y62_N30
\transmitter_fifo|memory_inst|ram~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_fifo|memory_inst|ram~36_combout\ = (\transmitter_fifo|memory_inst|ram_rtl_0_bypass\(18) & ((\transmitter_fifo|memory_inst|ram~25_combout\ & ((\transmitter_fifo|memory_inst|ram_rtl_0_bypass\(17)))) # 
-- (!\transmitter_fifo|memory_inst|ram~25_combout\ & (\transmitter_fifo|memory_inst|ram~35_combout\)))) # (!\transmitter_fifo|memory_inst|ram_rtl_0_bypass\(18) & (((\transmitter_fifo|memory_inst|ram_rtl_0_bypass\(17)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \transmitter_fifo|memory_inst|ram_rtl_0_bypass\(18),
	datab => \transmitter_fifo|memory_inst|ram~35_combout\,
	datac => \transmitter_fifo|memory_inst|ram~25_combout\,
	datad => \transmitter_fifo|memory_inst|ram_rtl_0_bypass\(17),
	combout => \transmitter_fifo|memory_inst|ram~36_combout\);

-- Location: FF_X49_Y62_N31
\transmitter_fifo|memory_inst|rd1_data[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_fifo|memory_inst|ram~36_combout\,
	ena => \transmitter_fifo|rd_int~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_fifo|memory_inst|rd1_data\(4));

-- Location: LCCOMB_X50_Y62_N2
\transmitter_fifo|memory_inst|ram_rtl_0_bypass[19]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_fifo|memory_inst|ram_rtl_0_bypass[19]~feeder_combout\ = \tx_data[5]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \tx_data[5]~input_o\,
	combout => \transmitter_fifo|memory_inst|ram_rtl_0_bypass[19]~feeder_combout\);

-- Location: FF_X50_Y62_N3
\transmitter_fifo|memory_inst|ram_rtl_0_bypass[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_fifo|memory_inst|ram_rtl_0_bypass[19]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_fifo|memory_inst|ram_rtl_0_bypass\(19));

-- Location: FF_X50_Y62_N13
\transmitter_fifo|memory_inst|ram~19\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \tx_data[5]~input_o\,
	sload => VCC,
	ena => \transmitter_fifo|memory_inst|ram~30_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_fifo|memory_inst|ram~19_q\);

-- Location: LCCOMB_X50_Y62_N12
\transmitter_fifo|memory_inst|ram~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_fifo|memory_inst|ram~37_combout\ = (\transmitter_fifo|memory_inst|ram~13_q\ & ((\transmitter_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a5\))) # (!\transmitter_fifo|memory_inst|ram~13_q\ & (\transmitter_fifo|memory_inst|ram~19_q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \transmitter_fifo|memory_inst|ram~13_q\,
	datac => \transmitter_fifo|memory_inst|ram~19_q\,
	datad => \transmitter_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a5\,
	combout => \transmitter_fifo|memory_inst|ram~37_combout\);

-- Location: LCCOMB_X50_Y62_N22
\transmitter_fifo|memory_inst|ram_rtl_0_bypass[20]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_fifo|memory_inst|ram_rtl_0_bypass[20]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \transmitter_fifo|memory_inst|ram_rtl_0_bypass[20]~feeder_combout\);

-- Location: FF_X50_Y62_N23
\transmitter_fifo|memory_inst|ram_rtl_0_bypass[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_fifo|memory_inst|ram_rtl_0_bypass[20]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_fifo|memory_inst|ram_rtl_0_bypass\(20));

-- Location: LCCOMB_X49_Y62_N10
\transmitter_fifo|memory_inst|ram~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_fifo|memory_inst|ram~38_combout\ = (\transmitter_fifo|memory_inst|ram~25_combout\ & (\transmitter_fifo|memory_inst|ram_rtl_0_bypass\(19))) # (!\transmitter_fifo|memory_inst|ram~25_combout\ & 
-- ((\transmitter_fifo|memory_inst|ram_rtl_0_bypass\(20) & ((\transmitter_fifo|memory_inst|ram~37_combout\))) # (!\transmitter_fifo|memory_inst|ram_rtl_0_bypass\(20) & (\transmitter_fifo|memory_inst|ram_rtl_0_bypass\(19)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \transmitter_fifo|memory_inst|ram_rtl_0_bypass\(19),
	datab => \transmitter_fifo|memory_inst|ram~37_combout\,
	datac => \transmitter_fifo|memory_inst|ram~25_combout\,
	datad => \transmitter_fifo|memory_inst|ram_rtl_0_bypass\(20),
	combout => \transmitter_fifo|memory_inst|ram~38_combout\);

-- Location: FF_X49_Y62_N11
\transmitter_fifo|memory_inst|rd1_data[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_fifo|memory_inst|ram~38_combout\,
	ena => \transmitter_fifo|rd_int~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_fifo|memory_inst|rd1_data\(5));

-- Location: FF_X50_Y62_N29
\transmitter_fifo|memory_inst|ram~21\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \tx_data[7]~input_o\,
	sload => VCC,
	ena => \transmitter_fifo|memory_inst|ram~30_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_fifo|memory_inst|ram~21_q\);

-- Location: LCCOMB_X50_Y62_N28
\transmitter_fifo|memory_inst|ram~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_fifo|memory_inst|ram~41_combout\ = (\transmitter_fifo|memory_inst|ram~13_q\ & ((\transmitter_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a7\))) # (!\transmitter_fifo|memory_inst|ram~13_q\ & (\transmitter_fifo|memory_inst|ram~21_q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \transmitter_fifo|memory_inst|ram~13_q\,
	datac => \transmitter_fifo|memory_inst|ram~21_q\,
	datad => \transmitter_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a7\,
	combout => \transmitter_fifo|memory_inst|ram~41_combout\);

-- Location: LCCOMB_X52_Y62_N26
\transmitter_fifo|memory_inst|ram_rtl_0_bypass[24]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_fifo|memory_inst|ram_rtl_0_bypass[24]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \transmitter_fifo|memory_inst|ram_rtl_0_bypass[24]~feeder_combout\);

-- Location: FF_X52_Y62_N27
\transmitter_fifo|memory_inst|ram_rtl_0_bypass[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_fifo|memory_inst|ram_rtl_0_bypass[24]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_fifo|memory_inst|ram_rtl_0_bypass\(24));

-- Location: LCCOMB_X52_Y62_N24
\transmitter_fifo|memory_inst|ram_rtl_0_bypass[23]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_fifo|memory_inst|ram_rtl_0_bypass[23]~feeder_combout\ = \tx_data[7]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \tx_data[7]~input_o\,
	combout => \transmitter_fifo|memory_inst|ram_rtl_0_bypass[23]~feeder_combout\);

-- Location: FF_X52_Y62_N25
\transmitter_fifo|memory_inst|ram_rtl_0_bypass[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_fifo|memory_inst|ram_rtl_0_bypass[23]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_fifo|memory_inst|ram_rtl_0_bypass\(23));

-- Location: LCCOMB_X52_Y62_N6
\transmitter_fifo|memory_inst|ram~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_fifo|memory_inst|ram~42_combout\ = (\transmitter_fifo|memory_inst|ram~25_combout\ & (((\transmitter_fifo|memory_inst|ram_rtl_0_bypass\(23))))) # (!\transmitter_fifo|memory_inst|ram~25_combout\ & 
-- ((\transmitter_fifo|memory_inst|ram_rtl_0_bypass\(24) & (\transmitter_fifo|memory_inst|ram~41_combout\)) # (!\transmitter_fifo|memory_inst|ram_rtl_0_bypass\(24) & ((\transmitter_fifo|memory_inst|ram_rtl_0_bypass\(23))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \transmitter_fifo|memory_inst|ram~25_combout\,
	datab => \transmitter_fifo|memory_inst|ram~41_combout\,
	datac => \transmitter_fifo|memory_inst|ram_rtl_0_bypass\(24),
	datad => \transmitter_fifo|memory_inst|ram_rtl_0_bypass\(23),
	combout => \transmitter_fifo|memory_inst|ram~42_combout\);

-- Location: FF_X52_Y62_N7
\transmitter_fifo|memory_inst|rd1_data[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_fifo|memory_inst|ram~42_combout\,
	ena => \transmitter_fifo|rd_int~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_fifo|memory_inst|rd1_data\(7));

-- Location: LCCOMB_X48_Y62_N16
\transmitter_inst|transmit_data[7]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_inst|transmit_data[7]~1_combout\ = (\res_n~input_o\ & ((\transmitter_inst|transmitter_state.TRANSMIT_FIRST~q\ & (\transmitter_fifo|memory_inst|rd1_data\(7))) # (!\transmitter_inst|transmitter_state.TRANSMIT_FIRST~q\ & 
-- ((\transmitter_inst|transmit_data\(7)))))) # (!\res_n~input_o\ & (((\transmitter_inst|transmit_data\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \transmitter_fifo|memory_inst|rd1_data\(7),
	datab => \res_n~input_o\,
	datac => \transmitter_inst|transmit_data\(7),
	datad => \transmitter_inst|transmitter_state.TRANSMIT_FIRST~q\,
	combout => \transmitter_inst|transmit_data[7]~1_combout\);

-- Location: FF_X48_Y62_N17
\transmitter_inst|transmit_data[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_inst|transmit_data[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_inst|transmit_data\(7));

-- Location: LCCOMB_X48_Y62_N10
\transmitter_fifo|memory_inst|ram_rtl_0_bypass[22]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_fifo|memory_inst|ram_rtl_0_bypass[22]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \transmitter_fifo|memory_inst|ram_rtl_0_bypass[22]~feeder_combout\);

-- Location: FF_X48_Y62_N11
\transmitter_fifo|memory_inst|ram_rtl_0_bypass[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_fifo|memory_inst|ram_rtl_0_bypass[22]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_fifo|memory_inst|ram_rtl_0_bypass\(22));

-- Location: LCCOMB_X50_Y62_N16
\transmitter_fifo|memory_inst|ram_rtl_0_bypass[21]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_fifo|memory_inst|ram_rtl_0_bypass[21]~feeder_combout\ = \tx_data[6]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \tx_data[6]~input_o\,
	combout => \transmitter_fifo|memory_inst|ram_rtl_0_bypass[21]~feeder_combout\);

-- Location: FF_X50_Y62_N17
\transmitter_fifo|memory_inst|ram_rtl_0_bypass[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_fifo|memory_inst|ram_rtl_0_bypass[21]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_fifo|memory_inst|ram_rtl_0_bypass\(21));

-- Location: FF_X50_Y62_N19
\transmitter_fifo|memory_inst|ram~20\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \tx_data[6]~input_o\,
	sload => VCC,
	ena => \transmitter_fifo|memory_inst|ram~30_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_fifo|memory_inst|ram~20_q\);

-- Location: LCCOMB_X50_Y62_N18
\transmitter_fifo|memory_inst|ram~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_fifo|memory_inst|ram~39_combout\ = (\transmitter_fifo|memory_inst|ram~13_q\ & (\transmitter_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a6\)) # (!\transmitter_fifo|memory_inst|ram~13_q\ & ((\transmitter_fifo|memory_inst|ram~20_q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \transmitter_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a6\,
	datac => \transmitter_fifo|memory_inst|ram~20_q\,
	datad => \transmitter_fifo|memory_inst|ram~13_q\,
	combout => \transmitter_fifo|memory_inst|ram~39_combout\);

-- Location: LCCOMB_X49_Y62_N12
\transmitter_fifo|memory_inst|ram~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_fifo|memory_inst|ram~40_combout\ = (\transmitter_fifo|memory_inst|ram_rtl_0_bypass\(22) & ((\transmitter_fifo|memory_inst|ram~25_combout\ & (\transmitter_fifo|memory_inst|ram_rtl_0_bypass\(21))) # 
-- (!\transmitter_fifo|memory_inst|ram~25_combout\ & ((\transmitter_fifo|memory_inst|ram~39_combout\))))) # (!\transmitter_fifo|memory_inst|ram_rtl_0_bypass\(22) & (\transmitter_fifo|memory_inst|ram_rtl_0_bypass\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \transmitter_fifo|memory_inst|ram_rtl_0_bypass\(22),
	datab => \transmitter_fifo|memory_inst|ram_rtl_0_bypass\(21),
	datac => \transmitter_fifo|memory_inst|ram~25_combout\,
	datad => \transmitter_fifo|memory_inst|ram~39_combout\,
	combout => \transmitter_fifo|memory_inst|ram~40_combout\);

-- Location: FF_X49_Y62_N13
\transmitter_fifo|memory_inst|rd1_data[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_fifo|memory_inst|ram~40_combout\,
	ena => \transmitter_fifo|rd_int~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_fifo|memory_inst|rd1_data\(6));

-- Location: LCCOMB_X49_Y62_N16
\transmitter_inst|Selector22~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_inst|Selector22~0_combout\ = (\transmitter_inst|transmitter_state.TRANSMIT_NEXT~q\ & (\transmitter_inst|transmit_data\(7))) # (!\transmitter_inst|transmitter_state.TRANSMIT_NEXT~q\ & ((\transmitter_fifo|memory_inst|rd1_data\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \transmitter_inst|transmitter_state.TRANSMIT_NEXT~q\,
	datac => \transmitter_inst|transmit_data\(7),
	datad => \transmitter_fifo|memory_inst|rd1_data\(6),
	combout => \transmitter_inst|Selector22~0_combout\);

-- Location: LCCOMB_X49_Y62_N22
\transmitter_inst|transmit_data[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_inst|transmit_data[0]~0_combout\ = (\res_n~input_o\ & ((\transmitter_inst|transmitter_state.TRANSMIT_FIRST~q\) # (\transmitter_inst|transmitter_state.TRANSMIT_NEXT~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \transmitter_inst|transmitter_state.TRANSMIT_FIRST~q\,
	datab => \transmitter_inst|transmitter_state.TRANSMIT_NEXT~q\,
	datac => \res_n~input_o\,
	combout => \transmitter_inst|transmit_data[0]~0_combout\);

-- Location: FF_X49_Y62_N17
\transmitter_inst|transmit_data[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_inst|Selector22~0_combout\,
	ena => \transmitter_inst|transmit_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_inst|transmit_data\(6));

-- Location: LCCOMB_X49_Y62_N28
\transmitter_inst|Selector23~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_inst|Selector23~0_combout\ = (\transmitter_inst|transmitter_state.TRANSMIT_NEXT~q\ & ((\transmitter_inst|transmit_data\(6)))) # (!\transmitter_inst|transmitter_state.TRANSMIT_NEXT~q\ & (\transmitter_fifo|memory_inst|rd1_data\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \transmitter_fifo|memory_inst|rd1_data\(5),
	datab => \transmitter_inst|transmitter_state.TRANSMIT_NEXT~q\,
	datad => \transmitter_inst|transmit_data\(6),
	combout => \transmitter_inst|Selector23~0_combout\);

-- Location: FF_X49_Y62_N29
\transmitter_inst|transmit_data[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_inst|Selector23~0_combout\,
	ena => \transmitter_inst|transmit_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_inst|transmit_data\(5));

-- Location: LCCOMB_X49_Y62_N8
\transmitter_inst|Selector24~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_inst|Selector24~0_combout\ = (\transmitter_inst|transmitter_state.TRANSMIT_NEXT~q\ & ((\transmitter_inst|transmit_data\(5)))) # (!\transmitter_inst|transmitter_state.TRANSMIT_NEXT~q\ & (\transmitter_fifo|memory_inst|rd1_data\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \transmitter_inst|transmitter_state.TRANSMIT_NEXT~q\,
	datac => \transmitter_fifo|memory_inst|rd1_data\(4),
	datad => \transmitter_inst|transmit_data\(5),
	combout => \transmitter_inst|Selector24~0_combout\);

-- Location: FF_X49_Y62_N9
\transmitter_inst|transmit_data[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_inst|Selector24~0_combout\,
	ena => \transmitter_inst|transmit_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_inst|transmit_data\(4));

-- Location: LCCOMB_X48_Y62_N12
\transmitter_fifo|memory_inst|ram_rtl_0_bypass[16]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_fifo|memory_inst|ram_rtl_0_bypass[16]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \transmitter_fifo|memory_inst|ram_rtl_0_bypass[16]~feeder_combout\);

-- Location: FF_X48_Y62_N13
\transmitter_fifo|memory_inst|ram_rtl_0_bypass[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_fifo|memory_inst|ram_rtl_0_bypass[16]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_fifo|memory_inst|ram_rtl_0_bypass\(16));

-- Location: LCCOMB_X50_Y62_N26
\transmitter_fifo|memory_inst|ram_rtl_0_bypass[15]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_fifo|memory_inst|ram_rtl_0_bypass[15]~feeder_combout\ = \tx_data[3]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \tx_data[3]~input_o\,
	combout => \transmitter_fifo|memory_inst|ram_rtl_0_bypass[15]~feeder_combout\);

-- Location: FF_X50_Y62_N27
\transmitter_fifo|memory_inst|ram_rtl_0_bypass[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_fifo|memory_inst|ram_rtl_0_bypass[15]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_fifo|memory_inst|ram_rtl_0_bypass\(15));

-- Location: FF_X50_Y62_N5
\transmitter_fifo|memory_inst|ram~17\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \tx_data[3]~input_o\,
	sload => VCC,
	ena => \transmitter_fifo|memory_inst|ram~30_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_fifo|memory_inst|ram~17_q\);

-- Location: LCCOMB_X50_Y62_N4
\transmitter_fifo|memory_inst|ram~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_fifo|memory_inst|ram~33_combout\ = (\transmitter_fifo|memory_inst|ram~13_q\ & ((\transmitter_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a3\))) # (!\transmitter_fifo|memory_inst|ram~13_q\ & (\transmitter_fifo|memory_inst|ram~17_q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \transmitter_fifo|memory_inst|ram~13_q\,
	datac => \transmitter_fifo|memory_inst|ram~17_q\,
	datad => \transmitter_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a3\,
	combout => \transmitter_fifo|memory_inst|ram~33_combout\);

-- Location: LCCOMB_X49_Y62_N18
\transmitter_fifo|memory_inst|ram~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_fifo|memory_inst|ram~34_combout\ = (\transmitter_fifo|memory_inst|ram_rtl_0_bypass\(16) & ((\transmitter_fifo|memory_inst|ram~25_combout\ & (\transmitter_fifo|memory_inst|ram_rtl_0_bypass\(15))) # 
-- (!\transmitter_fifo|memory_inst|ram~25_combout\ & ((\transmitter_fifo|memory_inst|ram~33_combout\))))) # (!\transmitter_fifo|memory_inst|ram_rtl_0_bypass\(16) & (((\transmitter_fifo|memory_inst|ram_rtl_0_bypass\(15)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \transmitter_fifo|memory_inst|ram_rtl_0_bypass\(16),
	datab => \transmitter_fifo|memory_inst|ram~25_combout\,
	datac => \transmitter_fifo|memory_inst|ram_rtl_0_bypass\(15),
	datad => \transmitter_fifo|memory_inst|ram~33_combout\,
	combout => \transmitter_fifo|memory_inst|ram~34_combout\);

-- Location: FF_X49_Y62_N19
\transmitter_fifo|memory_inst|rd1_data[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_fifo|memory_inst|ram~34_combout\,
	ena => \transmitter_fifo|rd_int~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_fifo|memory_inst|rd1_data\(3));

-- Location: LCCOMB_X49_Y62_N4
\transmitter_inst|Selector25~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_inst|Selector25~0_combout\ = (\transmitter_inst|transmitter_state.TRANSMIT_NEXT~q\ & (\transmitter_inst|transmit_data\(4))) # (!\transmitter_inst|transmitter_state.TRANSMIT_NEXT~q\ & ((\transmitter_fifo|memory_inst|rd1_data\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \transmitter_inst|transmitter_state.TRANSMIT_NEXT~q\,
	datac => \transmitter_inst|transmit_data\(4),
	datad => \transmitter_fifo|memory_inst|rd1_data\(3),
	combout => \transmitter_inst|Selector25~0_combout\);

-- Location: FF_X49_Y62_N5
\transmitter_inst|transmit_data[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_inst|Selector25~0_combout\,
	ena => \transmitter_inst|transmit_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_inst|transmit_data\(3));

-- Location: LCCOMB_X49_Y62_N24
\transmitter_inst|Selector26~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_inst|Selector26~0_combout\ = (\transmitter_inst|transmitter_state.TRANSMIT_NEXT~q\ & ((\transmitter_inst|transmit_data\(3)))) # (!\transmitter_inst|transmitter_state.TRANSMIT_NEXT~q\ & (\transmitter_fifo|memory_inst|rd1_data\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \transmitter_fifo|memory_inst|rd1_data\(2),
	datab => \transmitter_inst|transmitter_state.TRANSMIT_NEXT~q\,
	datac => \transmitter_inst|transmit_data\(3),
	combout => \transmitter_inst|Selector26~0_combout\);

-- Location: FF_X49_Y62_N25
\transmitter_inst|transmit_data[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_inst|Selector26~0_combout\,
	ena => \transmitter_inst|transmit_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_inst|transmit_data\(2));

-- Location: LCCOMB_X49_Y62_N26
\transmitter_inst|Selector27~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_inst|Selector27~0_combout\ = (\transmitter_inst|transmitter_state.TRANSMIT_NEXT~q\ & ((\transmitter_inst|transmit_data\(2)))) # (!\transmitter_inst|transmitter_state.TRANSMIT_NEXT~q\ & (\transmitter_fifo|memory_inst|rd1_data\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \transmitter_inst|transmitter_state.TRANSMIT_NEXT~q\,
	datac => \transmitter_fifo|memory_inst|rd1_data\(1),
	datad => \transmitter_inst|transmit_data\(2),
	combout => \transmitter_inst|Selector27~0_combout\);

-- Location: FF_X49_Y62_N27
\transmitter_inst|transmit_data[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_inst|Selector27~0_combout\,
	ena => \transmitter_inst|transmit_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_inst|transmit_data\(1));

-- Location: LCCOMB_X48_Y62_N8
\transmitter_fifo|memory_inst|ram_rtl_0_bypass[10]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_fifo|memory_inst|ram_rtl_0_bypass[10]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \transmitter_fifo|memory_inst|ram_rtl_0_bypass[10]~feeder_combout\);

-- Location: FF_X48_Y62_N9
\transmitter_fifo|memory_inst|ram_rtl_0_bypass[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_fifo|memory_inst|ram_rtl_0_bypass[10]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_fifo|memory_inst|ram_rtl_0_bypass\(10));

-- Location: FF_X50_Y62_N1
\transmitter_fifo|memory_inst|ram_rtl_0_bypass[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \tx_data[0]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_fifo|memory_inst|ram_rtl_0_bypass\(9));

-- Location: FF_X50_Y62_N11
\transmitter_fifo|memory_inst|ram~14\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \tx_data[0]~input_o\,
	sload => VCC,
	ena => \transmitter_fifo|memory_inst|ram~30_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_fifo|memory_inst|ram~14_q\);

-- Location: LCCOMB_X50_Y62_N10
\transmitter_fifo|memory_inst|ram~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_fifo|memory_inst|ram~22_combout\ = (\transmitter_fifo|memory_inst|ram~13_q\ & ((\transmitter_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a0~portbdataout\))) # (!\transmitter_fifo|memory_inst|ram~13_q\ & 
-- (\transmitter_fifo|memory_inst|ram~14_q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \transmitter_fifo|memory_inst|ram~13_q\,
	datac => \transmitter_fifo|memory_inst|ram~14_q\,
	datad => \transmitter_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a0~portbdataout\,
	combout => \transmitter_fifo|memory_inst|ram~22_combout\);

-- Location: LCCOMB_X49_Y62_N20
\transmitter_fifo|memory_inst|ram~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_fifo|memory_inst|ram~26_combout\ = (\transmitter_fifo|memory_inst|ram_rtl_0_bypass\(10) & ((\transmitter_fifo|memory_inst|ram~25_combout\ & (\transmitter_fifo|memory_inst|ram_rtl_0_bypass\(9))) # 
-- (!\transmitter_fifo|memory_inst|ram~25_combout\ & ((\transmitter_fifo|memory_inst|ram~22_combout\))))) # (!\transmitter_fifo|memory_inst|ram_rtl_0_bypass\(10) & (\transmitter_fifo|memory_inst|ram_rtl_0_bypass\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \transmitter_fifo|memory_inst|ram_rtl_0_bypass\(10),
	datab => \transmitter_fifo|memory_inst|ram_rtl_0_bypass\(9),
	datac => \transmitter_fifo|memory_inst|ram~25_combout\,
	datad => \transmitter_fifo|memory_inst|ram~22_combout\,
	combout => \transmitter_fifo|memory_inst|ram~26_combout\);

-- Location: FF_X49_Y62_N21
\transmitter_fifo|memory_inst|rd1_data[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_fifo|memory_inst|ram~26_combout\,
	ena => \transmitter_fifo|rd_int~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_fifo|memory_inst|rd1_data\(0));

-- Location: LCCOMB_X49_Y62_N0
\transmitter_inst|Selector28~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_inst|Selector28~0_combout\ = (\transmitter_inst|transmitter_state.TRANSMIT_NEXT~q\ & (\transmitter_inst|transmit_data\(1))) # (!\transmitter_inst|transmitter_state.TRANSMIT_NEXT~q\ & ((\transmitter_fifo|memory_inst|rd1_data\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \transmitter_inst|transmitter_state.TRANSMIT_NEXT~q\,
	datac => \transmitter_inst|transmit_data\(1),
	datad => \transmitter_fifo|memory_inst|rd1_data\(0),
	combout => \transmitter_inst|Selector28~0_combout\);

-- Location: FF_X49_Y62_N1
\transmitter_inst|transmit_data[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \transmitter_inst|Selector28~0_combout\,
	ena => \transmitter_inst|transmit_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \transmitter_inst|transmit_data\(0));

-- Location: LCCOMB_X48_Y63_N14
\transmitter_inst|Selector21~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_inst|Selector21~0_combout\ = (\transmitter_inst|transmit_data\(0) & ((\transmitter_inst|transmitter_state.TRANSMIT_STOP_NEXT~q\) # ((\transmitter_inst|transmitter_state.TRANSMIT~q\) # (\transmitter_inst|transmitter_state.TRANSMIT_NEXT~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \transmitter_inst|transmitter_state.TRANSMIT_STOP_NEXT~q\,
	datab => \transmitter_inst|transmitter_state.TRANSMIT~q\,
	datac => \transmitter_inst|transmitter_state.TRANSMIT_NEXT~q\,
	datad => \transmitter_inst|transmit_data\(0),
	combout => \transmitter_inst|Selector21~0_combout\);

-- Location: LCCOMB_X48_Y63_N6
\transmitter_inst|Selector21~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \transmitter_inst|Selector21~1_combout\ = ((\transmitter_inst|transmitter_state.TRANSMIT_STOP~q\) # ((\transmitter_inst|Selector21~0_combout\) # (\transmitter_inst|transmitter_state.NEW_DATA~q\))) # (!\transmitter_inst|transmitter_state.IDLE~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \transmitter_inst|transmitter_state.IDLE~q\,
	datab => \transmitter_inst|transmitter_state.TRANSMIT_STOP~q\,
	datac => \transmitter_inst|Selector21~0_combout\,
	datad => \transmitter_inst|transmitter_state.NEW_DATA~q\,
	combout => \transmitter_inst|Selector21~1_combout\);

-- Location: IOIBUF_X27_Y73_N8
\rx~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rx,
	o => \rx~input_o\);

-- Location: LCCOMB_X20_Y47_N20
\rx_sync_inst|sync[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_sync_inst|sync[1]~0_combout\ = !\rx~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rx~input_o\,
	combout => \rx_sync_inst|sync[1]~0_combout\);

-- Location: FF_X20_Y47_N21
\rx_sync_inst|sync[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \rx_sync_inst|sync[1]~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rx_sync_inst|sync\(1));

-- Location: FF_X19_Y47_N5
\rx_sync_inst|sync[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \rx_sync_inst|sync\(1),
	clrn => \res_n~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rx_sync_inst|sync\(2));

-- Location: LCCOMB_X52_Y53_N14
\receiver_inst|data_int[7]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_inst|data_int[7]~1_combout\ = !\rx_sync_inst|sync\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rx_sync_inst|sync\(2),
	combout => \receiver_inst|data_int[7]~1_combout\);

-- Location: LCCOMB_X18_Y47_N2
\receiver_inst|clk_cnt[0]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_inst|clk_cnt[0]~13_combout\ = \receiver_inst|clk_cnt\(0) $ (VCC)
-- \receiver_inst|clk_cnt[0]~14\ = CARRY(\receiver_inst|clk_cnt\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \receiver_inst|clk_cnt\(0),
	datad => VCC,
	combout => \receiver_inst|clk_cnt[0]~13_combout\,
	cout => \receiver_inst|clk_cnt[0]~14\);

-- Location: LCCOMB_X18_Y47_N4
\receiver_inst|clk_cnt[1]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_inst|clk_cnt[1]~15_combout\ = (\receiver_inst|clk_cnt\(1) & (!\receiver_inst|clk_cnt[0]~14\)) # (!\receiver_inst|clk_cnt\(1) & ((\receiver_inst|clk_cnt[0]~14\) # (GND)))
-- \receiver_inst|clk_cnt[1]~16\ = CARRY((!\receiver_inst|clk_cnt[0]~14\) # (!\receiver_inst|clk_cnt\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \receiver_inst|clk_cnt\(1),
	datad => VCC,
	cin => \receiver_inst|clk_cnt[0]~14\,
	combout => \receiver_inst|clk_cnt[1]~15_combout\,
	cout => \receiver_inst|clk_cnt[1]~16\);

-- Location: LCCOMB_X19_Y47_N14
\receiver_inst|Selector3~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_inst|Selector3~2_combout\ = (!\receiver_inst|receiver_state.MIDDLE_OF_START_BIT~q\ & !\receiver_inst|receiver_state.MIDDLE_OF_DATA_BIT~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \receiver_inst|receiver_state.MIDDLE_OF_START_BIT~q\,
	datac => \receiver_inst|receiver_state.MIDDLE_OF_DATA_BIT~q\,
	combout => \receiver_inst|Selector3~2_combout\);

-- Location: LCCOMB_X19_Y47_N4
\receiver_inst|Selector1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_inst|Selector1~0_combout\ = (\receiver_inst|receiver_state.WAIT_START_BIT~q\ & (((!\receiver_inst|receiver_state.IDLE~q\ & !\receiver_inst|receiver_state.MIDDLE_OF_STOP_BIT~q\)) # (!\rx_sync_inst|sync\(2)))) # 
-- (!\receiver_inst|receiver_state.WAIT_START_BIT~q\ & (!\receiver_inst|receiver_state.IDLE~q\ & (!\rx_sync_inst|sync\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101100101011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_inst|receiver_state.WAIT_START_BIT~q\,
	datab => \receiver_inst|receiver_state.IDLE~q\,
	datac => \rx_sync_inst|sync\(2),
	datad => \receiver_inst|receiver_state.MIDDLE_OF_STOP_BIT~q\,
	combout => \receiver_inst|Selector1~0_combout\);

-- Location: LCCOMB_X19_Y47_N6
\receiver_inst|Selector1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_inst|Selector1~1_combout\ = (\receiver_inst|Selector3~2_combout\ & ((\receiver_inst|Selector1~0_combout\) # ((!\rx_sync_inst|sync\(2) & \receiver_inst|receiver_state.MIDDLE_OF_STOP_BIT~q\)))) # (!\receiver_inst|Selector3~2_combout\ & 
-- (((!\rx_sync_inst|sync\(2) & \receiver_inst|receiver_state.MIDDLE_OF_STOP_BIT~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_inst|Selector3~2_combout\,
	datab => \receiver_inst|Selector1~0_combout\,
	datac => \rx_sync_inst|sync\(2),
	datad => \receiver_inst|receiver_state.MIDDLE_OF_STOP_BIT~q\,
	combout => \receiver_inst|Selector1~1_combout\);

-- Location: FF_X19_Y47_N7
\receiver_inst|receiver_state.WAIT_START_BIT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_inst|Selector1~1_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_inst|receiver_state.WAIT_START_BIT~q\);

-- Location: LCCOMB_X20_Y47_N16
\receiver_inst|Selector8~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_inst|Selector8~0_combout\ = (\receiver_inst|Selector6~0_combout\) # ((\receiver_inst|bit_cnt\(2) & ((\receiver_inst|receiver_state.MIDDLE_OF_DATA_BIT~q\) # (!\receiver_inst|receiver_state.WAIT_START_BIT~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_inst|Selector6~0_combout\,
	datab => \receiver_inst|receiver_state.WAIT_START_BIT~q\,
	datac => \receiver_inst|bit_cnt\(2),
	datad => \receiver_inst|receiver_state.MIDDLE_OF_DATA_BIT~q\,
	combout => \receiver_inst|Selector8~0_combout\);

-- Location: FF_X20_Y47_N17
\receiver_inst|bit_cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_inst|Selector8~0_combout\,
	ena => \res_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_inst|bit_cnt\(2));

-- Location: LCCOMB_X20_Y47_N30
\receiver_inst|Selector9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_inst|Selector9~0_combout\ = (\receiver_inst|bit_cnt\(0) & ((!\receiver_inst|bit_cnt\(2)) # (!\receiver_inst|bit_cnt\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \receiver_inst|bit_cnt\(0),
	datac => \receiver_inst|bit_cnt\(1),
	datad => \receiver_inst|bit_cnt\(2),
	combout => \receiver_inst|Selector9~0_combout\);

-- Location: LCCOMB_X20_Y47_N2
\receiver_inst|Selector9~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_inst|Selector9~1_combout\ = (\receiver_inst|receiver_state.MIDDLE_OF_DATA_BIT~q\ & (\receiver_inst|Selector9~0_combout\ $ (((\receiver_inst|bit_cnt\(1)))))) # (!\receiver_inst|receiver_state.MIDDLE_OF_DATA_BIT~q\ & 
-- (((!\receiver_inst|receiver_state.WAIT_START_BIT~q\ & \receiver_inst|bit_cnt\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_inst|Selector9~0_combout\,
	datab => \receiver_inst|receiver_state.WAIT_START_BIT~q\,
	datac => \receiver_inst|bit_cnt\(1),
	datad => \receiver_inst|receiver_state.MIDDLE_OF_DATA_BIT~q\,
	combout => \receiver_inst|Selector9~1_combout\);

-- Location: FF_X20_Y47_N3
\receiver_inst|bit_cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_inst|Selector9~1_combout\,
	ena => \res_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_inst|bit_cnt\(1));

-- Location: LCCOMB_X20_Y47_N24
\receiver_inst|Selector10~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_inst|Selector10~0_combout\ = (\receiver_inst|receiver_state.MIDDLE_OF_DATA_BIT~q\ & (((\receiver_inst|bit_cnt\(1) & \receiver_inst|bit_cnt\(2))) # (!\receiver_inst|bit_cnt\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_inst|receiver_state.MIDDLE_OF_DATA_BIT~q\,
	datab => \receiver_inst|bit_cnt\(0),
	datac => \receiver_inst|bit_cnt\(1),
	datad => \receiver_inst|bit_cnt\(2),
	combout => \receiver_inst|Selector10~0_combout\);

-- Location: LCCOMB_X20_Y47_N28
\receiver_inst|Selector10~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_inst|Selector10~1_combout\ = (\receiver_inst|Selector10~0_combout\) # ((!\receiver_inst|receiver_state.MIDDLE_OF_DATA_BIT~q\ & (!\receiver_inst|receiver_state.WAIT_START_BIT~q\ & \receiver_inst|bit_cnt\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_inst|receiver_state.MIDDLE_OF_DATA_BIT~q\,
	datab => \receiver_inst|receiver_state.WAIT_START_BIT~q\,
	datac => \receiver_inst|bit_cnt\(0),
	datad => \receiver_inst|Selector10~0_combout\,
	combout => \receiver_inst|Selector10~1_combout\);

-- Location: FF_X20_Y47_N29
\receiver_inst|bit_cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_inst|Selector10~1_combout\,
	ena => \res_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_inst|bit_cnt\(0));

-- Location: LCCOMB_X20_Y47_N14
\receiver_inst|Selector6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_inst|Selector6~0_combout\ = (\receiver_inst|bit_cnt\(0) & (\receiver_inst|bit_cnt\(1) & \receiver_inst|receiver_state.MIDDLE_OF_DATA_BIT~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \receiver_inst|bit_cnt\(0),
	datac => \receiver_inst|bit_cnt\(1),
	datad => \receiver_inst|receiver_state.MIDDLE_OF_DATA_BIT~q\,
	combout => \receiver_inst|Selector6~0_combout\);

-- Location: LCCOMB_X20_Y47_N18
\receiver_inst|Selector6~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_inst|Selector6~1_combout\ = (\receiver_inst|Equal1~3_combout\ & (\receiver_inst|Selector6~0_combout\ & ((\receiver_inst|bit_cnt\(2))))) # (!\receiver_inst|Equal1~3_combout\ & ((\receiver_inst|receiver_state.WAIT_STOP_BIT~q\) # 
-- ((\receiver_inst|Selector6~0_combout\ & \receiver_inst|bit_cnt\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_inst|Equal1~3_combout\,
	datab => \receiver_inst|Selector6~0_combout\,
	datac => \receiver_inst|receiver_state.WAIT_STOP_BIT~q\,
	datad => \receiver_inst|bit_cnt\(2),
	combout => \receiver_inst|Selector6~1_combout\);

-- Location: FF_X20_Y47_N19
\receiver_inst|receiver_state.WAIT_STOP_BIT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_inst|Selector6~1_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_inst|receiver_state.WAIT_STOP_BIT~q\);

-- Location: LCCOMB_X20_Y47_N0
\receiver_inst|Selector7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_inst|Selector7~0_combout\ = (\receiver_inst|Equal1~3_combout\ & \receiver_inst|receiver_state.WAIT_STOP_BIT~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_inst|Equal1~3_combout\,
	datad => \receiver_inst|receiver_state.WAIT_STOP_BIT~q\,
	combout => \receiver_inst|Selector7~0_combout\);

-- Location: FF_X20_Y47_N1
\receiver_inst|receiver_state.MIDDLE_OF_STOP_BIT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_inst|Selector7~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_inst|receiver_state.MIDDLE_OF_STOP_BIT~q\);

-- Location: LCCOMB_X19_Y47_N10
\receiver_inst|Selector0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_inst|Selector0~0_combout\ = ((!\receiver_inst|receiver_state.MIDDLE_OF_STOP_BIT~q\ & ((\receiver_inst|receiver_state.IDLE~q\) # (!\receiver_inst|Selector3~2_combout\)))) # (!\rx_sync_inst|sync\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_inst|Selector3~2_combout\,
	datab => \rx_sync_inst|sync\(2),
	datac => \receiver_inst|receiver_state.IDLE~q\,
	datad => \receiver_inst|receiver_state.MIDDLE_OF_STOP_BIT~q\,
	combout => \receiver_inst|Selector0~0_combout\);

-- Location: FF_X19_Y47_N11
\receiver_inst|receiver_state.IDLE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_inst|Selector0~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_inst|receiver_state.IDLE~q\);

-- Location: LCCOMB_X19_Y47_N20
\receiver_inst|clk_cnt[12]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_inst|clk_cnt[12]~17_combout\ = (\receiver_inst|receiver_state.IDLE~q\ & (\res_n~input_o\ & !\receiver_inst|receiver_state.MIDDLE_OF_STOP_BIT~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_inst|receiver_state.IDLE~q\,
	datab => \res_n~input_o\,
	datad => \receiver_inst|receiver_state.MIDDLE_OF_STOP_BIT~q\,
	combout => \receiver_inst|clk_cnt[12]~17_combout\);

-- Location: FF_X18_Y47_N5
\receiver_inst|clk_cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_inst|clk_cnt[1]~15_combout\,
	sclr => \receiver_inst|WideOr2~combout\,
	ena => \receiver_inst|clk_cnt[12]~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_inst|clk_cnt\(1));

-- Location: LCCOMB_X18_Y47_N6
\receiver_inst|clk_cnt[2]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_inst|clk_cnt[2]~18_combout\ = (\receiver_inst|clk_cnt\(2) & (\receiver_inst|clk_cnt[1]~16\ $ (GND))) # (!\receiver_inst|clk_cnt\(2) & (!\receiver_inst|clk_cnt[1]~16\ & VCC))
-- \receiver_inst|clk_cnt[2]~19\ = CARRY((\receiver_inst|clk_cnt\(2) & !\receiver_inst|clk_cnt[1]~16\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_inst|clk_cnt\(2),
	datad => VCC,
	cin => \receiver_inst|clk_cnt[1]~16\,
	combout => \receiver_inst|clk_cnt[2]~18_combout\,
	cout => \receiver_inst|clk_cnt[2]~19\);

-- Location: FF_X18_Y47_N7
\receiver_inst|clk_cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_inst|clk_cnt[2]~18_combout\,
	sclr => \receiver_inst|WideOr2~combout\,
	ena => \receiver_inst|clk_cnt[12]~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_inst|clk_cnt\(2));

-- Location: LCCOMB_X18_Y47_N8
\receiver_inst|clk_cnt[3]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_inst|clk_cnt[3]~20_combout\ = (\receiver_inst|clk_cnt\(3) & (!\receiver_inst|clk_cnt[2]~19\)) # (!\receiver_inst|clk_cnt\(3) & ((\receiver_inst|clk_cnt[2]~19\) # (GND)))
-- \receiver_inst|clk_cnt[3]~21\ = CARRY((!\receiver_inst|clk_cnt[2]~19\) # (!\receiver_inst|clk_cnt\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \receiver_inst|clk_cnt\(3),
	datad => VCC,
	cin => \receiver_inst|clk_cnt[2]~19\,
	combout => \receiver_inst|clk_cnt[3]~20_combout\,
	cout => \receiver_inst|clk_cnt[3]~21\);

-- Location: FF_X18_Y47_N9
\receiver_inst|clk_cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_inst|clk_cnt[3]~20_combout\,
	sclr => \receiver_inst|WideOr2~combout\,
	ena => \receiver_inst|clk_cnt[12]~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_inst|clk_cnt\(3));

-- Location: LCCOMB_X18_Y47_N10
\receiver_inst|clk_cnt[4]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_inst|clk_cnt[4]~22_combout\ = (\receiver_inst|clk_cnt\(4) & (\receiver_inst|clk_cnt[3]~21\ $ (GND))) # (!\receiver_inst|clk_cnt\(4) & (!\receiver_inst|clk_cnt[3]~21\ & VCC))
-- \receiver_inst|clk_cnt[4]~23\ = CARRY((\receiver_inst|clk_cnt\(4) & !\receiver_inst|clk_cnt[3]~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_inst|clk_cnt\(4),
	datad => VCC,
	cin => \receiver_inst|clk_cnt[3]~21\,
	combout => \receiver_inst|clk_cnt[4]~22_combout\,
	cout => \receiver_inst|clk_cnt[4]~23\);

-- Location: FF_X18_Y47_N11
\receiver_inst|clk_cnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_inst|clk_cnt[4]~22_combout\,
	sclr => \receiver_inst|WideOr2~combout\,
	ena => \receiver_inst|clk_cnt[12]~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_inst|clk_cnt\(4));

-- Location: LCCOMB_X20_Y47_N4
\receiver_inst|Selector2~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_inst|Selector2~4_combout\ = (\receiver_inst|receiver_state.GOTO_MIDDLE_OF_START_BIT~q\ & (!\receiver_inst|receiver_state.MIDDLE_OF_START_BIT~q\ & (!\receiver_inst|receiver_state.MIDDLE_OF_STOP_BIT~q\ & 
-- !\receiver_inst|receiver_state.MIDDLE_OF_DATA_BIT~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_inst|receiver_state.GOTO_MIDDLE_OF_START_BIT~q\,
	datab => \receiver_inst|receiver_state.MIDDLE_OF_START_BIT~q\,
	datac => \receiver_inst|receiver_state.MIDDLE_OF_STOP_BIT~q\,
	datad => \receiver_inst|receiver_state.MIDDLE_OF_DATA_BIT~q\,
	combout => \receiver_inst|Selector2~4_combout\);

-- Location: LCCOMB_X19_Y47_N18
\receiver_inst|Selector2~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_inst|Selector2~5_combout\ = (\receiver_inst|Selector2~4_combout\ & ((\rx_sync_inst|sync\(2) & (!\receiver_inst|receiver_state.WAIT_START_BIT~q\)) # (!\rx_sync_inst|sync\(2) & ((\receiver_inst|receiver_state.IDLE~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_inst|receiver_state.WAIT_START_BIT~q\,
	datab => \receiver_inst|receiver_state.IDLE~q\,
	datac => \rx_sync_inst|sync\(2),
	datad => \receiver_inst|Selector2~4_combout\,
	combout => \receiver_inst|Selector2~5_combout\);

-- Location: LCCOMB_X19_Y47_N8
\receiver_inst|WideOr0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_inst|WideOr0~0_combout\ = (\receiver_inst|receiver_state.WAIT_START_BIT~q\ & (\rx_sync_inst|sync\(2) & (\receiver_inst|Selector3~2_combout\ & !\receiver_inst|receiver_state.MIDDLE_OF_STOP_BIT~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_inst|receiver_state.WAIT_START_BIT~q\,
	datab => \rx_sync_inst|sync\(2),
	datac => \receiver_inst|Selector3~2_combout\,
	datad => \receiver_inst|receiver_state.MIDDLE_OF_STOP_BIT~q\,
	combout => \receiver_inst|WideOr0~0_combout\);

-- Location: LCCOMB_X20_Y47_N10
\receiver_inst|Selector4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_inst|Selector4~0_combout\ = (\receiver_inst|receiver_state.MIDDLE_OF_DATA_BIT~q\ & (((!\receiver_inst|bit_cnt\(2)) # (!\receiver_inst|bit_cnt\(1))) # (!\receiver_inst|bit_cnt\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_inst|receiver_state.MIDDLE_OF_DATA_BIT~q\,
	datab => \receiver_inst|bit_cnt\(0),
	datac => \receiver_inst|bit_cnt\(1),
	datad => \receiver_inst|bit_cnt\(2),
	combout => \receiver_inst|Selector4~0_combout\);

-- Location: LCCOMB_X20_Y47_N26
\receiver_inst|Selector4~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_inst|Selector4~1_combout\ = (\receiver_inst|receiver_state.MIDDLE_OF_START_BIT~q\) # ((\receiver_inst|Selector4~0_combout\) # ((!\receiver_inst|Equal1~3_combout\ & \receiver_inst|receiver_state.WAIT_DATA_BIT~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_inst|Equal1~3_combout\,
	datab => \receiver_inst|receiver_state.MIDDLE_OF_START_BIT~q\,
	datac => \receiver_inst|receiver_state.WAIT_DATA_BIT~q\,
	datad => \receiver_inst|Selector4~0_combout\,
	combout => \receiver_inst|Selector4~1_combout\);

-- Location: FF_X20_Y47_N27
\receiver_inst|receiver_state.WAIT_DATA_BIT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_inst|Selector4~1_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_inst|receiver_state.WAIT_DATA_BIT~q\);

-- Location: LCCOMB_X18_Y47_N12
\receiver_inst|clk_cnt[5]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_inst|clk_cnt[5]~24_combout\ = (\receiver_inst|clk_cnt\(5) & (!\receiver_inst|clk_cnt[4]~23\)) # (!\receiver_inst|clk_cnt\(5) & ((\receiver_inst|clk_cnt[4]~23\) # (GND)))
-- \receiver_inst|clk_cnt[5]~25\ = CARRY((!\receiver_inst|clk_cnt[4]~23\) # (!\receiver_inst|clk_cnt\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_inst|clk_cnt\(5),
	datad => VCC,
	cin => \receiver_inst|clk_cnt[4]~23\,
	combout => \receiver_inst|clk_cnt[5]~24_combout\,
	cout => \receiver_inst|clk_cnt[5]~25\);

-- Location: FF_X18_Y47_N13
\receiver_inst|clk_cnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_inst|clk_cnt[5]~24_combout\,
	sclr => \receiver_inst|WideOr2~combout\,
	ena => \receiver_inst|clk_cnt[12]~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_inst|clk_cnt\(5));

-- Location: LCCOMB_X18_Y47_N14
\receiver_inst|clk_cnt[6]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_inst|clk_cnt[6]~26_combout\ = (\receiver_inst|clk_cnt\(6) & (\receiver_inst|clk_cnt[5]~25\ $ (GND))) # (!\receiver_inst|clk_cnt\(6) & (!\receiver_inst|clk_cnt[5]~25\ & VCC))
-- \receiver_inst|clk_cnt[6]~27\ = CARRY((\receiver_inst|clk_cnt\(6) & !\receiver_inst|clk_cnt[5]~25\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \receiver_inst|clk_cnt\(6),
	datad => VCC,
	cin => \receiver_inst|clk_cnt[5]~25\,
	combout => \receiver_inst|clk_cnt[6]~26_combout\,
	cout => \receiver_inst|clk_cnt[6]~27\);

-- Location: FF_X18_Y47_N15
\receiver_inst|clk_cnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_inst|clk_cnt[6]~26_combout\,
	sclr => \receiver_inst|WideOr2~combout\,
	ena => \receiver_inst|clk_cnt[12]~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_inst|clk_cnt\(6));

-- Location: LCCOMB_X18_Y47_N16
\receiver_inst|clk_cnt[7]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_inst|clk_cnt[7]~28_combout\ = (\receiver_inst|clk_cnt\(7) & (!\receiver_inst|clk_cnt[6]~27\)) # (!\receiver_inst|clk_cnt\(7) & ((\receiver_inst|clk_cnt[6]~27\) # (GND)))
-- \receiver_inst|clk_cnt[7]~29\ = CARRY((!\receiver_inst|clk_cnt[6]~27\) # (!\receiver_inst|clk_cnt\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \receiver_inst|clk_cnt\(7),
	datad => VCC,
	cin => \receiver_inst|clk_cnt[6]~27\,
	combout => \receiver_inst|clk_cnt[7]~28_combout\,
	cout => \receiver_inst|clk_cnt[7]~29\);

-- Location: FF_X18_Y47_N17
\receiver_inst|clk_cnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_inst|clk_cnt[7]~28_combout\,
	sclr => \receiver_inst|WideOr2~combout\,
	ena => \receiver_inst|clk_cnt[12]~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_inst|clk_cnt\(7));

-- Location: LCCOMB_X18_Y47_N18
\receiver_inst|clk_cnt[8]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_inst|clk_cnt[8]~30_combout\ = (\receiver_inst|clk_cnt\(8) & (\receiver_inst|clk_cnt[7]~29\ $ (GND))) # (!\receiver_inst|clk_cnt\(8) & (!\receiver_inst|clk_cnt[7]~29\ & VCC))
-- \receiver_inst|clk_cnt[8]~31\ = CARRY((\receiver_inst|clk_cnt\(8) & !\receiver_inst|clk_cnt[7]~29\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \receiver_inst|clk_cnt\(8),
	datad => VCC,
	cin => \receiver_inst|clk_cnt[7]~29\,
	combout => \receiver_inst|clk_cnt[8]~30_combout\,
	cout => \receiver_inst|clk_cnt[8]~31\);

-- Location: FF_X18_Y47_N19
\receiver_inst|clk_cnt[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_inst|clk_cnt[8]~30_combout\,
	sclr => \receiver_inst|WideOr2~combout\,
	ena => \receiver_inst|clk_cnt[12]~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_inst|clk_cnt\(8));

-- Location: LCCOMB_X18_Y47_N20
\receiver_inst|clk_cnt[9]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_inst|clk_cnt[9]~32_combout\ = (\receiver_inst|clk_cnt\(9) & (!\receiver_inst|clk_cnt[8]~31\)) # (!\receiver_inst|clk_cnt\(9) & ((\receiver_inst|clk_cnt[8]~31\) # (GND)))
-- \receiver_inst|clk_cnt[9]~33\ = CARRY((!\receiver_inst|clk_cnt[8]~31\) # (!\receiver_inst|clk_cnt\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \receiver_inst|clk_cnt\(9),
	datad => VCC,
	cin => \receiver_inst|clk_cnt[8]~31\,
	combout => \receiver_inst|clk_cnt[9]~32_combout\,
	cout => \receiver_inst|clk_cnt[9]~33\);

-- Location: FF_X18_Y47_N21
\receiver_inst|clk_cnt[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_inst|clk_cnt[9]~32_combout\,
	sclr => \receiver_inst|WideOr2~combout\,
	ena => \receiver_inst|clk_cnt[12]~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_inst|clk_cnt\(9));

-- Location: LCCOMB_X18_Y47_N22
\receiver_inst|clk_cnt[10]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_inst|clk_cnt[10]~34_combout\ = (\receiver_inst|clk_cnt\(10) & (\receiver_inst|clk_cnt[9]~33\ $ (GND))) # (!\receiver_inst|clk_cnt\(10) & (!\receiver_inst|clk_cnt[9]~33\ & VCC))
-- \receiver_inst|clk_cnt[10]~35\ = CARRY((\receiver_inst|clk_cnt\(10) & !\receiver_inst|clk_cnt[9]~33\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_inst|clk_cnt\(10),
	datad => VCC,
	cin => \receiver_inst|clk_cnt[9]~33\,
	combout => \receiver_inst|clk_cnt[10]~34_combout\,
	cout => \receiver_inst|clk_cnt[10]~35\);

-- Location: FF_X18_Y47_N23
\receiver_inst|clk_cnt[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_inst|clk_cnt[10]~34_combout\,
	sclr => \receiver_inst|WideOr2~combout\,
	ena => \receiver_inst|clk_cnt[12]~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_inst|clk_cnt\(10));

-- Location: LCCOMB_X18_Y47_N24
\receiver_inst|clk_cnt[11]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_inst|clk_cnt[11]~36_combout\ = (\receiver_inst|clk_cnt\(11) & (!\receiver_inst|clk_cnt[10]~35\)) # (!\receiver_inst|clk_cnt\(11) & ((\receiver_inst|clk_cnt[10]~35\) # (GND)))
-- \receiver_inst|clk_cnt[11]~37\ = CARRY((!\receiver_inst|clk_cnt[10]~35\) # (!\receiver_inst|clk_cnt\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \receiver_inst|clk_cnt\(11),
	datad => VCC,
	cin => \receiver_inst|clk_cnt[10]~35\,
	combout => \receiver_inst|clk_cnt[11]~36_combout\,
	cout => \receiver_inst|clk_cnt[11]~37\);

-- Location: FF_X18_Y47_N25
\receiver_inst|clk_cnt[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_inst|clk_cnt[11]~36_combout\,
	sclr => \receiver_inst|WideOr2~combout\,
	ena => \receiver_inst|clk_cnt[12]~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_inst|clk_cnt\(11));

-- Location: LCCOMB_X18_Y47_N26
\receiver_inst|clk_cnt[12]~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_inst|clk_cnt[12]~38_combout\ = \receiver_inst|clk_cnt\(12) $ (!\receiver_inst|clk_cnt[11]~37\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_inst|clk_cnt\(12),
	cin => \receiver_inst|clk_cnt[11]~37\,
	combout => \receiver_inst|clk_cnt[12]~38_combout\);

-- Location: FF_X18_Y47_N27
\receiver_inst|clk_cnt[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_inst|clk_cnt[12]~38_combout\,
	sclr => \receiver_inst|WideOr2~combout\,
	ena => \receiver_inst|clk_cnt[12]~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_inst|clk_cnt\(12));

-- Location: LCCOMB_X19_Y47_N12
\receiver_inst|Selector2~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_inst|Selector2~6_combout\ = (\receiver_inst|receiver_state.IDLE~q\ & (\receiver_inst|clk_cnt\(12) & ((\receiver_inst|receiver_state.WAIT_DATA_BIT~q\) # (\receiver_inst|receiver_state.WAIT_STOP_BIT~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_inst|receiver_state.IDLE~q\,
	datab => \receiver_inst|receiver_state.WAIT_DATA_BIT~q\,
	datac => \receiver_inst|clk_cnt\(12),
	datad => \receiver_inst|receiver_state.WAIT_STOP_BIT~q\,
	combout => \receiver_inst|Selector2~6_combout\);

-- Location: LCCOMB_X18_Y47_N28
\receiver_inst|Equal1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_inst|Equal1~2_combout\ = (\receiver_inst|clk_cnt\(10) & (!\receiver_inst|clk_cnt\(9) & (\receiver_inst|clk_cnt\(6) & !\receiver_inst|clk_cnt\(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_inst|clk_cnt\(10),
	datab => \receiver_inst|clk_cnt\(9),
	datac => \receiver_inst|clk_cnt\(6),
	datad => \receiver_inst|clk_cnt\(11),
	combout => \receiver_inst|Equal1~2_combout\);

-- Location: LCCOMB_X19_Y47_N16
\receiver_inst|Equal1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_inst|Equal1~1_combout\ = (!\receiver_inst|clk_cnt\(3) & (\receiver_inst|clk_cnt\(4) & (\receiver_inst|clk_cnt\(2) & !\receiver_inst|clk_cnt\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_inst|clk_cnt\(3),
	datab => \receiver_inst|clk_cnt\(4),
	datac => \receiver_inst|clk_cnt\(2),
	datad => \receiver_inst|clk_cnt\(5),
	combout => \receiver_inst|Equal1~1_combout\);

-- Location: LCCOMB_X19_Y47_N22
\receiver_inst|Selector2~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_inst|Selector2~7_combout\ = (\receiver_inst|Selector2~6_combout\ & (\receiver_inst|Equal1~2_combout\ & (\receiver_inst|Equal1~0_combout\ & \receiver_inst|Equal1~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_inst|Selector2~6_combout\,
	datab => \receiver_inst|Equal1~2_combout\,
	datac => \receiver_inst|Equal1~0_combout\,
	datad => \receiver_inst|Equal1~1_combout\,
	combout => \receiver_inst|Selector2~7_combout\);

-- Location: LCCOMB_X19_Y47_N0
\receiver_inst|Selector2~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_inst|Selector2~8_combout\ = (\receiver_inst|WideOr0~0_combout\) # ((!\receiver_inst|Selector2~3_combout\ & (\receiver_inst|Selector2~5_combout\ & !\receiver_inst|Selector2~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_inst|Selector2~3_combout\,
	datab => \receiver_inst|Selector2~5_combout\,
	datac => \receiver_inst|WideOr0~0_combout\,
	datad => \receiver_inst|Selector2~7_combout\,
	combout => \receiver_inst|Selector2~8_combout\);

-- Location: FF_X19_Y47_N1
\receiver_inst|receiver_state.GOTO_MIDDLE_OF_START_BIT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_inst|Selector2~8_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_inst|receiver_state.GOTO_MIDDLE_OF_START_BIT~q\);

-- Location: LCCOMB_X19_Y47_N26
\receiver_inst|Selector2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_inst|Selector2~0_combout\ = (!\receiver_inst|clk_cnt\(4) & (\receiver_inst|receiver_state.GOTO_MIDDLE_OF_START_BIT~q\ & (!\receiver_inst|clk_cnt\(2) & \receiver_inst|clk_cnt\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_inst|clk_cnt\(4),
	datab => \receiver_inst|receiver_state.GOTO_MIDDLE_OF_START_BIT~q\,
	datac => \receiver_inst|clk_cnt\(2),
	datad => \receiver_inst|clk_cnt\(3),
	combout => \receiver_inst|Selector2~0_combout\);

-- Location: LCCOMB_X18_Y47_N30
\receiver_inst|Selector2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_inst|Selector2~1_combout\ = (!\receiver_inst|clk_cnt\(10) & (\receiver_inst|clk_cnt\(9) & (!\receiver_inst|clk_cnt\(6) & \receiver_inst|clk_cnt\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_inst|clk_cnt\(10),
	datab => \receiver_inst|clk_cnt\(9),
	datac => \receiver_inst|clk_cnt\(6),
	datad => \receiver_inst|clk_cnt\(5),
	combout => \receiver_inst|Selector2~1_combout\);

-- Location: LCCOMB_X19_Y47_N28
\receiver_inst|Selector2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_inst|Selector2~2_combout\ = (!\receiver_inst|clk_cnt\(12) & \receiver_inst|clk_cnt\(11))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \receiver_inst|clk_cnt\(12),
	datad => \receiver_inst|clk_cnt\(11),
	combout => \receiver_inst|Selector2~2_combout\);

-- Location: LCCOMB_X19_Y47_N30
\receiver_inst|Selector2~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_inst|Selector2~3_combout\ = (\receiver_inst|Selector2~0_combout\ & (\receiver_inst|Selector2~1_combout\ & (\receiver_inst|Equal1~0_combout\ & \receiver_inst|Selector2~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_inst|Selector2~0_combout\,
	datab => \receiver_inst|Selector2~1_combout\,
	datac => \receiver_inst|Equal1~0_combout\,
	datad => \receiver_inst|Selector2~2_combout\,
	combout => \receiver_inst|Selector2~3_combout\);

-- Location: LCCOMB_X19_Y47_N24
\receiver_inst|Selector3~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_inst|Selector3~3_combout\ = (\receiver_inst|Selector2~3_combout\ & (!\receiver_inst|receiver_state.MIDDLE_OF_DATA_BIT~q\ & (!\receiver_inst|receiver_state.MIDDLE_OF_START_BIT~q\ & !\receiver_inst|receiver_state.MIDDLE_OF_STOP_BIT~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_inst|Selector2~3_combout\,
	datab => \receiver_inst|receiver_state.MIDDLE_OF_DATA_BIT~q\,
	datac => \receiver_inst|receiver_state.MIDDLE_OF_START_BIT~q\,
	datad => \receiver_inst|receiver_state.MIDDLE_OF_STOP_BIT~q\,
	combout => \receiver_inst|Selector3~3_combout\);

-- Location: FF_X19_Y47_N25
\receiver_inst|receiver_state.MIDDLE_OF_START_BIT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_inst|Selector3~3_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_inst|receiver_state.MIDDLE_OF_START_BIT~q\);

-- Location: LCCOMB_X20_Y47_N8
\receiver_inst|WideOr2\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_inst|WideOr2~combout\ = (\receiver_inst|receiver_state.MIDDLE_OF_START_BIT~q\) # ((\receiver_inst|receiver_state.WAIT_START_BIT~q\) # (\receiver_inst|receiver_state.MIDDLE_OF_DATA_BIT~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \receiver_inst|receiver_state.MIDDLE_OF_START_BIT~q\,
	datac => \receiver_inst|receiver_state.WAIT_START_BIT~q\,
	datad => \receiver_inst|receiver_state.MIDDLE_OF_DATA_BIT~q\,
	combout => \receiver_inst|WideOr2~combout\);

-- Location: FF_X18_Y47_N3
\receiver_inst|clk_cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_inst|clk_cnt[0]~13_combout\,
	sclr => \receiver_inst|WideOr2~combout\,
	ena => \receiver_inst|clk_cnt[12]~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_inst|clk_cnt\(0));

-- Location: LCCOMB_X18_Y47_N0
\receiver_inst|Equal1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_inst|Equal1~0_combout\ = (!\receiver_inst|clk_cnt\(0) & (!\receiver_inst|clk_cnt\(8) & (\receiver_inst|clk_cnt\(1) & !\receiver_inst|clk_cnt\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_inst|clk_cnt\(0),
	datab => \receiver_inst|clk_cnt\(8),
	datac => \receiver_inst|clk_cnt\(1),
	datad => \receiver_inst|clk_cnt\(7),
	combout => \receiver_inst|Equal1~0_combout\);

-- Location: LCCOMB_X19_Y47_N2
\receiver_inst|Equal1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_inst|Equal1~3_combout\ = (\receiver_inst|Equal1~0_combout\ & (\receiver_inst|Equal1~2_combout\ & (\receiver_inst|clk_cnt\(12) & \receiver_inst|Equal1~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_inst|Equal1~0_combout\,
	datab => \receiver_inst|Equal1~2_combout\,
	datac => \receiver_inst|clk_cnt\(12),
	datad => \receiver_inst|Equal1~1_combout\,
	combout => \receiver_inst|Equal1~3_combout\);

-- Location: LCCOMB_X20_Y47_N12
\receiver_inst|Selector5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_inst|Selector5~0_combout\ = (\receiver_inst|Equal1~3_combout\ & (\receiver_inst|receiver_state.WAIT_DATA_BIT~q\ & !\receiver_inst|receiver_state.WAIT_STOP_BIT~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_inst|Equal1~3_combout\,
	datab => \receiver_inst|receiver_state.WAIT_DATA_BIT~q\,
	datad => \receiver_inst|receiver_state.WAIT_STOP_BIT~q\,
	combout => \receiver_inst|Selector5~0_combout\);

-- Location: FF_X20_Y47_N13
\receiver_inst|receiver_state.MIDDLE_OF_DATA_BIT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_inst|Selector5~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_inst|receiver_state.MIDDLE_OF_DATA_BIT~q\);

-- Location: LCCOMB_X20_Y47_N22
\receiver_inst|data_int[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_inst|data_int[0]~0_combout\ = (\res_n~input_o\ & \receiver_inst|receiver_state.MIDDLE_OF_DATA_BIT~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \res_n~input_o\,
	datad => \receiver_inst|receiver_state.MIDDLE_OF_DATA_BIT~q\,
	combout => \receiver_inst|data_int[0]~0_combout\);

-- Location: FF_X52_Y53_N15
\receiver_inst|data_int[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_inst|data_int[7]~1_combout\,
	ena => \receiver_inst|data_int[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_inst|data_int\(7));

-- Location: FF_X52_Y53_N29
\receiver_inst|data_int[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \receiver_inst|data_int\(7),
	sload => VCC,
	ena => \receiver_inst|data_int[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_inst|data_int\(6));

-- Location: LCCOMB_X52_Y53_N26
\receiver_inst|data_int[5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_inst|data_int[5]~feeder_combout\ = \receiver_inst|data_int\(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \receiver_inst|data_int\(6),
	combout => \receiver_inst|data_int[5]~feeder_combout\);

-- Location: FF_X52_Y53_N27
\receiver_inst|data_int[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_inst|data_int[5]~feeder_combout\,
	ena => \receiver_inst|data_int[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_inst|data_int\(5));

-- Location: FF_X52_Y53_N17
\receiver_inst|data_int[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \receiver_inst|data_int\(5),
	sload => VCC,
	ena => \receiver_inst|data_int[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_inst|data_int\(4));

-- Location: LCCOMB_X52_Y53_N6
\receiver_inst|data_int[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_inst|data_int[3]~feeder_combout\ = \receiver_inst|data_int\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \receiver_inst|data_int\(4),
	combout => \receiver_inst|data_int[3]~feeder_combout\);

-- Location: FF_X52_Y53_N7
\receiver_inst|data_int[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_inst|data_int[3]~feeder_combout\,
	ena => \receiver_inst|data_int[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_inst|data_int\(3));

-- Location: LCCOMB_X52_Y53_N12
\receiver_inst|data_int[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_inst|data_int[2]~feeder_combout\ = \receiver_inst|data_int\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \receiver_inst|data_int\(3),
	combout => \receiver_inst|data_int[2]~feeder_combout\);

-- Location: FF_X52_Y53_N13
\receiver_inst|data_int[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_inst|data_int[2]~feeder_combout\,
	ena => \receiver_inst|data_int[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_inst|data_int\(2));

-- Location: LCCOMB_X52_Y53_N2
\receiver_inst|data_int[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_inst|data_int[1]~feeder_combout\ = \receiver_inst|data_int\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \receiver_inst|data_int\(2),
	combout => \receiver_inst|data_int[1]~feeder_combout\);

-- Location: FF_X52_Y53_N3
\receiver_inst|data_int[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_inst|data_int[1]~feeder_combout\,
	ena => \receiver_inst|data_int[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_inst|data_int\(1));

-- Location: LCCOMB_X52_Y53_N8
\receiver_inst|data_int[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_inst|data_int[0]~feeder_combout\ = \receiver_inst|data_int\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \receiver_inst|data_int\(1),
	combout => \receiver_inst|data_int[0]~feeder_combout\);

-- Location: FF_X52_Y53_N9
\receiver_inst|data_int[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_inst|data_int[0]~feeder_combout\,
	ena => \receiver_inst|data_int[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_inst|data_int\(0));

-- Location: LCCOMB_X50_Y52_N14
\receiver_inst|data_out[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_inst|data_out[0]~0_combout\ = (\res_n~input_o\ & \receiver_inst|receiver_state.MIDDLE_OF_STOP_BIT~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \res_n~input_o\,
	datad => \receiver_inst|receiver_state.MIDDLE_OF_STOP_BIT~q\,
	combout => \receiver_inst|data_out[0]~0_combout\);

-- Location: FF_X52_Y53_N1
\receiver_inst|data_out[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \receiver_inst|data_int\(0),
	sload => VCC,
	ena => \receiver_inst|data_out[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_inst|data_out\(0));

-- Location: FF_X49_Y53_N27
\receiver_fifo|memory_inst|ram_rtl_0_bypass[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \receiver_inst|data_out\(0),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_fifo|memory_inst|ram_rtl_0_bypass\(9));

-- Location: LCCOMB_X49_Y53_N28
\receiver_fifo|memory_inst|ram_rtl_0_bypass[10]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_fifo|memory_inst|ram_rtl_0_bypass[10]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \receiver_fifo|memory_inst|ram_rtl_0_bypass[10]~feeder_combout\);

-- Location: FF_X49_Y53_N29
\receiver_fifo|memory_inst|ram_rtl_0_bypass[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_fifo|memory_inst|ram_rtl_0_bypass[10]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_fifo|memory_inst|ram_rtl_0_bypass\(10));

-- Location: LCCOMB_X50_Y52_N28
\receiver_inst|data_new~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_inst|data_new~feeder_combout\ = \receiver_inst|receiver_state.MIDDLE_OF_STOP_BIT~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \receiver_inst|receiver_state.MIDDLE_OF_STOP_BIT~q\,
	combout => \receiver_inst|data_new~feeder_combout\);

-- Location: FF_X50_Y52_N29
\receiver_inst|data_new\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_inst|data_new~feeder_combout\,
	ena => \res_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_inst|data_new~q\);

-- Location: LCCOMB_X52_Y52_N18
\receiver_fifo|write_address[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_fifo|write_address[0]~0_combout\ = !\receiver_fifo|write_address\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \receiver_fifo|write_address\(0),
	combout => \receiver_fifo|write_address[0]~0_combout\);

-- Location: FF_X52_Y52_N19
\receiver_fifo|write_address[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_fifo|write_address[0]~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \receiver_fifo|wr_int~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_fifo|write_address\(0));

-- Location: LCCOMB_X52_Y52_N16
\receiver_fifo|Add1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_fifo|Add1~2_combout\ = \receiver_fifo|write_address\(1) $ (\receiver_fifo|write_address\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \receiver_fifo|write_address\(1),
	datad => \receiver_fifo|write_address\(0),
	combout => \receiver_fifo|Add1~2_combout\);

-- Location: FF_X52_Y52_N17
\receiver_fifo|write_address[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_fifo|Add1~2_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \receiver_fifo|wr_int~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_fifo|write_address\(1));

-- Location: LCCOMB_X52_Y52_N22
\receiver_fifo|Add1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_fifo|Add1~0_combout\ = \receiver_fifo|write_address\(2) $ (((\receiver_fifo|write_address\(1) & \receiver_fifo|write_address\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \receiver_fifo|write_address\(1),
	datac => \receiver_fifo|write_address\(2),
	datad => \receiver_fifo|write_address\(0),
	combout => \receiver_fifo|Add1~0_combout\);

-- Location: FF_X52_Y52_N23
\receiver_fifo|write_address[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_fifo|Add1~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \receiver_fifo|wr_int~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_fifo|write_address\(2));

-- Location: FF_X52_Y52_N21
\receiver_fifo|write_address[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_fifo|Add1~1_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \receiver_fifo|wr_int~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_fifo|write_address\(3));

-- Location: LCCOMB_X52_Y52_N20
\receiver_fifo|Add1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_fifo|Add1~1_combout\ = \receiver_fifo|write_address\(3) $ (((\receiver_fifo|write_address\(2) & (\receiver_fifo|write_address\(1) & \receiver_fifo|write_address\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_fifo|write_address\(2),
	datab => \receiver_fifo|write_address\(1),
	datac => \receiver_fifo|write_address\(3),
	datad => \receiver_fifo|write_address\(0),
	combout => \receiver_fifo|Add1~1_combout\);

-- Location: LCCOMB_X49_Y52_N18
\receiver_fifo|read_address[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_fifo|read_address[0]~0_combout\ = !\receiver_fifo|read_address\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \receiver_fifo|read_address\(0),
	combout => \receiver_fifo|read_address[0]~0_combout\);

-- Location: LCCOMB_X49_Y52_N16
\receiver_fifo|Add0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_fifo|Add0~1_combout\ = \receiver_fifo|read_address\(0) $ (\receiver_fifo|read_address\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_fifo|read_address\(0),
	datac => \receiver_fifo|read_address\(1),
	combout => \receiver_fifo|Add0~1_combout\);

-- Location: FF_X49_Y52_N17
\receiver_fifo|read_address[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_fifo|Add0~1_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \receiver_fifo|rd_int~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_fifo|read_address\(1));

-- Location: LCCOMB_X50_Y52_N22
\receiver_fifo|empty_next~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_fifo|empty_next~0_combout\ = (\receiver_fifo|write_address\(0) & (!\receiver_fifo|read_address\(0) & (\receiver_fifo|read_address\(1) $ (!\receiver_fifo|write_address\(1))))) # (!\receiver_fifo|write_address\(0) & 
-- (\receiver_fifo|read_address\(0) & (\receiver_fifo|read_address\(1) $ (\receiver_fifo|write_address\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011010010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_fifo|read_address\(1),
	datab => \receiver_fifo|write_address\(1),
	datac => \receiver_fifo|write_address\(0),
	datad => \receiver_fifo|read_address\(0),
	combout => \receiver_fifo|empty_next~0_combout\);

-- Location: FF_X49_Y52_N21
\receiver_fifo|read_address[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_fifo|Add0~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \receiver_fifo|rd_int~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_fifo|read_address\(3));

-- Location: LCCOMB_X49_Y52_N20
\receiver_fifo|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_fifo|Add0~0_combout\ = \receiver_fifo|read_address\(3) $ (((\receiver_fifo|read_address\(0) & (\receiver_fifo|read_address\(1) & \receiver_fifo|read_address\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_fifo|read_address\(0),
	datab => \receiver_fifo|read_address\(1),
	datac => \receiver_fifo|read_address\(3),
	datad => \receiver_fifo|read_address\(2),
	combout => \receiver_fifo|Add0~0_combout\);

-- Location: LCCOMB_X50_Y52_N8
\receiver_fifo|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_fifo|Equal0~0_combout\ = \receiver_fifo|write_address\(2) $ (\receiver_fifo|read_address\(2) $ (((\receiver_fifo|read_address\(1) & \receiver_fifo|read_address\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000011101111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_fifo|read_address\(1),
	datab => \receiver_fifo|read_address\(0),
	datac => \receiver_fifo|write_address\(2),
	datad => \receiver_fifo|read_address\(2),
	combout => \receiver_fifo|Equal0~0_combout\);

-- Location: LCCOMB_X50_Y52_N2
\receiver_fifo|empty_next~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_fifo|empty_next~1_combout\ = (\receiver_fifo|empty_next~0_combout\ & (!\receiver_fifo|Equal0~0_combout\ & (\receiver_fifo|Add0~0_combout\ $ (!\receiver_fifo|write_address\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_fifo|empty_next~0_combout\,
	datab => \receiver_fifo|Add0~0_combout\,
	datac => \receiver_fifo|Equal0~0_combout\,
	datad => \receiver_fifo|write_address\(3),
	combout => \receiver_fifo|empty_next~1_combout\);

-- Location: IOIBUF_X58_Y73_N1
\rx_rd~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rx_rd,
	o => \rx_rd~input_o\);

-- Location: LCCOMB_X50_Y52_N0
\receiver_fifo|empty_next~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_fifo|empty_next~2_combout\ = (\receiver_inst|data_new~q\) # ((\receiver_fifo|empty_int~q\ & ((!\rx_rd~input_o\) # (!\receiver_fifo|empty_next~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_fifo|empty_next~1_combout\,
	datab => \receiver_inst|data_new~q\,
	datac => \receiver_fifo|empty_int~q\,
	datad => \rx_rd~input_o\,
	combout => \receiver_fifo|empty_next~2_combout\);

-- Location: FF_X50_Y52_N1
\receiver_fifo|empty_int\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_fifo|empty_next~2_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_fifo|empty_int~q\);

-- Location: LCCOMB_X50_Y52_N18
\receiver_fifo|rd_int\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_fifo|rd_int~combout\ = (\receiver_fifo|empty_int~q\ & \rx_rd~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \receiver_fifo|empty_int~q\,
	datad => \rx_rd~input_o\,
	combout => \receiver_fifo|rd_int~combout\);

-- Location: FF_X49_Y52_N19
\receiver_fifo|read_address[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_fifo|read_address[0]~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \receiver_fifo|rd_int~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_fifo|read_address\(0));

-- Location: LCCOMB_X49_Y52_N14
\receiver_fifo|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_fifo|Add0~2_combout\ = \receiver_fifo|read_address\(2) $ (((\receiver_fifo|read_address\(0) & \receiver_fifo|read_address\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_fifo|read_address\(0),
	datab => \receiver_fifo|read_address\(1),
	datac => \receiver_fifo|read_address\(2),
	combout => \receiver_fifo|Add0~2_combout\);

-- Location: FF_X49_Y52_N15
\receiver_fifo|read_address[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_fifo|Add0~2_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \receiver_fifo|rd_int~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_fifo|read_address\(2));

-- Location: LCCOMB_X50_Y52_N6
\receiver_fifo|full_next~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_fifo|full_next~0_combout\ = (\receiver_fifo|write_address\(0) & (!\receiver_fifo|read_address\(0) & (\receiver_fifo|read_address\(1) $ (\receiver_fifo|write_address\(1))))) # (!\receiver_fifo|write_address\(0) & (\receiver_fifo|read_address\(0) 
-- & (\receiver_fifo|read_address\(1) $ (!\receiver_fifo|write_address\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100101100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_fifo|read_address\(1),
	datab => \receiver_fifo|write_address\(1),
	datac => \receiver_fifo|write_address\(0),
	datad => \receiver_fifo|read_address\(0),
	combout => \receiver_fifo|full_next~0_combout\);

-- Location: LCCOMB_X50_Y52_N30
\receiver_fifo|full_next~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_fifo|full_next~1_combout\ = (\receiver_fifo|full_next~0_combout\ & (\receiver_fifo|read_address\(2) $ (!\receiver_fifo|Add1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_fifo|read_address\(2),
	datab => \receiver_fifo|Add1~0_combout\,
	datad => \receiver_fifo|full_next~0_combout\,
	combout => \receiver_fifo|full_next~1_combout\);

-- Location: LCCOMB_X50_Y52_N16
\receiver_fifo|full_next~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_fifo|full_next~2_combout\ = (\receiver_inst|data_new~q\ & (\receiver_fifo|full_next~1_combout\ & (\receiver_fifo|Add1~1_combout\ $ (!\receiver_fifo|read_address\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_fifo|Add1~1_combout\,
	datab => \receiver_inst|data_new~q\,
	datac => \receiver_fifo|full_next~1_combout\,
	datad => \receiver_fifo|read_address\(3),
	combout => \receiver_fifo|full_next~2_combout\);

-- Location: LCCOMB_X50_Y52_N26
\receiver_fifo|full_next~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_fifo|full_next~3_combout\ = (\receiver_fifo|full_next~2_combout\) # ((\receiver_fifo|full_int~q\ & !\rx_rd~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \receiver_fifo|full_next~2_combout\,
	datac => \receiver_fifo|full_int~q\,
	datad => \rx_rd~input_o\,
	combout => \receiver_fifo|full_next~3_combout\);

-- Location: FF_X50_Y52_N27
\receiver_fifo|full_int\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_fifo|full_next~3_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_fifo|full_int~q\);

-- Location: LCCOMB_X50_Y52_N10
\receiver_fifo|wr_int\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_fifo|wr_int~combout\ = (\receiver_inst|data_new~q\ & !\receiver_fifo|full_int~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \receiver_inst|data_new~q\,
	datac => \receiver_fifo|full_int~q\,
	combout => \receiver_fifo|wr_int~combout\);

-- Location: LCCOMB_X50_Y52_N20
\receiver_fifo|memory_inst|ram_rtl_0_bypass[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_fifo|memory_inst|ram_rtl_0_bypass[0]~feeder_combout\ = \receiver_fifo|wr_int~combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \receiver_fifo|wr_int~combout\,
	combout => \receiver_fifo|memory_inst|ram_rtl_0_bypass[0]~feeder_combout\);

-- Location: FF_X50_Y52_N21
\receiver_fifo|memory_inst|ram_rtl_0_bypass[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_fifo|memory_inst|ram_rtl_0_bypass[0]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_fifo|memory_inst|ram_rtl_0_bypass\(0));

-- Location: FF_X50_Y52_N31
\receiver_fifo|memory_inst|ram_rtl_0_bypass[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \receiver_fifo|write_address\(2),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_fifo|memory_inst|ram_rtl_0_bypass\(5));

-- Location: FF_X50_Y52_N25
\receiver_fifo|memory_inst|ram_rtl_0_bypass[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \receiver_fifo|write_address\(3),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_fifo|memory_inst|ram_rtl_0_bypass\(7));

-- Location: FF_X49_Y52_N29
\receiver_fifo|memory_inst|ram_rtl_0_bypass[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \receiver_fifo|Add0~2_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \receiver_fifo|rd_int~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_fifo|memory_inst|ram_rtl_0_bypass\(6));

-- Location: LCCOMB_X49_Y52_N10
\receiver_fifo|memory_inst|ram_rtl_0_bypass[8]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_fifo|memory_inst|ram_rtl_0_bypass[8]~feeder_combout\ = \receiver_fifo|Add0~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \receiver_fifo|Add0~0_combout\,
	combout => \receiver_fifo|memory_inst|ram_rtl_0_bypass[8]~feeder_combout\);

-- Location: FF_X49_Y52_N11
\receiver_fifo|memory_inst|ram_rtl_0_bypass[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_fifo|memory_inst|ram_rtl_0_bypass[8]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \receiver_fifo|rd_int~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_fifo|memory_inst|ram_rtl_0_bypass\(8));

-- Location: LCCOMB_X49_Y52_N28
\receiver_fifo|memory_inst|ram~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_fifo|memory_inst|ram~24_combout\ = (\receiver_fifo|memory_inst|ram_rtl_0_bypass\(5) & (\receiver_fifo|memory_inst|ram_rtl_0_bypass\(6) & (\receiver_fifo|memory_inst|ram_rtl_0_bypass\(7) $ (!\receiver_fifo|memory_inst|ram_rtl_0_bypass\(8))))) # 
-- (!\receiver_fifo|memory_inst|ram_rtl_0_bypass\(5) & (!\receiver_fifo|memory_inst|ram_rtl_0_bypass\(6) & (\receiver_fifo|memory_inst|ram_rtl_0_bypass\(7) $ (!\receiver_fifo|memory_inst|ram_rtl_0_bypass\(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_fifo|memory_inst|ram_rtl_0_bypass\(5),
	datab => \receiver_fifo|memory_inst|ram_rtl_0_bypass\(7),
	datac => \receiver_fifo|memory_inst|ram_rtl_0_bypass\(6),
	datad => \receiver_fifo|memory_inst|ram_rtl_0_bypass\(8),
	combout => \receiver_fifo|memory_inst|ram~24_combout\);

-- Location: FF_X49_Y52_N27
\receiver_fifo|memory_inst|ram_rtl_0_bypass[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \receiver_fifo|write_address\(0),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_fifo|memory_inst|ram_rtl_0_bypass\(1));

-- Location: LCCOMB_X49_Y52_N0
\receiver_fifo|memory_inst|ram_rtl_0_bypass[2]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_fifo|memory_inst|ram_rtl_0_bypass[2]~0_combout\ = !\receiver_fifo|read_address\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \receiver_fifo|read_address\(0),
	combout => \receiver_fifo|memory_inst|ram_rtl_0_bypass[2]~0_combout\);

-- Location: FF_X49_Y52_N1
\receiver_fifo|memory_inst|ram_rtl_0_bypass[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_fifo|memory_inst|ram_rtl_0_bypass[2]~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \receiver_fifo|rd_int~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_fifo|memory_inst|ram_rtl_0_bypass\(2));

-- Location: FF_X49_Y52_N31
\receiver_fifo|memory_inst|ram_rtl_0_bypass[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \receiver_fifo|Add0~1_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \receiver_fifo|rd_int~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_fifo|memory_inst|ram_rtl_0_bypass\(4));

-- Location: LCCOMB_X49_Y52_N12
\receiver_fifo|memory_inst|ram_rtl_0_bypass[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_fifo|memory_inst|ram_rtl_0_bypass[3]~feeder_combout\ = \receiver_fifo|write_address\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \receiver_fifo|write_address\(1),
	combout => \receiver_fifo|memory_inst|ram_rtl_0_bypass[3]~feeder_combout\);

-- Location: FF_X49_Y52_N13
\receiver_fifo|memory_inst|ram_rtl_0_bypass[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_fifo|memory_inst|ram_rtl_0_bypass[3]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_fifo|memory_inst|ram_rtl_0_bypass\(3));

-- Location: LCCOMB_X49_Y52_N30
\receiver_fifo|memory_inst|ram~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_fifo|memory_inst|ram~23_combout\ = (\receiver_fifo|memory_inst|ram_rtl_0_bypass\(1) & (\receiver_fifo|memory_inst|ram_rtl_0_bypass\(2) & (\receiver_fifo|memory_inst|ram_rtl_0_bypass\(4) $ (!\receiver_fifo|memory_inst|ram_rtl_0_bypass\(3))))) # 
-- (!\receiver_fifo|memory_inst|ram_rtl_0_bypass\(1) & (!\receiver_fifo|memory_inst|ram_rtl_0_bypass\(2) & (\receiver_fifo|memory_inst|ram_rtl_0_bypass\(4) $ (!\receiver_fifo|memory_inst|ram_rtl_0_bypass\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000000001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_fifo|memory_inst|ram_rtl_0_bypass\(1),
	datab => \receiver_fifo|memory_inst|ram_rtl_0_bypass\(2),
	datac => \receiver_fifo|memory_inst|ram_rtl_0_bypass\(4),
	datad => \receiver_fifo|memory_inst|ram_rtl_0_bypass\(3),
	combout => \receiver_fifo|memory_inst|ram~23_combout\);

-- Location: LCCOMB_X49_Y52_N26
\receiver_fifo|memory_inst|ram~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_fifo|memory_inst|ram~25_combout\ = (\receiver_fifo|memory_inst|ram_rtl_0_bypass\(0) & (\receiver_fifo|memory_inst|ram~24_combout\ & \receiver_fifo|memory_inst|ram~23_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_fifo|memory_inst|ram_rtl_0_bypass\(0),
	datab => \receiver_fifo|memory_inst|ram~24_combout\,
	datad => \receiver_fifo|memory_inst|ram~23_combout\,
	combout => \receiver_fifo|memory_inst|ram~25_combout\);

-- Location: LCCOMB_X50_Y53_N22
\receiver_fifo|memory_inst|ram~13feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_fifo|memory_inst|ram~13feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \receiver_fifo|memory_inst|ram~13feeder_combout\);

-- Location: FF_X50_Y53_N23
\receiver_fifo|memory_inst|ram~13\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_fifo|memory_inst|ram~13feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \receiver_fifo|rd_int~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_fifo|memory_inst|ram~13_q\);

-- Location: LCCOMB_X50_Y52_N12
\receiver_fifo|memory_inst|ram~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_fifo|memory_inst|ram~41_combout\ = (!\receiver_fifo|write_address\(2) & (\receiver_inst|data_new~q\ & (!\receiver_fifo|full_int~q\ & !\receiver_fifo|write_address\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_fifo|write_address\(2),
	datab => \receiver_inst|data_new~q\,
	datac => \receiver_fifo|full_int~q\,
	datad => \receiver_fifo|write_address\(3),
	combout => \receiver_fifo|memory_inst|ram~41_combout\);

-- Location: LCCOMB_X50_Y53_N14
\receiver_fifo|memory_inst|ram~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_fifo|memory_inst|ram~42_combout\ = (\receiver_fifo|memory_inst|ram~41_combout\ & (!\receiver_fifo|write_address\(1) & !\receiver_fifo|write_address\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_fifo|memory_inst|ram~41_combout\,
	datab => \receiver_fifo|write_address\(1),
	datad => \receiver_fifo|write_address\(0),
	combout => \receiver_fifo|memory_inst|ram~42_combout\);

-- Location: FF_X50_Y53_N5
\receiver_fifo|memory_inst|ram~14\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \receiver_inst|data_out\(0),
	sload => VCC,
	ena => \receiver_fifo|memory_inst|ram~42_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_fifo|memory_inst|ram~14_q\);

-- Location: LCCOMB_X50_Y52_N24
\receiver_fifo|read_address[0]~_wirecell\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_fifo|read_address[0]~_wirecell_combout\ = !\receiver_fifo|read_address\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \receiver_fifo|read_address\(0),
	combout => \receiver_fifo|read_address[0]~_wirecell_combout\);

-- Location: LCCOMB_X52_Y53_N10
\receiver_inst|data_out[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_inst|data_out[1]~feeder_combout\ = \receiver_inst|data_int\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \receiver_inst|data_int\(1),
	combout => \receiver_inst|data_out[1]~feeder_combout\);

-- Location: FF_X52_Y53_N11
\receiver_inst|data_out[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_inst|data_out[1]~feeder_combout\,
	ena => \receiver_inst|data_out[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_inst|data_out\(1));

-- Location: LCCOMB_X52_Y53_N20
\receiver_inst|data_out[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_inst|data_out[2]~feeder_combout\ = \receiver_inst|data_int\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \receiver_inst|data_int\(2),
	combout => \receiver_inst|data_out[2]~feeder_combout\);

-- Location: FF_X52_Y53_N21
\receiver_inst|data_out[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_inst|data_out[2]~feeder_combout\,
	ena => \receiver_inst|data_out[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_inst|data_out\(2));

-- Location: LCCOMB_X52_Y53_N22
\receiver_inst|data_out[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_inst|data_out[3]~feeder_combout\ = \receiver_inst|data_int\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \receiver_inst|data_int\(3),
	combout => \receiver_inst|data_out[3]~feeder_combout\);

-- Location: FF_X52_Y53_N23
\receiver_inst|data_out[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_inst|data_out[3]~feeder_combout\,
	ena => \receiver_inst|data_out[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_inst|data_out\(3));

-- Location: LCCOMB_X52_Y53_N24
\receiver_inst|data_out[4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_inst|data_out[4]~feeder_combout\ = \receiver_inst|data_int\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \receiver_inst|data_int\(4),
	combout => \receiver_inst|data_out[4]~feeder_combout\);

-- Location: FF_X52_Y53_N25
\receiver_inst|data_out[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_inst|data_out[4]~feeder_combout\,
	ena => \receiver_inst|data_out[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_inst|data_out\(4));

-- Location: FF_X52_Y53_N19
\receiver_inst|data_out[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \receiver_inst|data_int\(5),
	sload => VCC,
	ena => \receiver_inst|data_out[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_inst|data_out\(5));

-- Location: LCCOMB_X52_Y53_N4
\receiver_inst|data_out[6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_inst|data_out[6]~feeder_combout\ = \receiver_inst|data_int\(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \receiver_inst|data_int\(6),
	combout => \receiver_inst|data_out[6]~feeder_combout\);

-- Location: FF_X52_Y53_N5
\receiver_inst|data_out[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_inst|data_out[6]~feeder_combout\,
	ena => \receiver_inst|data_out[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_inst|data_out\(6));

-- Location: FF_X52_Y53_N31
\receiver_inst|data_out[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \receiver_inst|data_int\(7),
	sload => VCC,
	ena => \receiver_inst|data_out[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_inst|data_out\(7));

-- Location: M9K_X51_Y53_N0
\receiver_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a0\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => X"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/serial_port.ram0_dp_ram_1c1r1w_e3f5f569.hdl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "fifo_1c1r1w:receiver_fifo|dp_ram_1c1r1w:memory_inst|altsyncram:ram_rtl_0|altsyncram_4pn1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 4,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 36,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 15,
	port_a_logical_ram_depth => 16,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 4,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 36,
	port_b_first_address => 0,
	port_b_first_bit_number => 0,
	port_b_last_address => 15,
	port_b_logical_ram_depth => 16,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "new_data_with_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \receiver_fifo|wr_int~combout\,
	portbre => VCC,
	portbaddrstall => \receiver_fifo|ALT_INV_rd_int~combout\,
	clk0 => \clk~inputclkctrl_outclk\,
	portadatain => \receiver_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\,
	portaaddr => \receiver_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\,
	portbaddr => \receiver_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \receiver_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\);

-- Location: LCCOMB_X50_Y53_N4
\receiver_fifo|memory_inst|ram~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_fifo|memory_inst|ram~22_combout\ = (\receiver_fifo|memory_inst|ram~13_q\ & ((\receiver_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a0~portbdataout\))) # (!\receiver_fifo|memory_inst|ram~13_q\ & (\receiver_fifo|memory_inst|ram~14_q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_fifo|memory_inst|ram~13_q\,
	datac => \receiver_fifo|memory_inst|ram~14_q\,
	datad => \receiver_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a0~portbdataout\,
	combout => \receiver_fifo|memory_inst|ram~22_combout\);

-- Location: LCCOMB_X49_Y53_N0
\receiver_fifo|memory_inst|ram~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_fifo|memory_inst|ram~26_combout\ = (\receiver_fifo|memory_inst|ram_rtl_0_bypass\(10) & ((\receiver_fifo|memory_inst|ram~25_combout\ & (\receiver_fifo|memory_inst|ram_rtl_0_bypass\(9))) # (!\receiver_fifo|memory_inst|ram~25_combout\ & 
-- ((\receiver_fifo|memory_inst|ram~22_combout\))))) # (!\receiver_fifo|memory_inst|ram_rtl_0_bypass\(10) & (\receiver_fifo|memory_inst|ram_rtl_0_bypass\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_fifo|memory_inst|ram_rtl_0_bypass\(9),
	datab => \receiver_fifo|memory_inst|ram_rtl_0_bypass\(10),
	datac => \receiver_fifo|memory_inst|ram~25_combout\,
	datad => \receiver_fifo|memory_inst|ram~22_combout\,
	combout => \receiver_fifo|memory_inst|ram~26_combout\);

-- Location: FF_X49_Y53_N1
\receiver_fifo|memory_inst|rd1_data[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_fifo|memory_inst|ram~26_combout\,
	ena => \receiver_fifo|rd_int~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_fifo|memory_inst|rd1_data\(0));

-- Location: LCCOMB_X48_Y53_N8
\receiver_fifo|memory_inst|ram_rtl_0_bypass[12]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_fifo|memory_inst|ram_rtl_0_bypass[12]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \receiver_fifo|memory_inst|ram_rtl_0_bypass[12]~feeder_combout\);

-- Location: FF_X48_Y53_N9
\receiver_fifo|memory_inst|ram_rtl_0_bypass[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_fifo|memory_inst|ram_rtl_0_bypass[12]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_fifo|memory_inst|ram_rtl_0_bypass\(12));

-- Location: FF_X50_Y53_N25
\receiver_fifo|memory_inst|ram~15\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \receiver_inst|data_out\(1),
	sload => VCC,
	ena => \receiver_fifo|memory_inst|ram~42_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_fifo|memory_inst|ram~15_q\);

-- Location: LCCOMB_X50_Y53_N24
\receiver_fifo|memory_inst|ram~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_fifo|memory_inst|ram~27_combout\ = (\receiver_fifo|memory_inst|ram~13_q\ & ((\receiver_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a1\))) # (!\receiver_fifo|memory_inst|ram~13_q\ & (\receiver_fifo|memory_inst|ram~15_q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_fifo|memory_inst|ram~13_q\,
	datac => \receiver_fifo|memory_inst|ram~15_q\,
	datad => \receiver_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a1\,
	combout => \receiver_fifo|memory_inst|ram~27_combout\);

-- Location: FF_X49_Y53_N7
\receiver_fifo|memory_inst|ram_rtl_0_bypass[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \receiver_inst|data_out\(1),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_fifo|memory_inst|ram_rtl_0_bypass\(11));

-- Location: LCCOMB_X49_Y53_N10
\receiver_fifo|memory_inst|ram~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_fifo|memory_inst|ram~28_combout\ = (\receiver_fifo|memory_inst|ram_rtl_0_bypass\(12) & ((\receiver_fifo|memory_inst|ram~25_combout\ & ((\receiver_fifo|memory_inst|ram_rtl_0_bypass\(11)))) # (!\receiver_fifo|memory_inst|ram~25_combout\ & 
-- (\receiver_fifo|memory_inst|ram~27_combout\)))) # (!\receiver_fifo|memory_inst|ram_rtl_0_bypass\(12) & (((\receiver_fifo|memory_inst|ram_rtl_0_bypass\(11)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_fifo|memory_inst|ram_rtl_0_bypass\(12),
	datab => \receiver_fifo|memory_inst|ram~27_combout\,
	datac => \receiver_fifo|memory_inst|ram~25_combout\,
	datad => \receiver_fifo|memory_inst|ram_rtl_0_bypass\(11),
	combout => \receiver_fifo|memory_inst|ram~28_combout\);

-- Location: FF_X49_Y53_N11
\receiver_fifo|memory_inst|rd1_data[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_fifo|memory_inst|ram~28_combout\,
	ena => \receiver_fifo|rd_int~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_fifo|memory_inst|rd1_data\(1));

-- Location: LCCOMB_X48_Y53_N2
\receiver_fifo|memory_inst|ram_rtl_0_bypass[14]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_fifo|memory_inst|ram_rtl_0_bypass[14]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \receiver_fifo|memory_inst|ram_rtl_0_bypass[14]~feeder_combout\);

-- Location: FF_X48_Y53_N3
\receiver_fifo|memory_inst|ram_rtl_0_bypass[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_fifo|memory_inst|ram_rtl_0_bypass[14]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_fifo|memory_inst|ram_rtl_0_bypass\(14));

-- Location: LCCOMB_X49_Y53_N24
\receiver_fifo|memory_inst|ram_rtl_0_bypass[13]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_fifo|memory_inst|ram_rtl_0_bypass[13]~feeder_combout\ = \receiver_inst|data_out\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \receiver_inst|data_out\(2),
	combout => \receiver_fifo|memory_inst|ram_rtl_0_bypass[13]~feeder_combout\);

-- Location: FF_X49_Y53_N25
\receiver_fifo|memory_inst|ram_rtl_0_bypass[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_fifo|memory_inst|ram_rtl_0_bypass[13]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_fifo|memory_inst|ram_rtl_0_bypass\(13));

-- Location: FF_X50_Y53_N19
\receiver_fifo|memory_inst|ram~16\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \receiver_inst|data_out\(2),
	sload => VCC,
	ena => \receiver_fifo|memory_inst|ram~42_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_fifo|memory_inst|ram~16_q\);

-- Location: LCCOMB_X50_Y53_N18
\receiver_fifo|memory_inst|ram~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_fifo|memory_inst|ram~29_combout\ = (\receiver_fifo|memory_inst|ram~13_q\ & ((\receiver_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a2\))) # (!\receiver_fifo|memory_inst|ram~13_q\ & (\receiver_fifo|memory_inst|ram~16_q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_fifo|memory_inst|ram~13_q\,
	datac => \receiver_fifo|memory_inst|ram~16_q\,
	datad => \receiver_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a2\,
	combout => \receiver_fifo|memory_inst|ram~29_combout\);

-- Location: LCCOMB_X49_Y53_N12
\receiver_fifo|memory_inst|ram~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_fifo|memory_inst|ram~30_combout\ = (\receiver_fifo|memory_inst|ram_rtl_0_bypass\(14) & ((\receiver_fifo|memory_inst|ram~25_combout\ & (\receiver_fifo|memory_inst|ram_rtl_0_bypass\(13))) # (!\receiver_fifo|memory_inst|ram~25_combout\ & 
-- ((\receiver_fifo|memory_inst|ram~29_combout\))))) # (!\receiver_fifo|memory_inst|ram_rtl_0_bypass\(14) & (\receiver_fifo|memory_inst|ram_rtl_0_bypass\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_fifo|memory_inst|ram_rtl_0_bypass\(14),
	datab => \receiver_fifo|memory_inst|ram_rtl_0_bypass\(13),
	datac => \receiver_fifo|memory_inst|ram~25_combout\,
	datad => \receiver_fifo|memory_inst|ram~29_combout\,
	combout => \receiver_fifo|memory_inst|ram~30_combout\);

-- Location: FF_X49_Y53_N13
\receiver_fifo|memory_inst|rd1_data[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_fifo|memory_inst|ram~30_combout\,
	ena => \receiver_fifo|rd_int~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_fifo|memory_inst|rd1_data\(2));

-- Location: FF_X50_Y53_N29
\receiver_fifo|memory_inst|ram~17\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \receiver_inst|data_out\(3),
	sload => VCC,
	ena => \receiver_fifo|memory_inst|ram~42_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_fifo|memory_inst|ram~17_q\);

-- Location: LCCOMB_X50_Y53_N28
\receiver_fifo|memory_inst|ram~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_fifo|memory_inst|ram~31_combout\ = (\receiver_fifo|memory_inst|ram~13_q\ & ((\receiver_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a3\))) # (!\receiver_fifo|memory_inst|ram~13_q\ & (\receiver_fifo|memory_inst|ram~17_q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_fifo|memory_inst|ram~13_q\,
	datac => \receiver_fifo|memory_inst|ram~17_q\,
	datad => \receiver_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a3\,
	combout => \receiver_fifo|memory_inst|ram~31_combout\);

-- Location: LCCOMB_X49_Y53_N4
\receiver_fifo|memory_inst|ram_rtl_0_bypass[16]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_fifo|memory_inst|ram_rtl_0_bypass[16]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \receiver_fifo|memory_inst|ram_rtl_0_bypass[16]~feeder_combout\);

-- Location: FF_X49_Y53_N5
\receiver_fifo|memory_inst|ram_rtl_0_bypass[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_fifo|memory_inst|ram_rtl_0_bypass[16]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_fifo|memory_inst|ram_rtl_0_bypass\(16));

-- Location: LCCOMB_X49_Y53_N2
\receiver_fifo|memory_inst|ram_rtl_0_bypass[15]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_fifo|memory_inst|ram_rtl_0_bypass[15]~feeder_combout\ = \receiver_inst|data_out\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \receiver_inst|data_out\(3),
	combout => \receiver_fifo|memory_inst|ram_rtl_0_bypass[15]~feeder_combout\);

-- Location: FF_X49_Y53_N3
\receiver_fifo|memory_inst|ram_rtl_0_bypass[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_fifo|memory_inst|ram_rtl_0_bypass[15]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_fifo|memory_inst|ram_rtl_0_bypass\(15));

-- Location: LCCOMB_X50_Y53_N8
\receiver_fifo|memory_inst|ram~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_fifo|memory_inst|ram~32_combout\ = (\receiver_fifo|memory_inst|ram~25_combout\ & (((\receiver_fifo|memory_inst|ram_rtl_0_bypass\(15))))) # (!\receiver_fifo|memory_inst|ram~25_combout\ & ((\receiver_fifo|memory_inst|ram_rtl_0_bypass\(16) & 
-- (\receiver_fifo|memory_inst|ram~31_combout\)) # (!\receiver_fifo|memory_inst|ram_rtl_0_bypass\(16) & ((\receiver_fifo|memory_inst|ram_rtl_0_bypass\(15))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_fifo|memory_inst|ram~25_combout\,
	datab => \receiver_fifo|memory_inst|ram~31_combout\,
	datac => \receiver_fifo|memory_inst|ram_rtl_0_bypass\(16),
	datad => \receiver_fifo|memory_inst|ram_rtl_0_bypass\(15),
	combout => \receiver_fifo|memory_inst|ram~32_combout\);

-- Location: FF_X50_Y53_N9
\receiver_fifo|memory_inst|rd1_data[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_fifo|memory_inst|ram~32_combout\,
	ena => \receiver_fifo|rd_int~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_fifo|memory_inst|rd1_data\(3));

-- Location: LCCOMB_X48_Y53_N12
\receiver_fifo|memory_inst|ram_rtl_0_bypass[18]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_fifo|memory_inst|ram_rtl_0_bypass[18]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \receiver_fifo|memory_inst|ram_rtl_0_bypass[18]~feeder_combout\);

-- Location: FF_X48_Y53_N13
\receiver_fifo|memory_inst|ram_rtl_0_bypass[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_fifo|memory_inst|ram_rtl_0_bypass[18]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_fifo|memory_inst|ram_rtl_0_bypass\(18));

-- Location: LCCOMB_X49_Y53_N30
\receiver_fifo|memory_inst|ram_rtl_0_bypass[17]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_fifo|memory_inst|ram_rtl_0_bypass[17]~feeder_combout\ = \receiver_inst|data_out\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \receiver_inst|data_out\(4),
	combout => \receiver_fifo|memory_inst|ram_rtl_0_bypass[17]~feeder_combout\);

-- Location: FF_X49_Y53_N31
\receiver_fifo|memory_inst|ram_rtl_0_bypass[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_fifo|memory_inst|ram_rtl_0_bypass[17]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_fifo|memory_inst|ram_rtl_0_bypass\(17));

-- Location: FF_X50_Y53_N7
\receiver_fifo|memory_inst|ram~18\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \receiver_inst|data_out\(4),
	sload => VCC,
	ena => \receiver_fifo|memory_inst|ram~42_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_fifo|memory_inst|ram~18_q\);

-- Location: LCCOMB_X50_Y53_N6
\receiver_fifo|memory_inst|ram~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_fifo|memory_inst|ram~33_combout\ = (\receiver_fifo|memory_inst|ram~13_q\ & (\receiver_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a4\)) # (!\receiver_fifo|memory_inst|ram~13_q\ & ((\receiver_fifo|memory_inst|ram~18_q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_fifo|memory_inst|ram~13_q\,
	datab => \receiver_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a4\,
	datac => \receiver_fifo|memory_inst|ram~18_q\,
	combout => \receiver_fifo|memory_inst|ram~33_combout\);

-- Location: LCCOMB_X49_Y53_N22
\receiver_fifo|memory_inst|ram~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_fifo|memory_inst|ram~34_combout\ = (\receiver_fifo|memory_inst|ram~25_combout\ & (((\receiver_fifo|memory_inst|ram_rtl_0_bypass\(17))))) # (!\receiver_fifo|memory_inst|ram~25_combout\ & ((\receiver_fifo|memory_inst|ram_rtl_0_bypass\(18) & 
-- ((\receiver_fifo|memory_inst|ram~33_combout\))) # (!\receiver_fifo|memory_inst|ram_rtl_0_bypass\(18) & (\receiver_fifo|memory_inst|ram_rtl_0_bypass\(17)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_fifo|memory_inst|ram~25_combout\,
	datab => \receiver_fifo|memory_inst|ram_rtl_0_bypass\(18),
	datac => \receiver_fifo|memory_inst|ram_rtl_0_bypass\(17),
	datad => \receiver_fifo|memory_inst|ram~33_combout\,
	combout => \receiver_fifo|memory_inst|ram~34_combout\);

-- Location: FF_X49_Y53_N23
\receiver_fifo|memory_inst|rd1_data[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_fifo|memory_inst|ram~34_combout\,
	ena => \receiver_fifo|rd_int~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_fifo|memory_inst|rd1_data\(4));

-- Location: FF_X49_Y53_N17
\receiver_fifo|memory_inst|ram_rtl_0_bypass[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \receiver_inst|data_out\(5),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_fifo|memory_inst|ram_rtl_0_bypass\(19));

-- Location: LCCOMB_X49_Y53_N18
\receiver_fifo|memory_inst|ram_rtl_0_bypass[20]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_fifo|memory_inst|ram_rtl_0_bypass[20]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \receiver_fifo|memory_inst|ram_rtl_0_bypass[20]~feeder_combout\);

-- Location: FF_X49_Y53_N19
\receiver_fifo|memory_inst|ram_rtl_0_bypass[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_fifo|memory_inst|ram_rtl_0_bypass[20]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_fifo|memory_inst|ram_rtl_0_bypass\(20));

-- Location: FF_X50_Y53_N17
\receiver_fifo|memory_inst|ram~19\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \receiver_inst|data_out\(5),
	sload => VCC,
	ena => \receiver_fifo|memory_inst|ram~42_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_fifo|memory_inst|ram~19_q\);

-- Location: LCCOMB_X50_Y53_N16
\receiver_fifo|memory_inst|ram~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_fifo|memory_inst|ram~35_combout\ = (\receiver_fifo|memory_inst|ram~13_q\ & ((\receiver_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a5\))) # (!\receiver_fifo|memory_inst|ram~13_q\ & (\receiver_fifo|memory_inst|ram~19_q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_fifo|memory_inst|ram~13_q\,
	datac => \receiver_fifo|memory_inst|ram~19_q\,
	datad => \receiver_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a5\,
	combout => \receiver_fifo|memory_inst|ram~35_combout\);

-- Location: LCCOMB_X49_Y53_N8
\receiver_fifo|memory_inst|ram~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_fifo|memory_inst|ram~36_combout\ = (\receiver_fifo|memory_inst|ram_rtl_0_bypass\(20) & ((\receiver_fifo|memory_inst|ram~25_combout\ & (\receiver_fifo|memory_inst|ram_rtl_0_bypass\(19))) # (!\receiver_fifo|memory_inst|ram~25_combout\ & 
-- ((\receiver_fifo|memory_inst|ram~35_combout\))))) # (!\receiver_fifo|memory_inst|ram_rtl_0_bypass\(20) & (\receiver_fifo|memory_inst|ram_rtl_0_bypass\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_fifo|memory_inst|ram_rtl_0_bypass\(19),
	datab => \receiver_fifo|memory_inst|ram_rtl_0_bypass\(20),
	datac => \receiver_fifo|memory_inst|ram~25_combout\,
	datad => \receiver_fifo|memory_inst|ram~35_combout\,
	combout => \receiver_fifo|memory_inst|ram~36_combout\);

-- Location: FF_X49_Y53_N9
\receiver_fifo|memory_inst|rd1_data[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_fifo|memory_inst|ram~36_combout\,
	ena => \receiver_fifo|rd_int~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_fifo|memory_inst|rd1_data\(5));

-- Location: LCCOMB_X49_Y53_N14
\receiver_fifo|memory_inst|ram_rtl_0_bypass[22]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_fifo|memory_inst|ram_rtl_0_bypass[22]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \receiver_fifo|memory_inst|ram_rtl_0_bypass[22]~feeder_combout\);

-- Location: FF_X49_Y53_N15
\receiver_fifo|memory_inst|ram_rtl_0_bypass[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_fifo|memory_inst|ram_rtl_0_bypass[22]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_fifo|memory_inst|ram_rtl_0_bypass\(22));

-- Location: LCCOMB_X49_Y53_N20
\receiver_fifo|memory_inst|ram_rtl_0_bypass[21]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_fifo|memory_inst|ram_rtl_0_bypass[21]~feeder_combout\ = \receiver_inst|data_out\(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \receiver_inst|data_out\(6),
	combout => \receiver_fifo|memory_inst|ram_rtl_0_bypass[21]~feeder_combout\);

-- Location: FF_X49_Y53_N21
\receiver_fifo|memory_inst|ram_rtl_0_bypass[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_fifo|memory_inst|ram_rtl_0_bypass[21]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_fifo|memory_inst|ram_rtl_0_bypass\(21));

-- Location: FF_X50_Y53_N11
\receiver_fifo|memory_inst|ram~20\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \receiver_inst|data_out\(6),
	sload => VCC,
	ena => \receiver_fifo|memory_inst|ram~42_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_fifo|memory_inst|ram~20_q\);

-- Location: LCCOMB_X50_Y53_N10
\receiver_fifo|memory_inst|ram~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_fifo|memory_inst|ram~37_combout\ = (\receiver_fifo|memory_inst|ram~13_q\ & ((\receiver_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a6\))) # (!\receiver_fifo|memory_inst|ram~13_q\ & (\receiver_fifo|memory_inst|ram~20_q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_fifo|memory_inst|ram~13_q\,
	datac => \receiver_fifo|memory_inst|ram~20_q\,
	datad => \receiver_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a6\,
	combout => \receiver_fifo|memory_inst|ram~37_combout\);

-- Location: LCCOMB_X50_Y53_N26
\receiver_fifo|memory_inst|ram~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_fifo|memory_inst|ram~38_combout\ = (\receiver_fifo|memory_inst|ram_rtl_0_bypass\(22) & ((\receiver_fifo|memory_inst|ram~25_combout\ & (\receiver_fifo|memory_inst|ram_rtl_0_bypass\(21))) # (!\receiver_fifo|memory_inst|ram~25_combout\ & 
-- ((\receiver_fifo|memory_inst|ram~37_combout\))))) # (!\receiver_fifo|memory_inst|ram_rtl_0_bypass\(22) & (\receiver_fifo|memory_inst|ram_rtl_0_bypass\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_fifo|memory_inst|ram_rtl_0_bypass\(22),
	datab => \receiver_fifo|memory_inst|ram_rtl_0_bypass\(21),
	datac => \receiver_fifo|memory_inst|ram~25_combout\,
	datad => \receiver_fifo|memory_inst|ram~37_combout\,
	combout => \receiver_fifo|memory_inst|ram~38_combout\);

-- Location: FF_X50_Y53_N27
\receiver_fifo|memory_inst|rd1_data[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_fifo|memory_inst|ram~38_combout\,
	ena => \receiver_fifo|rd_int~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_fifo|memory_inst|rd1_data\(6));

-- Location: FF_X50_Y53_N21
\receiver_fifo|memory_inst|ram~21\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \receiver_inst|data_out\(7),
	sload => VCC,
	ena => \receiver_fifo|memory_inst|ram~42_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_fifo|memory_inst|ram~21_q\);

-- Location: LCCOMB_X50_Y53_N20
\receiver_fifo|memory_inst|ram~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_fifo|memory_inst|ram~39_combout\ = (\receiver_fifo|memory_inst|ram~13_q\ & (\receiver_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a7\)) # (!\receiver_fifo|memory_inst|ram~13_q\ & ((\receiver_fifo|memory_inst|ram~21_q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_fifo|memory_inst|ram~13_q\,
	datab => \receiver_fifo|memory_inst|ram_rtl_0|auto_generated|ram_block1a7\,
	datac => \receiver_fifo|memory_inst|ram~21_q\,
	combout => \receiver_fifo|memory_inst|ram~39_combout\);

-- Location: LCCOMB_X49_Y52_N22
\receiver_fifo|memory_inst|ram_rtl_0_bypass[24]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_fifo|memory_inst|ram_rtl_0_bypass[24]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \receiver_fifo|memory_inst|ram_rtl_0_bypass[24]~feeder_combout\);

-- Location: FF_X49_Y52_N23
\receiver_fifo|memory_inst|ram_rtl_0_bypass[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_fifo|memory_inst|ram_rtl_0_bypass[24]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_fifo|memory_inst|ram_rtl_0_bypass\(24));

-- Location: LCCOMB_X50_Y52_N4
\receiver_fifo|memory_inst|ram_rtl_0_bypass[23]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_fifo|memory_inst|ram_rtl_0_bypass[23]~feeder_combout\ = \receiver_inst|data_out\(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \receiver_inst|data_out\(7),
	combout => \receiver_fifo|memory_inst|ram_rtl_0_bypass[23]~feeder_combout\);

-- Location: FF_X50_Y52_N5
\receiver_fifo|memory_inst|ram_rtl_0_bypass[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_fifo|memory_inst|ram_rtl_0_bypass[23]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_fifo|memory_inst|ram_rtl_0_bypass\(23));

-- Location: LCCOMB_X49_Y52_N24
\receiver_fifo|memory_inst|ram~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \receiver_fifo|memory_inst|ram~40_combout\ = (\receiver_fifo|memory_inst|ram~25_combout\ & (((\receiver_fifo|memory_inst|ram_rtl_0_bypass\(23))))) # (!\receiver_fifo|memory_inst|ram~25_combout\ & ((\receiver_fifo|memory_inst|ram_rtl_0_bypass\(24) & 
-- (\receiver_fifo|memory_inst|ram~39_combout\)) # (!\receiver_fifo|memory_inst|ram_rtl_0_bypass\(24) & ((\receiver_fifo|memory_inst|ram_rtl_0_bypass\(23))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \receiver_fifo|memory_inst|ram~25_combout\,
	datab => \receiver_fifo|memory_inst|ram~39_combout\,
	datac => \receiver_fifo|memory_inst|ram_rtl_0_bypass\(24),
	datad => \receiver_fifo|memory_inst|ram_rtl_0_bypass\(23),
	combout => \receiver_fifo|memory_inst|ram~40_combout\);

-- Location: FF_X49_Y52_N25
\receiver_fifo|memory_inst|rd1_data[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \receiver_fifo|memory_inst|ram~40_combout\,
	ena => \receiver_fifo|rd_int~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \receiver_fifo|memory_inst|rd1_data\(7));

ww_tx <= \tx~output_o\;

ww_tx_free <= \tx_free~output_o\;

ww_rx_data(0) <= \rx_data[0]~output_o\;

ww_rx_data(1) <= \rx_data[1]~output_o\;

ww_rx_data(2) <= \rx_data[2]~output_o\;

ww_rx_data(3) <= \rx_data[3]~output_o\;

ww_rx_data(4) <= \rx_data[4]~output_o\;

ww_rx_data(5) <= \rx_data[5]~output_o\;

ww_rx_data(6) <= \rx_data[6]~output_o\;

ww_rx_data(7) <= \rx_data[7]~output_o\;

ww_rx_empty <= \rx_empty~output_o\;

ww_rx_full <= \rx_full~output_o\;
END structure;


