library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

use work.core_pack.all;
use work.op_pack.all;

entity memu is
	port (
		op   : in  mem_op_type;
		A    : in  std_logic_vector(ADDR_WIDTH-1 downto 0);
		W    : in  std_logic_vector(DATA_WIDTH-1 downto 0);
		D    : in  std_logic_vector(DATA_WIDTH-1 downto 0);
		M    : out mem_out_type;
		R    : out std_logic_vector(DATA_WIDTH-1 downto 0);
		XL   : out std_logic;
		XS   : out std_logic);
end memu;

architecture rtl of memu is

	alias W_D : std_logic_vector(7 downto 0) is W(31 downto 24);
	alias W_C : std_logic_vector(7 downto 0) is W(23 downto 16);
	alias W_B : std_logic_vector(7 downto 0) is W(15 downto 8);
	alias W_A : std_logic_vector(7 downto 0) is W(7 downto 0);

	alias D_D : std_logic_vector(7 downto 0) is D(31 downto 24);
	alias D_C : std_logic_vector(7 downto 0) is D(23 downto 16);
	alias D_B : std_logic_vector(7 downto 0) is D(15 downto 8);
	alias D_A : std_logic_vector(7 downto 0) is D(7 downto 0);


begin  -- rtl

M.address <= A;

process(all)
begin 

	XL <= '0';
	XS <= '0';
	M.rd <= op.memread;
	M.wr <= op.memwrite;
	
	case A(1 downto 0) is
		when "00" =>
			if op.memtype = MEM_B or op.memtype = MEM_BU then
				M.byteena <= "1000";
				M.wrdata <= W_A & "00000000" & "00000000" & "00000000";

				-------- Computation R --------
				if op.memtype = MEM_B then
					R <= std_logic_vector(resize(signed(D_D), R'length));
				elsif op.memtype = MEM_BU then
					R <= "00000000" & "00000000" & "00000000" & D_D;
				end if;

			elsif op.memtype = MEM_H or op.memtype = MEM_HU then
				M.byteena <= "1100";
				M.wrdata <= W_B & W_A & "00000000" & "00000000";

				-------- Domputation R --------
				if op.memtype = MEM_H then
					R <= std_logic_vector(resize(signed(D_D & D_C), R'length));
				elsif op.memtype = MEM_HU then
					R <= "00000000" & "00000000" & D_D & D_C;
				end if;

			elsif op.memtype = MEM_W then
				M.byteena <= "1111";
				M.wrdata <= W_D & W_C & W_B & W_A;

				-------- Computation R --------
				R <= D_D & D_C & D_B & D_A;
			end if;

			-------- memory load/store exception --------
			if op.memread = '1' and unsigned(A(ADDR_WIDTH -1 downto 2)) = "0" then
				XL <= '1';
				M.rd <= '0';
				M.wr <= '0';
			end if;

			if op.memwrite = '1' and unsigned(A(ADDR_WIDTH -1 downto 2)) = "0" then
				XS <= '1';
				M.rd <= '0';
				M.wr <= '0';
			end if;

		when "01" =>
			if op.memtype = MEM_B or op.memtype = MEM_BU then
				M.byteena <= "0100";
				M.wrdata <= "00000000" & W_A & "00000000" & "00000000";

				-------- Computation R --------
				if op.memtype = MEM_B then
					R <= std_logic_vector(resize(signed(D_C), R'length));
				elsif op.memtype = MEM_BU then
					R <= "00000000" & "00000000" & "00000000" & D_C;
				end if;

			elsif op.memtype = MEM_H or op.memtype = MEM_HU then
				M.byteena <= "1100";	
				M.wrdata <= W_B & W_A & "00000000" & "00000000";
		
				-------- Computation R --------
				if op.memtype = MEM_H then
					R <= std_logic_vector(resize(signed(D_D & D_C), R'length));

					-------- memory load/store exception --------
					if op.memread = '1' then
						XL <= '1';
						M.rd <= '0';
						M.wr <= '0';
					end if;
					if op.memwrite = '1' then
						XS <= '1';
						M.rd <= '0';
						M.wr <= '0';
					end if;
					
				elsif op.memtype = MEM_HU then
					R <= "00000000" & "00000000" & D_D & D_C;

					-------- memory load/store exception --------
					if op.memread = '1' then
						XL <= '1';	
						M.rd <= '0';
						M.wr <= '0';
					end if;
					if op.memwrite = '1' then
						XS <= '1';
						M.rd <= '0';
						M.wr <= '0';
					end if;

				end if;

			elsif op.memtype = MEM_W then
				M.byteena <= "1111";
				M.wrdata <= W_D & W_C & W_B & W_A;

				-------- Computation R --------
				R <= D_D & D_C & D_B & D_A;

				-------- memory load/store exception --------
				if op.memread = '1' then
					XL <= '1';
					M.rd <= '0';
					M.wr <= '0';
				end if;
				if op.memwrite = '1' then
					XS <= '1';
					M.rd <= '0';
					M.wr <= '0';
				end if;

			end if;

		when "10" =>
			if op.memtype = MEM_B or op.memtype = MEM_BU then
				M.byteena <= "0010";	
				M.wrdata <= "00000000" & "00000000" & W_A & "00000000" ;

				-------- Computation R --------
				if op.memtype = MEM_B then
					R <= std_logic_vector(resize(signed(D_B), R'length));
				elsif op.memtype = MEM_BU then
					R <= "00000000" & "00000000" & "00000000" & D_B;
				end if;

			elsif op.memtype = MEM_H or op.memtype = MEM_HU then
				M.byteena <= "0011";
				M.wrdata <=  "00000000" & "00000000" & W_B & W_A;

				-------- Computation R --------
				if op.memtype = MEM_H then
					R <= std_logic_vector(resize(signed(D_B & D_A), R'length));
				elsif op.memtype = MEM_HU then
					R <= "00000000" & "00000000" & D_B & D_A;
				end if;

				
			elsif op.memtype = MEM_W then
				M.byteena <= "1111";
				M.wrdata <= W_D & W_C & W_B & W_A;

				-------- Computation R --------
				R <= D_D & D_C & D_B & D_A;

				-------- memory load/store exception --------
				if op.memread = '1' then
					XL <= '1';
					M.rd <= '0';
					M.wr <= '0';
				end if;
				if op.memwrite = '1' then
					XS <= '1';
					M.rd <= '0';
					M.wr <= '0';
				end if;

			end if;

		when "11" =>
			if op.memtype = MEM_B or op.memtype = MEM_BU then
				M.byteena <= "0001";
				M.wrdata <= "00000000" & "00000000" & "00000000" & W_A;

				-------- Computation R --------
				if op.memtype = MEM_B then
					R <= std_logic_vector(resize(signed(D_A), R'length));
				elsif op.memtype = MEM_BU then
					R <= "00000000" & "00000000" & "00000000" & D_A;
				end if;

			elsif op.memtype = MEM_H or op.memtype = MEM_HU then
				M.byteena <= "0011";
				M.wrdata <=  "00000000" & "00000000" & W_B & W_A;

				-------- Computation R --------
				if op.memtype = MEM_H then
					R <= std_logic_vector(resize(signed(D_B & D_A), R'length));

					-------- memory load/store exception --------
					if op.memread = '1' then
						XL <= '1';
						M.rd <= '0';
						M.wr <= '0';
					end if;
					if op.memwrite = '1' then
						XS <= '1';
						M.rd <= '0';
						M.wr <= '0';
					end if;

				elsif op.memtype = MEM_HU then
					R <= "00000000" & "00000000" & D_B & D_A;

					-------- memory load/store exception --------
					if op.memread = '1' then
						XL <= '1';
						M.rd <= '0';
						M.wr <= '0';
					end if;
					if op.memwrite = '1' then
						XS <= '1';
						M.rd <= '0';
						M.wr <= '0';
					end if;

				end if;

			elsif op.memtype = MEM_W then
				M.byteena <= "1111";
				M.wrdata <= W_D & W_C & W_B & W_A;

				-------- Computation R --------
				R <= D_D & D_C & D_B & D_A;

				-------- memory load/store exception --------
				if op.memread = '1' then
					XL <= '1';
					M.rd <= '0';
					M.wr <= '0';
				end if;
				if op.memwrite = '1' then
					XS <= '1';
					M.rd <= '0';
					M.wr <= '0';
				end if;
				
			end if;

		when others =>

	end case;
	
end process;
	
end rtl;
