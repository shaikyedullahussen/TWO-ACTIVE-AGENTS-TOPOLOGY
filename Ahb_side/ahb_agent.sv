class ahb_agent extends uvm_agent;
        `uvm_component_utils(ahb_agent)
        ahb_drv drv;
        ahb_mon mon;
        ahb_seqr seqr;
        ahb_agent_config ahb_cfg;

        function new(string name="ahb_agent",uvm_component parent);
                super.new(name,parent);
        endfunction

        function void build_phase(uvm_phase phase);
                super.build_phase(phase);
                if(!uvm_config_db#(ahb_agent_config)::get(this,"","ahb_agent_config",ahb_cfg))
                        `uvm_fatal("error",get_type_name)
                mon=ahb_mon::type_id::create("mon",this);
                if(ahb_cfg.is_active==UVM_ACTIVE)
                        begin
                        drv=ahb_drv::type_id::create("drv",this);
                        seqr=ahb_seqr::type_id::create("seqr",this);
                        end
        endfunction

        function void connect_phase(uvm_phase phase);
                super.connect_phase(phase);
                if(ahb_cfg.is_active==UVM_ACTIVE)
                        drv.seq_item_port.connect(seqr.seq_item_export);
        endfunction

endclass


