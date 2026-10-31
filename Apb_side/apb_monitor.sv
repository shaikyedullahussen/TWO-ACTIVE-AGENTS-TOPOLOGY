class apb_mon extends uvm_monitor;
        `uvm_component_utils(apb_mon)
        function new(string name="apb_mon",uvm_component parent);

                super.new(name,parent);
        endfunction
endclass

