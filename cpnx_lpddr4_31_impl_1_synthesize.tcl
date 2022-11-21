if {[catch {

# define run engine funtion
source [file join {C:/lscc/radiant/3.1} scripts tcl flow run_engine.tcl]
# define global variables
global para
set para(gui_mode) 1
set para(prj_dir) "C:/Users/dabdulra/Designs/my_designs/lpddr4_avant/cpnx_lpddr4_31"
# synthesize IPs
# synthesize VMs
# propgate constraints
file delete -force -- cpnx_lpddr4_31_impl_1_cpe.ldc
run_engine_newmsg cpe -f "cpnx_lpddr4_31_impl_1.cprj" "lpddr4_core.cprj" -a "LFCPNX" -o cpnx_lpddr4_31_impl_1_cpe.ldc
# synthesize top design
file delete -force -- cpnx_lpddr4_31_impl_1.vm cpnx_lpddr4_31_impl_1.ldc
run_engine synpwrap -prj "cpnx_lpddr4_31_impl_1_synplify.tcl" -log "cpnx_lpddr4_31_impl_1.srf"
run_postsyn [list -a LFCPNX -p LFCPNX-100 -t LFG672 -sp 9_High-Performance_1.0V -oc Industrial -top -w -o cpnx_lpddr4_31_impl_1_syn.udb cpnx_lpddr4_31_impl_1.vm] "C:/Users/dabdulra/Designs/my_designs/lpddr4_avant/cpnx_lpddr4_31/impl_1/cpnx_lpddr4_31_impl_1.ldc"

} out]} {
   runtime_log $out
   exit 1
}
