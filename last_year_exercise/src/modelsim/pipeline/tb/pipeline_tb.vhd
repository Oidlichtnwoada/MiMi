-- ADD YOUR CODE HERE
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.core_pack.all;
use work.op_pack.all;

use work.pipeline;

library std; -- for Printing
use std.textio.all;
use ieee.std_logic_textio.all;

entity pipeline_tb is
end entity;

architecture beh of pipeline_tb is

	constant CLK_PERIOD : time := 20 ns;

	signal clk, reset :	std_logic;
	signal mem_in     : mem_in_type;
	signal mem_out    : mem_out_type;
	signal intr       : std_logic_vector(INTR_COUNT-1 downto 0);

	component pipeline is
	
		port (
			clk, reset : in	 std_logic;
			mem_in     : in  mem_in_type;
			mem_out    : out mem_out_type;
			intr       : in  std_logic_vector(INTR_COUNT-1 downto 0));

	end component;

begin
	
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
		mem_in.busy <= '0';
		
		--wait for rising_edge(clk);
		
		wait for 90 ns;
		reset <= '1';
		
		wait for 850000 ps; --Without stall
		wait until mem_out.rd='1';

		mem_in.rddata<="01000101011001111000100110101011";

		wait until mem_out.rd='1' and rising_edge(clk);

		mem_in.rddata<="10111010100110000111011001010100";

		wait until mem_out.rd='1' and rising_edge(clk);

		mem_in.rddata<="01000101011001111000100110101011";

		wait until mem_out.rd='1' and rising_edge(clk);

		mem_in.rddata<="10111010100110000111011001010100";

		wait until mem_out.rd='1' and rising_edge(clk);

		mem_in.rddata<="01000101011001111000100110101011";

		wait until mem_out.rd='1' and rising_edge(clk);

		mem_in.rddata<="10111010100110000111011001010100";

		wait until mem_out.rd='1' and rising_edge(clk);

		mem_in.rddata<="01000101011001111000100110101011";

		wait until mem_out.rd='1' and rising_edge(clk);

		mem_in.rddata<="10111010100110000111011001010100";

		wait until mem_out.rd='1' and rising_edge(clk);

		mem_in.rddata<="01000101011001111000100110101011";

		wait until mem_out.rd='1' and rising_edge(clk);

		mem_in.rddata<="10111010100110000111011001010100";

		wait until mem_out.rd='1' and rising_edge(clk);

		mem_in.rddata<="01000101011001111000100110101011";

		wait until mem_out.rd='1' and rising_edge(clk);

		mem_in.rddata<="10111010100110000111011001010100";

		wait until mem_out.rd='1' and rising_edge(clk);

		mem_in.rddata<="01000101011001111000100110101011";


		wait for 100 ns; --now with stall

		wait until mem_out.rd='1';

		mem_in.busy<='1';
		mem_in.rddata<="00000011100000000000000000000111";

		wait for 25 ns;
		mem_in.busy<='0';
		mem_in.rddata<="01000101011001111000100110101011";

		wait until mem_out.rd='1' and rising_edge(clk);

		mem_in.busy<='1';
		mem_in.rddata<="00000011100000000000000000000111";

		wait for 15 ns;
		mem_in.busy<='0';
		mem_in.rddata<="10111010100110000111011001010100";

		wait until mem_out.rd='1' and rising_edge(clk);

		mem_in.busy<='1';
		mem_in.rddata<="00000011100000000000000000000111";

		wait for 25 ns;
		mem_in.busy<='0';
		mem_in.rddata<="01000101011001111000100110101011";

		wait until mem_out.rd='1' and rising_edge(clk);

		mem_in.busy<='1';
		mem_in.rddata<="00000011100000000000000000000111";

		wait for 25 ns;
		mem_in.busy<='0';
		mem_in.rddata<="10111010100110000111011001010100";

		wait until mem_out.rd='1' and rising_edge(clk);

		mem_in.busy<='1';
		mem_in.rddata<="00000011100000000000000000000111";

		wait for 25 ns;
		mem_in.busy<='0';
		mem_in.rddata<="01000101011001111000100110101011";

		wait until mem_out.rd='1' and rising_edge(clk);

		mem_in.busy<='1';
		mem_in.rddata<="00000011100000000000000000000111";

		wait for 25 ns;
		mem_in.busy<='0';
		mem_in.rddata<="10111010100110000111011001010100";

		wait until mem_out.rd='1' and rising_edge(clk);

		mem_in.busy<='1';
		mem_in.rddata<="00000011100000000000000000000111";

		wait for 15 ns;
		mem_in.busy<='0';
		mem_in.rddata<="01000101011001111000100110101011";

		wait until mem_out.rd='1' and rising_edge(clk);

		mem_in.busy<='1';
		mem_in.rddata<="00000011100000000000000000000111";

		wait for 15 ns;
		mem_in.busy<='0';
		mem_in.rddata<="10111010100110000111011001010100";

		wait until mem_out.rd='1' and rising_edge(clk);

		mem_in.busy<='1';
		mem_in.rddata<="00000011100000000000000000000111";

		wait for 15 ns;
		mem_in.busy<='0';
		mem_in.rddata<="01000101011001111000100110101011";

		wait until mem_out.rd='1' and rising_edge(clk);

		mem_in.busy<='1';
		mem_in.rddata<="00000011100000000000000000000111";

		wait for 15 ns;
		mem_in.busy<='0';
		mem_in.rddata<="10111010100110000111011001010100";

		wait until mem_out.rd='1' and rising_edge(clk);

		mem_in.busy<='1';
		mem_in.rddata<="00000011100000000000000000000111";

		wait for 15 ns;
		mem_in.busy<='0';
		mem_in.rddata<="01000101011001111000100110101011";

		wait until mem_out.rd='1' and rising_edge(clk);

		mem_in.busy<='1';
		mem_in.rddata<="00000011100000000000000000000111";

		wait for 15 ns;
		mem_in.busy<='0';
		mem_in.rddata<="10111010100110000111011001010100";

		wait until mem_out.rd='1' and rising_edge(clk);

		mem_in.busy<='1';
		mem_in.rddata<="00000011100000000000000000000111";

		wait for 25 ns;
		mem_in.busy<='0';
		mem_in.rddata<="01000101011001111000100110101011";

		--Write Reg

		wait until mem_out.wr='1';

		mem_in.busy<='1';
		mem_in.rddata<="00000011100000000000000000000111";

		wait for 25 ns;
		mem_in.busy<='0';
		mem_in.rddata<="01000101011001111000100110101011";

		wait until mem_out.wr='1' and rising_edge(clk);

		mem_in.busy<='1';
		mem_in.rddata<="00000011100000000000000000000111";

		wait for 25 ns;
		mem_in.busy<='0';
		mem_in.rddata<="01000101011001111000100110101011";

		wait until mem_out.wr='1' and rising_edge(clk);

		mem_in.busy<='1';
		mem_in.rddata<="00000011100000000000000000000111";

		wait for 25 ns;
		mem_in.busy<='0';
		mem_in.rddata<="01000101011001111000100110101011";

		wait until mem_out.wr='1' and rising_edge(clk);

		mem_in.busy<='1';
		mem_in.rddata<="00000011100000000000000000000111";

		wait for 25 ns;
		mem_in.busy<='0';
		mem_in.rddata<="01000101011001111000100110101011";

		wait until mem_out.wr='1' and rising_edge(clk);

		mem_in.busy<='1';
		mem_in.rddata<="00000011100000000000000000000111";

		wait for 25 ns;
		mem_in.busy<='0';
		mem_in.rddata<="01000101011001111000100110101011";

		wait until mem_out.wr='1' and rising_edge(clk);

		mem_in.busy<='1';
		mem_in.rddata<="00000011100000000000000000000111";

		wait for 25 ns;
		mem_in.busy<='0';
		mem_in.rddata<="01000101011001111000100110101011";

		wait until mem_out.wr='1' and rising_edge(clk);

		mem_in.busy<='1';
		mem_in.rddata<="00000011100000000000000000000111";

		wait for 25 ns;
		mem_in.busy<='0';
		mem_in.rddata<="01000101011001111000100110101011";

		wait until mem_out.wr='1' and rising_edge(clk);

		mem_in.busy<='1';
		mem_in.rddata<="00000011100000000000000000000111";

		wait for 25 ns;
		mem_in.busy<='0';
		mem_in.rddata<="01000101011001111000100110101011";

		wait until mem_out.wr='1' and rising_edge(clk);

		mem_in.busy<='1';
		mem_in.rddata<="00000011100000000000000000000111";

		wait for 25 ns;
		mem_in.busy<='0';
		mem_in.rddata<="01000101011001111000100110101011";

		wait until mem_out.wr='1' and rising_edge(clk);

		mem_in.busy<='1';
		mem_in.rddata<="00000011100000000000000000000111";

		wait for 25 ns;
		mem_in.busy<='0';
		mem_in.rddata<="01000101011001111000100110101011";

		wait until mem_out.wr='1' and rising_edge(clk);

		mem_in.busy<='1';
		mem_in.rddata<="00000011100000000000000000000111";

		wait for 25 ns;
		mem_in.busy<='0';
		mem_in.rddata<="01000101011001111000100110101011";

		wait until mem_out.wr='1' and rising_edge(clk);

		mem_in.busy<='1';
		mem_in.rddata<="00000011100000000000000000000111";

		wait for 25 ns;
		mem_in.busy<='0';
		mem_in.rddata<="01000101011001111000100110101011";

		wait until mem_out.wr='1' and rising_edge(clk);

		mem_in.busy<='1';
		mem_in.rddata<="00000011100000000000000000000111";

		wait for 25 ns;
		mem_in.busy<='0';
		mem_in.rddata<="01000101011001111000100110101011";

		
		
		--At the end stall = 0
		wait for 20 ns; 
		
		mem_in.busy <= '0';
		mem_in.rddata<="00000000000000000000000000000111";
		
	
		wait;
	end process;

	pipeline_inst : pipeline
	PORT MAP (
		clk	=> clk,
		reset	=> reset,
		mem_in	=> mem_in,
		mem_out	=> mem_out,
		intr	=> intr
	);


end architecture;
