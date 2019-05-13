library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.alu;
use work.core_pack.all;
use work.op_pack.all;

entity exec is
	
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
		zero, neg        : out std_logic;
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

end exec;

architecture rtl of exec is

	component alu is
		port (
			op   : in  alu_op_type;
			A, B : in  std_logic_vector(DATA_WIDTH-1 downto 0);
			R    : out std_logic_vector(DATA_WIDTH-1 downto 0);
			Z    : out std_logic;
			V    : out std_logic
			);
	end component;
	
	signal sig_alu_op : alu_op_type;
	signal sig_A      : std_logic_vector(DATA_WIDTH-1 downto 0) := (others=>'0');
	signal sig_B      : std_logic_vector(DATA_WIDTH-1 downto 0) := (others=>'0');
	
	signal sig_exc_ovf_alu    : std_logic;
	signal sig_aluresult_alu	     	: std_logic_vector(DATA_WIDTH-1 downto 0);
	signal sig_zero_alu: std_logic;

	signal sig_rd_next, sig_rs_next, sig_rt_next      : std_logic_vector(REG_BITS-1 downto 0);
	signal sig_aluresult_next	     	: std_logic_vector(DATA_WIDTH-1 downto 0);
	signal sig_wrdata_next          	: std_logic_vector(DATA_WIDTH-1 downto 0);
	signal sig_zero_next, sig_neg_next : std_logic;
	signal sig_new_pc_next           	: std_logic_vector(PC_WIDTH-1 downto 0);
	signal sig_exc_ovf_next    : std_logic;
	
	signal sig_rd, sig_rs, sig_rt      : std_logic_vector(REG_BITS-1 downto 0);
	signal sig_aluresult	     	: std_logic_vector(DATA_WIDTH-1 downto 0);
	signal sig_wrdata         	: std_logic_vector(DATA_WIDTH-1 downto 0);
	signal sig_zero, sig_neg : std_logic;
	signal sig_new_pc          	: std_logic_vector(PC_WIDTH-1 downto 0);
	signal sig_exc_ovf    : std_logic;
	
	signal sig_memop_out : mem_op_type;
begin  -- rtl

	sync : process(all)
	begin
	
		if reset = '0' then			
			sig_rd <= (others=>'0'); 
			sig_rs <= (others=>'0'); 
			sig_rt <= (others=>'0');
			sig_aluresult <= (others=>'0');
			sig_wrdata <= (others=>'0');
			sig_zero <= '0';
			sig_neg <= '0';
			sig_new_pc <= (others=>'0');
			sig_exc_ovf <= '0';
			
			pc_out<=(others=>'0');
			sig_memop_out<=MEM_NOP;
			jmpop_out<=JMP_NOP;
			wbop_out<=WB_NOP;
				
		elsif rising_edge(clk) then
		
			if flush = '1' then								
				sig_rd <= (others=>'0'); 
				sig_rs <= (others=>'0'); 
				sig_rt <= (others=>'0');
				sig_aluresult <= (others=>'0');
				sig_wrdata <= (others=>'0');
				sig_zero <= '0';
				sig_neg <= '0';
				sig_new_pc <= (others=>'0');
				sig_exc_ovf <= '0';
				
			elsif stall = '0' then
	
				sig_rd <= sig_rd_next; 
				sig_rs <= sig_rs_next; 
				sig_rt <= sig_rt_next;
				sig_aluresult <= sig_aluresult_next;
				sig_wrdata <= sig_wrdata_next;
				sig_zero <= sig_zero_next;
				sig_neg <= sig_neg_next;
				sig_new_pc <= sig_new_pc_next;
				sig_exc_ovf <= sig_exc_ovf_next;
				
				pc_out<=pc_in;
				sig_memop_out<=memop_in;
				jmpop_out<=jmpop_in;
				wbop_out<=wbop_in;
								
			end if;
		end if;
	end process;
	
	memop_out <= 	MEM_NOP 	when stall ='1' else
					sig_memop_out;


	execute : process(all)
	begin
	
		sig_rd_next <= op.rd; 
		sig_rs_next <= op.rs;  
		sig_rt_next <= op.rt;
		
		sig_aluresult_next <= sig_aluresult_alu; 
		sig_wrdata_next <= (others=>'0'); 
		sig_zero_next <= sig_zero_alu; 
		sig_neg_next <= '0'; 
		sig_new_pc_next <= sig_new_pc; 
		sig_exc_ovf_next <= '0'; 
	
		if flush = '1' or  reset = '0' then				
			sig_alu_op <= ALU_NOP;
			sig_A <= (others=>'0');
			sig_B <= (others=>'0');
		else
		
			sig_alu_op <= op.aluop;
			sig_A <= (others=>'0');
			sig_B <= (others=>'0');
			
			case op.aluop is
				when ALU_NOP => --JR,JALR,Decode_exec
					
					if op.useimm = '0' then --JR,JALR
					
						sig_new_pc_next <= std_logic_vector(resize(unsigned(op.readdata1), sig_new_pc_next'length));
					
						if op.link = '1' then --JALR
							sig_aluresult_next <= std_logic_vector(resize((unsigned(pc_in)),sig_aluresult_next'length)); --pc_in is alredy the next pc (-> not pc+4)
						end if;
					else --J,JALR
					
						sig_aluresult_next <= std_logic_vector(resize((unsigned(pc_in)),sig_aluresult_next'length));
						sig_new_pc_next <= std_logic_vector(resize((signed(shift_left(signed(op.imm),2))), sig_new_pc_next'length));
						
					end if;
						
				
				when ALU_LUI => --LUI
				
					if op.link = '0' then --LUI
						sig_B <= op.imm;
					end if;
					
				when ALU_SLT => --SLT,SLTI
				
					if op.useimm = '0' then --SLT
						sig_A <= op.readdata1;
						sig_B <= op.readdata2;
					else --SLTI
						sig_A <= op.readdata1;
						sig_B <= op.imm;
					end if;
					
				when ALU_SLTU => --SLTU,SLTIU
				
					if op.useimm = '0' then --SLTU
						sig_A <= op.readdata1;
						sig_B <= op.readdata2;
					else --SLTIU
						sig_A <= op.readdata1;
						sig_B <= op.imm;
					end if;
					
				when ALU_SLL => --SLL,SLLV	|shmt und rs wir von decod berreits richtig auf imm übergeben
				
					if op.useimm = '0' AND op.useamt = '1' then --SLL,SLL
						sig_B <= op.readdata2;
						sig_A <= op.imm;
					end if;
					
				when ALU_SRL => --SRL,SLRV
				
					if op.useimm = '0' AND op.useamt = '1' then --SRL,SLRV
						sig_B <= op.readdata2;
						sig_A <= op.imm;
					end if;
					
				when ALU_SRA => --SRA,SLAV
					
					if op.useimm = '0' AND op.useamt = '1' then --SRL,SLRV
						sig_B <= op.readdata2;
						sig_A <= op.imm;
					end if;	
					
				when ALU_AND => --AND, ANDI
				
					if op.useimm = '0' then --AND
						sig_A <= op.readdata1;
						sig_B <= op.readdata2;
						
					else --ANDI
						sig_A <= op.readdata1;
						sig_B <= op.imm;
						
					end if;
					
				when ALU_OR => --OR, ORI
				
					if op.useimm = '0' then --OR
						sig_A <= op.readdata1;
						sig_B <= op.readdata2;
						
					else --ORI
						sig_A <= op.readdata1;
						sig_B <= op.imm;
						
					end if;
					
				when ALU_XOR => --XOR, XORI
				
					if op.useimm = '0' then --XOR
						sig_A <= op.readdata1;
						sig_B <= op.readdata2;
						
					else --XORI
						sig_A <= op.readdata1;
						sig_B <= op.imm;
						
					end if;
					
				when ALU_NOR => --NOR, NORI
				
					if op.useimm = '0' then --NOR
						sig_A <= op.readdata1;
						sig_B <= op.readdata2;
						
					else --NORI
						sig_A <= op.readdata1;
						sig_B <= op.imm;
						
					end if;
					
				when ALU_ADD => --ADD,ADDU,ADDI,ADDIU,LB,LH,LW,LBU,LHU,SB,SH,SW
				
					if op.useimm = '0' then --ADD,ADDU
						sig_A <= op.readdata1;
						sig_B <= op.readdata2;
						
					else --ADDI,ADDIU,LB,LH,LW,LBU,LHU,SB,SH,SW
						sig_A <= op.readdata1;
						sig_B <= op.imm;
						
						--SB,SH,SW,LB,LH,LW,LBU,LHU,SB,SH,SW 
						--nur wenn daten geschrieben/gelesen werden (wird in der decode einheit entschieden und in der mem ausgefürt)
						sig_wrdata_next <= op.readdata2;
						
					end if;
					
					
					if op.ovf = '1' then --ADD,ADDI
						sig_exc_ovf_next <= sig_exc_ovf_alu;
						
						sig_neg_next <= sig_aluresult_alu(31);
					end if;
					
					
				
				when ALU_SUB => 
				--SUB,SUBU,SUBI,SUBIU
				--Für vergleiche bei branches (Zero und neg Flag werden in der Jump Unit überprüft)
				
				
					--//////////////////////////////////////////////////////////////
					--Subtraktionen
					--//////////////////////////////////////////////////////////////
					if op.branch = '0' then
						if op.useimm = '0' then --SUBB,SUBU
							sig_A <= op.readdata1;
							sig_B <= op.readdata2;
							
						else --SUBI,SUBIU
							sig_A <= op.readdata1;
							sig_B <= op.imm;
							
						end if;
						
						
						if op.ovf = '1' then --ADD,ADDI
							sig_exc_ovf_next <= sig_exc_ovf_alu;
							
							sig_neg_next <= sig_aluresult_alu(31);
						end if;
						
					--//////////////////////////////////////////////////////////////
					--Branches
					--//////////////////////////////////////////////////////////////
					else
						sig_A <= op.readdata1;
						sig_B <= op.readdata2;
						
						sig_neg_next <= sig_aluresult_alu(31);
						
						sig_new_pc_next <= std_logic_vector(resize(((signed(pc_in)-4)+signed(shift_left(signed(op.imm),2))), sig_new_pc_next'length)); --we need the actual pc (pc - 4)
						
						if op.link = '1' then
							sig_aluresult_next <=  std_logic_vector(resize((unsigned(pc_in)),sig_aluresult_next'length));
						end if;
						
					end if;	
					
			end case;
			
		end if;
		
	end process;
	
	alu_inst : alu
	port map (
		op  => sig_alu_op,
		A   => sig_A,
		B   => sig_B,
		R   => sig_aluresult_alu,
		Z   => sig_zero_alu,
		V   => sig_exc_ovf_alu
	);
	
	rd <= sig_rd; 
	rs <= sig_rs;  
	rt <= sig_rt; 
	aluresult <= sig_aluresult; 
	wrdata <= sig_wrdata; 
	zero <= sig_zero; 
	neg <= sig_neg; 
	new_pc <= sig_new_pc; 
	exc_ovf <= sig_exc_ovf; 

end rtl;
