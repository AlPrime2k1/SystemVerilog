///////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Company: Scaledge Technology
// Engineer: Kirti Kumar
// 
// Module Name: fifo_env
// Project Name: FIFO Verification
// Description: Environment for FIFO consisting of all the components, interfaces and mailboxes
///////////////////////////////////////////////////////////////////////////////////////////////////////////////

 class fifo_env;
 
   //all verification component instance
   fifo_gen gen_h;
   fifo_drv drv_h;
   fifo_mon mon_h;
   fifo_ref ref_h;
   fifo_scb1 scb_h;
   
   //mailbox
   mailbox #(fifo_trans) gen_drv=new();
   mailbox #(fifo_trans) mon_ref=new();
   mailbox #(fifo_trans) ref_scb=new();
   mailbox #(fifo_trans) mon_scb=new();
   
  //interface
  virtual fifo_if.DRIVER_MP  drv_if;
  virtual fifo_if.MONITOR_MP mon_if;
     
  function new (virtual fifo_if.DRIVER_MP  drv_if,
                virtual fifo_if.MONITOR_MP mon_if); 

	this.drv_if = drv_if;
	this.mon_if = mon_if;
  endfunction
  
  function void build();
  //gen_h = new(gen_wd,gen_rd);
	drv_h  = new(gen_drv,drv_if);
	mon_h  = new(mon_ref,mon_scb,mon_if);
	ref_h  = new(mon_ref,ref_scb);
	scb_h  = new(ref_scb,mon_scb);
  endfunction
  
  task start();
   fork
    
	 gen_h.start(); 
	 drv_h.start();  
	 mon_h.start();
	 ref_h.start();
	 scb_h.start();
   join_none
 
  endtask

endclass  
