if [file exists work] {vdel -all}
vlib work
vlog -f compile_sv.f
vsim -voptargs="+acc" top +UVM_TESTNAME=counter_test
set NoQuitOnFinish 1
log /* -r
run -all


