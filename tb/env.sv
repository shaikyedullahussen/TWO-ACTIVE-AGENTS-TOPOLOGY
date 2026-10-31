class env extends uvm_env;
        `uvm_component_utils(env)
        //ahb
        ahb_agent_top ahb_top;
        ahb_agent_config ahb_cfg[];

        //apb
        apb_agent_top apb_top;
        apb_agent_config apb_cfg[];
        env_config e_cfg;

        function new(string name="env",uvm_component parent);
                super.new(name,parent);
        endfunction
        function void build_phase(uvm_phase phase);
                super.build_phase(phase);
        if(!uvm_config_db#(env_config)::get(this,"","env_config",e_cfg))
                `uvm_fatal("error",get_type_name);
        //ahb
        if(e_cfg.has_ahb_agent==1)
                begin
                ahb_top=ahb_agent_top::type_id::create("ahb_top",this);
                foreach(e_cfg.ahb_cfg[i])

                uvm_config_db#(ahb_agent_config)::set(this,$sformatf("ahb_top.agent[%0d]",i),"ahb_agent_config",e_cfg.ahb_cfg[i]);
                end

        //apb
        if(e_cfg.has_apb_agent==1)
                begin
                apb_top=apb_agent_top::type_id::create("apb_top",this);
                foreach(e_cfg.apb_cfg[i])

                uvm_config_db#(apb_agent_config)::set(this,$sformatf("apb_top.agent[%0d]",i),"apb_agent_config",e_cfg.apb_cfg[i]);
                end
        endfunction

endclass

