library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.core_pack.all;
use work.op_pack.all;

entity ctrl is
	port (
		jmp_op         : in jmp_op_type;
		J              : in std_logic;
		decode_flush   : out std_logic;
		fetch_flush   : out std_logic;
);

end ctrl;

architecture rtl of ctrl is

begin  -- rtl

process (all)
begin
 decode_flush <= '0';
 fetch_flush <= '0';
 
 if JMP_op=JMP_BEQ or jmp_op=JMP_BNE or jmp_op=JMP_BLEZ or jmp_op=JMP_BGTZ or jmp_op=JMP_BLTZ or jmp_op=JMP_BGEZ then
	if J='1' then
		decode_flush <= '1';
		fetch_flush <= '1';
	end if;
 end if;
	
end process;

end rtl;
