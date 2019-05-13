library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.core_pack.all;
use work.op_pack.all;
use work.jmpu;
use work.memu;

entity mem is
	
	port (
		clk, reset    : in  std_logic;
		stall         : in  std_logic;
		flush         : in  std_logic;
		mem_op        : in  mem_op_type;
		jmp_op        : in  jmp_op_type;
		pc_in         : in  std_logic_vector(PC_WIDTH-1 downto 0);
		rd_in         : in  std_logic_vector(REG_BITS-1 downto 0);
		aluresult_in  : in  std_logic_vector(DATA_WIDTH-1 downto 0);
		wrdata        : in  std_logic_vector(DATA_WIDTH-1 downto 0);
		zero, neg     : in  std_logic;
		new_pc_in     : in  std_logic_vector(PC_WIDTH-1 downto 0);
		pc_out        : out std_logic_vector(PC_WIDTH-1 downto 0) := (others =>'0');
		pcsrc         : out std_logic;
		rd_out        : out std_logic_vector(REG_BITS-1 downto 0);
		aluresult_out : out std_logic_vector(DATA_WIDTH-1 downto 0);
		memresult     : out std_logic_vector(DATA_WIDTH-1 downto 0);
		new_pc_out    : out std_logic_vector(PC_WIDTH-1 downto 0);
		wbop_in       : in  wb_op_type;
		wbop_out      : out wb_op_type;
		mem_out       : out mem_out_type;
		mem_data      : in  std_logic_vector(DATA_WIDTH-1 downto 0);
		exc_load      : out std_logic;
		exc_store     : out std_logic);

end mem;

architecture rtl of mem is

	component jmpu is
		port (
			op   : in  jmp_op_type;
			N, Z : in  std_logic;
			J    : out std_logic);
	end component;
	
	component memu is
		port (
			op   : in  mem_op_type;
			A    : in  std_logic_vector(ADDR_WIDTH-1 downto 0);
			W    : in  std_logic_vector(DATA_WIDTH-1 downto 0);
			D    : in  std_logic_vector(DATA_WIDTH-1 downto 0);
			M    : out mem_out_type;
			R    : out std_logic_vector(DATA_WIDTH-1 downto 0);
			XL   : out std_logic;
			XS   : out std_logic);
	end component;
	
	signal sig_exc_load_next	: std_logic;
	signal sig_exc_store_next	: std_logic;
	signal sig_memresult_next	: std_logic_vector(DATA_WIDTH-1 downto 0);
	signal sig_mem_out_next	: mem_out_type;
	
	signal sig_pcsrc_next : std_logic;
	signal sig_pcsrc_jmp	: std_logic;
	signal sig_exc_load_memu	: std_logic;
	signal sig_exc_store_memu	: std_logic;
	signal sig_memresult_memu	: std_logic_vector(DATA_WIDTH-1 downto 0);
	signal sig_mem_out_memu	: mem_out_type;
	
	signal sig_new_pc_out_next : std_logic_vector(PC_WIDTH-1 downto 0);

	signal sig_mem_op        : mem_op_type;

	signal sig_mem_op_mem        : mem_op_type;
	
	signal sig_aluresult_out : std_logic_vector(DATA_WIDTH-1 downto 0);

	signal sig_wrdata        : std_logic_vector(DATA_WIDTH-1 downto 0);
	
begin  -- rtl
	
	sync : process(all)
	begin
	
		pcsrc <= sig_pcsrc_next;
		new_pc_out <= sig_new_pc_out_next;
	
		if stall = '0' then
			pcsrc <= sig_pcsrc_jmp; 
			sig_pcsrc_next <= sig_pcsrc_jmp;
			
			new_pc_out <= new_pc_in;
			sig_new_pc_out_next <= new_pc_in;
			
		else
			sig_pcsrc_next <= pcsrc;
			sig_new_pc_out_next <= new_pc_out;
		end if;
	
		if reset = '0' then
			pc_out	<= (others=>'0');
			rd_out	<= (others=>'0');
			aluresult_out	<= (others=>'0');
			sig_aluresult_out<= (others=>'0');
			new_pc_out	<= (others=>'0');
			wbop_out	<= WB_NOP;	
			pcsrc <= '0';
				
		elsif rising_edge(clk) then
			if flush = '1' then				
				
			elsif stall='0' then			
				pc_out	<= pc_in;
				rd_out	<= rd_in;
				aluresult_out	<= aluresult_in;
				sig_aluresult_out<= aluresult_in;
				wbop_out	<= wbop_in;	
							
				sig_mem_op <= mem_op;
				sig_wrdata <= wrdata;	
			end if;

		end if;
	end process;

	sig_mem_op_mem.memread <= 	sig_mem_op.memread when stall = '0' else
					'0';

	sig_mem_op_mem.memwrite <= 	sig_mem_op.memwrite when stall ='0' else
					'0';

	sig_mem_op_mem.memtype <= sig_mem_op.memtype; 

	exc_load <= sig_exc_load_next;
	exc_store <= sig_exc_store_next;
	memresult <= sig_memresult_next;
	mem_out <= sig_mem_out_next;

	
	read_data : process( all )
	begin
		sig_exc_load_next <= sig_exc_load_memu;
		sig_exc_store_next <= sig_exc_store_memu;
		sig_memresult_next <= sig_memresult_memu;
		sig_mem_out_next <= sig_mem_out_memu;
		
	end process;

	jmpu_inst :jmpu
		port map (
			op	=>jmp_op,
			N	=>neg, 
			Z	=>zero,
			J	=>sig_pcsrc_jmp
	);
	
	memu_inst : memu
		port map(
			op	=>sig_mem_op_mem,
			A	=>sig_aluresult_out(ADDR_WIDTH-1 downto 0), --alu result laut tutor
			W	=>sig_wrdata,
			D 	=>mem_data,
			M	=>sig_mem_out_memu,
			R	=>sig_memresult_memu,
			XL	=>sig_exc_load_memu,
			XS	=>sig_exc_store_memu
	);

end rtl;
