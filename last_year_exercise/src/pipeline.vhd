library ieee;
use ieee.std_logic_1164.all;

use work.core_pack.all;
use work.op_pack.all;

use work.fetch;
use work.decode;
use work.exec;
use work.mem;
use work.wb;

entity pipeline is
	
	port (
		clk, reset : in	 std_logic;
		mem_in     : in  mem_in_type;
		mem_out    : out mem_out_type;
		intr       : in  std_logic_vector(INTR_COUNT-1 downto 0));

end pipeline;

architecture rtl of pipeline is

	component fetch is
	
		port (
			clk, reset : in	 std_logic;
			stall      : in  std_logic;
			pcsrc	   : in	 std_logic;
			pc_in	   : in	 std_logic_vector(PC_WIDTH-1 downto 0);
			pc_out	   : out std_logic_vector(PC_WIDTH-1 downto 0);
			instr	   : out std_logic_vector(INSTR_WIDTH-1 downto 0));

	end component;
	
	component exec is
	
		port (
			clk, reset       : in  std_logic;
			stall      		 : in  std_logic;
			flush            : in  std_logic;
			pc_in            : in  std_logic_vector(PC_WIDTH-1 downto 0);
			op	   	         : in  exec_op_type;
			pc_out           : out std_logic_vector(PC_WIDTH-1 downto 0);
			rd, rs, rt       : out std_logic_vector(REG_BITS-1 downto 0);
			aluresult	     : out std_logic_vector(DATA_WIDTH-1 downto 0);
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
			exc_ovf          : out std_logic);

	end component;
	
	component decode is
	
		port (
			clk, reset : in  std_logic;
			stall      : in  std_logic;
			flush      : in  std_logic;
			pc_in      : in  std_logic_vector(PC_WIDTH-1 downto 0);
			instr	   : in  std_logic_vector(INSTR_WIDTH-1 downto 0);
			wraddr     : in  std_logic_vector(REG_BITS-1 downto 0);
			wrdata     : in  std_logic_vector(DATA_WIDTH-1 downto 0);
			regwrite   : in  std_logic;
			pc_out     : out std_logic_vector(PC_WIDTH-1 downto 0);
			exec_op    : out exec_op_type;
			cop0_op    : out cop0_op_type;
			jmp_op     : out jmp_op_type;
			mem_op     : out mem_op_type;
			wb_op      : out wb_op_type;
			exc_dec    : out std_logic);

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
			exc_store     : out std_logic);

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
			regwrite   : out std_logic);

	end component;

	signal flush,stall	:std_logic;

	signal fet_dec_pc :std_logic_vector(PC_WIDTH-1 downto 0);
	signal fet_dec_instr	:std_logic_vector(INSTR_WIDTH-1 downto 0);
	
	signal dec_exe_pc	:std_logic_vector(PC_WIDTH-1 downto 0);
	signal dec_exe_op	:exec_op_type;
	signal dec_exe_jmp_op	:jmp_op_type;
	signal dec_exe_mem_op	:mem_op_type;
	signal dec_exe_wb_op	:wb_op_type;
	
	signal exe_mem_rd	:std_logic_vector(REG_BITS-1 downto 0);
	signal exe_mem_aluresult	:std_logic_vector(DATA_WIDTH-1 downto 0);
	signal exe_mem_wrdata	:std_logic_vector(DATA_WIDTH-1 downto 0);
	signal exe_mem_zero	:std_logic;
	signal exe_mem_neg	:std_logic;
	signal exe_mem_new_pc	:std_logic_vector(PC_WIDTH-1 downto 0);
	signal exe_mem_pc	:std_logic_vector(PC_WIDTH-1 downto 0);
	signal exe_mem_mem_op	:mem_op_type;
	signal exe_mem_jmpu_op	:jmp_op_type;
	signal exe_mem_wb_op	:wb_op_type;
	
	signal mem_wb_memresult	:std_logic_vector(DATA_WIDTH-1 downto 0);
	signal mem_wb_rd	:std_logic_vector(REG_BITS-1 downto 0);
	signal mem_wb_aluresult	:std_logic_vector(DATA_WIDTH-1 downto 0);
	signal mem_wb_wb_op	:wb_op_type;
	
	signal mem_fet_pcsrc	:std_logic;
	signal mem_fet_new_pc	:std_logic_vector(PC_WIDTH-1 downto 0);
	
	signal wb_dec_result	:std_logic_vector(DATA_WIDTH-1 downto 0);
	signal wb_dec_regwrite	:std_logic;
	signal wb_dec_rd	:std_logic_vector(REG_BITS-1 downto 0);
	
begin  -- rtl

	flush <= '0';
	stall <= mem_in.busy;

	fetch_inst : fetch
	port map (
		clk	=> clk,
		reset	=> reset,
		stall	=> stall,
		pcsrc	=> mem_fet_pcsrc,
		pc_in	=> mem_fet_new_pc,
		pc_out	=> fet_dec_pc,
		instr	=> fet_dec_instr
	);
	
	decode_inst : decode
	port map (
		clk	=> clk, 
		reset	=> reset,
		stall	=> stall,
		flush	=> flush,
		pc_in	=> fet_dec_pc,
		instr	=> fet_dec_instr,
		wraddr 	=> wb_dec_rd,
		wrdata	=> wb_dec_result,
		regwrite	=> wb_dec_regwrite,
		pc_out	=> dec_exe_pc,
		exec_op	=> dec_exe_op,
		cop0_op	=> open,
		jmp_op	=> dec_exe_jmp_op,
		mem_op	=> dec_exe_mem_op,
		wb_op	=> dec_exe_wb_op,
		exc_dec	=> open
	);
	
	exec_inst : exec
	port map (
		clk => clk, 
		reset => reset,
		stall => stall,
		flush => flush,
		pc_in => dec_exe_pc,
		op => dec_exe_op,
		pc_out => exe_mem_pc,
		rd => exe_mem_rd, 
		rs => open, 
		rt => open,
		aluresult => exe_mem_aluresult,
		wrdata => exe_mem_wrdata,
		zero => exe_mem_zero,
		neg => exe_mem_neg,
		new_pc  => exe_mem_new_pc,		
		memop_in => dec_exe_mem_op,
		memop_out => exe_mem_mem_op,
		jmpop_in => dec_exe_jmp_op,
		jmpop_out => exe_mem_jmpu_op,
		wbop_in => dec_exe_wb_op,
		wbop_out => exe_mem_wb_op,
		forwardA => FWD_NONE,
		forwardB => FWD_NONE,
		cop0_rddata => (others=>'0'),
		mem_aluresult  => (others=>'0'),
		wb_result => (others=>'0'),
		exc_ovf => open
	);
	
	mem_inst : mem
	port map (
		clk	=> clk,
		reset	=> reset,
		stall	=> stall,
		flush	=> flush,
		mem_op	=> exe_mem_mem_op,
		jmp_op	=> exe_mem_jmpu_op,
		pc_in	=> exe_mem_pc,
		rd_in	=> exe_mem_rd,
		aluresult_in	=> exe_mem_aluresult,
		wrdata	=> exe_mem_wrdata,
		zero	=> exe_mem_zero,
		neg	=> exe_mem_neg,
		new_pc_in	=> exe_mem_new_pc,
		pc_out	=> open,
		pcsrc	=> mem_fet_pcsrc,
		rd_out	=> mem_wb_rd,
		aluresult_out	=> mem_wb_aluresult,
		memresult	=> mem_wb_memresult,
		new_pc_out	=> mem_fet_new_pc,
		wbop_in	=> exe_mem_wb_op,
		wbop_out	=> mem_wb_wb_op,
		mem_out	=> mem_out,
		mem_data	=> mem_in.rddata,
		exc_load	=> open,
		exc_store	=> open
	);
	
	wb_inst : wb
	port map (
		clk	=> clk, 
		reset	=> reset,
		stall	=> stall,
		flush	=> flush,
		op	=> mem_wb_wb_op,
		rd_in	=> mem_wb_rd,
		aluresult	=> mem_wb_aluresult,
		memresult	=> mem_wb_memresult,
		rd_out	=> wb_dec_rd,
		result	=> wb_dec_result,
		regwrite	=> wb_dec_regwrite
	);
	
end rtl;
