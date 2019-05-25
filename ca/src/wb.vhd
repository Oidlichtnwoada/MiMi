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

begin  -- rtl

process(clk, reset, stall, flush, op, rd_in, aluresult, memresult)
begin
	--report "wb";
	if reset = '0' then
		report "wb 1";
		rd_out <= (others => '0');
		result <= (others => '0');
		regwrite <= '0';
	elsif flush = '1' then
		report "wb 2";
		result <= (others=>'0');
		regwrite <= '0';
	elsif stall='1' then
		report "wb 3";
		null;
	else
		rd_out <= rd_in;
		regwrite <= op.regwrite;
		if op.memtoreg='1' then
			report "wb 4";
			result <= memresult;
		else
			report "wb 5";
			result <= aluresult;
		end if;
	end if;
end process;
end rtl;
