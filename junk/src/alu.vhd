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
		V    : out std_logic
		);

end alu;
		
architecture rtl of alu is

	signal ALU_Result: std_logic_vector(DATA_WIDTH-1 downto 0);
	signal ALU_Z : std_logic; 	--tmp Zero Flag
	signal ALU_V : std_logic;	--tmp Overflow Flag
	
begin  -- rtl
	
	mode :process(A,B,op)
	begin
	
		case(op) is
			
			when ALU_NOP =>
				ALU_Result <= A;
				
			when ALU_LUI =>
				ALU_Result <= std_logic_vector(shift_left(unsigned(B),16));
				
			when ALU_SLT =>
				if signed(A) < signed(B) then
					ALU_Result <= (0=>'1', others=>'0');
					
				else
					ALU_Result <= (others=>'0');
					
				end if;
				
			when ALU_SLTU =>
				if unsigned(A) < unsigned(B) then
					
					ALU_Result <= (0=>'1', others=>'0');
				else
					ALU_Result <= (others=>'0');
				end if;
				
			when ALU_SLL =>
				ALU_Result <= std_logic_vector(shift_left(unsigned(B), to_integer(unsigned(A(DATA_WIDTH_BITS-1 downto 0)))));
				
			when ALU_SRL =>
				ALU_Result <= std_logic_vector(shift_right(unsigned(B), to_integer(unsigned(A(DATA_WIDTH_BITS-1 downto 0)))));
				
			when ALU_SRA =>
				ALU_Result <= std_logic_vector(shift_right(signed(B), to_integer(unsigned(A(DATA_WIDTH_BITS-1 downto 0)))));
				
			when ALU_ADD =>
				ALU_Result <= std_logic_vector(signed(A)+signed(B));
				
			when ALU_SUB =>
				ALU_Result <= std_logic_vector(signed(A)-signed(B));
				
			when ALU_AND =>
				ALU_Result <= A and B;
				
			when ALU_OR =>
				ALU_Result <= A or B;
				
			when ALU_XOR =>
				ALU_Result <= A xor B;
				
			when ALU_NOR =>
				ALU_Result <= not (A or B);
				
			when others =>
				ALU_Result <= (others=>'0');
			
		end case;
		
	end process;
	
	flag :process(op,a,b,ALU_Result)
	begin
	
	--Zero Flag
		case(op) is
			
			when ALU_SUB =>
				if A = B then
					ALU_Z <= '1';
				else
					ALU_Z <= '0';
				end if;
				
			when others =>
				if unsigned(A) = to_unsigned(0, A'length) then
					ALU_Z <= '1';
				else
					ALU_Z <= '0';
				end if;
	
		end case;
		
	--Overflow Flag
		case(op) is
			
			when ALU_ADD =>
				if 	signed(A) >= to_signed(0, A'length) and 
					signed(B) >= to_signed(0, B'length) and 
					signed(ALU_Result) < to_signed(0, ALU_Result'length) then
					
					ALU_V <= '1';
					
				elsif 	signed(A) < to_signed(0, A'length) and 
						signed(B) < to_signed(0, B'length) and 
						signed(ALU_Result) >= to_signed(0, ALU_Result'length) then
					
					ALU_V <= '1';
					
				else
					ALU_V <= '0';
					
				end if;
			
			when ALU_SUB =>
				if 	signed(A) >= to_signed(0, A'length) and 
					signed(B) < to_signed(0, B'length) and 
					signed(ALU_Result) < to_signed(0, ALU_Result'length) then
					
					ALU_V <= '1';
					
				elsif 	signed(A) < to_signed(0, A'length) and 
						signed(B) >= to_signed(0, B'length) and 
						signed(ALU_Result) >= to_signed(0, ALU_Result'length) then
					
					ALU_V <= '1';
					
				else
					ALU_V <= '0';
					
				end if;
				
			when others =>
				ALU_V <= '0';
	
		end case;
		
	end process;
	
	Z <= ALU_Z;
	V <= ALU_V;
	R <= ALU_Result; -- ALU out
	
end rtl;
