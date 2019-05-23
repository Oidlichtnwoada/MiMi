library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.core_pack.all;
use work.op_pack.all;

use work.alu_pkg.all;

entity alu_tb is
end entity;

architecture rtl of alu_tb is

	signal op		:	alu_op_type;
	signal A,B,R	:	std_logic_vector(DATA_WIDTH-1 downto 0);
	signal Z,V		:	std_logic;

begin

	UUT : alu
	port map (
		op => op,
		A => A,
		B => B,
		R => R,
		Z => Z,
		V => V
	);
	
--	test: process
--		file input_file : text;
--		file output_file : text;
--		variable current_read_line : line;
--		variable current_write_line : line;
--		variable inputs : lines_t;
--   begin
--	 
--		file_open(input_file, "input.csv", READ_MODE);
--      file_open(output_file, "output_simulated.csv", WRITE_MODE);
--		
--		
--	 
--	end process;

end architecture;