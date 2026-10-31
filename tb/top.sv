module top;
        import uvm_pkg::*;
        import pkg::*;
        `include "uvm_macros.svh"
        bit clock=0;
        always #5 clock=~clock;
        ahb_if in0(clock);
        apb_if in1(clock);

        initial begin
        uvm_config_db#(virtual ahb_if)::set(null,"*","ahb_vif",in0);//ahb_if

        uvm_config_db#(virtual apb_if)::set(null,"*","apb_vif",in1);//apb_if
        run_test();
        end
endmodule

