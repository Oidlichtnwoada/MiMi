library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

use work.core_pack.all;
use work.op_pack.all;
use work.mem_pkg.all;
use work.tb_pkg.all;

entity mem_tb is
end mem_tb;

architecture rtl of mem_tb is
    signal clk, reset : std_logic;
    signal stall : std_logic;
    signal flush : std_logic;
    signal mem_op : mem_op_type;
    signal jmp_op : jmp_op_type;
    signal pc_in : std_logic_vector(PC_WIDTH-1 downto 0);
    signal rd_in : std_logic_vector(REG_BITS-1 downto 0);
    signal aluresult_in : std_logic_vector(DATA_WIDTH-1 downto 0);
    signal wrdata : std_logic_vector(DATA_WIDTH-1 downto 0);
    signal zero, neg : std_logic;
    signal new_pc_in : std_logic_vector(PC_WIDTH-1 downto 0);
    signal pc_out : std_logic_vector(PC_WIDTH-1 downto 0);
    signal pcsrc : std_logic;
    signal rd_out : std_logic_vector(REG_BITS-1 downto 0);
    signal aluresult_out : std_logic_vector(DATA_WIDTH-1 downto 0);
    signal memresult : std_logic_vector(DATA_WIDTH-1 downto 0);
    signal new_pc_out : std_logic_vector(PC_WIDTH-1 downto 0);
    signal wbop_in : wb_op_type;
    signal wbop_out : wb_op_type;
    signal mem_out : mem_out_type;
    signal mem_data : std_logic_vector(DATA_WIDTH-1 downto 0);
    signal exc_load : std_logic;
    signal exc_store : std_logic;
begin

    UUT: mem
    port map (clk => clk, reset => reset, stall => stall, flush => flush, mem_op => mem_op, jmp_op => jmp_op, pc_in => pc_in, rd_in => rd_in, aluresult_in => aluresult_in, wrdata => wrdata, zero => zero, neg => neg, new_pc_in => new_pc_in, pc_out => pc_out, pcsrc => pcsrc, rd_out => rd_out, aluresult_out => aluresult_out, memresult => memresult, new_pc_out => new_pc_out, wbop_in => wbop_in, wbop_out => wbop_out, mem_out => mem_out, mem_data => mem_data, exc_load => exc_load, exc_store => exc_store);

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
        write(current_write_line, string'("pc_out,pcsrc,rd_out,aluresult_out,memresult,new_pc_out,wbop_out.memtoreg,wbop_out.regwrite,mem_out.address,mem_out.rd,mem_out.wr,mem_out.byteena,mem_out.wrdata,exc_load,exc_load"));
        writeline(output_file, current_write_line);
        --skip header from input.csv
        readline(input_file, current_read_line);
        while not endfile(input_file) loop
            --assigning the inputs from the file
            readline(input_file, current_read_line);
            inputs := str_split(current_read_line.all, ",");
            stall <= str_to_slv(inputs(0).all)(0);
		    flush <= str_to_slv(inputs(1).all)(0);
            mem_op.memread <= str_to_slv(inputs(2).all)(0);
            mem_op.memwrite <= str_to_slv(inputs(3).all)(0);
            --mem_op.memtype <= str_to_slv(inputs(4).all);
            --jmp_op <= str_to_slv(inputs(5).all);
            pc_in <= str_to_slv(inputs(6).all);
            rd_in <= str_to_slv(inputs(7).all);
            aluresult_in <= str_to_slv(inputs(8).all);
            wrdata <= str_to_slv(inputs(9).all);
            zero <= str_to_slv(inputs(10).all)(0);
            neg <= str_to_slv(inputs(11).all)(0);
            new_pc_in <= str_to_slv(inputs(12).all);
            wbop_in.memtoreg <= str_to_slv(inputs(13).all)(0);
            wbop_in.regwrite <= str_to_slv(inputs(14).all)(0);
            mem_data <= str_to_slv(inputs(15).all);
            deallocate(inputs);
            clk <= '1';
            wait for CLK_PERIOD/2;
            clk <= '0';
            wait for CLK_PERIOD/2;
            --read the output pins and write to output_simulated.csv
            write(current_write_line, to_string(pc_out) & "," & to_string(pcsrc) & "," & to_string(rd_out) & "," & to_string(aluresult_out) & "," & to_String(memresult) & "," & to_string(new_pc_out) & "," & to_string(wbop_out.memtoreg) & "," & to_string(wbop_out.regwrite) & "," & to_string(mem_out.address) & "," & to_string(mem_out.rd) & "," & to_string(mem_out.wr) & "," & to_string(mem_out.byteena) & "," & to_string(mem_out.wrdata) & "," & to_string(exc_load) & "," & to_string(exc_load));
            writeline(output_file, current_write_line);
        end loop;
        file_close(input_file);
        file_close(output_file);
        wait;
    end process test;

end architecture rtl;