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
	signal sig_rddata1, sig_rddata1_prev, sig_rddata2, sig_rddata2_prev : std_logic_vector(DATA_WIDTH-1 downto 0);
begin

	process (all)
	begin
		--writing 
		if rising_edge(clk) and regwrite = '1' and stall = '0' and reset = '1' then
			registers(to_integer(unsigned(wraddr))) <= wrdata;
		end if;
		--reading address 1
		if unsigned(rdaddr1) = 0 or reset = '0' then
			sig_rddata1 <= (others => '0');
		elsif rdaddr1 = wraddr and regwrite = '1' and stall = '0' and reset = '1' then
			sig_rddata1 <= wrdata;
		else 
			sig_rddata1 <= registers(to_integer(unsigned(rdaddr1)));
		end if;
		--reading address 2
		if unsigned(rdaddr2) = 0  or reset = '0' then
			sig_rddata2 <= (others => '0');
		elsif rdaddr2 = wraddr and regwrite = '1' and stall = '0' and reset = '1' then
			sig_rddata2 <= wrdata;
		else 
			sig_rddata2 <= registers(to_integer(unsigned(rdaddr2)));
		end if;
	end process;

	process (all)
	begin
		if stall = '0' then 
			rddata1 <= sig_rddata1;
			rddata2 <= sig_rddata2;
			sig_rddata1_prev <= sig_rddata1;
			sig_rddata2_prev <= sig_rddata2;
		else 
			rddata1 <= sig_rddata1_prev;
			rddata2 <= sig_rddata2_prev;
			sig_rddata1_prev <= rddata1;
			sig_rddata2_prev <= rddata2;
		end if;
	end process;

end rtl;
