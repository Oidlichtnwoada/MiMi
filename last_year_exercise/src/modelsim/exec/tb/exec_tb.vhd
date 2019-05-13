-- ADD YOUR CODE HERE
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.exec;

use work.core_pack.all;
use work.op_pack.all;

entity exec_tb is
end entity;

architecture beh of exec_tb is

	constant CLK_PERIOD : time := 20 ns;

	signal clk, reset   :  std_logic;
	signal stall        :  std_logic;
	signal flush        :  std_logic;
	signal pc_in        :  std_logic_vector(PC_WIDTH-1 downto 0);
	signal op	    :  exec_op_type;
	signal pc_out       :  std_logic_vector(PC_WIDTH-1 downto 0);
	signal rd, rs, rt   :  std_logic_vector(REG_BITS-1 downto 0);
	signal aluresult    :  std_logic_vector(DATA_WIDTH-1 downto 0);
	signal wrdata       :  std_logic_vector(DATA_WIDTH-1 downto 0);
	signal zero, neg    :  std_logic;
	signal new_pc       :  std_logic_vector(PC_WIDTH-1 downto 0);		
	signal memop_in     :  mem_op_type;
	signal memop_out    :  mem_op_type;
	signal jmpop_in     :  jmp_op_type;
	signal jmpop_out    :  jmp_op_type;
	signal wbop_in      :  wb_op_type;
	signal wbop_out     :  wb_op_type;
	signal forwardA     :  fwd_type;
	signal forwardB     :  fwd_type;
	signal cop0_rddata  :  std_logic_vector(DATA_WIDTH-1 downto 0);
	signal mem_aluresult:  std_logic_vector(DATA_WIDTH-1 downto 0);
	signal wb_result    :  std_logic_vector(DATA_WIDTH-1 downto 0);
	signal exc_ovf      :  std_logic;

	component exec is
	
	port (
		clk, reset       : in  std_logic;
		stall      		 : in  std_logic;
		flush            : in  std_logic;
		pc_in            : in  std_logic_vector(PC_WIDTH-1 downto 0);
		op	   	         : in  exec_op_type;
		pc_out           : out std_logic_vector(PC_WIDTH-1 downto 0);
		rd, rs, rt       : out std_logic_vector(REG_BITS-1 downto 0);
		aluresult	     : out std_logic_vector(DATA_WIDTH-1 downto 0);
		wrdata           : out std_logic_vector(DATA_WIDTH-1 downto 0);
		zero, neg         : out std_logic;
		new_pc           : out std_logic_vector(PC_WIDTH-1 downto 0);		
		memop_in         : in  mem_op_type;
		memop_out        : out mem_op_type;
		jmpop_in         : in  jmp_op_type;
		jmpop_out        : out jmp_op_type;
		wbop_in          : in  wb_op_type;
		wbop_out         : out wb_op_type;
		forwardA         : in  fwd_type;
		forwardB         : in  fwd_type;
		cop0_rddata      : in  std_logic_vector(DATA_WIDTH-1 downto 0);
		mem_aluresult    : in  std_logic_vector(DATA_WIDTH-1 downto 0);
		wb_result        : in  std_logic_vector(DATA_WIDTH-1 downto 0);
		exc_ovf          : out std_logic);

	end component;

begin



	exec_inst : exec
	PORT MAP (
		clk				=> clk, 
		reset			=> reset,
		stall			=> stall,
		flush			=> flush,
		pc_in			=> pc_in,
		op				=> op,
		pc_out			=> pc_out,
		rd				=> rd, 
		rs				=> rs, 
		rt				=> rt,
		aluresult		=> aluresult,
		wrdata			=> wrdata,
		zero			=> zero, 
		neg				=> neg,
		new_pc			=> new_pc,		
		memop_in		=> memop_in,
		memop_out		=> memop_out,
		jmpop_in		=> jmpop_in,
		jmpop_out		=> jmpop_out,
		wbop_in			=> wbop_in,
		wbop_out		=> wbop_out,
		forwardA		=> forwardA,
		forwardB		=> forwardB,
		cop0_rddata 	=> cop0_rddata,
		mem_aluresult	=> mem_aluresult,
		wb_result		=> wb_result,
		exc_ovf			=> exc_ovf
	);

	-- Generates the clock signal
	clkgen : process
	begin
		clk <= '0';
		wait for CLK_PERIOD/2;
		clk <= '1';
		wait for CLK_PERIOD/2;
	end process clkgen;

	input : process
	begin  -- process input
		reset <= '0';
		stall <= '1';
		op.aluop <= ALU_NOP;
		op.readdata1 <= (others => '0');
		op.readdata2 <= (others => '0');

		wait for 100 ns;
		-- test stall
		reset <= '1';
		stall <= '0';
		op.aluop <= ALU_ADD;
		op.readdata1 <= std_logic_vector(to_unsigned(15,DATA_WIDTH));
		op.readdata2 <= std_logic_vector(to_unsigned(26,DATA_WIDTH));

		wait;
	end process;

end architecture;

