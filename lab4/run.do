if [file exists work] {vdel -all}
vlib work
vlog -f compile_sv.f
vsim -voptargs="+acc" top;
set NoQuitOnFinish 1
log /* -r
run -all


