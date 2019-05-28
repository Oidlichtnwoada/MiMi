library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.core_pack.all;
use work.op_pack.all;

entity mem is

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

end mem;

architecture rtl of mem is

component jmpu is
port(
		op   : in  jmp_op_type;
		N, Z : in  std_logic;
		J    : out std_logic);
end component;

component memu is
port(
		op   : in  mem_op_type;
		A    : in  std_logic_vector(ADDR_WIDTH-1 downto 0);
		W    : in  std_logic_vector(DATA_WIDTH-1 downto 0);
		D    : in  std_logic_vector(DATA_WIDTH-1 downto 0);
		M    : out mem_out_type;
		R    : out std_logic_vector(DATA_WIDTH-1 downto 0);
		XL   : out std_logic;
		XS   : out std_logic);
end component;

--signals to components
signal op_mem : mem_op_type;
signal N, Z : std_logic;
signal J : std_logic;
signal A : std_logic_vector(DATA_WIDTH-1 downto 0);
signal W : std_logic_vector(DATA_WIDTH-1 downto 0);
signal D : std_logic_vector(DATA_WIDTH-1 downto 0);
signal M : mem_out_type;
signal R : std_logic_vector(DATA_WIDTH-1 downto 0);
signal XL : std_logic;
signal XS : std_logic;

--internal signals
signal sig_mem_op : mem_op_type;
signal sig_jmp_op : jmp_op_type;
signal sig_pc_in : std_logic_vector(PC_WIDTH-1 downto 0);
signal sig_rd_in : std_logic_vector(REG_BITS-1 downto 0);
signal sig_aluresult_in : std_logic_vector(DATA_WIDTH-1 downto 0);
signal sig_wrdata : std_logic_vector(DATA_WIDTH-1 downto 0);
signal sig_zero, sig_neg : std_logic;
signal sig_new_pc_in : std_logic_vector(PC_WIDTH-1 downto 0);
signal sig_wbop_in : wb_op_type;
signal sig_mem_data : std_logic_vector(DATA_WIDTH-1 downto 0);

begin  -- rtl

sync : process(all)
begin
	if reset = '0' then
		sig_mem_op <= MEM_NOP;
		sig_jmp_op <= JMP_NOP;
		sig_pc_in <= (others => '0');
		sig_rd_in <= (others => '0');
		sig_aluresult_in <= (others => '0');
		sig_wrdata <= (others => '0');
		sig_zero <= '0';
		sig_neg <= '0';
		sig_new_pc_in <= (others => '0');
		sig_wbop_in <= WB_NOP;
		sig_mem_data <= (others => '0');
	elsif rising_edge(clk) and stall = '0' then
		sig_mem_op <= mem_op;
		sig_jmp_op <= jmp_op;
		sig_pc_in <= pc_in;
		sig_rd_in <= rd_in;
		sig_aluresult_in <= aluresult_in;
		sig_wrdata <= wrdata;
		sig_zero <= zero;
		sig_neg <= neg;
		sig_new_pc_in <= new_pc_in;
		sig_wbop_in <= wbop_in;
		sig_mem_data <= mem_data;
	end if;
	if flush = '1' then
		sig_mem_op <= MEM_OP;
	end if;
end process;

process(all)
begin
	exc_load <= XL;
	exc_store <= XS;
	memresult <= R;
	mem_out <= M;
	pcsrc <= J;
	new_pc_out <= new_pc_in;
	pc_out <= sig_pc_in;
	rd_out <= sig_rd_in;
	aluresult_out <= sig_aluresult_in;
	A <= sig_aluresult_in;
	wbop_out <= sig_wbop_in;
	op_mem <= sig_mem_op;
	W <= sig_wrdata;
	op_mem.memread <= sig_mem_op.memread;
	op_mem.memwrite <= sig_mem_op.memwrite;
	if stall = '1' then
		op_mem.memread <= '0';
		op_mem.memwrite <= '0';
	end if;
end process;

jmpu_inst : jmpu
	port map(
		op => jmp_op, --in
		N => zero, --in
		Z => neg, --in
		J => J --out pcsrc
	);

memu_inst : memu
	port map(
		op => op_mem, --in
		A => A(ADDR_WIDTH-1 downto 0), --in aluresult
		W => W, --in write_data
		D => mem_data, --in
		M => M, --out mem_out
		R => R, --out memresult
		XL => XL, --out exc_load
		XS => XS  --out exc_store
	);

end rtl;
