library ieee;
use ieee.std_logic_1164.all;

use work.core_pack.all;
use work.op_pack.all;

entity pipeline is
	port (
		clk, reset : in	 std_logic;
		mem_in     : in  mem_in_type;
		mem_out    : out mem_out_type;
		intr       : in  std_logic_vector(INTR_COUNT-1 downto 0)
	);
end pipeline;

architecture rtl of pipeline is

	component fetch is
		port (
			clk, reset : in	 std_logic;
			stall      : in  std_logic;
			flush            : in  std_logic;
			pcsrc	  	 : in	 std_logic;
			pc_in	   	 : in	 std_logic_vector(PC_WIDTH-1 downto 0);
			pc_out	   : out std_logic_vector(PC_WIDTH-1 downto 0);
			instr	     : out std_logic_vector(INSTR_WIDTH-1 downto 0)
		);
	end component;

	component decode is
		port (
			clk, reset : in  std_logic;
			stall      : in  std_logic;
			flush      : in  std_logic;
			pc_in      : in  std_logic_vector(PC_WIDTH-1 downto 0);
			instr	   	 : in  std_logic_vector(INSTR_WIDTH-1 downto 0);
			wraddr     : in  std_logic_vector(REG_BITS-1 downto 0);
			wrdata     : in  std_logic_vector(DATA_WIDTH-1 downto 0);
			regwrite   : in  std_logic;
			pc_out     : out std_logic_vector(PC_WIDTH-1 downto 0);
			exec_op    : out exec_op_type;
			cop0_op    : out cop0_op_type;
			jmp_op     : out jmp_op_type;
			mem_op     : out mem_op_type;
			wb_op      : out wb_op_type;
			exc_dec    : out std_logic;
			rdaddr1_out : out std_logic_vector(REG_BITS-1 downto 0);
			rdaddr2_out : out std_logic_vector(REG_BITS-1 downto 0)
		);
	end component;

	component exec is
		port (
			clk, reset       : in  std_logic;
			stall      		   : in  std_logic;
			flush            : in  std_logic;
			pc_in            : in  std_logic_vector(PC_WIDTH-1 downto 0);
			op	   	         : in  exec_op_type;
			pc_out           : out std_logic_vector(PC_WIDTH-1 downto 0);
			rd, rs, rt       : out std_logic_vector(REG_BITS-1 downto 0);
			aluresult	       : out std_logic_vector(DATA_WIDTH-1 downto 0);
			wrdata           : out std_logic_vector(DATA_WIDTH-1 downto 0);
			zero, neg        : out std_logic;
			new_pc           : out std_logic_vector(PC_WIDTH-1 downto 0);
			memop_in         : in  mem_op_type;
			memop_out        : out mem_op_type;
			jmpop_in         : in  jmp_op_type;
			jmpop_out        : out jmp_op_type;
			wbop_in          : in  wb_op_type;
			wbop_out         : out wb_op_type;
			forwardA         : in  fwd_type;
			forwardB         : in  fwd_type;
			cop0_rddata      : in  std_logic_vector(DATA_WIDTH-1 downto 0);
			mem_aluresult    : in  std_logic_vector(DATA_WIDTH-1 downto 0);
			wb_result        : in  std_logic_vector(DATA_WIDTH-1 downto 0);
			exc_ovf          : out std_logic;
			rdaddr1_in : in std_logic_vector(REG_BITS-1 downto 0);
			rdaddr2_in : in std_logic_vector(REG_BITS-1 downto 0);
			rdaddr1_out : out std_logic_vector(REG_BITS-1 downto 0);
			rdaddr2_out : out std_logic_vector(REG_BITS-1 downto 0)
		);
	end component;

	component mem is
		port (
			clk, reset    : in  std_logic;
			stall         : in  std_logic;
			flush         : in  std_logic;
			mem_op        : in  mem_op_type;
			jmp_op        : in  jmp_op_type;
			pc_in         : in  std_logic_vector(PC_WIDTH-1 downto 0);
			rd_in         : in  std_logic_vector(REG_BITS-1 downto 0);
			aluresult_in  : in  std_logic_vector(DATA_WIDTH-1 downto 0);
			wrdata        : in  std_logic_vector(DATA_WIDTH-1 downto 0);
			zero, neg     : in  std_logic;
			new_pc_in     : in  std_logic_vector(PC_WIDTH-1 downto 0);
			pc_out        : out std_logic_vector(PC_WIDTH-1 downto 0);
			pcsrc         : out std_logic;
			rd_out        : out std_logic_vector(REG_BITS-1 downto 0);
			aluresult_out : out std_logic_vector(DATA_WIDTH-1 downto 0);
			memresult     : out std_logic_vector(DATA_WIDTH-1 downto 0);
			new_pc_out    : out std_logic_vector(PC_WIDTH-1 downto 0);
			wbop_in       : in  wb_op_type;
			wbop_out      : out wb_op_type;
			mem_out       : out mem_out_type;
			mem_data      : in  std_logic_vector(DATA_WIDTH-1 downto 0);
			exc_load      : out std_logic;
			exc_store     : out std_logic
		);
	end component;

	component wb is
		port (
			clk, reset : in  std_logic;
			stall      : in  std_logic;
			flush      : in  std_logic;
			op	   	   : in  wb_op_type;
			rd_in      : in  std_logic_vector(REG_BITS-1 downto 0);
			aluresult  : in  std_logic_vector(DATA_WIDTH-1 downto 0);
			memresult  : in  std_logic_vector(DATA_WIDTH-1 downto 0);
			rd_out     : out std_logic_vector(REG_BITS-1 downto 0);
			result     : out std_logic_vector(DATA_WIDTH-1 downto 0);
			regwrite   : out std_logic
		);
	end component;

	component fwd is
		port (
			mem_rd, wb_rd : in std_logic_vector(REG_BITS-1 downto 0);
			mem_regwrite, wb_regwrite : in std_logic;
			forwardA, forwardB		: out  fwd_type;
			execrdaddr1 : in std_logic_vector(REG_BITS-1 downto 0);
			execrdaddr2 : in std_logic_vector(REG_BITS-1 downto 0)
		);
	end component;
	
	component ctrl is
		port(
			J              : in std_logic;
			decode_flush   : out std_logic;
			fetch_flush    : out std_logic
		);
	end component;

	signal flush : std_logic;
	signal stall : std_logic;
	signal mem_fetch_pcsrc : std_logic;
	signal mem_fetch_new_pc : std_logic_vector(PC_WIDTH-1 downto 0);
	signal fetch_decode_pc : std_logic_vector(PC_WIDTH-1 downto 0);
	signal fetch_decode_instr : std_logic_vector(INSTR_WIDTH-1 downto 0);
	--
	signal wb_decode_wraddr : std_logic_vector(REG_BITS-1 downto 0);
	signal wb_decode_wrdata : std_logic_vector(DATA_WIDTH-1 downto 0);
	signal wb_decode_regwrite : std_logic;
	signal decode_exec_pc : std_logic_vector(PC_WIDTH-1 downto 0);
	signal decode_exec_exec_op : exec_op_type;
	signal decode_exec_jmp_op : jmp_op_type;
	signal decode_exec_mem_op : mem_op_type;
	signal decode_exec_wb_op : wb_op_type;
	--
	signal exec_mem_pc : std_logic_vector(PC_WIDTH-1 downto 0);
	signal exec_mem_rd : std_logic_vector(REG_BITS-1 downto 0);
	signal exec_mem_rs : std_logic_vector(REG_BITS-1 downto 0);
	signal exec_mem_rt : std_logic_vector(REG_BITS-1 downto 0);
	signal exec_mem_aluresult : std_logic_vector(DATA_WIDTH-1 downto 0);
	signal exec_mem_wrdata : std_logic_vector(DATA_WIDTH-1 downto 0);
	signal exec_mem_zero : std_logic;
	signal exec_mem_neg : std_logic;
	signal exec_mem_new_pc : std_logic_vector(PC_WIDTH-1 downto 0);
	signal exec_mem_mem_op : mem_op_type;
	signal exec_mem_jmp_op : jmp_op_type;
	signal exec_mem_wb_op : wb_op_type;
	--
	signal mem_wb_rd : std_logic_vector(REG_BITS-1 downto 0);
	signal mem_wb_aluresult : std_logic_vector(DATA_WIDTH-1 downto 0);
	signal mem_wb_memresult : std_logic_vector(DATA_WIDTH-1 downto 0);
	signal mem_wb_wb_op : wb_op_type;
	--
	signal forwardA, forwardB : fwd_type;
	signal decode_exec_rdaddr1, decode_exec_rdaddr2, exec_fwd_rdaddr1, exec_fwd_rdaddr2 : std_logic_vector(REG_BITS-1 downto 0);
	--
	signal decode_flush, fetch_flush : std_logic;
	--
	

begin

	flush <= '0';
	stall <= mem_in.busy;

	fwd_inst : fwd
	port map(execrdaddr1 => exec_fwd_rdaddr1, execrdaddr2 => exec_fwd_rdaddr2, mem_rd => mem_wb_rd, wb_rd => wb_decode_wraddr,
	 			mem_regwrite => mem_wb_wb_op.regwrite, wb_regwrite => wb_decode_regwrite, forwardA => forwardA, forwardB => forwardB);

	fetch_inst: fetch
	port map(clk => clk, reset => reset, stall => stall, flush => fetch_flush, pcsrc => mem_fetch_pcsrc,
				pc_in => mem_fetch_new_pc, pc_out => fetch_decode_pc, instr => fetch_decode_instr);

	decode_inst: decode
	port map(clk => clk, reset => reset, stall => stall, flush => decode_flush, pc_in => fetch_decode_pc,
				instr => fetch_decode_instr, wraddr => wb_decode_wraddr, wrdata => wb_decode_wrdata,
				regwrite => wb_decode_regwrite, pc_out => decode_exec_pc, exec_op => decode_exec_exec_op,
				cop0_op => open, jmp_op => decode_exec_jmp_op, mem_op => decode_exec_mem_op,
				wb_op => decode_exec_wb_op, exc_dec => open, rdaddr1_out => decode_exec_rdaddr1, rdaddr2_out => decode_exec_rdaddr2);

	exec_inst: exec
	port map(clk => clk, reset => reset, stall => stall, flush => flush, pc_in => decode_exec_pc,
				op => decode_exec_exec_op, pc_out => exec_mem_pc, rd => exec_mem_rd, rs => exec_mem_rs,
				rt => exec_mem_rt, aluresult => exec_mem_aluresult, wrdata => exec_mem_wrdata,
				zero => exec_mem_zero, neg => exec_mem_neg, new_pc => exec_mem_new_pc,
				memop_in => decode_exec_mem_op, memop_out => exec_mem_mem_op, jmpop_in => decode_exec_jmp_op,
				jmpop_out => exec_mem_jmp_op, wbop_in => decode_exec_wb_op, wbop_out => exec_mem_wb_op,
				forwardA => forwardA, forwardB => forwardB, cop0_rddata => (others => '0'),
				mem_aluresult => mem_wb_aluresult, wb_result => wb_decode_wrdata, exc_ovf => open,
				rdaddr1_in => decode_exec_rdaddr1, rdaddr2_in => decode_exec_rdaddr2,
				rdaddr1_out => exec_fwd_rdaddr1, rdaddr2_out => exec_fwd_rdaddr2);

	mem_inst: mem
	port map(clk => clk, reset => reset, stall => stall, flush => flush,
				mem_op => exec_mem_mem_op, jmp_op => exec_mem_jmp_op, pc_in => exec_mem_pc, rd_in => exec_mem_rd,
				aluresult_in => exec_mem_aluresult, wrdata => exec_mem_wrdata, zero => exec_mem_zero,
				neg => exec_mem_neg, new_pc_in => exec_mem_new_pc, pc_out => open, pcsrc => mem_fetch_pcsrc,
				rd_out => mem_wb_rd, aluresult_out => mem_wb_aluresult, memresult => mem_wb_memresult,
				new_pc_out => mem_fetch_new_pc, wbop_in => exec_mem_wb_op, wbop_out => mem_wb_wb_op,
				mem_out => mem_out, mem_data => mem_in.rddata, exc_load => open, exc_store => open);

	wb_inst: wb
	port map(clk => clk, reset => reset, stall => stall, flush => flush, op => mem_wb_wb_op,
				rd_in => mem_wb_rd, aluresult => mem_wb_aluresult, memresult => mem_wb_memresult,
				rd_out => wb_decode_wraddr, result => wb_decode_wrdata, regwrite => wb_decode_regwrite);
	
	ctrl_inst: ctrl
	port map(J => mem_fetch_pcsrc, decode_flush => decode_flush, fetch_flush => fetch_flush);

end rtl;
