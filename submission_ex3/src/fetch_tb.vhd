library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

use work.core_pack.all;
use work.fetch_pkg.all;
use work.tb_pkg.all;

entity fetch_tb is
end fetch_tb;

architecture rtl of fetch_tb is
    signal clk, reset : std_logic;
    signal stall      : std_logic;
    signal pcsrc	  : std_logic;
    signal pc_in      : std_logic_vector(PC_WIDTH-1 downto 0);
    signal pc_out     : std_logic_vector(PC_WIDTH-1 downto 0);
    signal instr      : std_logic_vector(INSTR_WIDTH-1 downto 0);
begin

    UUT: fetch
    port map (clk => clk, reset => reset, stall => stall, pcsrc => pcsrc, pc_in => pc_in, pc_out => pc_out, instr => instr);

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
        write(current_write_line, string'("pc_out,instr"));
        writeline(output_file, current_write_line);
        --skip header from input.csv
        readline(input_file, current_read_line);
        while not endfile(input_file) loop
            --assigning the inputs from the file
            readline(input_file, current_read_line);
            inputs := str_split(current_read_line.all, ",");
            stall <= str_to_slv(inputs(0).all)(0);
            pcsrc <= str_to_slv(inputs(1).all)(0);
            pc_in <= str_to_slv(inputs(2).all);
            deallocate(inputs);
            clk <= '1';
            wait for CLK_PERIOD/2;
            clk <= '0';
            wait for CLK_PERIOD/2;
            --read the output pins and write to output_simulated.csv
            write(current_write_line, to_string(pc_out) & "," & to_string(instr));
            writeline(output_file, current_write_line);
        end loop;
        file_close(input_file);
        file_close(output_file);
        wait;
    end process test;

end architecture rtl;