class ahb_agent_top extends uvm_agent;
        `uvm_component_utils(ahb_agent_top)
        ahb_agent agent[];
        int no_of_agents;

        function new(string name="ahb_agent",uvm_component parent);
                super.new(name,parent);
        endfunction

        function void build_phase(uvm_phase phase);
                super.build_phase(phase);
        if(!uvm_config_db#(int)::get(this,"","int",no_of_agents))
                `uvm_fatal("error",get_type_name)
        agent=new[no_of_agents];
        foreach(agent[i])
                begin
                agent[i]=ahb_agent::type_id::create($sformatf("agent[%0d]",i),this);
                end
        endfunction
endclass

