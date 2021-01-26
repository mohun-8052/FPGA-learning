transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/20185/Desktop/QT_TEST/new_begin/full_add/rtl {C:/Users/20185/Desktop/QT_TEST/new_begin/full_add/rtl/half_add.v}
vlog -vlog01compat -work work +incdir+C:/Users/20185/Desktop/QT_TEST/new_begin/full_add/rtl {C:/Users/20185/Desktop/QT_TEST/new_begin/full_add/rtl/full_add.v}

vlog -vlog01compat -work work +incdir+C:/Users/20185/Desktop/QT_TEST/new_begin/full_add/par/../sim {C:/Users/20185/Desktop/QT_TEST/new_begin/full_add/par/../sim/tb_full_add.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  tb_full_add

add wave *
view structure
view signals
run 1 us
