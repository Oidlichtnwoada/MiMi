library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.core_pack.all;

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
	type register_array is array (REG_COUNT-1 downto 0) of std_logic_vector(DATA_WIDTH-1 downto 0);
	signal registers : register_array;
	signal latched_rdaddr1 : std_logic_vector(REG_BITS-1 downto 0);
	signal latched_rdaddr2 : std_logic_vector(REG_BITS-1 downto 0);
	signal latched_wraddr : std_logic_vector(REG_BITS-1 downto 0); 
begin
	process (all)
	begin
		if stall = '1' then
			null;
		else 
			--writing
			if regwrite = '1' then
				registers(to_integer(unsigned(latched_wraddr))) <= wrdata;
			end if;
			--reading
			if unsigned(latched_rdaddr1) = 0 then
				rddata1 <= (others => '0');
			elsif latched_rdaddr1 = latched_wraddr and regwrite = '1' then
				rddata1 <= wrdata;
			else 
				rddata1 <= registers(to_integer(unsigned(latched_rdaddr1)));
			end if;
			if unsigned(latched_rdaddr2) = 0 then
				rddata2 <= (others => '0');
			elsif latched_rdaddr2 = latched_wraddr and regwrite = '1' then
				rddata2 <= wrdata;
			else 
				rddata2 <= registers(to_integer(unsigned(latched_rdaddr2)));
			end if;
		end if;
	end process;
	
	sync: process (all)
	begin
		if reset = '0' then 
			latched_rdaddr1 <= (others => '0');
			latched_rdaddr2 <= (others => '0');
			latched_wraddr <= (others => '0');
		elsif rising_edge(clk) and stall /= '1' then
			latched_rdaddr1 <= rdaddr1;
			latched_rdaddr2 <= rdaddr2;
			latched_wraddr <= wraddr;
		end if;
	end process; 
end rtl;
