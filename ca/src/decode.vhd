library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.core_pack.all;
use work.op_pack.all;

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
		exc_dec    : out std_logic
	);
end decode;

architecture rtl of decode is

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

	signal sig_pc_in : std_logic_vector(PC_WIDTH-1 downto 0);
	signal sig_instr : std_logic_vector(INSTR_WIDTH-1 downto 0);
	signal sig_wraddr : std_logic_vector(REG_BITS-1 downto 0);
	signal sig_wrdata : std_logic_vector(DATA_WIDTH-1 downto 0);
	signal sig_regwrite : std_logic;
	signal sig_rdaddr1, sig_rdaddr2 : std_logic_vector(REG_BITS-1 downto 0);
	signal sig_rddata1, sig_rddata2	: std_logic_vector(DATA_WIDTH-1 downto 0);

	alias opcode : std_logic_vector(5 downto 0) is sig_instr(31 downto 26);
	alias rs : std_logic_vector(4 downto 0) is sig_instr(25 downto 21);
	alias r_rt_or_i_rd : std_logic_vector(4 downto 0) is sig_instr(20 downto 16);
	alias shamt : std_logic_vector(4 downto 0) is sig_instr(10 downto 6);
	alias func : std_logic_vector(5 downto 0) is sig_instr(5 downto 0);
	alias address_or_immediate : std_logic_vector(15 downto 0) is sig_instr(15 downto 0);
	alias target_address : std_logic_vector(25 downto 0) is sig_instr(25 downto 0);
	alias r_rd : std_logic_vector(4 downto 0) is sig_instr(15 downto 11);

begin

	regfile_inst : regfile
	port map (clk => clk, reset => reset, stall => stall, rdaddr1 => sig_rdaddr1, rdaddr2 => sig_rdaddr2, rddata1 => sig_rddata1, rddata2 => sig_rddata2, wraddr => sig_wraddr, wrdata => sig_wrdata, regwrite => sig_regwrite);

	sync: process (all)
	begin
	if reset = '0' then
		pc_out <= (others => '0');
		sig_pc_in <= (others => '0');
		sig_instr <= (others => '0');
		sig_wraddr <= (others => '0');
		sig_wrdata <= (others => '0');
		sig_regwrite <= '0';
	elsif rising_edge(clk) then
		if stall = '0' then
			pc_out <= pc_in;
			sig_pc_in <= pc_in;
			sig_instr <= instr;
			sig_wraddr <= wraddr;
			sig_wrdata <= wrdata;
			sig_regwrite <= regwrite;
		end if;
	end if;	
	end process;
	
	decode : process (all)
	begin
		
		--read from regfile
		sig_rdaddr1 <= rs;
		sig_rdaddr2 <= r_rt_or_i_rd;
		
		--setting default values 
		exec_op <= EXEC_NOP;
		cop0_op <= COP0_NOP;
		jmp_op <= JMP_NOP;
		mem_op <= MEM_NOP;
		wb_op <= WB_NOP;
		exc_dec <= '0';

		--assigning the values from the regfile
		exec_op.readdata1 <= sig_rddata1;
		exec_op.readdata2 <= sig_rddata2;

		if unsigned(instr) > 0 then
			case opcode is 
				when "000000" =>
					case func is
						when "000000" => --SLL
							exec_op.aluop <= ALU_SLL;
							exec_op.rd <= r_rd;
							exec_op.rt <= r_rt_or_i_rd;
							exec_op.imm <= std_logic_vector(resize(unsigned(shamt),exec_op.imm'LENGTH));
							exec_op.useamt <= '1';
							wb_op.regwrite <= '1';
						when "000010" => --SRL
							exec_op.aluop <= ALU_SRL;
							exec_op.rd <= r_rd;
							exec_op.rt <= r_rt_or_i_rd;
							exec_op.imm <= std_logic_vector(resize(unsigned(shamt),exec_op.imm'LENGTH));
							exec_op.useamt <= '1';
							wb_op.regwrite <= '1';
						when "000011" => --SRA
							exec_op.aluop <= ALU_SRA;
							exec_op.rd <= r_rd;
							exec_op.rt <= r_rt_or_i_rd;
							exec_op.imm <= std_logic_vector(resize(unsigned(shamt),exec_op.imm'LENGTH));
							exec_op.useamt <= '1';
							wb_op.regwrite <= '1';
						when "000100" => --SLLV
							exec_op.aluop <= ALU_SLL;
							exec_op.rd <= r_rd;
							exec_op.rt <= r_rt_or_i_rd;
							exec_op.imm <= std_logic_vector(resize(unsigned(sig_rddata1(4 downto 0)),exec_op.imm'LENGTH));
							exec_op.useamt <= '1';
							wb_op.regwrite <= '1';
						when "000110" => --SRLV
							exec_op.aluop <= ALU_SRL;
							exec_op.rd <= r_rd;
							exec_op.rt <= r_rt_or_i_rd;
							exec_op.imm <= std_logic_vector(resize(unsigned(sig_rddata1(4 downto 0)),exec_op.imm'LENGTH));
							exec_op.useamt <= '1';
							wb_op.regwrite <= '1';
						when "000111" => --SRAV
							exec_op.aluop <= ALU_SRA;
							exec_op.rd <= r_rd;
							exec_op.rt <= r_rt_or_i_rd;
							exec_op.imm <= std_logic_vector(resize(unsigned(sig_rddata1(4 downto 0)),exec_op.imm'LENGTH));
							exec_op.useamt <= '1';
							wb_op.regwrite <= '1';
						when "001000" => --JR
							jmp_op <= JMP_JMP;
						when "001001" => --JALR
							jmp_op <= JMP_JMP;
							exec_op.link <= '1';
							wb_op.regwrite <= '1';
						when "100000" => --ADD
							exec_op.aluop <= ALU_ADD;
							exec_op.rd <= r_rd;
							exec_op.rt <= r_rt_or_i_rd;
							exec_op.rs <= rs;
							exec_op.ovf <= '1';
							wb_op.regwrite <= '1';
						when "100001" => --ADDU
							exec_op.aluop <= ALU_ADD;
							exec_op.rd <= r_rd;
							exec_op.rt <= r_rt_or_i_rd;
							exec_op.rs <= rs;
							wb_op.regwrite <= '1';
						when "100010" => --SUB
							exec_op.aluop <= ALU_SUB;
							exec_op.rd <= r_rd;
							exec_op.rt <= r_rt_or_i_rd;
							exec_op.rs <= rs;
							exec_op.ovf <= '1';
							wb_op.regwrite <= '1';
						when "100011" => --SUBU
							exec_op.aluop <= ALU_SUB;
							exec_op.rd <= r_rd;
							exec_op.rt <= r_rt_or_i_rd;
							exec_op.rs <= rs;
							wb_op.regwrite <= '1';
						when "100100" => --AND
							exec_op.aluop <= ALU_AND;
							exec_op.rd <= r_rd;
							exec_op.rt <= r_rt_or_i_rd;
							exec_op.rs <= rs;
							wb_op.regwrite <= '1';
						when "100101" => --OR
							exec_op.aluop <= ALU_OR;
							exec_op.rd <= r_rd;
							exec_op.rt <= r_rt_or_i_rd;
							exec_op.rs <= rs;
							wb_op.regwrite <= '1';
						when "100110" => --XOR
							exec_op.aluop <= ALU_XOR;
							exec_op.rd <= r_rd;
							exec_op.rt <= r_rt_or_i_rd;
							exec_op.rs <= rs;
							wb_op.regwrite <= '1';
						when "100111" => --NOR
							exec_op.aluop <= ALU_NOR;
							exec_op.rd <= r_rd;
							exec_op.rt <= r_rt_or_i_rd;
							exec_op.rs <= rs;
							wb_op.regwrite <= '1';
						when "101010" => --SLT
							exec_op.aluop <= ALU_SLT;
							exec_op.rd <= r_rd;
							exec_op.rt <= r_rt_or_i_rd;
							exec_op.rs <= rs;
							wb_op.regwrite <= '1';
						when "101011" => --SLTU
							exec_op.aluop <= ALU_SLTU;
							exec_op.rd <= r_rd;
							exec_op.rt <= r_rt_or_i_rd;
							exec_op.rs <= rs;
							wb_op.regwrite <= '1';
						when others =>
							exc_dec <= '1';
					end case;
				when "000001" =>
					case r_rt_or_i_rd is 
						when "00000" => --BLTZ
							jmp_op <= JMP_BLTZ;
							exec_op.aluop <= ALU_SUB;
							exec_op.branch <= '1';
							exec_op.rs <= rs;
							exec_op.readdata2 <= (others => '0');
							exec_op.imm <= std_logic_vector(resize(signed(address_or_immediate),exec_op.imm'LENGTH));
							exec_op.useimm <= '1';
						when "00001" => --BGEZ
							jmp_op <= JMP_BGEZ;
							exec_op.aluop <= ALU_SUB;
							exec_op.branch <= '1';
							exec_op.rs <= rs;
							exec_op.readdata2 <= (others => '0');
							exec_op.imm <= std_logic_vector(resize(signed(address_or_immediate),exec_op.imm'LENGTH));
							exec_op.useimm <= '1';
						when "10000" => --BLTZAL
							jmp_op <= JMP_BLTZ;
							exec_op.aluop <= ALU_SUB;
							exec_op.branch <= '1';
							exec_op.rs <= rs;
							exec_op.readdata2 <= (others => '0');
							exec_op.imm <= std_logic_vector(resize(signed(address_or_immediate),exec_op.imm'LENGTH));
							exec_op.useimm <= '1';
							exec_op.link <= '1';
							exec_op.rd <= (others => '1');
							wb_op.regwrite <= '1';
						when "10001" => --BGEZAL
							jmp_op <= JMP_BGEZ;
							exec_op.aluop <= ALU_SUB;
							exec_op.branch <= '1';
							exec_op.rs <= rs;
							exec_op.readdata2 <= (others => '0');
							exec_op.imm <= std_logic_vector(resize(signed(address_or_immediate),exec_op.imm'LENGTH));
							exec_op.useimm <= '1';
							exec_op.link <= '1';
							exec_op.rd <= (others => '1');
							wb_op.regwrite <= '1';
						when others =>
							exc_dec <= '1';
					end case;
				when "000010" => --J
					jmp_op <= JMP_JMP;
					exec_op.imm <= std_logic_vector(resize(unsigned(target_address),exec_op.imm'LENGTH));
					exec_op.useimm <= '1';
				when "000011" => --JAL
					jmp_op <= JMP_JMP;
					exec_op.imm <= std_logic_vector(resize(unsigned(target_address),exec_op.imm'LENGTH));
					exec_op.useimm <= '1';
					exec_op.link <= '1';
					exec_op.rd <= (others => '1');
					wb_op.regwrite <= '1';
				when "000100" => --BEQ
					jmp_op <= JMP_BEQ;
					exec_op.aluop <= ALU_SUB;
					exec_op.rd <= r_rt_or_i_rd;
					exec_op.rs <= rs;
					exec_op.branch <= '1';
					exec_op.imm <= std_logic_vector(resize(signed(address_or_immediate),exec_op.imm'LENGTH));
					exec_op.useimm <= '1';
				when "000101" => --BNE
					jmp_op <= JMP_BNE;
					exec_op.aluop <= ALU_SUB;
					exec_op.rd <= r_rt_or_i_rd;
					exec_op.rs <= rs;
					exec_op.branch <= '1';
					exec_op.imm <= std_logic_vector(resize(signed(address_or_immediate),exec_op.imm'LENGTH));
					exec_op.useimm <= '1';
				when "000110" => --BLEZ
					jmp_op <= JMP_BLEZ;
					exec_op.aluop <= ALU_SUB;
					exec_op.rd <= r_rt_or_i_rd;
					exec_op.rs <= rs;
					exec_op.readdata2 <= (others => '0');
					exec_op.branch <= '1';
					exec_op.imm <= std_logic_vector(resize(signed(address_or_immediate),exec_op.imm'LENGTH));
					exec_op.useimm <= '1';
				when "000111" => --BGTZ
					jmp_op <= JMP_BGTZ;
					exec_op.aluop <= ALU_SUB;
					exec_op.rd <= r_rt_or_i_rd;
					exec_op.rs <= rs;
					exec_op.readdata2 <= (others => '0');
					exec_op.branch <= '1';
					exec_op.imm <= std_logic_vector(resize(signed(address_or_immediate),exec_op.imm'LENGTH));
					exec_op.useimm <= '1';
				when "001000" => --ADDI
					exec_op.aluop <= ALU_ADD;
					exec_op.rd <= r_rt_or_i_rd;
					exec_op.rs <= rs;
					exec_op.imm <= std_logic_vector(resize(signed(address_or_immediate),exec_op.imm'LENGTH));
					exec_op.useimm <= '1';
					exec_op.ovf <= '1';
					wb_op.regwrite <= '1';
				when "001001" => --ADDIU
					exec_op.aluop <= ALU_ADD;
					exec_op.rd <= r_rt_or_i_rd;
					exec_op.rs <= rs;
					exec_op.imm <= std_logic_vector(resize(signed(address_or_immediate),exec_op.imm'LENGTH));
					exec_op.useimm <= '1';
					wb_op.regwrite <= '1';
				when "001010" => --SLTI
					exec_op.aluop <= ALU_SLT;
					exec_op.rd <= r_rt_or_i_rd;
					exec_op.rs <= rs;
					exec_op.imm <= std_logic_vector(resize(signed(address_or_immediate),exec_op.imm'LENGTH));
					exec_op.useimm <= '1';
					wb_op.regwrite <= '1';
				when "001011" => --SLTIU
					exec_op.aluop <= ALU_SLTU;
					exec_op.rd <= r_rt_or_i_rd;
					exec_op.rs <= rs;
					exec_op.imm <= std_logic_vector(resize(unsigned(address_or_immediate),exec_op.imm'LENGTH));
					exec_op.useimm <= '1';
					wb_op.regwrite <= '1';
				when "001100" => --ANDI
					exec_op.aluop <= ALU_AND;
					exec_op.rd <= r_rt_or_i_rd;
					exec_op.rs <= rs;
					exec_op.imm <= std_logic_vector(resize(unsigned(address_or_immediate),exec_op.imm'LENGTH));
					exec_op.useimm <= '1';
					wb_op.regwrite <= '1';
				when "001101" => --ORI
					exec_op.aluop <= ALU_OR;
					exec_op.rd <= r_rt_or_i_rd;
					exec_op.rs <= rs;
					exec_op.imm <= std_logic_vector(resize(unsigned(address_or_immediate),exec_op.imm'LENGTH));
					exec_op.useimm <= '1';
					wb_op.regwrite <= '1';
				when "001110" => --XORI
					exec_op.aluop <= ALU_XOR;
					exec_op.rd <= r_rt_or_i_rd;
					exec_op.rs <= rs;
					exec_op.imm <= std_logic_vector(resize(unsigned(address_or_immediate),exec_op.imm'LENGTH));
					exec_op.useimm <= '1';
					wb_op.regwrite <= '1';
				when "001111" => --LUI
					exec_op.aluop <= ALU_LUI;
					exec_op.rd <= r_rt_or_i_rd;
					exec_op.imm <= std_logic_vector(resize(unsigned(address_or_immediate),exec_op.imm'LENGTH));
					exec_op.useimm <= '1';
					wb_op.regwrite <= '1';
				when "010000" =>
					case rs is 
						when "00000" => --MFC0
							cop0_op.wr <= '0';
							cop0_op.addr <= r_rt_or_i_rd;
						when "00100" => --MTC0
							cop0_op.wr <= '1';
							cop0_op.addr <= r_rt_or_i_rd;
						when others =>
							exc_dec <= '1';
					end case;
				when "100000" => --LB
					exec_op.aluop <= ALU_ADD;
					exec_op.rd <= r_rt_or_i_rd;
					exec_op.rs <= rs;
					exec_op.imm <= std_logic_vector(resize(signed(address_or_immediate),exec_op.imm'LENGTH));
					exec_op.useimm <= '1';
					mem_op.memtype <= MEM_B;
					mem_op.memread <= '1';
					wb_op.memtoreg <= '1';
					wb_op.regwrite <= '1';
				when "100001" => --LH
					exec_op.aluop <= ALU_ADD;
					exec_op.rd <= r_rt_or_i_rd;
					exec_op.rs <= rs;
					exec_op.imm <= std_logic_vector(resize(signed(address_or_immediate),exec_op.imm'LENGTH));
					exec_op.useimm <= '1';
					mem_op.memtype <= MEM_H;
					mem_op.memread <= '1';
					wb_op.memtoreg <= '1';
					wb_op.regwrite <= '1';
				when "100011" => --LW
					exec_op.aluop <= ALU_ADD;
					exec_op.rd <= r_rt_or_i_rd;
					exec_op.rs <= rs;
					exec_op.imm <= std_logic_vector(resize(signed(address_or_immediate),exec_op.imm'LENGTH));
					exec_op.useimm <= '1';
					mem_op.memtype <= MEM_W;
					mem_op.memread <= '1';
					wb_op.memtoreg <= '1';
					wb_op.regwrite <= '1';
				when "100100" => --LBU
					exec_op.aluop <= ALU_ADD;
					exec_op.rd <= r_rt_or_i_rd;
					exec_op.rs <= rs;
					exec_op.imm <= std_logic_vector(resize(signed(address_or_immediate),exec_op.imm'LENGTH));
					exec_op.useimm <= '1';
					mem_op.memtype <= MEM_BU;
					mem_op.memread <= '1';
					wb_op.memtoreg <= '1';
					wb_op.regwrite <= '1';
				when "100101" => --LHU
					exec_op.aluop <= ALU_ADD;
					exec_op.rd <= r_rt_or_i_rd;
					exec_op.rs <= rs;
					exec_op.imm <= std_logic_vector(resize(signed(address_or_immediate),exec_op.imm'LENGTH));
					exec_op.useimm <= '1';
					mem_op.memtype <= MEM_HU;
					mem_op.memread <= '1';
					wb_op.memtoreg <= '1';
					wb_op.regwrite <= '1';
				when "101000" => --SB
					exec_op.aluop <= ALU_ADD;
					exec_op.rd <= r_rt_or_i_rd;
					exec_op.rs <= rs;
					exec_op.imm <= std_logic_vector(resize(signed(address_or_immediate),exec_op.imm'LENGTH));
					exec_op.useimm <= '1';
					mem_op.memtype <= MEM_B;
					mem_op.memwrite <= '1';
				when "101001" => --SH
					exec_op.aluop <= ALU_ADD;
					exec_op.rd <= r_rt_or_i_rd;
					exec_op.rs <= rs;
					exec_op.imm <= std_logic_vector(resize(signed(address_or_immediate),exec_op.imm'LENGTH));
					exec_op.useimm <= '1';
					mem_op.memtype <= MEM_H;
					mem_op.memwrite <= '1';
				when "101011" => --SW
					exec_op.aluop <= ALU_ADD;
					exec_op.rd <= r_rt_or_i_rd;
					exec_op.rs <= rs;
					exec_op.imm <= std_logic_vector(resize(signed(address_or_immediate),exec_op.imm'LENGTH));
					exec_op.useimm <= '1';
					mem_op.memtype <= MEM_W;
					mem_op.memwrite <= '1';
				when others =>
					exc_dec <= '1';
			end case;
		end if;

		if flush = '1' then
			exec_op <= EXEC_NOP;
			cop0_op <= COP0_NOP;
			jmp_op <= JMP_NOP;
			mem_op <= MEM_NOP;
			wb_op <= WB_NOP;
			exc_dec <= '0';
		end if;

	end process;

end rtl;
