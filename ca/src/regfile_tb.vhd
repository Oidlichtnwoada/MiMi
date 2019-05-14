library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;

use work.core_pack.all;
use work.regfile_pkg.all;
use work.string_ops.all;
use work.tb_pkg.all;

entity regfile_tb is 
end regfile_tb;

architecture rtl of regfile_tb is 
    signal clk, reset : std_logic;
    signal stall : std_logic;
    signal rdaddr1, rdaddr2 : std_logic_vector(REG_BITS-1 downto 0);
    signal rddata1, rddata2 : std_logic_vector(DATA_WIDTH-1 downto 0);
    signal wraddr : std_logic_vector(REG_BITS-1 downto 0);
    signal wrdata : std_logic_vector(DATA_WIDTH-1 downto 0);
    signal regwrite : std_logic;
begin

    UUT: regfile
    port map (clk => clk, reset => reset, stall => stall, rdaddr1 => rdaddr1, rdaddr2 => rdaddr2, rddata1 => rddata1, rddata2 => rddata2, wraddr => wraddr, wrdata => wrdata, regwrite => regwrite);

    test: process
        file input_file : text;
        file output_file : text;
        variable inputs : lines_t;
    begin
        file_open(input_file, "input.txt", READ_MODE);
        file_open(output_file, "simulated.txt", WRITE_MODE);
        --
        res <= '0';
        wait for RESET_FACTOR * CLK_PERIOD;
        res <= '1';
        --
        while not endfile(input_file) loop
            clk <= '0';
            wait for CLK_PERIOD/4;
            --
            readline(input_file, current_line);
            inputs := split(current_line, ",");
            stall <= inputs(0).all;
            deallocate(inputs);
            --
            clk <= '1';
            wait for CLK_PERIOD/2;
            clk <= '0';
            wait for CLK_PERIOD/4;
            --read outputs
        end loop;
        file_close(input_file);
        file_close(output_file);
        wait;
    end process test;

end rtl;