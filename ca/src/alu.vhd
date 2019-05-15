library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.core_pack.all;
use work.op_pack.all;

entity alu is
	port (
		op   : in  alu_op_type;
		A, B : in  std_logic_vector(DATA_WIDTH-1 downto 0);
		R    : out std_logic_vector(DATA_WIDTH-1 downto 0);
		Z    : out std_logic;
		V    : out std_logic);

end alu;

architecture rtl of alu is
	
	signal	NOP_result	: std_logic_vector(DATA_WIDTH-1 downto 0);
	signal	LUI_result	: std_logic_vector(DATA_WIDTH-1 downto 0);
	signal	SLT_result	: std_logic_vector(DATA_WIDTH-1 downto 0);
	signal	SLTU_result	: std_logic_vector(DATA_WIDTH-1 downto 0);
	signal	SLL_result	: std_logic_vector(DATA_WIDTH-1 downto 0);
	signal	SRL_result	: std_logic_vector(DATA_WIDTH-1 downto 0);
	signal	SRA_result	: std_logic_vector(DATA_WIDTH-1 downto 0);
	signal	ADD_result	: std_logic_vector(DATA_WIDTH-1 downto 0);
	signal	SUB_result	: std_logic_vector(DATA_WIDTH-1 downto 0);
	signal	AND_result	: std_logic_vector(DATA_WIDTH-1 downto 0);
	signal	OR_result	: std_logic_vector(DATA_WIDTH-1 downto 0);
	signal	XOR_result	: std_logic_vector(DATA_WIDTH-1 downto 0);
	signal	NOR_result	: std_logic_vector(DATA_WIDTH-1 downto 0);
	
begin  -- rtl

--	NOP_result <= A;
--	LUI_result <= std_logic_vector(shift_left(unsigned(B),16));
--	SLT_result <= std_logic_vector(to_unsigned(1,DATA_WIDTH)) when signed(A) < signed(B) else std_logic_vector(to_unsigned(0,DATA_WIDTH));
--	SLTU_result <= std_logic_vector(to_unsigned(1,DATA_WIDTH)) when unsigned(A) < unsigned(B) else std_logic_vector(to_unsigned(0,DATA_WIDTH));
--	SLL_result <= std_logic_vector(shift_left(unsigned(B),to_integer(unsigned(A))));
--	SRL_result <= std_logic_vector(shift_right(unsigned(B),to_integer(unsigned(A))));
--	SRA_result <= std_logic_vector(shift_right(signed(B),to_integer(unsigned(A))));
--	ADD_result <= std_logic_vector(signed(A) + signed(B));
--	SUB_result <= std_logic_vector(signed(A) - signed(B));
--	AND_result <= A and B;
--	OR_result <= A or B;
--	XOR_result <= A xor B;
--	NOR_result <= not or_result;
--
--	with op select
--	R <= NOP_result when ALU_NOP,
--		LUI_result when ALU_LUI,
--		SLT_result when ALU_SLT,
--		SLTU_result when ALU_SLTU,
--		SLL_result when ALU_SLL,
--		SRL_result when ALU_SRL,
--		SRA_result when ALU_SRA,
--		ADD_result when ALU_ADD,
--		SUB_result when ALU_SUB,
--		AND_result when ALU_AND,
--		OR_result when ALU_OR,
--		XOR_result when ALU_XOR,
--		NOR_result when ALU_NOR;
	
	result : process (A,B,op)
	begin
	
		case op is
			when ALU_NOP =>
				R <= A;
			when ALU_LUI =>
				R <= std_logic_vector(shift_left(unsigned(B),16));
			when ALU_SLT =>
				if(signed(A) < signed(B)) then
					R <= std_logic_vector(to_unsigned(1,DATA_WIDTH));
				else
					R <= std_logic_vector(to_unsigned(0,DATA_WIDTH));
				end if;
			when ALU_SLTU =>
				if(unsigned(A) < unsigned(B)) then
					R <= std_logic_vector(to_unsigned(1,DATA_WIDTH));
				else
					R <= std_logic_vector(to_unsigned(0,DATA_WIDTH));
				end if;
			when ALU_SLL =>
				R <= std_logic_vector(shift_left(unsigned(B),to_integer(unsigned(A))));
			when ALU_SRL =>
				R <= std_logic_vector(shift_right(unsigned(B),to_integer(unsigned(A))));
			when ALU_SRA =>
				R <= std_logic_vector(shift_right(signed(B),to_integer(unsigned(A))));
			when ALU_ADD =>
				R <= std_logic_vector(signed(A) + signed(B));
			when ALU_SUB =>
				R <= std_logic_vector(signed(A) - signed(B));
			when ALU_AND =>
				R <= A and B;
			when ALU_OR =>
				R <= A or B;
			when ALU_XOR =>
				R <= A xor B;
			when ALU_NOR =>
				R <= not (A or B);
			when others =>
				R <= (others=>'0');
		end case;
	
	end process;
	
	zero : process (A,B,op)
	begin
		
		if(op = ALU_SUB) then
			if(A = B) then
				Z <= '1';
			else
				Z <= '0';
			end if;
		else
			if (unsigned(A) = 0) then
				Z <= '1';
			else
				Z <= '0';
			end if;
		end if;
		
	end process;
	
	overflow : process (A,B,op,R)
	begin
	
		case op is
			when ALU_ADD =>
				if(signed(A) >= 0) and (signed(B) >= 0) and (signed(R) < 0) then
					V <= '1';
				elsif (signed(A) < 0) and (signed(B) < 0) and (signed(R) >= 0) then
					V <= '1';
				end if;
			when ALU_SUB =>
				if(signed(A) >= 0) and (signed(B) < 0) and (signed(R) < 0) then
					V <= '1';
				elsif (signed(A) < 0) and (signed(B) >= 0) and (signed(R) >= 0) then
					V <= '1';
				end if;
			when others =>
				V <= '0';
		end case;
	
	end process;
			

end rtl;
