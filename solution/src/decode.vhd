library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.core_pack.all;
use work.op_pack.all;

use work.regfile;

entity decode is
	
	port (
		clk, reset : in  std_logic;
		stall      : in  std_logic;
		flush      : in  std_logic;
		pc_in      : in  std_logic_vector(PC_WIDTH-1 downto 0);
		instr	   : in  std_logic_vector(INSTR_WIDTH-1 downto 0);
		wraddr     : in  std_logic_vector(REG_BITS-1 downto 0);
		wrdata     : in  std_logic_vector(DATA_WIDTH-1 downto 0);
		regwrite   : in  std_logic;
		pc_out     : out std_logic_vector(PC_WIDTH-1 downto 0);
		exec_op    : out exec_op_type;
		cop0_op    : out cop0_op_type;
		jmp_op     : out jmp_op_type;
		mem_op     : out mem_op_type;
		wb_op      : out wb_op_type;
		exc_dec    : out std_logic);

end decode;

architecture rtl of decode is

	component regfile is
		port (
			clk, reset       	: in  std_logic;
			stall            	: in  std_logic;
			rdaddr1, rdaddr2 	: in  std_logic_vector(REG_BITS-1 downto 0);
			rddata1, rddata2 	: out std_logic_vector(DATA_WIDTH-1 downto 0);
			wraddr			 	: in  std_logic_vector(REG_BITS-1 downto 0);
			wrdata			 	: in  std_logic_vector(DATA_WIDTH-1 downto 0);
			regwrite         	: in  std_logic);
			
	end component;

	constant zero_27 : std_logic_vector := "000000000000000000000000000";
	constant zero_16 : std_logic_vector := "0000000000000000";
	constant zero_6  : std_logic_vector := "000000";

	signal sig_mem_op : mem_op_type;
	
	signal sig_instr, sig_instr_old : std_logic_vector(31 downto 0) := (others=>'0');

	signal sig_rdaddr1 : std_logic_vector(REG_BITS-1 downto 0);
	signal sig_rdaddr2 : std_logic_vector(REG_BITS-1 downto 0);
	signal sig_rddata1 : std_logic_vector(DATA_WIDTH-1 downto 0);
	signal sig_rddata2 : std_logic_vector(DATA_WIDTH-1 downto 0);

	signal exec_op_next : exec_op_type;
	signal cop0_op_next : cop0_op_type;
	signal jmp_op_next : jmp_op_type;
	signal mem_op_next : mem_op_type;
	signal wb_op_next : wb_op_type;

	alias opcode : std_logic_vector(5 downto 0) is sig_instr(31 downto 26);

	alias RI_rs : std_logic_vector(4 downto 0) is sig_instr(25 downto 21);
	alias RI_rt_rd : std_logic_vector(4 downto 0) is sig_instr(20 downto 16);


	alias R_rd : std_logic_vector(4 downto 0) is sig_instr(15 downto 11);
	alias R_shamt : std_logic_vector(4 downto 0) is sig_instr(10 downto 6);
	alias R_func : std_logic_vector(5 downto 0) is sig_instr(5 downto 0);

	alias I_adress_immediate : std_logic_vector(15 downto 0) is sig_instr(15 downto 0);
	
	alias J_target_address : std_logic_vector(25 downto 0) is sig_instr(25 downto 0);

	alias rs_data : std_logic_vector(DATA_WIDTH-1 downto 0) is sig_rddata1(DATA_WIDTH-1 downto 0);
	alias rt_data : std_logic_vector(DATA_WIDTH-1 downto 0) is sig_rddata2(DATA_WIDTH-1 downto 0);

	

begin  -- rtl
regfile_ins : regfile
	port map (
		clk => clk,
		reset => reset,       	
		stall => stall,	
		rdaddr1 => sig_rdaddr1,
		rdaddr2 => sig_rdaddr2,
		rddata1 => sig_rddata1,
		rddata2 => sig_rddata2,
		wraddr => wraddr,
		wrdata => wrdata,	
		regwrite => regwrite   	
	);

sync : process(all)
begin

	if reset = '0' then
		exec_op <= EXEC_NOP;
		cop0_op <= COP0_NOP;
		jmp_op <= JMP_NOP;
		sig_mem_op <= MEM_NOP;
		wb_op <= WB_NOP;
		
		pc_out <= (others=>'0');
		sig_instr <= (others=>'0');
			
	elsif rising_edge(clk) then
		if flush = '1' then
			exec_op <= EXEC_NOP;
			cop0_op <= COP0_NOP;
			jmp_op <= JMP_NOP;
			sig_mem_op <= MEM_NOP;
			wb_op <= WB_NOP;
			
			exec_op <= EXEC_NOP;
			
			pc_out <= (others=>'0');

		elsif stall='0' then	

			sig_instr <= instr;

			exec_op <= exec_op_next;
			cop0_op <= cop0_op_next; 
			jmp_op <= jmp_op_next;
			sig_mem_op <= mem_op_next;
			wb_op <= wb_op_next;
			
			
			pc_out <= pc_in;
	
		end if;

	end if;
end process;

mem_op <= 	MEM_NOP 	when stall ='1' else
			sig_mem_op;

read_from_regfile : process( all )
begin
	sig_rdaddr1 <= RI_rs;
	sig_rdaddr2 <= RI_rt_rd;
end process
 ; -- read_from_regfile

MiMi_instructions : process( all )
begin

	--default value 
	exec_op_next <= EXEC_NOP;
	cop0_op_next <= COP0_NOP;
	jmp_op_next <= JMP_NOP;
	mem_op_next <= MEM_NOP;
	wb_op_next <= WB_NOP;
	exc_dec <= '0';

	if sig_instr = "00000000000000000000000000000000" then -- != NOP instr
	else

		exec_op_next.readdata1 <= sig_rddata1;
		exec_op_next.readdata2 <= sig_rddata2;
		case( opcode ) is
		
			when "000000" =>

				---------- MiMi special instructions ----------
				case( R_func ) is
				
					when "000000" => --SLL - R - Format
						exec_op_next.aluop <= ALU_SLL;
						exec_op_next.rd <= R_rd;
						exec_op_next.rt <= RI_rt_rd;
						exec_op_next.imm <= zero_27 & R_shamt;
						exec_op_next.useamt <= '1'; -- 0 = use imm as imm; 1 = use imm as shamt
						exec_op_next.useimm <= '0'; -- 0 = use imm as shamt; 1 == use imm as imm
						
						wb_op_next.regwrite <= '1';

					when "000010" => --SRL - R - Format
						exec_op_next.aluop <= ALU_SRL;
						exec_op_next.rd <= R_rd;
						exec_op_next.rt <= RI_rt_rd;
						exec_op_next.imm <= zero_27 &  R_shamt;
						exec_op_next.useamt <= '1';
						exec_op_next.useimm <= '0';
						
						wb_op_next.regwrite <= '1';
			
					when "000011" => -- SRA - R - Format
						exec_op_next.aluop <= ALU_SRA;
						exec_op_next.rd <= R_rd;
						exec_op_next.rt <= RI_rt_rd;
						exec_op_next.imm <= zero_27 &  R_shamt;
						exec_op_next.useamt <= '1';
						exec_op_next.useimm <= '0';
						
						wb_op_next.regwrite <= '1';

					when "000100" => -- SLLV - R - Format
						exec_op_next.aluop <= ALU_SLL;
						exec_op_next.rd <= R_rd;
						exec_op_next.rt <= RI_rt_rd;
						exec_op_next.imm <= zero_27 & rs_data(4 downto 0);
						exec_op_next.useamt <= '1';
						exec_op_next.useimm <= '0';
						
						wb_op_next.regwrite <= '1';

					when "000110" => -- SRLV - R - Format
						exec_op_next.aluop <= ALU_SRL;
						exec_op_next.rd <= R_rd;
						exec_op_next.rt <= RI_rt_rd;
						exec_op_next.imm <= zero_27 & rs_data(4 downto 0);
						exec_op_next.useamt <= '1';
						exec_op_next.useimm <= '0';
						
						wb_op_next.regwrite <= '1';

					when "000111" => --SRAV - R - Format
						exec_op_next.aluop <= ALU_SRA;
						exec_op_next.rd <= R_rd;
						exec_op_next.rt <= RI_rt_rd;
						exec_op_next.imm <= zero_27 & rs_data(4 downto 0);
						exec_op_next.useamt <= '1';
						exec_op_next.useimm <= '0';
						
						wb_op_next.regwrite <= '1';

					when "001000" => -- JR rs - R - Format
						exec_op_next.aluop <= ALU_NOP;
						jmp_op_next <= JMP_JMP;
						exec_op_next.rs <= RI_rs;

					when "001001" => -- JALR - R - Format
						exec_op_next.aluop <= ALU_NOP;
						jmp_op_next <= JMP_JMP;
						exec_op_next.rs <= RI_rs;
						exec_op_next.rd <= R_rd;

						--pc + 4 -- link auf 1
						exec_op_next.link <= '1';
						
						wb_op_next.regwrite <= '1';

					when "100000" => -- ADD - R - Format
						exec_op_next.aluop <= ALU_ADD;
						exec_op_next.rd <= R_rd;
						exec_op_next.rt <= RI_rt_rd;
						exec_op_next.rs <= RI_rs;
						exec_op_next.ovf <= '1'; -- overflow trap
						
						wb_op_next.regwrite <= '1';

					when "100001" => -- ADDU - R - Format
						exec_op_next.aluop <= ALU_ADD;
						exec_op_next.rd <= R_rd;
						exec_op_next.rt <= RI_rt_rd;
						exec_op_next.rs <= RI_rs;
						
						wb_op_next.regwrite <= '1';
					
					when "100010" => -- SUB - R - Format
						exec_op_next.aluop <= ALU_SUB;
						exec_op_next.rd <= R_rd;
						exec_op_next.rt <= RI_rt_rd;
						exec_op_next.rs <= RI_rs;
						exec_op_next.ovf <= '1'; -- overflow trap
						
						wb_op_next.regwrite <= '1';

					when "100011" => -- SUBU - R - Format
						exec_op_next.aluop <= ALU_SUB;
						exec_op_next.rd <= R_rd;
						exec_op_next.rt <= RI_rt_rd;
						exec_op_next.rs <= RI_rs;
						
						wb_op_next.regwrite <= '1';

					when "100100" => -- AND - R - Format
						exec_op_next.aluop <= ALU_AND;
						exec_op_next.rd <= R_rd;
						exec_op_next.rt <= RI_rt_rd;
						exec_op_next.rs <= RI_rs;
						
						wb_op_next.regwrite <= '1';

					when "100101" => -- OR - R - Format
						exec_op_next.aluop <= ALU_OR;
						exec_op_next.rd <= R_rd;
						exec_op_next.rt <= RI_rt_rd;
						exec_op_next.rs <= RI_rs;
						
						wb_op_next.regwrite <= '1';

					when "100110" => -- xor - R - Format
						exec_op_next.aluop <= ALU_XOR;
						exec_op_next.rd <= R_rd;
						exec_op_next.rt <= RI_rt_rd;
						exec_op_next.rs <= RI_rs;
						
						wb_op_next.regwrite <= '1';

					when "100111" => -- NOR - R - Format
						exec_op_next.aluop <= ALU_NOR;
						exec_op_next.rd <= R_rd;
						exec_op_next.rt <= RI_rt_rd;
						exec_op_next.rs <= RI_rs;
						
						wb_op_next.regwrite <= '1';
					
					when "101010" => -- slt - R - Format
						exec_op_next.aluop <= ALU_SLT;
						exec_op_next.rd <= R_rd;
						exec_op_next.rt <= RI_rt_rd;
						exec_op_next.rs <= RI_rs;
						
						wb_op_next.regwrite <= '1';

					when "101011" => -- sltu - R - Format
						exec_op_next.aluop <= ALU_SLTU;
						exec_op_next.rd <= R_rd;
						exec_op_next.rt <= RI_rt_rd;
						exec_op_next.rs <= RI_rs;
						
						wb_op_next.regwrite <= '1';
				
					when others =>
						exec_op_next.aluop <= ALU_NOP;
						exc_dec <= '1';
				
				end case ;


			when "000001" =>
				---------- MiMi regimm instructions ----------
				case( RI_rt_rd ) is
				
					when "00000" => -- BLTZ - I - Format
						jmp_op_next <= JMP_BLTZ;
						exec_op_next.aluop <= ALU_SUB;
						exec_op_next.branch <= '1'; -- pc += imm << 2
						exec_op_next.rs <= RI_rs;
						exec_op_next.rt <= (others => '0');
						exec_op_next.readdata2 <= (others=>'0'); -- rt
						exec_op_next.imm <= std_logic_vector(resize(signed(I_adress_immediate), exec_op_next.imm'length));
						exec_op_next.useimm <= '1';

					when "00001" => -- BGEZ - I - Format
						jmp_op_next <= JMP_BGEZ;
						exec_op_next.aluop <= ALU_SUB;
						exec_op_next.branch <= '1';
						exec_op_next.rs <= RI_rs;	
						exec_op_next.readdata2 <= (others=>'0'); -- rt					
						exec_op_next.rt <= (others => '0');
						exec_op_next.imm <= std_logic_vector(resize(signed(I_adress_immediate), exec_op_next.imm'length));
						exec_op_next.useimm <= '1';
					
					when "10000" => -- BLTZAL - I - Format
						jmp_op_next <= JMP_BLTZ; -- ändenr auf BLTZAL -- rt = 0 für vergleich
						exec_op_next.aluop <= ALU_SUB;
						exec_op_next.branch <= '1';
						exec_op_next.rs <= RI_rs;
						exec_op_next.readdata2 <= (others=>'0'); -- rt	
						exec_op_next.rt <= (others => '0');
						exec_op_next.imm <= std_logic_vector(resize(signed(I_adress_immediate), exec_op_next.imm'length));
						exec_op_next.useimm <= '1';
						exec_op_next.link <= '1';	-- r31 = pc + 4
						exec_op_next.rd <= "11111"; 	-- r31 = pc + 4
						
						wb_op_next.regwrite <= '1';
					
					when "10001" => -- BGEZAL - I - Format
						jmp_op_next <= JMP_BGEZ; -- ändern auf BGEZAL -- rt = 0 für vergleich
						exec_op_next.aluop <= ALU_SUB;
						exec_op_next.branch <= '1';
						exec_op_next.rs <= RI_rs;
						exec_op_next.readdata2 <= (others=>'0'); -- rt
						exec_op_next.rt <= (others => '0');
						exec_op_next.imm <= std_logic_vector(resize(signed(I_adress_immediate), exec_op_next.imm'length));
						exec_op_next.useimm <= '1';
						exec_op_next.link <= '1';	-- r31 = pc + 4
						exec_op_next.rd <= "11111"; 	-- r31 = pc + 4
						
						wb_op_next.regwrite <= '1';
						
					when others =>
						jmp_op_next <= JMP_NOP;
						exc_dec <= '1';
						
				end case ; 

			when "000010" => -- J - J - Format
				jmp_op_next <= JMP_JMP;
				exec_op_next.imm <= zero_6 & J_target_address;
				exec_op_next.useimm <= '1';
					
			when "000011" => -- JAL - J - Format
				jmp_op_next <= JMP_JMP;
				exec_op_next.imm <= zero_6 & J_target_address; 
				exec_op_next.useimm <= '1';
				
				exec_op_next.link <= '1';	-- r31 = pc + 4
				exec_op_next.rd <= "11111"; 	-- r31 = pc + 4
				
				wb_op_next.regwrite <= '1';
			
			when "000100" => -- BEQ - I - Format
				jmp_op_next <= JMP_BEQ;
				exec_op_next.aluop <= ALU_SUB;
				exec_op_next.rd <= RI_rt_rd;
				exec_op_next.rs <= RI_rs;
				exec_op_next.branch <= '1';
				exec_op_next.imm <= std_logic_vector(resize(signed(I_adress_immediate), exec_op_next.imm'length));
				exec_op_next.useimm <= '1';

			when "000101" => -- BNE - I - Format
				jmp_op_next <= JMP_BNE;
				exec_op_next.aluop <= ALU_SUB;
				exec_op_next.rd <= RI_rt_rd;
				exec_op_next.rs <= RI_rs;
				exec_op_next.branch <= '1';
				exec_op_next.imm <= std_logic_vector(resize(signed(I_adress_immediate), exec_op_next.imm'length));
				exec_op_next.useimm <= '1';

			when "000110" => -- BLEZ - I - Format
				jmp_op_next <= JMP_BLEZ;
				exec_op_next.aluop <= ALU_SUB;
				exec_op_next.rd <= RI_rt_rd;
				exec_op_next.rs <= RI_rs;
				exec_op_next.readdata2 <= (others=>'0'); -- rt	
				exec_op_next.branch <= '1';
				exec_op_next.imm <= std_logic_vector(resize(signed(I_adress_immediate), exec_op_next.imm'length));
				exec_op_next.useimm <= '1';

			when "000111" => -- BGTZ - I - Format
				jmp_op_next <= JMP_BGTZ;
				exec_op_next.aluop <= ALU_SUB;
				exec_op_next.rd <= RI_rt_rd;
				exec_op_next.rs <= RI_rs;
				exec_op_next.readdata2 <= (others=>'0'); -- rt	
				exec_op_next.branch <= '1';
				exec_op_next.imm <= std_logic_vector(resize(signed(I_adress_immediate), exec_op_next.imm'length));
				exec_op_next.useimm <= '1';
			
			when "001000" => -- ADDI - I - Format
				exec_op_next.aluop <= ALU_ADD;
				exec_op_next.rd <= RI_rt_rd;
				exec_op_next.rs <= RI_rs;
				exec_op_next.imm <= std_logic_vector(resize(signed(I_adress_immediate), exec_op_next.imm'length));
				exec_op_next.useimm <= '1';
				exec_op_next.ovf <= '1'; -- overflow trap
				
				wb_op_next.regwrite <= '1';

			when "001001" => -- ADDIU - I - Format
				exec_op_next.aluop <= ALU_ADD;
				exec_op_next.rd <= RI_rt_rd;
				exec_op_next.rs <= RI_rs;
				exec_op_next.imm <= std_logic_vector(resize(signed(I_adress_immediate), exec_op_next.imm'length));
				exec_op_next.useimm <= '1';
				
				wb_op_next.regwrite <= '1';

			when "001010" => -- SLTI - I - Format
				exec_op_next.aluop <= ALU_SLT;
				exec_op_next.rd <= RI_rt_rd;
				exec_op_next.rs <= RI_rs;
				exec_op_next.imm <= std_logic_vector(resize(signed(I_adress_immediate), exec_op_next.imm'length));
				exec_op_next.useimm <= '1';
				
				wb_op_next.regwrite <= '1';

			when "001011" => -- SLTIU - I - Format
				exec_op_next.aluop <= ALU_SLTU;
				exec_op_next.rd <= RI_rt_rd;
				exec_op_next.rs <= RI_rs;
				exec_op_next.imm <= zero_16 & I_adress_immediate;
				exec_op_next.useimm <= '1';
				
				wb_op_next.regwrite <= '1';
			
			when "001100" => -- ANDI - I - Format
				exec_op_next.aluop <= ALU_AND;
				exec_op_next.rd <= RI_rt_rd;
				exec_op_next.rs <= RI_rs;
				exec_op_next.imm <= zero_16 & I_adress_immediate;
				exec_op_next.useimm <= '1';
				
				wb_op_next.regwrite <= '1';
			
			when "001101" => -- ORI - I - Format
				exec_op_next.aluop <= ALU_OR;
				exec_op_next.rd <= RI_rt_rd;
				exec_op_next.rs <= RI_rs;
				exec_op_next.imm <= zero_16 & I_adress_immediate;
				exec_op_next.useimm <= '1';
				
				wb_op_next.regwrite <= '1';
			
			when "001110" => -- XORI - I - Format
				exec_op_next.aluop <= ALU_XOR;
				exec_op_next.rd <= RI_rt_rd;
				exec_op_next.rs <= RI_rs;
				exec_op_next.imm <= zero_16 & I_adress_immediate;
				exec_op_next.useimm <= '1';
				
				wb_op_next.regwrite <= '1';
			
			when "001111" => -- LUI - I - Format
				exec_op_next.aluop <= ALU_LUI;
				exec_op_next.rd <= RI_rt_rd;
				exec_op_next.imm <= zero_16 & I_adress_immediate;
				exec_op_next.useimm <= '1';
				
				wb_op_next.regwrite <= '1';

			when "010000" =>  -- R - Format
							
					---------- MiMi cop0 instructions ----------
					case( RI_rs ) is
					
						when "00000" => 
							
						when "00100" =>
								
						when others =>
					
					end case ;
			
			when "100000" => -- LB - I - Format
				exec_op_next.aluop <= ALU_ADD;
				mem_op_next.memtype <= MEM_B;
				mem_op_next.memread <= '1';
				
				wb_op_next.memtoreg <= '1';
				wb_op_next.regwrite <= '1';
					
				exec_op_next.rd <= RI_rt_rd;
				exec_op_next.rs <= RI_rs;
				exec_op_next.imm <= std_logic_vector(resize(signed(I_adress_immediate), exec_op_next.imm'length));
				exec_op_next.useimm <= '1';

			when "100001" => -- LH - I - Format
				exec_op_next.aluop <= ALU_ADD;
				mem_op_next.memtype <= MEM_H;
				mem_op_next.memread <= '1';
				
				wb_op_next.memtoreg <= '1';
				wb_op_next.regwrite <= '1';
				
				exec_op_next.rd <= RI_rt_rd;
				exec_op_next.rs <= RI_rs;
				exec_op_next.imm <= std_logic_vector(resize(signed(I_adress_immediate), exec_op_next.imm'length));
				exec_op_next.useimm <= '1';

			when "100011" => -- lw - I - Format
				exec_op_next.aluop <= ALU_ADD;
				mem_op_next.memtype <= MEM_W;
				mem_op_next.memread <= '1';
				
				wb_op_next.memtoreg <= '1';
				wb_op_next.regwrite <= '1';
				
				exec_op_next.rd <= RI_rt_rd;
				exec_op_next.rs <= RI_rs;
				exec_op_next.imm <= std_logic_vector(resize(signed(I_adress_immediate), exec_op_next.imm'length));
				exec_op_next.useimm <= '1';
			
			when "100100" => -- LBU - I - Format
				exec_op_next.aluop <= ALU_ADD;
				mem_op_next.memtype <= MEM_BU;
				mem_op_next.memread <= '1';
				
				wb_op_next.memtoreg <= '1';
				wb_op_next.regwrite <= '1';
				
				exec_op_next.rd <= RI_rt_rd;
				exec_op_next.rs <= RI_rs;
				exec_op_next.imm <= std_logic_vector(resize(signed(I_adress_immediate), exec_op_next.imm'length));
				exec_op_next.useimm <= '1';
			
			when "100101" => -- LHU - I - Format
				exec_op_next.aluop <= ALU_ADD;
				mem_op_next.memtype <= MEM_HU;
				mem_op_next.memread <= '1';
				
				wb_op_next.memtoreg <= '1';
				wb_op_next.regwrite <= '1';
				
				exec_op_next.rd <= RI_rt_rd;
				exec_op_next.rs <= RI_rs;
				exec_op_next.imm <= std_logic_vector(resize(signed(I_adress_immediate), exec_op_next.imm'length));
				exec_op_next.useimm <= '1';
			
			when "101000" => -- SB - I - Format
				exec_op_next.aluop <= ALU_ADD;
				mem_op_next.memtype <= MEM_B;
				mem_op_next.memwrite <= '1';
				
				exec_op_next.rd <= RI_rt_rd;
				exec_op_next.rs <= RI_rs;
				exec_op_next.imm <= std_logic_vector(resize(signed(I_adress_immediate), exec_op_next.imm'length));
				exec_op_next.useimm <= '1';
		
			when "101001" => -- SH - I - Format
				exec_op_next.aluop <= ALU_ADD;
				mem_op_next.memtype <= MEM_H;
				mem_op_next.memwrite <= '1';
				
				exec_op_next.rd <= RI_rt_rd;
				exec_op_next.rs <= RI_rs;
				exec_op_next.imm <= std_logic_vector(resize(signed(I_adress_immediate), exec_op_next.imm'length));
				exec_op_next.useimm <= '1';

			when "101011" => -- SW - I - Format
				exec_op_next.aluop <= ALU_ADD;
				mem_op_next.memtype <= MEM_W;
				mem_op_next.memwrite <= '1';
				
				exec_op_next.rd <= RI_rt_rd;
				exec_op_next.rs <= RI_rs;
				exec_op_next.imm <= std_logic_vector(resize(signed(I_adress_immediate), exec_op_next.imm'length));
				exec_op_next.useimm <= '1';

			when others =>
				exc_dec <= '1';
		
		end case ;	
	end if;
	
	
end process ; -- MiMi_instructions
end rtl;