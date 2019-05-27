-- ADD YOUR CODE HERE
library ieee;
use ieee.std_logic_1164.all;
use work.jmpu;

use work.core_pack.all;
use work.op_pack.all;

entity jmpu_tb is
end entity;

architecture beh of jmpu_tb is

	signal op : jmp_op_type;
	signal N : std_logic;
	signal Z : std_logic;
	signal J : std_logic;

	component jmpu is
		port 
		(
			op   : in  jmp_op_type;
			N, Z : in  std_logic;
			J    : out std_logic
		);
	end component;

begin



	jmpu_inst : jmpu
	PORT MAP (
		op => op,
		N => N,
		Z => Z,
		J => J
	);

	input : process
	begin  -- process input
		
		wait for 10 us;
		N <= '0';
		Z <= '0';
		wait for 10 us;
		op <= JMP_NOP;
		wait for 10 us;
		op <= JMP_JMP;
		wait for 10 us;
		op <= JMP_BEQ;
		wait for 10 us;
		op <= JMP_BNE;
		wait for 10 us;
		op <= JMP_BLEZ;
		wait for 10 us;
		op <= JMP_BGTZ;
		wait for 10 us;
		op <= JMP_BLTZ;
		wait for 10 us;
		op <= JMP_BGEZ;
		wait for 10 us;
		N <= '0';
		Z <= '1';
		op <= JMP_NOP;
		wait for 10 us;
		op <= JMP_JMP;
		wait for 10 us;
		op <= JMP_BEQ;
		wait for 10 us;
		op <= JMP_BNE;
		wait for 10 us;
		op <= JMP_BLEZ;
		wait for 10 us;
		op <= JMP_BGTZ;
		wait for 10 us;
		op <= JMP_BLTZ;
		wait for 10 us;
		op <= JMP_BGEZ;
		wait for 10 us;
		N <= '1';
		Z <= '0';
		op <= JMP_NOP;
		wait for 10 us;
		op <= JMP_JMP;
		wait for 10 us;
		op <= JMP_BEQ;
		wait for 10 us;
		op <= JMP_BNE;
		wait for 10 us;
		op <= JMP_BLEZ;
		wait for 10 us;
		op <= JMP_BGTZ;
		wait for 10 us;
		op <= JMP_BLTZ;
		wait for 10 us;
		op <= JMP_BGEZ;
		wait for 10 us;
		N <= '1';
		Z <= '1';
		op <= JMP_NOP;
		wait for 10 us;
		op <= JMP_JMP;
		wait for 10 us;
		op <= JMP_BEQ;
		wait for 10 us;
		op <= JMP_BNE;
		wait for 10 us;
		op <= JMP_BLEZ;
		wait for 10 us;
		op <= JMP_BGTZ;
		wait for 10 us;
		op <= JMP_BLTZ;
		wait for 10 us;
		op <= JMP_BGEZ;
		wait;
	end process;

end architecture;

