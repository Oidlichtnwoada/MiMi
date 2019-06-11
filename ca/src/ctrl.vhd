library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.core_pack.all;
use work.op_pack.all;

entity ctrl is
	port (
		jmp_op         : in jmp_op_type;
		decode_flush   : out std_logic;
		fetch_flush   : out std_logic;
);

end ctrl;

architecture rtl of ctrl is

begin  -- rtl

process (all)
begin

end;

end rtl;
