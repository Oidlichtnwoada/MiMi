library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;
use ieee.numeric_std.all;

package tb_pkg is 
    type line_vector is array (natural range <>) of line;
    type lines_t is access line_vector;
    constant CLK_PERIOD : time := 13.333 ns;
    constant RESET_FACTOR : integer := 10;
    impure function split (constant s : string; constant sep : string; constant max_split : integer := -1) return lines_t;
end package;

package body tb_pkg is
    impure function split (
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
  end split;
end package body;