library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.core_pack.all;

package regfile_pkg is 

    type register_array is array (REG_COUNT-1 downto 0) of std_logic_vector(DATA_WIDTH-1 downto 0);

    component regfile is
        port (
            clk, reset       : in  std_logic;
            stall            : in  std_logic;
            rdaddr1, rdaddr2 : in  std_logic_vector(REG_BITS-1 downto 0);
            rddata1, rddata2 : out std_logic_vector(DATA_WIDTH-1 downto 0);
            wraddr			 : in  std_logic_vector(REG_BITS-1 downto 0);
            wrdata			 : in  std_logic_vector(DATA_WIDTH-1 downto 0);
            regwrite         : in  std_logic
        );
    end component;

end package;