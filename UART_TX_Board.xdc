## Clock
set_property PACKAGE_PIN H16 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 8.000 -name sys_clk_pin [get_ports clk]

## Reset Button
set_property PACKAGE_PIN D19 [get_ports rst]
set_property IOSTANDARD LVCMOS33 [get_ports rst]

## Start Button
set_property PACKAGE_PIN D20 [get_ports start]
set_property IOSTANDARD LVCMOS33 [get_ports start]

## UART TX to LED
set_property PACKAGE_PIN R14 [get_ports tx]
set_property IOSTANDARD LVCMOS33 [get_ports tx]