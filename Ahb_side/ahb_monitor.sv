class ahb_mon extends uvm_monitor;
        `uvm_component_utils(ahb_mon)
        function new(string name="ahb_mon",uvm_component parent);

                super.new(name,parent);
        endfunction
endclass

