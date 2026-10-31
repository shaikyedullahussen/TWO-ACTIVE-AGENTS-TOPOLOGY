interface apb_if(input bit clock);
    // APB bus signals:
    bit Presetn;           // Active-low reset signal as Presetn
    bit [55:0] Paddr;     // 55-bit address bus as Paddr
    bit [4:0] Psel;      // 4-bits Slave select as Psel
    bit Penable;          // Enable as Penable
    bit Pwrite;           // Write/read control (1=write, 0=read) as Pwrite
    bit [63:0] Prdata;    // 32-bits Read data bus as Prdata
    bit [63:0] Pwdata;    // 32-bits Write data as Pwdata
    bit [4:0] Pready;     // 5-bits Ready as Pready
    bit [7:0] Pstrb;      // 8-bits Strobe as Pstrb

   // Declare clocking block for driver synchronization as apb_slv_drv_cb
    clocking apb_slv_drv_cb @(posedge clock);
        default input #1 output #0;
        output Presetn;
        output Prdata;
        output Pready;
        input Penable;
        input Pwrite;
        input Paddr;
        input Psel;
    endclocking

    // Declare clocking block for monitor synchronization as apb_slv_mon_cb
    clocking apb_slv_mon_cb @(posedge clock);
        default input #1 output #0;
        input Paddr;
        input Psel;
        input Pready;
        input Penable;
        input Pwrite;
        input Prdata;
        input Pwdata;
        input Pstrb;
    endclocking

     // Declare modports for driver and monitor as APB_SLV_DRV_MP and APB_SLV_MON_MP respectively
    modport APB_SLV_DRV_MP(clocking apb_slv_drv_cb);
    modport APB_SLV_MON_MP(clocking apb_slv_mon_cb);

endinterface

