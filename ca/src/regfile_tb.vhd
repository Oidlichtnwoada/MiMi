library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use std.textio.all;
use ieee.std_logic_textio.all;

use work.core_pack.all;
use work.regfile_pkg.all;

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
        variable l : line;

    begin
    end process test;
end rtl;