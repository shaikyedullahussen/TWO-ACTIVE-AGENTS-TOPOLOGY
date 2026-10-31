class ahb_sequence extends uvm_sequence#(ahb_trans);
        `uvm_object_utils(ahb_sequence)
function new(string name="ahb_sequence");
        super.new(name);
endfunction
endclass

