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

signal op_jmpu : jmp_op_type;
signal op_memu : mem_op_type;
signal N, Z : std_logic;
signal J : std_logic;
signal A : std_logic_vector(ADDR_WIDTH-1 downto 0);
signal W : std_logic_vector(DATA_WIDTH-1 downto 0);
signal D : std_logic_vector(DATA_WIDTH-1 downto 0);
signal M : mem_out_type;
signal R : std_logic_vector(DATA_WIDTH-1 downto 0);
signal XL : std_logic;
signal XS : std_logic;
signal exc_load

begin  -- rtl

op_memu.memread <= mem_op.memread when stall='0' else '0';
op_memu.memwrite <= mem_op.memwrite when stall='0' else '0';

sync : process(all)
begin


end process;

inst : process(all)
begin

if stall='1' then
	
else

end if;

if reset='1' then
	new_pc_out <= (others=>'0');
	pc_out <= (others=>'0');
	rd_out <= (others=>'0');
	aluresult_out <= (others=>'0');
	wbop_out <= WB_NOP;
	exc_load <= '0';
	exc_store <= '0';
	

elsif rising_edge(clk) then
	if flush='1' then
	
	elsif stall!='1'then
		pc_out <= pc_in;
		rd_out <= rd_in;
		aluresult_out <= aluresult_in;
		wbop_out <= wbop_in;
	end if;
end if;
end process;	
jmpu_inst : jmpu
	port map(
		op => op_jmpu,
		N => zero,
		Z => neg,
		J => J
	);
	
memu_inst : memu
	port map(
		op => op_mem,
		A => A,
		W => W,
		D => mem_data,
		M => M,
		R => R,
		XL => XL,
		XS => XS
	);
	
end rtl;
