library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;

use work.core_pack.all;
use work.memu_pkg.all;
use work.tb_pkg.all;
use work.op_pack.all;

entity memu_tb is 
end memu_tb;

architecture rtl of memu_tb is 
    signal op : mem_op_type;
    signal A : std_logic_vector(ADDR_WIDTH-1 downto 0);
    signal W, D, R : std_logic_vector(DATA_WIDTH-1 downto 0);
    signal M : mem_out_type;
    signal XL, XS : std_logic;
begin

    UUT: memu
    port map (op => op, A => A, W => W, D => D, M => M, R => R, XL => XL, XS => XS);

    test: process
        file input_file : text;
        file output_file : text;
        variable current_read_line : line;
        variable current_write_line : line;
        variable inputs : lines_t;
    begin
        file_open(input_file, "input.csv", READ_MODE);
        file_open(output_file, "output_simulated.csv", WRITE_MODE);
        --skip header from input.csv
        readline(input_file, current_read_line);
        while not endfile(input_file) loop
            readline(input_file, current_read_line);
            inputs := str_split(current_read_line.all, ",");
            op.memread <= str_to_slv(inputs(0).all)(0);
            op.memwrite <= str_to_slv(inputs(1).all)(0);
            --op.memtype <= str_to_slv(inputs(2).all);
            A <= str_to_slv(inputs(3).all);
            W <= str_to_slv(inputs(4).all);
            D <= str_to_slv(inputs(5).all);
            deallocate(inputs);
            wait for 10 ns;
            write(current_write_line, to_string(M.address) & "," & to_string(M.rd) & "," & to_string(M.wr) & "," & to_string(M.byteena) & "," & to_String(M.wrdata) & "," & to_string(R) & "," & to_string(XL) & "," & to_string(XS)); --M, R, XL, XS
            writeline(output_file, current_write_line);
        end loop;
        file_close(input_file);
        file_close(output_file);
        wait;
    end process test;

end rtl;