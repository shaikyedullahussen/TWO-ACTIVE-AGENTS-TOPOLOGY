class ahb_drv extends uvm_driver#(ahb_trans);
        `uvm_component_utils(ahb_drv)
        function new(string name="ahb_drv",uvm_component parent);
                super.new(name,parent);
        endfunction
endclass

