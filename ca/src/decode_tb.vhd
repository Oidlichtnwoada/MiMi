library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

use work.core_pack.all;
use work.op_pack.all;
use work.decode_pkg.all;
use work.tb_pkg.all;

entity decode_tb is
end decode_tb;

architecture rtl of decode_tb is
    signal clk, reset : std_logic;
    signal stall : std_logic;
    signal flush : std_logic;
    signal pc_in : std_logic_vector(PC_WIDTH-1 downto 0);
    signal instr : std_logic_vector(INSTR_WIDTH-1 downto 0);
    signal wraddr : std_logic_vector(REG_BITS-1 downto 0);
    signal wrdata : std_logic_vector(DATA_WIDTH-1 downto 0);
    signal regwrite : std_logic;
    signal pc_out : std_logic_vector(PC_WIDTH-1 downto 0);
    signal exec_op : exec_op_type;
    signal cop0_op : cop0_op_type;
    signal jmp_op : jmp_op_type;
    signal mem_op : mem_op_type;
    signal wb_op : wb_op_type;
    signal exc_dec : std_logic;
begin

    UUT: decode
    port map (clk => clk, reset => reset, stall => stall, flush => flush, pc_in => pc_in, instr => instr, wraddr => wraddr, wrdata => wrdata, regwrite => regwrite, pc_out => pc_out, exec_op => exec_op, cop0_op => cop0_op, jmp_op => jmp_op, mem_op => mem_op, wb_op => wb_op, exc_dec => exc_dec);

    test: process
        file input_file : text;
        file output_file : text;
        variable current_read_line : line;
        variable current_write_line : line;
        variable inputs : lines_t;
    begin
        file_open(input_file, "input.csv", READ_MODE);
        file_open(output_file, "output_simulated.csv", WRITE_MODE);
        clk <= '0';
        --reset
        reset <= '0';
        wait for RESET_FACTOR * CLK_PERIOD;
        reset <= '1';
        --creating header for output_simulated.csv
        write(current_write_line, string'("pc_out,exec_op,cop0_op,jmp_op,mem_op,wb_op,exc_dec"));
        writeline(output_file, current_write_line);
        --skip header from input.csv
        readline(input_file, current_read_line);
        while not endfile(input_file) loop
            --assigning the inputs from the file
            readline(input_file, current_read_line);
            inputs := str_split(current_read_line.all, ",");
            stall <= str_to_slv(inputs(0).all)(0);
            flush <= str_to_slv(inputs(1).all)(0);
            pc_in <= str_to_slv(inputs(2).all);
            instr <= str_to_slv(inputs(3).all);
            wraddr <= str_to_slv(inputs(4).all);
            wrdata <= str_to_slv(inputs(5).all);
            regwrite <= str_to_slv(inputs(6).all)(0);
            deallocate(inputs);
            clk <= '1';
            wait for CLK_PERIOD/2;
            clk <= '0';
            wait for CLK_PERIOD/2;
            --read the output pins and write to output_simulated.csv
            write(current_write_line, to_string(pc_out) & "," & to_string(exec_op.aluop) & "," & to_string(cop0_op.addr) & "," & to_string(jmp_op) & "," & to_string(mem_op.memtype) & "," & to_string(wb_op.memtoreg) & "," & to_string(exc_dec));
            writeline(output_file, current_write_line);
        end loop;
        file_close(input_file);
        file_close(output_file);
        wait;
    end process test;

end architecture rtl;