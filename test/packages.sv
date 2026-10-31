package pkg;
        import uvm_pkg::*;
        `include "uvm_macros.svh"
        //ahb
        `include "ahb_trans.sv"
        `include "ahb_sequence.sv"
        `include "ahb_agent_config.sv"
        `include "apb_agent_config.sv"

        `include "env_config.sv"
        `include "ahb_drv.sv"
        `include "ahb_mon.sv"
        `include "ahb_seqr.sv"
        `include "ahb_agent.sv"
        `include "ahb_agent_top.sv"


        //apb
        `include "apb_trans.sv"
        `include "apb_sequence.sv"
        `include "apb_drv.sv"
        `include "apb_mon.sv"
        `include "apb_seqr.sv"
        `include "apb_agent.sv"
        `include "apb_agent_top.sv"
        `include "env.sv"
        `include "base_test.sv"



endpackage

