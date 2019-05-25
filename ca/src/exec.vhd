library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.core_pack.all;
use work.op_pack.all;

entity exec is
	
	port (
		clk, reset		: in  std_logic;
		stall				: in  std_logic;
		flush				: in  std_logic;
		pc_in				: in  std_logic_vector(PC_WIDTH-1 downto 0);
		op					: in  exec_op_type;
		pc_out			: out std_logic_vector(PC_WIDTH-1 downto 0);
		rd, rs, rt		: out std_logic_vector(REG_BITS-1 downto 0);
		aluresult		: out std_logic_vector(DATA_WIDTH-1 downto 0);
		wrdata			: out std_logic_vector(DATA_WIDTH-1 downto 0);
		zero, neg		: out std_logic;
		new_pc			: out std_logic_vector(PC_WIDTH-1 downto 0);		
		memop_in			: in  mem_op_type;
		memop_out		: out mem_op_type;
		jmpop_in			: in  jmp_op_type;
		jmpop_out		: out jmp_op_type;
		wbop_in			: in  wb_op_type;
		wbop_out			: out wb_op_type;
		forwardA			: in  fwd_type;
		forwardB			: in  fwd_type;
		cop0_rddata		: in  std_logic_vector(DATA_WIDTH-1 downto 0);
		mem_aluresult	: in  std_logic_vector(DATA_WIDTH-1 downto 0);
		wb_result		: in  std_logic_vector(DATA_WIDTH-1 downto 0);
		exc_ovf			: out std_logic);

end exec;

architecture rtl of exec is

	signal signal_rd, signal_rs, signal_rt	: std_logic_vector(REG_BITS-1 downto 0);
	signal signal_aluresult						: std_logic_vector(DATA_WIDTH-1 downto 0);
	signal signal_wrdata							: std_logic_vector(DATA_WIDTH-1 downto 0);
	signal signal_zero, signal_neg			: std_logic;
	signal signal_new_pc							: std_logic_vector(PC_WIDTH-1 downto 0);
	signal signal_exc_ovf						: std_logic;
	
	signal signal_rd_nxt, signal_rs_nxt, signal_rt_nxt	: std_logic_vector(REG_BITS-1 downto 0);
	signal signal_aluresult_nxt								: std_logic_vector(DATA_WIDTH-1 downto 0);
	signal signal_wrdata_nxt									: std_logic_vector(DATA_WIDTH-1 downto 0);
	signal signal_zero_nxt, signal_neg_nxt					: std_logic;
	signal signal_new_pc_nxt									: std_logic_vector(PC_WIDTH-1 downto 0);
	signal signal_exc_ovf_nxt									: std_logic;
	
	signal alu_OP					: alu_op_type;
	signal alu_A, alu_B, alu_R	: std_logic_vector(DATA_WIDTH-1 downto 0);
	signal alu_Z, alu_V			: std_logic;

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

	sync:process(clk,reset,stall,flush)
	begin
	
		if (reset = '0') then
			
			signal_rd			<= (others=>'0');
			signal_rs			<= (others=>'0');
			signal_rt			<= (others=>'0');
			signal_aluresult	<= (others=>'0');
			signal_wrdata		<= (others=>'0');
			signal_zero			<= '0';
			signal_neg			<= '0';
			signal_new_pc		<= (others=>'0');
			signal_exc_ovf		<= '0';
			
			pc_out 		<= (others=>'0');
			memop_out	<= MEM_NOP;
			jmpop_out	<= JMP_NOP;
			wbop_out		<= WB_NOP;
			
		elsif rising_edge(clk) then
		
			if (flush = '1') then
				
				signal_rd			<= (others=>'0');
				signal_rs			<= (others=>'0');
				signal_rt			<= (others=>'0');
				signal_aluresult	<= (others=>'0');
				signal_wrdata		<= (others=>'0');
				signal_zero			<= '0';
				signal_neg			<= '0';
				signal_new_pc		<= (others=>'0');
				signal_exc_ovf		<= '0';
			
				pc_out 		<= (others=>'0');
				memop_out	<= MEM_NOP;
				jmpop_out	<= JMP_NOP;
				wbop_out		<= WB_NOP;
				
			elsif (stall = '0') then
			
				signal_rd			<= signal_rd_nxt;
				signal_rs			<= signal_rs_nxt;
				signal_rt			<= signal_rt_nxt;
				signal_aluresult	<= signal_aluresult_nxt;
				signal_wrdata		<= signal_wrdata_nxt;
				signal_zero			<= signal_zero_nxt;
				signal_neg			<= signal_neg_nxt;
				signal_new_pc		<= signal_new_pc_nxt;
				signal_exc_ovf		<= signal_exc_ovf_nxt;
			
				pc_out 		<= pc_in;
				memop_out	<= memop_in;
				jmpop_out	<= jmpop_in;
				wbop_out		<= wbop_in;
			
			end if;
				
		end if;
	end process;
	
	ecec:process(all)
	begin
		report "exec";
		signal_rd_nxt <= op.rd;
		signal_rs_nxt <= op.rs;
		signal_rt_nxt <= op.rt;
		
		signal_aluresult_nxt	<= alu_R;
		signal_wrdata_nxt		<= (others=>'0');
		signal_zero_nxt		<= alu_Z;
		signal_neg_nxt			<= '0';
		signal_new_pc_nxt		<= signal_new_pc;
		signal_exc_ovf_nxt	<= '0';
		
		if (flush = '1') or (reset = '0') then
			
			alu_op	<= ALU_NOP;
			alu_A		<= (others=>'0');
			alu_B		<= (others=>'0');
			
		else
			
			alu_op	<= op.aluop;
			alu_A		<= (others=>'0');
			alu_B		<= (others=>'0');
			
			case op.aluop is
			
				when ALU_NOP => --JR,JALR,Decode_exec
				
					if (op.useimm = '0') then --JR,JALR
					
						signal_new_pc_nxt <= std_logic_vector(resize(unsigned(op.readdata1), signal_new_pc_nxt'length));
						
						if (op.link = '1') then --JALR
							signal_aluresult_nxt <= std_logic_vector(resize(unsigned(pc_in), signal_aluresult_nxt'length));
						end if;
						
					else --J,JALR
					
						signal_aluresult_nxt	<= std_logic_vector(resize(unsigned(pc_in),signal_aluresult_nxt'length));
						signal_new_pc_nxt		<= std_logic_Vector(resize(signed(shift_left(signed(op.imm),2)), signal_new_pc_nxt'length));
					
					end if;
		
				when ALU_LUI => --LUI
				
					if op.link = '0' then --LUI
						alu_B <= op.imm;
					end if;
					
				when ALU_SLT => --SLT,SLTI
				
					if op.useimm = '0' then --SLT
						alu_A <= op.readdata1;
						alu_B <= op.readdata2;
					else --SLTI
						alu_A <= op.readdata1;
						alu_B <= op.imm;
					end if;
					
				when ALU_SLTU => --SLTU,SLTIU
				
					if op.useimm = '0' then --SLTU
						alu_A <= op.readdata1;
						alu_B <= op.readdata2;
					else --SLTIU
						alu_A <= op.readdata1;
						alu_B <= op.imm;
					end if;
					
				when ALU_SLL => --SLL,SLLV	|shmt und rs wir von decod berreits richtig auf imm übergeben
				
					if op.useimm = '0' AND op.useamt = '1' then --SLL,SLL
						alu_B <= op.readdata2;
						alu_A <= op.imm;
					end if;
					
				when ALU_SRL => --SRL,SLRV
				
					if op.useimm = '0' AND op.useamt = '1' then --SRL,SLRV
						alu_B <= op.readdata2;
						alu_A <= op.imm;
					end if;
					
				when ALU_SRA => --SRA,SLAV
					
					if op.useimm = '0' AND op.useamt = '1' then --SRL,SLRV
						alu_B <= op.readdata2;
						alu_A <= op.imm;
					end if;	
					
				when ALU_AND => --AND, ANDI
				
					if op.useimm = '0' then --AND
						alu_A <= op.readdata1;
						alu_B <= op.readdata2;
						
					else --ANDI
						alu_A <= op.readdata1;
						alu_B <= op.imm;
						
					end if;
					
				when ALU_OR => --OR, ORI
				
					if op.useimm = '0' then --OR
						alu_A <= op.readdata1;
						alu_B <= op.readdata2;
						
					else --ORI
						alu_A <= op.readdata1;
						alu_B <= op.imm;
						
					end if;
					
				when ALU_XOR => --XOR, XORI
				
					if op.useimm = '0' then --XOR
						alu_A <= op.readdata1;
						alu_B <= op.readdata2;
						
					else --XORI
						alu_A <= op.readdata1;
						alu_B <= op.imm;
						
					end if;
					
				when ALU_NOR => --NOR, NORI
				
					if op.useimm = '0' then --NOR
						alu_A <= op.readdata1;
						alu_B <= op.readdata2;
						
					else --NORI
						alu_A <= op.readdata1;
						alu_B <= op.imm;
						
					end if;
					
				when ALU_ADD => --ADD,ADDU,ADDI,ADDIU,LB,LH,LW,LBU,LHU,SB,SH,SW
				
					if op.useimm = '0' then --ADD,ADDU
						alu_A <= op.readdata1;
						alu_B <= op.readdata2;
						
					else --ADDI,ADDIU,LB,LH,LW,LBU,LHU,SB,SH,SW
						alu_A <= op.readdata1;
						alu_B <= op.imm;
						
						--SB,SH,SW,LB,LH,LW,LBU,LHU,SB,SH,SW 
						--nur wenn daten geschrieben/gelesen werden (wird in der decode einheit entschieden und in der mem ausgefürt)
						signal_wrdata_nxt <= op.readdata2;
						
					end if;
					
					
					if op.ovf = '1' then --ADD,ADDI
						signal_exc_ovf_nxt <= alu_V;
						
						signal_neg_nxt <= alu_R(31);
					end if;
					
					
				
				when ALU_SUB => 
				--SUB,SUBU,SUBI,SUBIU
				--Für vergleiche bei branches (Zero und neg Flag werden in der Jump Unit überprüft)
				
				
					--//////////////////////////////////////////////////////////////
					--Subtraktionen
					--//////////////////////////////////////////////////////////////
					if op.branch = '0' then
						if op.useimm = '0' then --SUBB,SUBU
							alu_A <= op.readdata1;
							alu_B <= op.readdata2;
							
						else --SUBI,SUBIU
							alu_A <= op.readdata1;
							alu_B <= op.imm;
							
						end if;
						
						
						if op.ovf = '1' then --ADD,ADDI
							signal_exc_ovf_nxt <= alu_V;
							
							signal_neg_nxt <= alu_R(31);
						end if;
						
					--//////////////////////////////////////////////////////////////
					--Branches
					--//////////////////////////////////////////////////////////////
					else
						alu_A <= op.readdata1;
						alu_B <= op.readdata2;
						
						signal_neg_nxt <= alu_R(31);
						
						signal_new_pc_nxt <= std_logic_vector(resize(((signed(pc_in)-4)+signed(shift_left(signed(op.imm),2))), signal_new_pc_nxt'length)); --we need the actual pc (pc - 4)
						
						if op.link = '1' then
							signal_aluresult_nxt <=  std_logic_vector(resize((unsigned(pc_in)),signal_aluresult_nxt'length));
						end if;
						
					end if;	
					
			end case;
		
		end if;
		
	end process;
	
	rd				<= signal_rd;
	rs				<= signal_rs;
	rt				<= signal_rt;
	aluresult	<= signal_aluresult;
	wrdata		<= signal_wrdata;
	zero			<= signal_zero;
	neg			<= signal_neg;
	new_pc		<= signal_new_pc;
	exc_ovf		<= signal_exc_ovf;
	
end rtl;
