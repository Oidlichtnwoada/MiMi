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
	type register_array is array (natural range REG_COUNT-1 downto 0) of std_logic_vector(DATA_WIDTH-1 downto 0);
	signal registers : register_array;
begin
	process (all)
		variable rdaddr1_var : std_logic_vector(REG_BITS-1 downto 0);
		variable rdaddr2_var : std_logic_vector(REG_BITS-1 downto 0);
		variable writing : boolean;
	begin
		--writing
		writing := regwrite = '1' and stall = '0' and reset = '1';
		if rising_edge(clk) and writing then
			registers(to_integer(unsigned(wraddr))) <= wrdata;
		end if;
		--updating read addresses
		if reset = '0' then
			rdaddr1_var := (others => '0');
			rdaddr2_var := (others => '0');
		elsif stall = '0' then
			rdaddr1_var := rdaddr1;
			rdaddr2_var := rdaddr2;
		end if;
		--reading address 1
		if unsigned(rdaddr1_var) = 0 then
			rddata1 <= (others => '0');
		elsif rdaddr1_var = wraddr and writing then
			rddata1 <= wrdata;
		else 
			rddata1 <= registers(to_integer(unsigned(rdaddr1_var)));
		end if;
		--reading address 2
		if unsigned(rdaddr2_var) = 0 then
			rddata2 <= (others => '0');
		elsif rdaddr2_var = wraddr and writing then
			rddata2 <= wrdata;
		else 
			rddata2 <= registers(to_integer(unsigned(rdaddr2_var)));
		end if;
	end process;
end rtl;
