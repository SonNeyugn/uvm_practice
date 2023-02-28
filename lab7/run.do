if [file exists work] {vdel -all}
vlib work
vlog -f compile.f
vsim -voptargs="+acc" top
set NoQuitOnFinish 1
run -all


