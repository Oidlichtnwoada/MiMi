library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.core_pack.all;
use work.op_pack.all;

--MEM_W bei 2.10&2.11 auslagern???
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

-- aliases for W(DCBA)
alias WA : std_logic_vector(7 downto 0) is W(7 downto 0);
alias WB : std_logic_vector(7 downto 0) is W(15 downto 8);
alias WC : std_logic_vector(7 downto 0) is W(23 downto 16);
alias WD : std_logic_vector(7 downto 0) is W(31 downto 24);

-- aliases for D(DCBA)
alias DA : std_logic_vector(7 downto 0) is D(7 downto 0);
alias DB : std_logic_vector(7 downto 0) is D(15 downto 8);
alias DC : std_logic_vector(7 downto 0) is D(23 downto 16);
alias DD : std_logic_vector(7 downto 0) is D(31 downto 24);

constant EMPTY : std_logic_vector(7 downto 0) := (others => '0');
constant ADDRZERO : std_logic_vector(ADDR_WIDTH-1 downto 2) := (others => '0');

begin  -- rtl

process(all)
begin

--default assignments
M.address <= A;
M.rd <= '0';
M.wr <= '0';
M.byteena <= (others => '0');
M.wrdata <= (others => '0');
R <= (others => '0');
XL <= '0';
XS <= '0';

--setting the operation to the memory module
if op.memread = '1' then
	M.rd <= '1';
else
	M.rd <= '0';
end if;
if op.memwrite = '1' then
	M.wr <= '1';
else
	M.wr <= '0';
end if;

case A(1 downto 0) is

	when "00" =>
		
		--computation of M.byteena and M.wrdata
		if op.memtype=MEM_B or op.memtype=MEM_BU then
			M.byteena <= "1000";
			M.wrdata <= WA & EMPTY & EMPTY & EMPTY;
		elsif op.memtype=MEM_H or op.memtype=MEM_HU then
			M.byteena <= "1100";
			M.wrdata <= WB & WA & EMPTY & EMPTY;
		elsif op.memtype=MEM_W then
			M.byteena <= "1111";
			M.wrdata <= WD & WC & WB & WA;
		end if;
		
		--computation of R
		if op.memtype=MEM_B then
			R <= std_logic_vector(resize(signed(DD),R'length));
		elsif op.memtype=MEM_BU then
			R <= EMPTY & EMPTY & EMPTY & DD;
		elsif op.memtype=MEM_H then
			R <= std_logic_vector(resize(signed(DD & DC),R'length));
		elsif op.memtype=MEM_HU then
			R <= EMPTY & EMPTY & DD & DC;
		elsif op.memtype=MEM_W then
			R <= DD & DC & DB & DA;
		end if;
		
		--computation of load exception
		if op.memread='1' and A(ADDR_WIDTH-1 downto 2)=ADDRZERO then
			XL <= '1';
			M.rd <= '0';
			M.wr <= '0';
		end if;
		--computation of store exception
		if op.memwrite='1' and A(ADDR_WIDTH-1 downto 2)=ADDRZERO then
			XS <= '1';
			M.rd <= '0';
			M.wr <= '0';
		end if;
		
	when "01" =>
		--computation of M.byteena and M.wrdata
		if op.memtype=MEM_B or op.memtype=MEM_BU then
			M.byteena <= "0100";
			M.wrdata <= EMPTY & WA & EMPTY & EMPTY;
		elsif op.memtype=MEM_H or op.memtype=MEM_HU then
			M.byteena <= "1100";
			M.wrdata <= WB & WA & EMPTY & EMPTY;
		elsif op.memtype=MEM_W then
			M.byteena <= "1111";
			M.wrdata <= WD & WC & WB & WA;
		end if;
		
		--computation of R
		if op.memtype=MEM_B then
			R <= std_logic_vector(resize(signed(DC),R'length));
		elsif op.memtype=MEM_BU then
			R <= EMPTY & EMPTY & EMPTY & DC;
		elsif op.memtype=MEM_H then
			R <= std_logic_vector(resize(signed(DD & DC),R'length));
		elsif op.memtype=MEM_HU then
			R <= EMPTY & EMPTY & DD & DC;
		elsif op.memtype=MEM_W then
			R <= DD & DC & DB & DA;
		end if;
		
		--computation of load exception
		if op.memread='1' then
			if op.memtype=MEM_H or op.memtype=MEM_HU or op.memtype=MEM_W then
				XL <= '1';
				M.rd <= '0';
				M.wr <= '0';
			end if;
		end if;
		--computation of store exception
		if op.memwrite='1' then
			if op.memtype=MEM_H or op.memtype=MEM_HU or op.memtype=MEM_W then
				XS <= '1';
				M.rd <= '0';
				M.wr <= '0';
			end if;
		end if;
		
	when "10" =>
		--computation of M.byteena and M.wrdata
		if op.memtype=MEM_B or op.memtype=MEM_BU then
			M.byteena <= "0010";
			M.wrdata <= EMPTY & EMPTY & WA & EMPTY;
		elsif op.memtype=MEM_H or op.memtype=MEM_HU then
			M.byteena <= "0011";
			M.wrdata <= EMPTY & EMPTY & WB & WA;
		elsif op.memtype=MEM_W then
			M.byteena <= "1111";
			M.wrdata <= WD & WC & WB & WA;
		end if;
		
		--computation of R
		if op.memtype=MEM_B then
			R <= std_logic_vector(resize(signed(DB),R'length));
		elsif op.memtype=MEM_BU then
			R <= EMPTY & EMPTY & EMPTY & DB;
		elsif op.memtype=MEM_H then
			R <= std_logic_vector(resize(signed(DB & DA), R'length));
		elsif op.memtype=MEM_HU then
			R <= EMPTY & EMPTY & DB & DA;
		elsif op.memtype=MEM_W then
			R <= DD & DC & DB & DA;
		end if;
		
		--computation of load exception
		if op.memread='1' and op.memtype=MEM_W then
			XL <= '1';
			M.rd <= '0';
			M.wr <= '0';
		end if;
		--computation of store exception
		if op.memwrite='1' and op.memtype=MEM_W then
			XS <= '1';
			M.rd <= '0';
			M.wr <= '0';
		end if;
	
	when "11" =>
		--computation of M.byteena and M.wrdata
		if op.memtype=MEM_B or op.memtype=MEM_BU then
			M.byteena <= "0001";
			M.wrdata <= EMPTY & EMPTY & EMPTY & WA;
		elsif op.memtype=MEM_H or op.memtype=MEM_HU then
			M.byteena <= "0011";
			M.wrdata <= EMPTY & EMPTY & WB & WA;
		elsif op.memtype=MEM_W then
			M.byteena <= "1111";
			M.wrdata <= WD & WC & WB & WA;
		end if;
		
		--computation of R
		if op.memtype=MEM_B then
			R <= std_logic_vector(resize(signed(DA),R'length));
		elsif op.memtype=MEM_BU then
			R <= EMPTY & EMPTY & EMPTY & DA;
		elsif op.memtype=MEM_H then
			R <= std_logic_vector(resize(signed(DB & DA),R'length));
		elsif op.memtype=MEM_HU then
			R <= EMPTY & EMPTY & DB & DA;
		elsif op.memtype=MEM_W then
			R <= DD & DC & DB & DA;
		end if;
		
		--computation of load exception
		if op.memread='1' then
			if op.memtype=MEM_H or op.memtype=MEM_HU or op.memtype=MEM_W then
				XL <= '1';
				M.rd <= '0';
				M.wr <= '0';
			end if;
		end if;
		--computation of store exception
		if op.memwrite='1' then
			if op.memtype=MEM_H or op.memtype=MEM_HU or op.memtype=MEM_W then
				XS <= '1';
				M.rd <= '0';
				M.wr <= '0';
			end if;
		end if;
	
	when others =>
	
end case;
end process;

end rtl;
