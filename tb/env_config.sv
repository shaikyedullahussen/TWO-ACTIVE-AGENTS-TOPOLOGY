class env_config extends uvm_object;
        `uvm_object_utils(env_config)
        //ahb
        ahb_agent_config ahb_cfg[];
        bit has_ahb_agent=1;
        //apb
        apb_agent_config apb_cfg[];
        bit has_apb_agent=1;

        function new(string name="env_config");
                super.new(name);
        endfunction
endclass

