-- ADD YOUR CODE HERE
library ieee;
use ieee.std_logic_1164.all;
use work.memu;
use work.core_pack.all;
use work.op_pack.all;


entity memu_tb is
end entity;

architecture beh of memu_tb is

	signal op : mem_op_type;
	signal A : std_logic_vector(ADDR_WIDTH-1 downto 0);
	signal W : std_logic_vector(DATA_WIDTH-1 downto 0);
	signal D : std_logic_vector(DATA_WIDTH-1 downto 0);
	signal M : mem_out_type;
	signal R : std_logic_vector(DATA_WIDTH-1 downto 0);
	signal XL : std_logic;
	signal XS : std_logic;
	component memu is
		port
		(
			op   : in  mem_op_type;
			A    : in  std_logic_vector(ADDR_WIDTH-1 downto 0);
			W    : in  std_logic_vector(DATA_WIDTH-1 downto 0);
			D    : in  std_logic_vector(DATA_WIDTH-1 downto 0);
			M    : out mem_out_type;
			R    : out std_logic_vector(DATA_WIDTH-1 downto 0);
			XL   : out std_logic;
			XS   : out std_logic
		);
	  end component;

begin



	memu_inst : memu
	PORT MAP (
		op => op,
		A => A,
		W => W,
		D => D,
		M => M,
		R => R,
		XL => XL,
		XS => XS
	);

	input : process
	begin  -- process input
		
		wait for 10 us;

		op.memread <= '1';
		op.memwrite <= '0';
		op.memtype <= MEM_W; 

		A <= (0 => '0',1 => '0', others => '0');
		W <= "11100011" & "01110001" & "00111000" & "00011100";
		D <= (others => '0');

		wait for 10 us;
		wait for 10 us;
		wait for 10 us;
		wait for 10 us;
		wait for 10 us;
		wait for 10 us;
	end process;

end architecture;

