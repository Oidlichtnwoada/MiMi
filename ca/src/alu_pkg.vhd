library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.core_pack.all;
use work.op_pack.all;

package alu_pkg is

	component alu is
		port (
			op		: in  alu_op_type;
			A		: in	std_logic_vector(DATA_WIDTH-1 downto 0);
			B 		: in  std_logic_vector(DATA_WIDTH-1 downto 0);
			R		: out std_logic_vector(DATA_WIDTH-1 downto 0);
			Z		: out std_logic;
			V		: out std_logic
		);
	end component;
	
end package;