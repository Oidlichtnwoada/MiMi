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

	alias opcode : std_logic_vector(5 downto 0) is instr(31 downto 26);
	alias rs : std_logic_vector(4 downto 0) is instr(25 downto 21);
	alias r_rt_or_i_rd : std_logic_vector(4 downto 0) is instr(20 downto 16);
	alias shamt : std_logic_vector(4 downto 0) is instr(10 downto 6);
	alias func : std_logic_vector(5 downto 0) is instr(5 downto 0);
	alias address_or_immediate : std_logic_vector(15 downto 0) is instr(15 downto 0);
	alias target_address : std_logic_vector(25 downto 0) is instr(25 downto 0);
	alias r_rd : std_logic_vector(4 downto 0) is instr(15 downto 11);

	signal rdaddr1, rdaddr2 : std_logic_vector(REG_BITS-1 downto 0);
	signal rddata1, rddata2	: std_logic_vector(DATA_WIDTH-1 downto 0);

	signal exec_op_nxt : exec_op_type;
	signal cop0_op_nxt : cop0_op_type;
	signal jmp_op_nxt : jmp_op_type;
	signal mem_op_nxt : mem_op_type;
	signal wb_op_nxt : wb_op_type;
	signal exc_dec_nxt : std_logic;
begin

	regfile_inst : regfile
	port map (clk => clk, reset => reset, stall => stall, rdaddr1 => rdaddr1, rdaddr2 => rdaddr2, rddata1 => rddata1, rddata2 => rddata2, wraddr => wraddr, wrdata => wrdata, regwrite => regwrite);

	sync: process (all)
	begin
	if reset = '0' then
		pc_out <= (others => '0');
		exec_op <= EXEC_NOP;
		cop0_op <= COP0_NOP;
		jmp_op <= JMP_NOP;
		mem_op <= MEM_NOP;
		wb_op <= WB_NOP;
		exc_dec <= '0';
	elsif rising_edge(clk) then
		if flush = '1' then
			pc_out <= (others => '0');
			exec_op <= EXEC_NOP;
			cop0_op <= COP0_NOP;
			jmp_op <= JMP_NOP;
			mem_op <= MEM_NOP;
			wb_op <= WB_NOP;
			exc_dec <= '0';
		elsif stall = '0' then
			pc_out <= pc_in;
			exec_op <= exec_op_nxt;
			cop0_op <= cop0_op_nxt;
			jmp_op <= jmp_op_nxt;
			mem_op <= mem_op_nxt;
			wb_op <= wb_op_nxt;
			exc_dec <= exc_dec_nxt;
		end if;
	end if;	
	end process;
	
	decode : process (all)
	begin
		report "decode";
		--read from regfile
		rdaddr1 <= rs;
		rdaddr2 <= r_rt_or_i_rd;

		--assigning the values from the register
		exec_op_nxt.readdata1 <= rddata1;
		exec_op_nxt.readdata2 <= rddata2;

		--setting default values 
		exec_op_nxt <= EXEC_NOP;
		cop0_op_nxt <= COP0_NOP;
		jmp_op_nxt <= JMP_NOP;
		mem_op_nxt <= MEM_NOP;
		wb_op_nxt <= WB_NOP;
		exc_dec_nxt <= '0';

		if unsigned(instr) > 0 then
			case opcode is 
				when "000000" =>
					case func is
						when "000000" => --SLL
							exec_op_nxt.aluop <= ALU_SLL;
							exec_op_nxt.rd <= r_rd;
							exec_op_nxt.rt <= r_rt_or_i_rd;
							exec_op_nxt.imm <= std_logic_vector(resize(unsigned(shamt),exec_op_nxt.imm'LENGTH));
							exec_op_nxt.useamt <= '1';
							wb_op_nxt.regwrite <= '1';
						when "000010" => --SRL
							exec_op_nxt.aluop <= ALU_SRL;
							exec_op_nxt.rd <= r_rd;
							exec_op_nxt.rt <= r_rt_or_i_rd;
							exec_op_nxt.imm <= std_logic_vector(resize(unsigned(shamt),exec_op_nxt.imm'LENGTH));
							exec_op_nxt.useamt <= '1';
							wb_op_nxt.regwrite <= '1';
						when "000011" => --SRA
							exec_op_nxt.aluop <= ALU_SRA;
							exec_op_nxt.rd <= r_rd;
							exec_op_nxt.rt <= r_rt_or_i_rd;
							exec_op_nxt.imm <= std_logic_vector(resize(unsigned(shamt),exec_op_nxt.imm'LENGTH));
							exec_op_nxt.useamt <= '1';
							wb_op_nxt.regwrite <= '1';
						when "000100" => --SLLV
							exec_op_nxt.aluop <= ALU_SLL;
							exec_op_nxt.rd <= r_rd;
							exec_op_nxt.rt <= r_rt_or_i_rd;
							exec_op_nxt.imm <= std_logic_vector(resize(unsigned(rddata1(4 downto 0)),exec_op_nxt.imm'LENGTH));
							exec_op_nxt.useamt <= '1';
							wb_op_nxt.regwrite <= '1';
						when "000110" => --SRLV
							exec_op_nxt.aluop <= ALU_SRL;
							exec_op_nxt.rd <= r_rd;
							exec_op_nxt.rt <= r_rt_or_i_rd;
							exec_op_nxt.imm <= std_logic_vector(resize(unsigned(rddata1(4 downto 0)),exec_op_nxt.imm'LENGTH));
							exec_op_nxt.useamt <= '1';
							wb_op_nxt.regwrite <= '1';
						when "000111" => --SRAV
							exec_op_nxt.aluop <= ALU_SRA;
							exec_op_nxt.rd <= r_rd;
							exec_op_nxt.rt <= r_rt_or_i_rd;
							exec_op_nxt.imm <= std_logic_vector(resize(unsigned(rddata1(4 downto 0)),exec_op_nxt.imm'LENGTH));
							exec_op_nxt.useamt <= '1';
							wb_op_nxt.regwrite <= '1';
						when "001000" => --JR
							jmp_op_nxt <= JMP_JMP;
						when "001001" => --JALR
							jmp_op_nxt <= JMP_JMP;
							exec_op_nxt.link <= '1';
							wb_op_nxt.regwrite <= '1';
						when "100000" => --ADD
							exec_op_nxt.aluop <= ALU_ADD;
							exec_op_nxt.rd <= r_rd;
							exec_op_nxt.rt <= r_rt_or_i_rd;
							exec_op_nxt.rs <= rs;
							exec_op_nxt.ovf <= '1';
							wb_op_nxt.regwrite <= '1';
						when "100001" => --ADDU
							exec_op_nxt.aluop <= ALU_ADD;
							exec_op_nxt.rd <= r_rd;
							exec_op_nxt.rt <= r_rt_or_i_rd;
							exec_op_nxt.rs <= rs;
							wb_op_nxt.regwrite <= '1';
						when "100010" => --SUB
							exec_op_nxt.aluop <= ALU_SUB;
							exec_op_nxt.rd <= r_rd;
							exec_op_nxt.rt <= r_rt_or_i_rd;
							exec_op_nxt.rs <= rs;
							exec_op_nxt.ovf <= '1';
							wb_op_nxt.regwrite <= '1';
						when "100011" => --SUBU
							exec_op_nxt.aluop <= ALU_SUB;
							exec_op_nxt.rd <= r_rd;
							exec_op_nxt.rt <= r_rt_or_i_rd;
							exec_op_nxt.rs <= rs;
							wb_op_nxt.regwrite <= '1';
						when "100100" => --AND
							exec_op_nxt.aluop <= ALU_AND;
							exec_op_nxt.rd <= r_rd;
							exec_op_nxt.rt <= r_rt_or_i_rd;
							exec_op_nxt.rs <= rs;
							wb_op_nxt.regwrite <= '1';
						when "100101" => --OR
							exec_op_nxt.aluop <= ALU_OR;
							exec_op_nxt.rd <= r_rd;
							exec_op_nxt.rt <= r_rt_or_i_rd;
							exec_op_nxt.rs <= rs;
							wb_op_nxt.regwrite <= '1';
						when "100110" => --XOR
							exec_op_nxt.aluop <= ALU_XOR;
							exec_op_nxt.rd <= r_rd;
							exec_op_nxt.rt <= r_rt_or_i_rd;
							exec_op_nxt.rs <= rs;
							wb_op_nxt.regwrite <= '1';
						when "100111" => --NOR
							exec_op_nxt.aluop <= ALU_NOR;
							exec_op_nxt.rd <= r_rd;
							exec_op_nxt.rt <= r_rt_or_i_rd;
							exec_op_nxt.rs <= rs;
							wb_op_nxt.regwrite <= '1';
						when "101010" => --SLT
							exec_op_nxt.aluop <= ALU_SLT;
							exec_op_nxt.rd <= r_rd;
							exec_op_nxt.rt <= r_rt_or_i_rd;
							exec_op_nxt.rs <= rs;
							wb_op_nxt.regwrite <= '1';
						when "101011" => --SLTU
							exec_op_nxt.aluop <= ALU_SLTU;
							exec_op_nxt.rd <= r_rd;
							exec_op_nxt.rt <= r_rt_or_i_rd;
							exec_op_nxt.rs <= rs;
							wb_op_nxt.regwrite <= '1';
						when others =>
							exc_dec_nxt <= '1';
					end case;
				when "000001" =>
					case r_rt_or_i_rd is 
						when "00000" => --BLTZ
							jmp_op_nxt <= JMP_BLTZ;
							exec_op_nxt.aluop <= ALU_SUB;
							exec_op_nxt.branch <= '1';
							exec_op_nxt.rs <= rs;
							exec_op_nxt.readdata2 <= (others => '0');
							exec_op_nxt.imm <= std_logic_vector(resize(signed(address_or_immediate),exec_op_nxt.imm'LENGTH));
							exec_op_nxt.useimm <= '1';
						when "00001" => --BGEZ
							jmp_op_nxt <= JMP_BGEZ;
							exec_op_nxt.aluop <= ALU_SUB;
							exec_op_nxt.branch <= '1';
							exec_op_nxt.rs <= rs;
							exec_op_nxt.readdata2 <= (others => '0');
							exec_op_nxt.imm <= std_logic_vector(resize(signed(address_or_immediate),exec_op_nxt.imm'LENGTH));
							exec_op_nxt.useimm <= '1';
						when "10000" => --BLTZAL
							jmp_op_nxt <= JMP_BLTZ;
							exec_op_nxt.aluop <= ALU_SUB;
							exec_op_nxt.branch <= '1';
							exec_op_nxt.rs <= rs;
							exec_op_nxt.readdata2 <= (others => '0');
							exec_op_nxt.imm <= std_logic_vector(resize(signed(address_or_immediate),exec_op_nxt.imm'LENGTH));
							exec_op_nxt.useimm <= '1';
							exec_op_nxt.link <= '1';
							exec_op_nxt.rd <= (others => '1');
							wb_op_nxt.regwrite <= '1';
						when "10001" => --BGEZAL
							jmp_op_nxt <= JMP_BGEZ;
							exec_op_nxt.aluop <= ALU_SUB;
							exec_op_nxt.branch <= '1';
							exec_op_nxt.rs <= rs;
							exec_op_nxt.readdata2 <= (others => '0');
							exec_op_nxt.imm <= std_logic_vector(resize(signed(address_or_immediate),exec_op_nxt.imm'LENGTH));
							exec_op_nxt.useimm <= '1';
							exec_op_nxt.link <= '1';
							exec_op_nxt.rd <= (others => '1');
							wb_op_nxt.regwrite <= '1';
						when others =>
							exc_dec_nxt <= '1';
					end case;
				when "000010" => --J
					jmp_op_nxt <= JMP_JMP;
					exec_op_nxt.imm <= std_logic_vector(resize(unsigned(target_address),exec_op_nxt.imm'LENGTH));
					exec_op_nxt.useimm <= '1';
				when "000011" => --JAL
					jmp_op_nxt <= JMP_JMP;
					exec_op_nxt.imm <= std_logic_vector(resize(unsigned(target_address),exec_op_nxt.imm'LENGTH));
					exec_op_nxt.useimm <= '1';
					exec_op_nxt.link <= '1';
					exec_op_nxt.rd <= (others => '1');
					wb_op_nxt.regwrite <= '1';
				when "000100" => --BEQ
					jmp_op_nxt <= JMP_BEQ;
					exec_op_nxt.aluop <= ALU_SUB;
					exec_op_nxt.rd <= r_rt_or_i_rd;
					exec_op_nxt.rs <= rs;
					exec_op_nxt.branch <= '1';
					exec_op_nxt.imm <= std_logic_vector(resize(signed(address_or_immediate),exec_op_nxt.imm'LENGTH));
					exec_op_nxt.useimm <= '1';
				when "000101" => --BNE
					jmp_op_nxt <= JMP_BNE;
					exec_op_nxt.aluop <= ALU_SUB;
					exec_op_nxt.rd <= r_rt_or_i_rd;
					exec_op_nxt.rs <= rs;
					exec_op_nxt.branch <= '1';
					exec_op_nxt.imm <= std_logic_vector(resize(signed(address_or_immediate),exec_op_nxt.imm'LENGTH));
					exec_op_nxt.useimm <= '1';
				when "000110" => --BLEZ
					jmp_op_nxt <= JMP_BLEZ;
					exec_op_nxt.aluop <= ALU_SUB;
					exec_op_nxt.rd <= r_rt_or_i_rd;
					exec_op_nxt.rs <= rs;
					exec_op_nxt.readdata2 <= (others => '0');
					exec_op_nxt.branch <= '1';
					exec_op_nxt.imm <= std_logic_vector(resize(signed(address_or_immediate),exec_op_nxt.imm'LENGTH));
					exec_op_nxt.useimm <= '1';
				when "000111" => --BGTZ
					jmp_op_nxt <= JMP_BGTZ;
					exec_op_nxt.aluop <= ALU_SUB;
					exec_op_nxt.rd <= r_rt_or_i_rd;
					exec_op_nxt.rs <= rs;
					exec_op_nxt.readdata2 <= (others => '0');
					exec_op_nxt.branch <= '1';
					exec_op_nxt.imm <= std_logic_vector(resize(signed(address_or_immediate),exec_op_nxt.imm'LENGTH));
					exec_op_nxt.useimm <= '1';
				when "001000" => --ADDI
					exec_op_nxt.aluop <= ALU_ADD;
					exec_op_nxt.rd <= r_rt_or_i_rd;
					exec_op_nxt.rs <= rs;
					exec_op_nxt.imm <= std_logic_vector(resize(signed(address_or_immediate),exec_op_nxt.imm'LENGTH));
					exec_op_nxt.useimm <= '1';
					exec_op_nxt.ovf <= '1';
					wb_op_nxt.regwrite <= '1';
				when "001001" => --ADDIU
					exec_op_nxt.aluop <= ALU_ADD;
					exec_op_nxt.rd <= r_rt_or_i_rd;
					exec_op_nxt.rs <= rs;
					exec_op_nxt.imm <= std_logic_vector(resize(signed(address_or_immediate),exec_op_nxt.imm'LENGTH));
					exec_op_nxt.useimm <= '1';
					wb_op_nxt.regwrite <= '1';
				when "001010" => --SLTI
					exec_op_nxt.aluop <= ALU_SLT;
					exec_op_nxt.rd <= r_rt_or_i_rd;
					exec_op_nxt.rs <= rs;
					exec_op_nxt.imm <= std_logic_vector(resize(signed(address_or_immediate),exec_op_nxt.imm'LENGTH));
					exec_op_nxt.useimm <= '1';
					wb_op_nxt.regwrite <= '1';
				when "001011" => --SLTIU
					exec_op_nxt.aluop <= ALU_SLTU;
					exec_op_nxt.rd <= r_rt_or_i_rd;
					exec_op_nxt.rs <= rs;
					exec_op_nxt.imm <= std_logic_vector(resize(unsigned(address_or_immediate),exec_op_nxt.imm'LENGTH));
					exec_op_nxt.useimm <= '1';
					wb_op_nxt.regwrite <= '1';
				when "001100" => --ANDI
					exec_op_nxt.aluop <= ALU_AND;
					exec_op_nxt.rd <= r_rt_or_i_rd;
					exec_op_nxt.rs <= rs;
					exec_op_nxt.imm <= std_logic_vector(resize(unsigned(address_or_immediate),exec_op_nxt.imm'LENGTH));
					exec_op_nxt.useimm <= '1';
					wb_op_nxt.regwrite <= '1';
				when "001101" => --ORI
					exec_op_nxt.aluop <= ALU_OR;
					exec_op_nxt.rd <= r_rt_or_i_rd;
					exec_op_nxt.rs <= rs;
					exec_op_nxt.imm <= std_logic_vector(resize(unsigned(address_or_immediate),exec_op_nxt.imm'LENGTH));
					exec_op_nxt.useimm <= '1';
					wb_op_nxt.regwrite <= '1';
				when "001110" => --XORI
					exec_op_nxt.aluop <= ALU_XOR;
					exec_op_nxt.rd <= r_rt_or_i_rd;
					exec_op_nxt.rs <= rs;
					exec_op_nxt.imm <= std_logic_vector(resize(unsigned(address_or_immediate),exec_op_nxt.imm'LENGTH));
					exec_op_nxt.useimm <= '1';
					wb_op_nxt.regwrite <= '1';
				when "001111" => --LUI
					exec_op_nxt.aluop <= ALU_AND;
					exec_op_nxt.rd <= r_rt_or_i_rd;
					exec_op_nxt.imm <= std_logic_vector(resize(unsigned(address_or_immediate),exec_op_nxt.imm'LENGTH));
					exec_op_nxt.useimm <= '1';
					wb_op_nxt.regwrite <= '1';
				when "010000" =>
					case rs is 
						when "00000" => --MFC0
							null;
						when "00100" => --MTC0
							null;
						when others =>
							exc_dec_nxt <= '1';
					end case;
				when "100000" => --LB
					exec_op_nxt.aluop <= ALU_ADD;
					exec_op_nxt.rd <= r_rt_or_i_rd;
					exec_op_nxt.rs <= rs;
					exec_op_nxt.imm <= std_logic_vector(resize(signed(address_or_immediate),exec_op_nxt.imm'LENGTH));
					exec_op_nxt.useimm <= '1';
					mem_op_nxt.memtype <= MEM_B;
					mem_op_nxt.memread <= '1';
					wb_op_nxt.memtoreg <= '1';
					wb_op_nxt.regwrite <= '1';
				when "100001" => --LH
					exec_op_nxt.aluop <= ALU_ADD;
					exec_op_nxt.rd <= r_rt_or_i_rd;
					exec_op_nxt.rs <= rs;
					exec_op_nxt.imm <= std_logic_vector(resize(signed(address_or_immediate),exec_op_nxt.imm'LENGTH));
					exec_op_nxt.useimm <= '1';
					mem_op_nxt.memtype <= MEM_H;
					mem_op_nxt.memread <= '1';
					wb_op_nxt.memtoreg <= '1';
					wb_op_nxt.regwrite <= '1';
				when "100011" => --LW
					exec_op_nxt.aluop <= ALU_ADD;
					exec_op_nxt.rd <= r_rt_or_i_rd;
					exec_op_nxt.rs <= rs;
					exec_op_nxt.imm <= std_logic_vector(resize(signed(address_or_immediate),exec_op_nxt.imm'LENGTH));
					exec_op_nxt.useimm <= '1';
					mem_op_nxt.memtype <= MEM_W;
					mem_op_nxt.memread <= '1';
					wb_op_nxt.memtoreg <= '1';
					wb_op_nxt.regwrite <= '1';
				when "100100" => --LBU
					exec_op_nxt.aluop <= ALU_ADD;
					exec_op_nxt.rd <= r_rt_or_i_rd;
					exec_op_nxt.rs <= rs;
					exec_op_nxt.imm <= std_logic_vector(resize(signed(address_or_immediate),exec_op_nxt.imm'LENGTH));
					exec_op_nxt.useimm <= '1';
					mem_op_nxt.memtype <= MEM_BU;
					mem_op_nxt.memread <= '1';
					wb_op_nxt.memtoreg <= '1';
					wb_op_nxt.regwrite <= '1';
				when "100101" => --LHU
					exec_op_nxt.aluop <= ALU_ADD;
					exec_op_nxt.rd <= r_rt_or_i_rd;
					exec_op_nxt.rs <= rs;
					exec_op_nxt.imm <= std_logic_vector(resize(signed(address_or_immediate),exec_op_nxt.imm'LENGTH));
					exec_op_nxt.useimm <= '1';
					mem_op_nxt.memtype <= MEM_HU;
					mem_op_nxt.memread <= '1';
					wb_op_nxt.memtoreg <= '1';
					wb_op_nxt.regwrite <= '1';
				when "101000" => --SB
					exec_op_nxt.aluop <= ALU_ADD;
					exec_op_nxt.rd <= r_rt_or_i_rd;
					exec_op_nxt.rs <= rs;
					exec_op_nxt.imm <= std_logic_vector(resize(signed(address_or_immediate),exec_op_nxt.imm'LENGTH));
					exec_op_nxt.useimm <= '1';
					mem_op_nxt.memtype <= MEM_B;
					mem_op_nxt.memwrite <= '1';
				when "101001" => --SH
					exec_op_nxt.aluop <= ALU_ADD;
					exec_op_nxt.rd <= r_rt_or_i_rd;
					exec_op_nxt.rs <= rs;
					exec_op_nxt.imm <= std_logic_vector(resize(signed(address_or_immediate),exec_op_nxt.imm'LENGTH));
					exec_op_nxt.useimm <= '1';
					mem_op_nxt.memtype <= MEM_H;
					mem_op_nxt.memwrite <= '1';
				when "101011" => --SW
					exec_op_nxt.aluop <= ALU_ADD;
					exec_op_nxt.rd <= r_rt_or_i_rd;
					exec_op_nxt.rs <= rs;
					exec_op_nxt.imm <= std_logic_vector(resize(signed(address_or_immediate),exec_op_nxt.imm'LENGTH));
					exec_op_nxt.useimm <= '1';
					mem_op_nxt.memtype <= MEM_W;
					mem_op_nxt.memwrite <= '1';
				when others =>
					exc_dec_nxt <= '1';
			end case;
		end if;
	end process;

end rtl;
