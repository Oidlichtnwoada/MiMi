library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

use work.core_pack.all;
use work.op_pack.all;
use work.pipeline_pkg.all;
use work.tb_pkg.all;

entity pipeline_tb is
end pipeline_tb;

architecture rtl of pipeline_tb is
    signal clk, reset : std_logic;
    signal mem_in : mem_in_type;
    signal mem_out : mem_out_type;
    signal intr : std_logic_vector(INTR_COUNT-1 downto 0);
begin

    UUT: pipeline
    port map (clk => clk, reset => reset, mem_in => mem_in, mem_out => mem_out, intr => intr);

    test: process
        file input_file : text;
        file output_file : text;
        variable current_read_line : line;
        variable current_write_line : line;
        variable inputs : lines_t;
    begin
        file_open(input_file, "input.csv", READ_MODE);
        file_open(output_file, "output_simulated.csv", WRITE_MODE);
        clk <= '0';
        --reset
        reset <= '0';
        wait for RESET_FACTOR * CLK_PERIOD;
        reset <= '1';
        --creating header for output_simulated.csv
        write(current_write_line, string'("mem_out"));
        writeline(output_file, current_write_line);
        --skip header from input.csv
        readline(input_file, current_read_line);
        while not endfile(input_file) loop
            --assigning the inputs from the file
            readline(input_file, current_read_line);
            inputs := str_split(current_read_line.all, ",");
            mem_in.busy <= str_to_slv(inputs(0).all)(0);
		    mem_in.rddata <= str_to_slv(inputs(1).all);
            deallocate(inputs);
            clk <= '1';
            wait for CLK_PERIOD/2;
            clk <= '0';
            wait for CLK_PERIOD/2;
            --read the output pins and write to output_simulated.csv
            write(current_write_line, to_string(mem_out.wrdata));
            writeline(output_file, current_write_line);
        end loop;
        file_close(input_file);
        file_close(output_file);
        wait;
    end process test;

end architecture rtl;