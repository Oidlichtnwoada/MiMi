-- ADD YOUR CODE HERE
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.fetch;

use work.core_pack.all;

entity fetch_tb is
end entity;

architecture beh of fetch_tb is

	constant CLK_PERIOD : time := 20 ns;

	signal clk, reset :	std_logic;
	signal stall      : std_logic;
	signal pcsrc	  : std_logic;
	signal pc_in	  : std_logic_vector(PC_WIDTH-1 downto 0);
	signal pc_out	  : std_logic_vector(PC_WIDTH-1 downto 0);
	signal instr	  : std_logic_vector(INSTR_WIDTH-1 downto 0);

	component fetch is
		port 
		(
			clk, reset : in	 std_logic;
			stall      : in  std_logic;
			pcsrc	   : in	 std_logic;
			pc_in	   : in	 std_logic_vector(PC_WIDTH-1 downto 0);
			pc_out	   : out std_logic_vector(PC_WIDTH-1 downto 0);
			instr	   : out std_logic_vector(INSTR_WIDTH-1 downto 0)
		);
	end component;

begin



	fetch_inst : fetch
	PORT MAP (
		clk	=> clk,
		reset	=> reset,
		stall	=> stall,
		pcsrc	=> pcsrc,
		pc_in	=>pc_in,
		pc_out	=> pc_out,
		instr	=> instr
	);

	-- Generates the clock signal
	clkgen : process
	begin
		clk <= '0';
		wait for CLK_PERIOD/2;
		clk <= '1';
		wait for CLK_PERIOD/2;
	end process clkgen;

	input : process
	begin  -- process input
		reset <= '0';
		stall <= '0';
		pc_in <= (others => '0');
		pcsrc <= '0';

		wait for 100 ns;
		-- test stall
		reset <= '1';
		stall <= '1';
		pc_in <= (others => '0');
		pcsrc <= '1';

		wait for 100 ns;
		--test pcsrc
		stall <= '0';
		pc_in <= std_logic_vector(to_unsigned(12,PC_WIDTH));
		pcsrc <= '1';

		wait for 100 ns;
		--test count
		stall <= '0';
		pc_in <= std_logic_vector(to_unsigned(20,PC_WIDTH));
		pcsrc <= '0';

		wait for 200 ns;
		--test stall
		stall <= '1';
		pc_in <= std_logic_vector(to_unsigned(20,PC_WIDTH));
		pcsrc <= '1';

		wait for 100 ns;
		--test pcsrc
		stall <= '0';
		pc_in <= std_logic_vector(to_unsigned(20,PC_WIDTH));
		pcsrc <= '1';

		wait for 100 ns;
		--test reset
		reset <= '0';
		stall <= '0';
		pc_in <= std_logic_vector(to_unsigned(20,PC_WIDTH));
		pcsrc <= '1';

		wait for 100 ns;
		--test count
		reset <= '1';
		stall <= '0';
		pc_in <= std_logic_vector(to_unsigned(20,PC_WIDTH));
		pcsrc <= '0';

		wait for 100 ns;
		--test count
		reset <= '1';
		stall <= '0';
		pc_in <= std_logic_vector(to_unsigned(20,PC_WIDTH));
		pcsrc <= '0';

		wait;
	end process;

end architecture;

