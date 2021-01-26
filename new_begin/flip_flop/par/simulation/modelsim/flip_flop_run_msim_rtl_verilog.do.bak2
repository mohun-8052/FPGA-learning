transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/20185/Desktop/QT_TEST/new_begin/flip_flop/rtl {C:/Users/20185/Desktop/QT_TEST/new_begin/flip_flop/rtl/flip_flop.v}

vlog -vlog01compat -work work +incdir+C:/Users/20185/Desktop/QT_TEST/new_begin/flip_flop/par/../sim {C:/Users/20185/Desktop/QT_TEST/new_begin/flip_flop/par/../sim/tb_flip_flop.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  tb_flip_flop

add wave *
view structure
view signals
run 1 us
