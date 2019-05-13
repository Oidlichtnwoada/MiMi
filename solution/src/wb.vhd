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
		op	   	   : in  wb_op_type;
		rd_in      : in  std_logic_vector(REG_BITS-1 downto 0);
		aluresult  : in  std_logic_vector(DATA_WIDTH-1 downto 0);
		memresult  : in  std_logic_vector(DATA_WIDTH-1 downto 0);
		rd_out     : out std_logic_vector(REG_BITS-1 downto 0);
		result     : out std_logic_vector(DATA_WIDTH-1 downto 0);
		regwrite   : out std_logic);

end wb;

architecture rtl of wb is

	signal var_result : std_logic_vector(DATA_WIDTH-1 downto 0);
	
	signal var_regwrite    : std_logic;

begin  -- rtl

	sync : process(all)
	begin
		
		
		if reset = '0' then
			var_result <= (others=>'0');
			var_regwrite <= '0';
			rd_out <= (others=>'0');
				
		elsif flush = '1' then
			var_result <= (others=>'0');
			var_regwrite <= '0';

		elsif stall = '1' then

		else
			rd_out <= rd_in;
			var_regwrite <= op.regwrite;
			var_result <= (others=>'0');
			
			if op.memtoreg = '1' then
				var_result <= memresult;
			else
				var_result <= aluresult;
			end if;
			
		end if;
		
	end process;
	
	result <= var_result;
	regwrite <= var_regwrite;

end rtl;
