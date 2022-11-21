#!/usr/local/bin/tclsh

set Para(cmd) ""
if ![catch {set temp $argc} result] {
    if {$argc > 0} {
        for {set i 0} {$i < $argc} {incr i 2} {
            set temp [lindex $argv $i]
            set temp [string range $temp 1 end]
            lappend argv_list $temp
            lappend value_list [lindex $argv [expr $i+1]]
        }
        foreach argument $argv_list value $value_list {
            switch $argument {
                "cmd" {set Para(cmd) $value;}
            }
        }
    }
}
#IP Core information
set Para(ProjectPath) "C:/Users/dabdulra/Designs/my_designs/lpddr4_avant/cpnx_lpddr4_31/impl_1"
set Para(BuildDir) "C:/Users/dabdulra/Designs/my_designs/lpddr4_avant/cpnx_lpddr4_31/impl_1/reveal_workspace/tmpreveal"
set Para(Module) "reveal"
set Reveal_Cores {eval_top_la0 }
set Para(lib) "C:/lscc/radiant/3.1/data/reveal/lib"
set Para(CoreName) "reveal"
set Para(Family) "LFCPNX"
set Para(design) "Schematic/Verilog HDL"
set Para(synthesis) "synplify"

#environment
lappend auto_path "C:/lscc/radiant/3.1/scripts/tcl/reveal"
set Para(install_dir) "C:/lscc/radiant/3.1"

#include tcl package
package require Core_Generate
package require runcmd
#excute GenerateCore
foreach core $Reveal_Cores {
	set Para(ModuleName) $core
	set Para(result) [GenerateCore 1]
	if {$Para(result)<0} {exit $Para(result)}
}

