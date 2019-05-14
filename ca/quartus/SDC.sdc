# clock constraints
create_clock -name "clk_pin" -period 13.333ns [get_ports {clk_pin}]

# automatically constrain PLL and other generated clocks
derive_pll_clocks -create_base_clocks

# automatically calculate clock uncertainty to jitter and other effects.
derive_clock_uncertainty