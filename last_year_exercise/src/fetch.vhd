library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.core_pack.all;
use work.imem_altera;

entity fetch is
	
	port (
		clk, reset : in	 std_logic;
		stall      : in  std_logic;
		pcsrc	   : in	 std_logic;
		pc_in	   : in	 std_logic_vector(PC_WIDTH-1 downto 0);
		pc_out	   : out std_logic_vector(PC_WIDTH-1 downto 0);
		instr	   : out std_logic_vector(INSTR_WIDTH-1 downto 0));

end fetch;

architecture rtl of fetch is

	COMPONENT imem_altera IS
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (11 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		q		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
	END COMPONENT;

	signal count_next : std_logic_vector(PC_WIDTH-1 downto 0);
	signal count : std_logic_vector(PC_WIDTH-1 downto 0);

begin  -- rtl

	sync : process(all)
	begin
		if reset = '0' then
			count <= (others=>'0');	--set address to 0
		elsif rising_edge(clk) then
			count <= count_next;
		end if;
	end process;

	fetch : process(all)
	begin
		if stall = '1' or reset = '0' then
			count_next <= count;
		else

			if pcsrc = '1' then
				count_next <= pc_in;
			else
				count_next <= std_logic_vector(unsigned(count) + 4);
			end if;
					
		end if;
	end process;

	pc_out <= count_next;

	imem_inst:imem_altera
	PORT MAP
	(
		address	=>count_next(PC_WIDTH-1 downto 2),
		clock	=>clk,
		q	=>instr
	);

	
end rtl;
