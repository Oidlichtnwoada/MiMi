library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;
use ieee.numeric_std.all;

package tb_pkg is 
    type line_vector is array (natural range <>) of line;
    type lines_t is access line_vector;
    constant CLK_PERIOD : time := 13.333 ns;
    constant RESET_FACTOR : integer := 10;
    function count (constant s : string; constant substring : string; constant start : natural := 0; constant stop : natural := 0) return natural;
    impure function str_split (constant s : string; constant sep : string; constant max_split : integer := -1) return lines_t;
    function str_to_sl(constant c: character) return std_logic; 
    function str_to_slv(constant s: string) return std_logic_vector; 
end package;

package body tb_pkg is
    function count (
        constant s : string;
        constant substring : string;
        constant start : natural := 0;
        constant stop : natural := 0)
        return natural is
        variable start_pos, stop_pos : natural;
        variable n, o : natural := 0;
    begin
        if substring = "" then
            n := s'length + 1;
        elsif s = "" then
            n := 0;
        else
            if start = 0 then
                start_pos := s'left;
            elsif not in_range(s, start) then
                return 0;
            else
                start_pos := start;
            end if;
            if stop = 0 then
                stop_pos := s'right;
            elsif not in_range(s, stop) then
                return 0;
            else
                stop_pos := stop;
            end if;
            if offset(s, start_pos) > offset(s, stop_pos) then
                return 0;
            end if;
            o := offset(s, start_pos);
            while o <= offset(s, stop_pos) - substring'length + 1 loop
                if slice(s, o, substring'length) = substring then
                    n := n + 1;
                    o := o + substring'length;
                else
                    o := o + 1;
                end if;
            end loop;
        end if;
        return n;
    end count;

    impure function str_split (
        constant s         : string;
        constant sep       : string;
        constant max_split : integer := -1)
        return lines_t is
        variable ret_val : lines_t;
        variable ret_val_index : natural := 0;
        variable previous_sep_index : natural := 0;
        variable i, n_splits : natural := 0;
        constant s_int : string(1 to s'length) := s;
    begin
        if (count(s_int, sep) <= max_split) or (max_split = -1) then
            ret_val := new line_vector(0 to count(s_int, sep));
        else
            ret_val := new line_vector(0 to max_split);
        end if;
        i := 1;
        while i <= s_int'length - sep'length + 1 loop
            exit when n_splits = max_split;
            if s_int(i to i + sep'length - 1) = sep then
                n_splits := n_splits + 1;
                write(ret_val(ret_val_index), s_int(previous_sep_index + 1 to i - 1));
                ret_val_index := ret_val_index + 1;
                previous_sep_index := i + sep'length - 1;
                if sep'length = 0 then
                    i := i + 1;
                else
                    i := i + sep'length;
                end if;
            else
                i := i + 1;
            end if;
        end loop;
        write(ret_val(ret_val_index), s_int(previous_sep_index + 1 to s_int'length));
        return ret_val;
    end str_split;

    function str_to_sl(c: character) return std_logic is
        variable sl : std_logic;
    begin
        case c is
            when 'U' =>
                sl:='U';
            when 'X' =>
                sl:='X';
            when '0' => 
                sl:='0';
            when '1' => 
                sl:='1';
            when 'Z' => 
                sl:='Z';
            when 'W' => 
                sl:='W';
            when 'L' => 
                sl:='L';
            when 'H' => 
                sl:='H';
            when '-' => 
                sl:='-';
            when others =>
                sl:='X';
        end case;
        return sl;
    end function str_to_sl;

    function str_to_slv(s: string) return std_logic_vector is 
        variable slv: std_logic_vector(s'high-s'low downto 0);
        variable k: integer;
    begin
        k := s'high-s'low;
        for i in s'range loop
            slv(k) := str_to_sl(s(i));
            k := k - 1;
        end loop;
        return slv;
    end str_to_slv;
end package body;