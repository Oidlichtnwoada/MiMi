library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.core_pack.all;
use work.op_pack.all;

entity exec is

	port (
		clk, reset		: in  std_logic;
		stall			: in  std_logic;
		flush			: in  std_logic;
		pc_in			: in  std_logic_vector(PC_WIDTH-1 downto 0);
		op				: in  exec_op_type;
		pc_out			: out std_logic_vector(PC_WIDTH-1 downto 0);
		rd, rs, rt		: out std_logic_vector(REG_BITS-1 downto 0);
		aluresult		: out std_logic_vector(DATA_WIDTH-1 downto 0);
		wrdata			: out std_logic_vector(DATA_WIDTH-1 downto 0);
		zero, neg		: out std_logic;
		new_pc			: out std_logic_vector(PC_WIDTH-1 downto 0);
		memop_in		: in  mem_op_type;
		memop_out		: out mem_op_type;
		jmpop_in		: in  jmp_op_type;
		jmpop_out		: out jmp_op_type;
		wbop_in			: in  wb_op_type;
		wbop_out		: out wb_op_type;
		forwardA		: in  fwd_type;
		forwardB		: in  fwd_type;
		cop0_rddata		: in  std_logic_vector(DATA_WIDTH-1 downto 0);
		mem_aluresult	: in  std_logic_vector(DATA_WIDTH-1 downto 0);
		wb_result		: in  std_logic_vector(DATA_WIDTH-1 downto 0);
		exc_ovf			: out std_logic);

end exec;

architecture rtl of exec is

	signal signal_rd, signal_rs, signal_rt	: std_logic_vector(REG_BITS-1 downto 0);
	signal sig_aluresult					: std_logic_vector(DATA_WIDTH-1 downto 0);
	signal sig_wrdata					: std_logic_vector(DATA_WIDTH-1 downto 0);
	signal sig_zero, sig_neg			: std_logic;
	signal sig_new_pc					: std_logic_vector(PC_WIDTH-1 downto 0);
	signal sig_exc_ovf					: std_logic;

	signal alu_OP				: alu_op_type;
	signal alu_A, alu_B, alu_R	: std_logic_vector(DATA_WIDTH-1 downto 0);
	signal alu_Z, alu_V			: std_logic;

	signal sig_pc_in			: std_logic_vector(PC_WIDTH-1 downto 0);
	signal sig_op				: exec_op_type;
	signal sig_memop_in			: mem_op_type;
	signal sig_jmpop_in			: jmp_op_type;
	signal sig_wbop_in			: wb_op_type;
	signal sig_cop0_rddata		: std_logic_vector(DATA_WIDTH-1 downto 0);
	signal sig_mem_aluresult	: std_logic_vector(DATA_WIDTH-1 downto 0);
	signal sig_wb_result		: std_logic_vector(DATA_WIDTH-1 downto 0);

	component alu is
		port (
			op   : in  alu_op_type;
			A, B : in  std_logic_vector(DATA_WIDTH-1 downto 0);
			R    : out std_logic_vector(DATA_WIDTH-1 downto 0);
			Z    : out std_logic;
			V    : out std_logic);
	end component;



begin  -- rtl

	alu_inst:alu
	port map (
		op	=> alu_OP,
		A	=> alu_A,
		B	=> alu_B,
		R	=> alu_R,
		Z	=> alu_Z,
		V	=> alu_V
	);

	sync:process (all)
	begin
		if reset = '0' then
			sig_pc_in <= (others => '0');
			sig_op	<= EXEC_NOP;
			sig_memop_in <= MEM_NOP;
			sig_jmpop_in <= JMP_NOP;
			sig_wbop_in	<= WB_NOP;
			sig_cop0_rddata	<= (others => '0');
			sig_mem_aluresult <= (others => '0');
			sig_wb_result <= (others => '0');
		elsif rising_edge(clk) then
			if stall = '0' then
				sig_pc_in <= pc_in;
				sig_op	<= op;
				sig_memop_in <= memop_in;
				sig_jmpop_in <= jmpop_in;
				sig_wbop_in	<= wbop_in;
				sig_cop0_rddata	<= cop0_rddata;
				sig_mem_aluresult <= mem_aluresult;
				sig_wb_result <= wb_result;
			end if;
			if flush = '1' then
				sig_op <= EXEC_NOP;
			end if;
		end if;

	end process;

	ecec: process(all)
	begin

		sig_aluresult	<= alu_R;
		sig_wrdata		<= (others=>'0');
		sig_zero			<= alu_Z;
		sig_neg			<= '0';
		sig_new_pc		<= (others=>'0');
		sig_exc_ovf		<= '0';

		alu_op		<= sig_op.aluop;
		alu_A		<= (others => '0');
		alu_B		<= (others => '0');

		case sig_op.aluop is

			when ALU_NOP => --JR,JALR,Decode_exec

				if (sig_op.useimm = '0') then --JR,JALR

					sig_new_pc <= std_logic_vector(resize(unsigned(sig_op.readdata1), sig_new_pc'length));

				else --J,JALR

					sig_new_pc		<= std_logic_Vector(resize(signed(shift_left(signed(sig_op.imm),2)), sig_new_pc'length));

				end if;

				if (sig_op.link = '1') then --JALR
					sig_aluresult <= std_logic_vector(resize(unsigned(sig_pc_in) + 4, sig_aluresult'length));
				end if;

			when ALU_LUI => --LUI

				if sig_op.link = '0' then --LUI
					alu_B <= sig_op.imm;
				end if;

			when ALU_SLT => --SLT,SLTI

				if sig_op.useimm = '0' then --SLT
					alu_A <= sig_op.readdata1;
					alu_B <= sig_op.readdata2;
				else --SLTI
					alu_A <= sig_op.readdata1;
					alu_B <= sig_op.imm;
				end if;

			when ALU_SLTU => --SLTU,SLTIU

				if sig_op.useimm = '0' then --SLTU
					alu_A <= sig_op.readdata1;
					alu_B <= sig_op.readdata2;
				else --SLTIU
					alu_A <= sig_op.readdata1;
					alu_B <= sig_op.imm;
				end if;

			when ALU_SLL => --SLL,SLLV	|shmt und rs wir von decod berreits richtig auf imm übergeben

				if sig_op.useimm = '0' AND sig_op.useamt = '1' then --SLL,SLL
					alu_B <= sig_op.readdata2;
					alu_A <= sig_op.imm;
				end if;

			when ALU_SRL => --SRL,SLRV

				if sig_op.useimm = '0' AND sig_op.useamt = '1' then --SRL,SLRV
					alu_B <= sig_op.readdata2;
					alu_A <= sig_op.imm;
				end if;

			when ALU_SRA => --SRA,SLAV

				if sig_op.useimm = '0' AND sig_op.useamt = '1' then --SRL,SLRV
					alu_B <= sig_op.readdata2;
					alu_A <= sig_op.imm;
				end if;

			when ALU_AND => --AND, ANDI

				if sig_op.useimm = '0' then --AND
					alu_A <= sig_op.readdata1;
					alu_B <= sig_op.readdata2;

				else --ANDI
					alu_A <= sig_op.readdata1;
					alu_B <= sig_op.imm;

				end if;

			when ALU_OR => --OR, ORI

				if sig_op.useimm = '0' then --OR
					alu_A <= sig_op.readdata1;
					alu_B <= sig_op.readdata2;

				else --ORI
					alu_A <= sig_op.readdata1;
					alu_B <= sig_op.imm;

				end if;

			when ALU_XOR => --XOR, XORI

				if sig_op.useimm = '0' then --XOR
					alu_A <= sig_op.readdata1;
					alu_B <= sig_op.readdata2;

				else --XORI
					alu_A <= sig_op.readdata1;
					alu_B <= sig_op.imm;

				end if;

			when ALU_NOR => --NOR, NORI

				if sig_op.useimm = '0' then --NOR
					alu_A <= sig_op.readdata1;
					alu_B <= sig_op.readdata2;

				else --NORI
					alu_A <= sig_op.readdata1;
					alu_B <= sig_op.imm;

				end if;

			when ALU_ADD => --ADD,ADDU,ADDI,ADDIU,LB,LH,LW,LBU,LHU,SB,SH,SW

				if sig_op.useimm = '0' then --ADD,ADDU
					alu_A <= sig_op.readdata1;
					alu_B <= sig_op.readdata2;

				else --ADDI,ADDIU,LB,LH,LW,LBU,LHU,SB,SH,SW
					alu_A <= sig_op.readdata1;
					alu_B <= sig_op.imm;

					--SB,SH,SW,LB,LH,LW,LBU,LHU,SB,SH,SW
					--nur wenn daten geschrieben/gelesen werden (wird in der decode einheit entschieden und in der mem ausgefürt)
					sig_wrdata <= sig_op.readdata2;

				end if;


				if sig_op.ovf = '1' then --ADD,ADDI
					sig_exc_ovf <= alu_V;

					sig_neg <= alu_R(31);
				end if;



			when ALU_SUB =>
			--SUB,SUBU,SUBI,SUBIU
			--Für vergleiche bei branches (Zero und neg Flag werden in der Jump Unit überprüft)


				--//////////////////////////////////////////////////////////////
				--Subtraktionen
				--//////////////////////////////////////////////////////////////
				if sig_op.branch = '0' then
					if sig_op.useimm = '0' then --SUBB,SUBU
						alu_A <= sig_op.readdata1;
						alu_B <= sig_op.readdata2;

					else --SUBI,SUBIU
						alu_A <= sig_op.readdata1;
						alu_B <= sig_op.imm;

					end if;


					if sig_op.ovf = '1' then --ADD,ADDI
						sig_exc_ovf <= alu_V;

						sig_neg <= alu_R(31);
					end if;

				--//////////////////////////////////////////////////////////////
				--Branches
				--//////////////////////////////////////////////////////////////
				else
					alu_A <= sig_op.readdata1;
					alu_B <= sig_op.readdata2;

					sig_neg <= alu_R(31);

					sig_new_pc <= std_logic_vector(resize(signed(sig_pc_in) + shift_left(signed(sig_op.imm),2),sig_new_pc'length));

					if sig_op.link = '1' then
						sig_aluresult <=  std_logic_vector(resize(unsigned(sig_pc_in) + 4,sig_aluresult'length));
					end if;

				end if;

		end case;
	end process;

	pc_out <= sig_pc_in;
	rd <= sig_op.rd;
	rs <= sig_op.rs;
	rt <= sig_op.rt;
	aluresult <= sig_aluresult;
	wrdata <= sig_wrdata;
	zero <= sig_zero;
	neg <= sig_neg;
	new_pc <= sig_new_pc;
	memop_out <= sig_memop_in;
	jmpop_out <= sig_jmpop_in;
	wbop_out <= sig_wbop_in;
	exc_ovf	<= sig_exc_ovf;

end rtl;
