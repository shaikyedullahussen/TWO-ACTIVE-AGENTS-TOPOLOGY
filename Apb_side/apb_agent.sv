class apb_agent extends uvm_agent;
        `uvm_component_utils(apb_agent)
        apb_drv drv;
        apb_mon mon;
        apb_seqr seqr;
        apb_agent_config apb_cfg;

        function new(string name="apb_agent",uvm_component parent);
                super.new(name,parent);
        endfunction

        function void build_phase(uvm_phase phase);
                super.build_phase(phase);
                if(!uvm_config_db#(apb_agent_config)::get(this,"","apb_agent_config",apb_cfg))
                        `uvm_fatal("error",get_type_name)
                mon=apb_mon::type_id::create("mon",this);
                if(apb_cfg.is_active==UVM_ACTIVE)
                        begin
                        drv=apb_drv::type_id::create("drv",this);
                        seqr=apb_seqr::type_id::create("seqr",this);
                        end
        endfunction

        function void connect_phase(uvm_phase phase);
                super.connect_phase(phase);
                if(apb_cfg.is_active==UVM_ACTIVE)
                        drv.seq_item_port.connect(seqr.seq_item_export);
        endfunction

endclass

