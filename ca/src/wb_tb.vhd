library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;

use work.core_pack.all;
use work.op_pack.all;
use work.wb_pkg.all;
use work.tb_pkg.all;

entity wb_tb is 
end wb_tb;

architecture rtl of wb_tb is 
    signal clk, reset : std_logic;
    signal stall : std_logic;
    signal flush : std_logic;
    signal op : wb_op_type;
    signal rd_in : std_logic_vector(REG_BITS-1 downto 0);
    signal aluresult : std_logic_vector(DATA_WIDTH-1 downto 0);
    signal memresult : std_logic_vector(DATA_WIDTH-1 downto 0);
    signal rd_out : std_logic_vector(REG_BITS-1 downto 0);
    signal result : std_logic_vector(DATA_WIDTH-1 downto 0);
    signal regwrite : std_logic;
begin

    UUT: wb
    port map (clk => clk, reset => reset, stall => stall, flush => flush, op => op, rd_in => rd_in, aluresult => aluresult, memresult => memresult, rd_out => rd_out, result => result, regwrite => regwrite);

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
        write(current_write_line, string'("rd_out,result,regwrite"));
        writeline(output_file, current_write_line);
        --skip header from input.csv
        readline(input_file, current_read_line);
        while not endfile(input_file) loop
            --assigning the inputs from the file
            readline(input_file, current_read_line);
            inputs := str_split(current_read_line.all, ",");
            stall <= str_to_slv(inputs(0).all)(0);
            flush <= str_to_slv(inputs(1).all)(0);
            rd_in <= str_to_slv(inputs(2).all);
            aluresult <= str_to_slv(inputs(3).all);
            memresult <= str_to_slv(inputs(4).all);
            deallocate(inputs);
            clk <= '1';
            wait for CLK_PERIOD/2;
            clk <= '0';
            wait for CLK_PERIOD/2;
            --read the output pins and write to output_simulated.csv
            write(current_write_line, to_string(rd_out) & "," & to_string(result) & "," & to_string(regwrite));
            writeline(output_file, current_write_line);
        end loop;
        file_close(input_file);
        file_close(output_file);
        wait;
    end process test;

end rtl;