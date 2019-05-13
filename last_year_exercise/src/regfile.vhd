library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.core_pack.all;

entity regfile is
	port (
		clk, reset       	: in  std_logic;
		stall            	: in  std_logic;
		rdaddr1, rdaddr2 	: in  std_logic_vector(REG_BITS-1 downto 0);
		rddata1, rddata2 	: out std_logic_vector(DATA_WIDTH-1 downto 0);
		wraddr			 	: in  std_logic_vector(REG_BITS-1 downto 0);
		wrdata			 	: in  std_logic_vector(DATA_WIDTH-1 downto 0);
		regwrite         	: in  std_logic);

end regfile;

architecture rtl of regfile is
	type ram_type is array(0 to REG_COUNT-1) of std_logic_vector(DATA_WIDTH-1 downto 0);
	
	signal ram : ram_type := (others =>"00000000000000000000000000000000");
	
	signal sig_rdaddr1, sig_rdaddr2 : std_logic_vector(REG_BITS-1 downto 0) := (others=>'0');
	signal sig_rdaddr1_next, sig_rdaddr2_next : std_logic_vector(REG_BITS-1 downto 0) := (others=>'0');

	signal register_write : std_logic := '0';

begin  -- rtl
	
	reg : process(all)

	begin

		if register_write = '1' and rdaddr1 = wraddr and not(sig_rdaddr1 = "00000") then
			rddata1 <= wrdata;
		else
			rddata1 <= ram(to_integer(unsigned(sig_rdaddr1)));
		end if;

		if register_write = '1' and rdaddr2 = wraddr and not(sig_rdaddr2 = "00000") then
			rddata2 <= wrdata;
		else
			rddata2 <= ram(to_integer(unsigned(sig_rdaddr2)));
		end if;

	end process;
	
	sync : process(all)
	
		variable var_register_write : std_logic := '0';
	
	begin
	
		var_register_write := regwrite and (not stall);

		sig_rdaddr1 <= sig_rdaddr1_next;
		sig_rdaddr2 <= sig_rdaddr2_next;
		
		if stall = '0' then 
			sig_rdaddr1 <= rdaddr1;
			sig_rdaddr2 <= rdaddr2;
			sig_rdaddr1_next <= rdaddr1;
			sig_rdaddr2_next <= rdaddr2;
		else
			sig_rdaddr1_next <= sig_rdaddr1;
			sig_rdaddr2_next <= sig_rdaddr2;
			
			
		end if;
	
		if reset = '0' then
			ram(0) <= (others=>'0');	--set data of address 0 to 0
			
			sig_rdaddr1 <= (others=>'0');
			sig_rdaddr2 <= (others=>'0');
			
			register_write <= '0';
			
		elsif rising_edge(clk) and var_register_write = '1' then
			ram(to_integer(unsigned(wraddr))) <= wrdata;
		end if;
		
		register_write <= var_register_write;
		ram(0) <= (others=>'0'); --Reads form addr 0 must always return 0
		
	end process;
	
	
end rtl;
