library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;

use work.core_pack.all;
use work.op_pack.all;
use work.tb_pkg.all;

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
	
	test: process
		file input_file : text;
		file output_file : text;
		variable current_read_line : line;
		variable current_write_line : line;
		variable inputs : lines_t;
   begin
	 
		file_open(input_file, "input.csv", READ_MODE);
		file_open(output_file, "output_simulated.csv", WRITE_MODE);
			
			--creating header for output_simulated.csv
		write(current_write_line, string'("R,Z,V"));
		writeline(output_file, current_write_line);
		--skip header from input.csv
		readline(input_file, current_read_line);
		
		
		while not endfile(input_file) loop
			--assigning the inputs from the file
			readline(input_file, current_read_line);
			inputs := str_split(current_read_line.all, ",");
			--op <= str_to_slv(inputs(0).all);
			A <= str_to_slv(inputs(1).all);
			B <= str_to_slv(inputs(2).all);
			deallocate(inputs);
			
			wait for CLK_PERIOD/2;

			--read the output pins and write to output_simulated.csv
			write(current_write_line, to_string(R));
			writeline(output_file, current_write_line);
			
			wait for CLK_PERIOD/2;
			
		end loop;
		file_close(input_file);
		file_close(output_file);
		wait;
	 
	end process;

end architecture;