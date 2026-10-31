interface ahb_if(input bit clock);
    // AHB bus signals:
    bit Hresetn;          // Active-low reset as Hresetn
    bit [55:0] Haddr;    // 32-bits address bus as Haddr
    bit Hwrite;          // Write/read control (1=write, 0=read) as Hwrite
    bit [1:0] Htrans;    // 2-bits Transfer type as Htrans
    bit [2:0] Hsize;     // 3-bits size as Hsize
    bit [63:0] Hrdata;   // 32-bits Read data bus as Hrdata
    bit [63:0] Hwdata;   // 32-bits Write data bus as Hwdata
    bit Hreadyin;        // Transfer ready from master as Hreadyin
    bit Hreadyout;       // Transfer ready from slave as Hreadyout
    bit [2:0] Hburst;    // 3-bits Burst type as Hburst
    bit  Hresp;          // 2-bits Response as Hresp
    bit  Hsel;           // 1-bit Select as Hsel
    bit [7:0] Hwstrb;    // 8-bit Strobe as Hwstrb


    // Declare clocking block for driver synchronization as ahb_drv_cb
    clocking ahb_drv_cb @(posedge clock);
        output Hresetn;
        output Haddr;
        output Hwrite;
        output Htrans;
        output Hsize;
        output Hwdata;
        output Hreadyin;
        output Hburst;
        output Hsel;
        output Hwstrb;
        input Hreadyout;
        input Hresp;
        input Hrdata;
    endclocking

    // Declare clocking block for monitor synchronization as ahb_mon_cb
    clocking ahb_mon_cb @(posedge clock);
        input Hresetn;
        input Haddr;
        input Hwrite;
        input Htrans;
        input Hsize;
        input Hwdata;
        input Hreadyin;
        input Hburst;
        input Hwstrb;
        input Hreadyout;
        input Hresp;
        input Hrdata;
    endclocking

    // Declare modports for driver and monitor as AHB_DRV_MP and AHB_MON_MP respectively
    modport AHB_DRV_MP(clocking ahb_drv_cb);
    modport AHB_MON_MP(clocking ahb_mon_cb);

endinterface

