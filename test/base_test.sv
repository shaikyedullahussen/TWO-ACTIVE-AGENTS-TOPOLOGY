class base_test extends uvm_test;
        `uvm_component_utils(base_test)
        env ev;
        env_config e_cfg;
        int no_of_agents=2;

        //ahb
        ahb_agent_config ahb_cfg[];
        bit has_ahb_agent=1;
        virtual ahb_if ahb_vif;


        //apb
        apb_agent_config apb_cfg[];
        bit has_apb_agent=1;
        virtual apb_if a_vif;

        function  new(string name="base_test",uvm_component parent);
                super.new(name,parent);
        endfunction
        function void config_agent();
                if(!uvm_config_db#(virtual ahb_if)::get(this,"","ahb_vif",ahb_vif))//ahb
                        `uvm_fatal("error",get_type_name)
                foreach(ahb_cfg[i])
                        begin
                        ahb_cfg[i].ahb_vif=ahb_vif;
                        e_cfg.ahb_cfg[i]=ahb_cfg[i];
                        end



                e_cfg.has_ahb_agent=has_ahb_agent;

                //apb
                if(!uvm_config_db#(virtual apb_if)::get(this,"","apb_vif",a_vif))
                        `uvm_fatal("error",get_type_name)
                foreach(apb_cfg[i])
                        begin
                        apb_cfg[i].a_vif=a_vif;
                        e_cfg.apb_cfg[i]=apb_cfg[i];
                        end



                e_cfg.has_apb_agent=has_apb_agent;
                uvm_config_db#(env_config)::set(this,"*","env_config",e_cfg);
                uvm_config_db#(int)::set(this,"*","int",no_of_agents);
        endfunction


        function void build_phase(uvm_phase phase);
                super.build_phase(phase);
                e_cfg=env_config::type_id::create("e_cfg");
                e_cfg.ahb_cfg=new[no_of_agents];//ahb
                e_cfg.apb_cfg=new[no_of_agents];//apb

                ahb_cfg=new[no_of_agents];//ahb
                apb_cfg=new[no_of_agents];//apb




        if(has_ahb_agent==1)
                begin
                foreach(ahb_cfg[i])
                        begin
                                ahb_cfg[i]=ahb_agent_config::type_id::create($sformatf("ahb_cfg[%0d]",i));
                                if(i==0)
                                        ahb_cfg[i].is_active =UVM_ACTIVE;
                                else
                                        ahb_cfg[i].is_active=UVM_PASSIVE;
                        end
                end


        if(has_apb_agent==1)
                begin
                foreach(apb_cfg[i])
                        begin
                                apb_cfg[i]=apb_agent_config::type_id::create($sformatf("apb_cfg[%0d]",i));
                                if(i==0)
                                        apb_cfg[i].is_active =UVM_ACTIVE;
                                else
                                        apb_cfg[i].is_active=UVM_PASSIVE;
                        end
                end
        config_agent();
        ev=env::type_id::create("ev",this);

        endfunction
        function void end_of_elaboration_phase(uvm_phase phase);
                super.end_of_elaboration_phase(phase);
                uvm_top.print_topology();
        endfunction
endclass


