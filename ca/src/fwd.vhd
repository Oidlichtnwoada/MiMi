library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.core_pack.all;
use work.op_pack.all;

entity fwd is
	port (
		mem_rd, wb_rd : in std_logic_vector(REG_BITS-1 downto 0);
		mem_regwrite, wb_regwrite : in std_logic;
		forwardA, forwardB		: out  fwd_type;
		execrdaddr1 : in std_logic_vector(REG_BITS-1 downto 0);
		execrdaddr2 : in std_logic_vector(REG_BITS-1 downto 0)
	);
end fwd;

architecture rtl of fwd is
begin
	process (all)
	begin
		forwardA <= FWD_NONE;
		forwardB <= FWD_NONE;
		if mem_regwrite = '1' and unsigned(mem_rd) /= 0 and mem_rd = execrdaddr1 then
			forwardA <= FWD_ALU;
		end if;
		if mem_regwrite = '1' and unsigned(mem_rd) /= 0 and mem_rd = execrdaddr2 then
			forwardB <= FWD_ALU;
		end if;
		if wb_regwrite = '1' and unsigned(wb_rd) /= 0 and not(mem_regwrite = '1' and unsigned(mem_rd) /= 0 and mem_rd = execrdaddr1) and wb_rd = execrdaddr1 then
			forwardA <= FWD_WB;
		end if;
		if wb_regwrite = '1' and unsigned(wb_rd) /= 0 and not(mem_regwrite = '1' and unsigned(mem_rd) /= 0 and mem_rd = execrdaddr2) and wb_rd = execrdaddr2 then
			forwardB <= FWD_WB;
		end if;
	end process;
end rtl;
