-- ADD YOUR CODE HERE
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.alu;
use work.core_pack.all;
use work.op_pack.all;

library std; -- for Printing
use std.textio.all;
use ieee.std_logic_textio.all;

entity alu_tb_fileio is
end entity;

architecture beh of alu_tb_fileio is

	signal op   : alu_op_type;
	signal A, B : std_logic_vector(DATA_WIDTH-1 downto 0) := (others=>'0');
	signal R    : std_logic_vector(DATA_WIDTH-1 downto 0);
	signal Z    : std_logic;
	signal V    : std_logic;
	
	component alu is
		port (
			op   : in  alu_op_type;
			A, B : in  std_logic_vector(DATA_WIDTH-1 downto 0);
			R    : out std_logic_vector(DATA_WIDTH-1 downto 0);
			Z    : out std_logic;
			V    : out std_logic);
	end component;
	
	file file_VECTORS : text;
	file file_RESULTS : text;
	file file_REF : text;
	
	function ascii_char_to_slv(c : character) return std_logic_vector is
	begin
		return std_logic_vector(to_unsigned(natural(character'pos(c)), 8));
	end function;

	function slv_to_hex(slv : in std_logic_vector) return string is
		constant hex_digits : string(1 to 16) := "0123456789abcdef";
		constant num_hex_digits : integer := integer((slv'length+3)/4);
		variable ret_value : string(1 to num_hex_digits);
		variable zero_padded_slv : std_logic_vector((4*num_hex_digits)-1 downto 0) := (others=>'0');
		variable r : integer := 0;
	begin
		zero_padded_slv(slv'range) := slv;
		loop
			ret_value(num_hex_digits-r) :=  hex_digits(to_integer(unsigned( zero_padded_slv( (r+1)*4-1 downto 4*r) ))+1);
			r := r + 1;
			if num_hex_digits-r = 0 then
				exit;
			end if;
		end loop;
		return ret_value;
	end function;

	function max(a,b : integer) return integer is
	begin
		if a > b then
			return a;
		else
			return b;
		end if;
	end function;

	function hex_to_slv(hex : string; min_width : integer) return std_logic_vector is
		variable ret_value : std_logic_vector(max(hex'length*4-1,min_width-1) downto 0) := (others=>'0');
		variable temp : std_logic_vector(3 downto 0);
		variable r : integer := 0;
	begin
		ret_value := (others=>'0');
		--assert hex'length = hex'high - hex'low + 1 severity failure;
		for i in 0 to hex'length-1 loop
			case hex(hex'high-i) is
				when '0' => temp := x"0";
				when '1' => temp := x"1";	
				when '2' => temp := x"2";
				when '3' => temp := x"3";
				when '4' => temp := x"4";
				when '5' => temp := x"5";
				when '6' => temp := x"6";
				when '7' => temp := x"7";
				when '8' => temp := x"8";
				when '9' => temp := x"9";
				when 'a' | 'A' => temp := x"a";
				when 'b' | 'B' => temp := x"b";
				when 'c' | 'C' => temp := x"c";
				when 'd' | 'D' => temp := x"d";
				when 'e' | 'E' => temp := x"e";
				when 'f' | 'F' => temp := x"f";
				when others => report "Conversion Error: char: " & hex(hex'high-i) severity error;
			end case;
			ret_value((i+1)*4-1 downto i*4) := temp;
		end loop;
		return ret_value;
	end function;
	
	function slv_to_string ( a: std_logic_vector) return string is
		constant num_hex_digits : integer := integer((a'length+3)/4);
		variable b : string (1 to (4*num_hex_digits)) := (others => NUL);
		variable stri : integer := 4*num_hex_digits; 
		begin
			
			while stri>0 loop
				b(stri) := std_logic'image(a(((4*num_hex_digits)-stri)))(2);
				stri := stri-1;
			end loop;
		return b;
	end function;

begin



	alu_inst : alu
	PORT MAP (
		op	=> op,
		A	=> A,
		B	=> B,
		R 	=> R,
		Z 	=> Z,
		V 	=> V
	);

	input : process
		
		variable v_ILINE     : line;
		variable v_ILINE_REF : line;
		variable v_OLINE     : line;
		
		variable inst_count	 : integer := 0;
		
		variable v_A : std_logic_vector(DATA_WIDTH-1 downto 0);
		variable v_B : std_logic_vector(DATA_WIDTH-1 downto 0);
		
		variable v_R_Ref : std_logic_vector(DATA_WIDTH-1 downto 0);
		variable v_Z_Ref :std_logic;
		variable v_V_Ref :std_logic;
		
		variable v_SPACE     : character;
		
		variable v_mode : string(1 to 4);
		
		variable v_write_string : string (1 to 43);
		
	begin  -- process input
	
		A <= (others=>'0');
		B <= (others=>'0');
		
		--file_open(file_VECTORS, "../../../test_ALU/testdata/input.txt",  read_mode); --Relativ Path from Simulation Project file (.mdf)
		--file_open(file_RESULTS, "../../../test_ALU/testdata/output.txt",  write_mode);
		--file_open(file_REF, "../../../test_ALU/testdata/output_ref.txt",  read_mode);
		
		file_open(file_VECTORS, "testdata/input.txt",  read_mode); --Relativ Path from Simulation terminal
		file_open(file_RESULTS, "testdata/output.txt",  write_mode);
		file_open(file_REF, "testdata/output_ref.txt",  read_mode);
		
		while not endfile(file_VECTORS) loop
			
			readline(file_VECTORS, v_ILINE);
			
			if( v_ILINE(1) = '#' ) then --ignore comment lines 
				next;
			end if;
			
			inst_count := inst_count + 1;
			
			read(v_ILINE, v_mode);
			read(v_ILINE, v_SPACE);           -- read in the space character
			
			--v_A := hex_to_slv(v_ILINE(1 to 8),32); --For Hex input
			--v_B := hex_to_slv(v_ILINE(10 to 17),32); --For Hex input
			
			read(v_ILINE, v_A);					--For Bin input
			read(v_ILINE, v_SPACE);				--For Bin input
			read(v_ILINE, v_B);					--For Bin input
			
			readline(file_REF, v_ILINE_REF);
			read(v_ILINE_REF, v_R_Ref);
			read(v_ILINE_REF, v_SPACE);
			read(v_ILINE_REF, v_Z_Ref);
			read(v_ILINE_REF, v_SPACE);
			read(v_ILINE_REF, v_V_Ref);

			report "[" & v_mode & "]" severity note;

			wait for 10 us;
			
			case (v_mode) is					
				when "nop " =>
					op <= ALU_NOP;
				
				when "lui " =>
					op <= ALU_LUI;
					
				when "slt " =>
					op <= ALU_SLT;
					
				when "sltu" =>
					op <= ALU_SLTU;
					
				when "sll " =>
					op <= ALU_SLL;
					
				when "srl " =>
					op <= ALU_SRL;
					
				when "sra " =>
					op <= ALU_SRA;
					
				when "add " =>
					op <= ALU_ADD;
					
				when "sub " =>
					op <= ALU_SUB;
					
				when "and " =>
					op <= ALU_AND;
					
				when "or  " =>
					op <= ALU_OR;
					
				when "xor " =>
					op <= ALU_XOR;
					
				when "nor " =>
					op <= ALU_NOR;
					
				when others =>
					op <= ALU_NOP;
					
			end case;

			A <= v_A;
			B <= v_B;
			
			wait for 10 us; --wait for Results
			
			--v_write_string := slv_to_hex(R) & " Z:" & STD_LOGIC'IMAGE(Z) & " V" & STD_LOGIC'IMAGE(V); --For Hex output
			v_write_string := slv_to_string(R) & " Z:" & STD_LOGIC'IMAGE(Z) & " V" & STD_LOGIC'IMAGE(V);  --For Bin output
			
			if not (R=v_R_Ref and Z=v_Z_Ref and V=v_V_Ref) then
				report "Fault: Inst: " & INTEGER'IMAGE(inst_count) & " [" & v_write_string & "]" severity Error;
			else
				report "Inst: " & INTEGER'IMAGE(inst_count) & " [" & v_write_string & "]" severity note;
			end if;
			
			wait for 10 us; --wait for Convertion
						
			write(v_OLINE, v_write_string, right, v_write_string'length);
			writeline(file_RESULTS, v_OLINE);
			
			wait for 10 us; -- wait for next run
			
		end loop;
		
		file_close(file_VECTORS);
		file_close(file_RESULTS);
		
		wait;
		
	end process;

end architecture;

