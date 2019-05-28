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
	signal sig_rdaddr1, sig_rdaddr1_before, sig_rdaddr2, sig_rdaddr2_before : std_logic_vector(REG_BITS-1 downto 0);
begin

	process (all)
	begin 
		if reset = '0' then 
			sig_rdaddr1_before <= (others => '0');
			sig_rdaddr2_before <= (others => '0');
		elsif rising_edge(clk) then
			if stall = '0' then
				sig_rdaddr1_before <= rdaddr1;
				sig_rdaddr2_before <= rdaddr2;
			end if;
			if regwrite = '1' and stall = '0' then
				registers(to_integer(unsigned(wraddr))) <= wrdata;
			end if;
		end if;
	end process;

	sig_rdaddr1 <= sig_rdaddr1_before when stall = '1' else rdaddr1;
	sig_rdaddr2 <= sig_rdaddr2_before when stall = '1' else rdaddr2;

	process (all)
	begin
		--reading address 1
		if unsigned(sig_rdaddr1) = 0 then
			rddata1 <= (others => '0');
		elsif sig_rdaddr1 = wraddr and regwrite = '1' and stall = '0' then
			rddata1 <= wrdata;
		else 
			rddata1 <= registers(to_integer(unsigned(sig_rdaddr1)));
		end if;
		--reading address 2
		if unsigned(sig_rdaddr2) = 0 then
			rddata2 <= (others => '0');
		elsif sig_rdaddr2 = wraddr and regwrite = '1' and stall = '0' then
			rddata2 <= wrdata;
		else 
			rddata2 <= registers(to_integer(unsigned(sig_rdaddr2)));
		end if;
	end process;

end rtl;
