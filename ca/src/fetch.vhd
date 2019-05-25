library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.core_pack.all;

entity fetch is
	
	port (
		clk, reset : in	 std_logic;
		stall      : in  std_logic;
		pcsrc	   : in	 std_logic;
		pc_in	   : in	 std_logic_vector(PC_WIDTH-1 downto 0);
		pc_out	   : out std_logic_vector(PC_WIDTH-1 downto 0);
		instr	   : out std_logic_vector(INSTR_WIDTH-1 downto 0)
	);

end fetch;

architecture rtl of fetch is

	component imem_altera is
		port (
			address		: in std_logic_vector (11 downto 0);
			clock		: in std_logic  := '1';
			q			: out std_logic_vector (31 downto 0)
		);
	end component imem_altera;

	signal pc, pc_nxt	: std_logic_vector(PC_WIDTH-1 downto 0);

begin

	imem: imem_altera
	port map (address => pc_nxt(PC_WIDTH-1 downto 2), clock => clk, q => instr);

	pc_out <= pc_nxt;

	sync: process (all)
	begin
		if reset = '0' then 
			pc <= (others => '0');
		elsif rising_edge(clk) then
			pc <= pc_nxt;
		end if;
	end process;

	nxt: process (all)
	begin
		report "fetch";
		if stall = '0' and reset = '1' then
			if pcsrc = '1' then
				pc_nxt <= pc_in;
			else 
				pc_nxt <= std_logic_vector(unsigned(pc) + 4);
			end if;
		else 
			pc_nxt <= pc;
		end if;
	end process;

end rtl;
