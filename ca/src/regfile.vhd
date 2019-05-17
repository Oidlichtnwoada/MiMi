library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.core_pack.all;
use work.regfile_pkg.all;

entity regfile is
	
	port (
		clk, reset       : in  std_logic;
		stall            : in  std_logic;
		rdaddr1, rdaddr2 : in  std_logic_vector(REG_BITS-1 downto 0);
		rddata1, rddata2 : out std_logic_vector(DATA_WIDTH-1 downto 0);
		wraddr			 : in  std_logic_vector(REG_BITS-1 downto 0);
		wrdata			 : in  std_logic_vector(DATA_WIDTH-1 downto 0);
		regwrite         : in  std_logic
	);

end regfile;

architecture rtl of regfile is
	signal registers : register_array;
begin
	process(all)
	begin
		if reset = '0' then
			rddata1 <= (others => '0');
			rddata2 <= (others => '0');
		elsif rising_edge(clk) then
			if stall = '1' then
				null;
			else
				--reading
				if unsigned(rdaddr1) = 0 then
					rddata1 <= (others => '0');
				elsif rdaddr1 = wraddr and regwrite = '1' then
					rddata1 <= wrdata;
				else 
					rddata1 <= registers(to_integer(unsigned(rdaddr1)));
				end if;
				if unsigned(rdaddr2) = 0 then
					rddata2 <= (others => '0');
				elsif rdaddr2 = wraddr and regwrite = '1' then
					rddata2 <= wrdata;
				else 
					rddata2 <= registers(to_integer(unsigned(rdaddr2)));
				end if;
				--writing
				if regwrite = '1' then
					registers(to_integer(unsigned(wraddr))) <= wrdata;
				end if;
			end if;
		end if;
	end process;
end rtl;
