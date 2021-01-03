transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/20185/Desktop/QT_TEST/new_begin/mux8_1/rtl {C:/Users/20185/Desktop/QT_TEST/new_begin/mux8_1/rtl/mux8_1.v}

vlog -vlog01compat -work work +incdir+C:/Users/20185/Desktop/QT_TEST/new_begin/mux8_1/par/../sim {C:/Users/20185/Desktop/QT_TEST/new_begin/mux8_1/par/../sim/tb_mux8_1.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  tb_mux8_1

add wave *
view structure
view signals
run 1 us
