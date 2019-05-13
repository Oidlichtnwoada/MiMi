-- ADD YOUR CODE HERE
library ieee;
use ieee.std_logic_1164.all;
use work.regfile;

use work.core_pack.all;

entity regfile_tb is
end entity;

architecture beh of regfile_tb is

	constant CLK_PERIOD : time := 20 ns;

	signal clk,reset : std_logic;
	signal stall : std_logic;
	signal rdaddr1, rdaddr2 : std_logic_Vector(REG_BITS-1 downto 0);
	signal rddata1, rddata2 :std_logic_vector(DATA_WIDTH-1 downto 0);
	signal wraddr : std_logic_vector(REG_BITS-1 downto 0);
	signal wrdata : std_logic_vector(DATA_WIDTH-1 downto 0);
	signal regwrite : std_logic;

	component regfile is
	port (
		clk, reset       	: in  std_logic;
		stall            	: in  std_logic;
		rdaddr1, rdaddr2 	: in  std_logic_vector(REG_BITS-1 downto 0);
		rddata1, rddata2 	: out std_logic_vector(DATA_WIDTH-1 downto 0);
		wraddr			: in  std_logic_vector(REG_BITS-1 downto 0);
		wrdata			: in  std_logic_vector(DATA_WIDTH-1 downto 0);
		regwrite         	: in  std_logic);

	end component;

begin



	regfile_inst : regfile
	PORT MAP (
		clk => clk,
		reset => reset,
		stall => stall,
		rdaddr1 => rdaddr1,
		rdaddr2 => rdaddr2,
		rddata1 => rddata1,
		rddata2 => rddata2,
		wraddr => wraddr,
		wrdata => wrdata,
		regwrite => regwrite
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
		wraddr <= "00000";
		wrdata <= "00000000000000000000000000000000";
		rdaddr1 <= "00000";
		rdaddr2 <= "00000";
		regwrite <= '0';
		stall <= '1';
		wait for 100 ns;
		reset <= '1';
		--test stall 1 regwrite 0
		stall <= '1';
		regwrite <= '0';
		rdaddr1 <= "00000";
		rdaddr2 <= "00000";
		wraddr <= "00000";
		wrdata <= "11111111111111110000000000000000"; 
		wait for 100 ns;
		wraddr <= "00001";
		wrdata <= "00111111111111110000000000000000"; 
		wait for 100 ns;
		wraddr <= "00010";
		wrdata <= "10111111111111110000000000000000"; 
		wait for 100 ns;
		wraddr <= "00011";
		wrdata <= "00011111111111110000000000000000"; 
		wait for 100 ns;
		wraddr <= "00100";
		wrdata <= "00000111111111110000000000000000"; 
		wait for 100 ns;
		--test stall 1 regwrite 1
		regwrite <= '1';
		stall <= '1';
		wraddr <= "00000";
		wrdata <= "11111111111111110000000000000000"; 
		wait for 100 ns;
		wraddr <= "00001";
		wrdata <= "00111111111111110000000000000000"; 
		wait for 100 ns;
		wraddr <= "00010";
		wrdata <= "10111111111111110000000000000000"; 
		wait for 100 ns;
		wraddr <= "00011";
		wrdata <= "00011111111111110000000000000000"; 
		wait for 100 ns;
		wraddr <= "00100";
		wrdata <= "00000111111111110000000000000000"; 
		wait for 100 ns;
		--test stall 0 regwrite 1
		stall <= '0';
		regwrite <= '1';
		rdaddr1 <= "00000";
		rdaddr2 <= "00000";
		wraddr <= "00000";
		wrdata <= "11111111111111110000000000000000"; 
		wait for 100 ns;
		wraddr <= "00001";
		wrdata <= "00111111111111110000000000000000"; 
		wait for 100 ns;
		wraddr <= "00010";
		wrdata <= "10111111111111110000000000000000"; 
		wait for 100 ns;
		wraddr <= "00011";
		wrdata <= "00011111111111110000000000000000"; 
		wait for 100 ns;
		wraddr <= "00100";
		wrdata <= "00000111111111110000000000000000"; 
		wait for 100 ns;
		--test stall 0 regwrite 0
		stall <= '0';
		regwrite <= '0';
		wraddr <= "00000";
		wrdata <= "11111111111111110000000000000000"; 
		wait for 100 ns;
		wraddr <= "00001";
		wrdata <= "00111111111111110000000000000000"; 
		wait for 100 ns;
		wraddr <= "00010";
		wrdata <= "10111111111111110000000000000000"; 
		wait for 100 ns;
		wraddr <= "00011";
		wrdata <= "00011111111111110000000000000000"; 
		wait for 100 ns;
		wraddr <= "00100";
		wrdata <= "00000111111111110000000000000000"; 
		wait for 100 ns;
		wraddr <= "00001";
		wrdata <= "10000000000001111000000000000000";
		wait for 100 ns;
		--test read
		rdaddr1 <= "00001";
		rdaddr2 <= "00011";
		wait for 100 ns;
		rdaddr1 <= "00000";
		rdaddr2 <= "00100";
		wait for 100 ns;
		--test read and write on same address
		regwrite <= '1';
		rdaddr1 <= "01000";
		rdaddr2 <= "01000";
		wraddr <= "01000";
		wrdata <= "11111111111111111111111111111111";
		wait for 100 ns;
		rdaddr1 <= "11000";
		rdaddr2 <= "01000";
		wraddr <= "11000";
		wrdata <= "00001111111111111111111111111111";
		wait for 100 ns;
		rdaddr1 <= "01000";
		rdaddr2 <= "10000";
		wraddr <= "10000";
		wrdata <= "00111111111111111111111111111111";
		wait for 100 ns;

		wait;
	end process;

end architecture;

