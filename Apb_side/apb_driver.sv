class apb_drv extends uvm_driver#(apb_trans);
        `uvm_component_utils(apb_drv)
        function new(string name="apb_drv",uvm_component parent);
                super.new(name,parent);
        endfunction
endclass

