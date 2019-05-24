library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.core_pack.all;
use work.op_pack.all;

package pipeline_pkg is

    component pipeline is 
        port (
            clk, reset : in	 std_logic;
            mem_in     : in  mem_in_type;
            mem_out    : out mem_out_type;
            intr       : in  std_logic_vector(INTR_COUNT-1 downto 0)
        );
    end component;

end package;