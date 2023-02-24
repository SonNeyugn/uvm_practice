vlog -writetoplevels questa.tops -timescale 1ns/1ns covergroup_test.sv
#vlog covergroup_test.sv
vsim -voptargs=+acc=npr
run 10000