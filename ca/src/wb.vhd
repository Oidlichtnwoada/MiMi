library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.core_pack.all;
use work.op_pack.all;

entity wb is

	port (
		clk, reset : in  std_logic;
		stall      : in  std_logic;
		flush      : in  std_logic;
		op         : in  wb_op_type;
		rd_in      : in  std_logic_vector(REG_BITS-1 downto 0);
		aluresult  : in  std_logic_vector(DATA_WIDTH-1 downto 0);
		memresult  : in  std_logic_vector(DATA_WIDTH-1 downto 0);
		rd_out     : out std_logic_vector(REG_BITS-1 downto 0);
		result     : out std_logic_vector(DATA_WIDTH-1 downto 0);
		regwrite   : out std_logic
	);
end wb;

architecture rtl of wb is
	signal sig_op : wb_op_type;
	signal sig_rd_in : std_logic_vector(REG_BITS-1 downto 0);
	signal sig_aluresult : std_logic_vector(DATA_WIDTH-1 downto 0);
	signal sig_memresult : std_logic_vector(DATA_WIDTH-1 downto 0);
begin

process (all)
begin
	if reset = '0' then
		sig_op <= WB_NOP;
		sig_rd_in <= (others => '0');
		sig_aluresult <= (others => '0');
		sig_memresult <= (others => '0');
	elsif rising_edge(clk) and stall = '0' then
		sig_op <= op;
		sig_rd_in <= rd_in;
		sig_aluresult <= aluresult;
		sig_memresult <= memresult;
	end if;
	if flush = '1' then
		sig_op <= WB_NOP;
	end if;
end process;

process (all)
begin
	rd_out <= sig_rd_in;
	regwrite <= sig_op.regwrite;
	if sig_op.memtoreg = '1' then
		result <= sig_memresult;
	else
		result <= sig_aluresult;
	end if;
end process;

end rtl;
