library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.core_pack.all;
use work.op_pack.all;

entity exec is
	
	port (
		clk, reset		: in  std_logic;
		stall				: in  std_logic;
		flush				: in  std_logic;
		pc_in				: in  std_logic_vector(PC_WIDTH-1 downto 0);
		op					: in  exec_op_type;
		pc_out			: out std_logic_vector(PC_WIDTH-1 downto 0);
		rd, rs, rt		: out std_logic_vector(REG_BITS-1 downto 0);
		aluresult		: out std_logic_vector(DATA_WIDTH-1 downto 0);
		wrdata			: out std_logic_vector(DATA_WIDTH-1 downto 0);
		zero, neg		: out std_logic;
		new_pc			: out std_logic_vector(PC_WIDTH-1 downto 0);		
		memop_in			: in  mem_op_type;
		memop_out		: out mem_op_type;
		jmpop_in			: in  jmp_op_type;
		jmpop_out		: out jmp_op_type;
		wbop_in			: in  wb_op_type;
		wbop_out			: out wb_op_type;
		forwardA			: in  fwd_type;
		forwardB			: in  fwd_type;
		cop0_rddata		: in  std_logic_vector(DATA_WIDTH-1 downto 0);
		mem_aluresult	: in  std_logic_vector(DATA_WIDTH-1 downto 0);
		wb_result		: in  std_logic_vector(DATA_WIDTH-1 downto 0);
		exc_ovf			: out std_logic);

end exec;

architecture rtl of exec is

	signal signal_rd, signal_rs, signal_rt	: std_logic_vector(REG_BITS-1 downto 0);
	signal signal_aluresult						: std_logic_vector(DATA_WIDTH-1 downto 0);
	signal signal_wrdata							: std_logic_vector(DATA_WIDTH-1 downto 0);
	signal signal_zero, signal_neg			: std_logic;
	signal signal_new_pc							: std_logic_vector(PC_WIDTH-1 downto 0);
	signal signal_exc_ovf						: std_logic);
	
	signal signal_rd_nxt, signal_rs_nxt, signal_rt_nxt	: std_logic_vector(REG_BITS-1 downto 0);
	signal signal_aluresult_nxt								: std_logic_vector(DATA_WIDTH-1 downto 0);
	signal signal_wrdata_nxt									: std_logic_vector(DATA_WIDTH-1 downto 0);
	signal signal_zero_nxt, signal_neg_nxt					: std_logic;
	signal signal_new_pc_nxt									: std_logic_vector(PC_WIDTH-1 downto 0);
	signal signal_exc_ovf_nxt									: std_logic);
	
	signal alu_OP					: alu_op_type;
	signal alu_A, alu_B, alu_R	: std_logic_vector(DATA_WIDTH-1 downto 0);
	signal alu_Z, alu_V			: std_logic;

	component alu is
		port (
			op   : in  alu_op_type;
			A, B : in  std_logic_vector(DATA_WIDTH-1 downto 0);
			R    : out std_logic_vector(DATA_WIDTH-1 downto 0);
			Z    : out std_logic;
			V    : out std_logic);
	end component;

	
	
begin  -- rtl
	
	alu_inst:alu
	port map (
		op	=> alu_OP,
		A	=> alu_A,
		B	=> alu_B,
		R	=> alu_R,
		Z	=> alu_Z,
		V	=> alu_V
	);

	sync:process(clk,reset,stall,flush)
	begin
	
		if (reset = '0') then
			
			signal_rd			<= (others=>'0');
			signal_rs			<= (others=>'0');
			signal_rt			<= (others=>'0');
			signal_aluresult	<= (others=>'0');
			signal_wrdata		<= (others=>'0');
			signal_zero			<= '0';
			signal_neg			<= '0';
			signal_new_pc		<= (others=>'0');
			signal_exc_ovf		<= '0';
			
			pc_out 		<= (others=>'0');
			memop_out	<= MEM_NOP;
			jmpop_out	<= JMP_NOP;
			wbop_out		<= WB_NOP;
			
		elsif rising_edge(clk) then
		
			if (flush = '1') then
				
				signal_rd			<= (others=>'0');
				signal_rs			<= (others=>'0');
				signal_rt			<= (others=>'0');
				signal_aluresult	<= (others=>'0');
				signal_wrdata		<= (others=>'0');
				signal_zero			<= '0';
				signal_neg			<= '0';
				signal_new_pc		<= (others=>'0');
				signal_exc_ovf		<= '0';
			
				pc_out 		<= (others=>'0');
				memop_out	<= MEM_NOP;
				jmpop_out	<= JMP_NOP;
				wbop_out		<= WB_NOP;
				
			elsif (stall = '0') then
			
				signal_rd			<= signal_rd_nxt;
				signal_rs			<= signal_rs_nxt;
				signal_rt			<= signal_rt_nxt;
				signal_aluresult	<= signal_aluresult_nxt;
				signal_wrdata		<= signal_wrdata_nxt;
				signal_zero			<= signal_zero_nxt;
				signal_neg			<= signal_neg_nxt;
				signal_new_pc		<= signal_new_pc_nxt;
				signal_exc_ovf		<= signal_exc_ovf_nxt;
			
				pc_out 		<= pc_in;
				memop_out	<= memop_in;
				jmpop_out	<= jmpop_in;
				wbop_out		<= wbop_in;
			
			end if;
				
		end if;
	end process;
	
	ecec:process(all)
	begin
	
	
	
	end process;
	
end rtl;
