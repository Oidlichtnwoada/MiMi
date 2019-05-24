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
		exc_store     : out std_logic);

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
signal A : std_logic_vector(ADDR_WIDTH-1 downto 0);
signal W : std_logic_vector(DATA_WIDTH-1 downto 0);
signal D : std_logic_vector(DATA_WIDTH-1 downto 0);
signal M : mem_out_type;
signal R : std_logic_vector(DATA_WIDTH-1 downto 0);
signal XL : std_logic;
signal XS : std_logic;

--internal signals
signal sig_mem_op : mem_op_type;
signal sig_XL : std_logic;
signal sig_XL_next : std_logic;
signal sig_XS : std_logic;
signal sig_XS_next : std_logic;
signal sig_R : std_logic_vector(DATA_WIDTH-1 downto 0);
signal sig_R_next : std_logic_vector(DATA_WIDTH-1 downto 0);
signal sig_M : mem_out_type;
signal sig_M_next : mem_out_type;
signal sig_J_next : std_logic;
signal sig_new_pc_out : std_logic_vector(PC_WIDTH-1 downto 0);

begin  -- rtl

--mem_op to memu
op_mem.memtype <= sig_mem_op.memtype;
op_mem.memread <= sig_mem_op.memread when stall='0' else '0';
op_mem.memwrite <= sig_mem_op.memwrite when stall='0' else '0';


exc_load <= sig_XL_next;
exc_store <= sig_XS_next;
memresult <= sig_R_next;
mem_out <= sig_M_next;

sync : process(all)
begin
	sig_XL_next <= XL;
	sig_XS_next <= XS;
	sig_R_next <= R;
	sig_M_next <= M;

end process;

inst : process(all)
begin

	pcsrc <= sig_J_next;
	new_pc_out <= sig_new_pc_out;

	if stall='1' then
		--store values
		sig_J_next <= pcsrc;
		sig_new_pc_out <= new_pc_out;
	else
		pcsrc <= J;
		sig_J_next <= J;
		
		new_pc_out <= new_pc_in;
		sig_new_pc_out <= new_pc_in;	
	end if;

	if reset='0' then
		pcsrc <= '0';
		new_pc_out <= (others=>'0');
		pc_out <= (others=>'0');
		rd_out <= (others=>'0');
		aluresult_out <= (others=>'0');
		wbop_out <= WB_NOP;
		sig_mem_op <= MEM_NOP;
		

	elsif rising_edge(clk) then
		if flush='1' then
		
		elsif stall='0' then
			pc_out <= pc_in;
			rd_out <= rd_in;
			aluresult_out <= aluresult_in;
			A <= aluresult_in;
			wbop_out <= wbop_in;
			sig_mem_op <= mem_op;
			W <= wrdata;
		else
		
		end if;
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
