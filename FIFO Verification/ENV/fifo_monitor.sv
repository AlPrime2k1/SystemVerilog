///////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Company: Scaledge Technology
// Engineer: Kirti Kumar
// 
// Module Name: fifo_mon
// Project Name: FIFO Verification
// Description: Monitor class to get transaction from DUT and pass them to reference model and scoreboard
///////////////////////////////////////////////////////////////////////////////////////////////////////////////

class fifo_mon;

  fifo_trans trans_h;
  
  mailbox #(fifo_trans) mon_ref;
  mailbox #(fifo_trans) mon_scb;
  
  virtual fifo_if.MONITOR_MP vif;
  
   function new (mailbox #(fifo_trans) mon_ref, 
                 mailbox #(fifo_trans) mon_scb, 
                 virtual fifo_if.MONITOR_MP vif);
	this.mon_ref = mon_ref;
	this.mon_scb = mon_scb;
	this.vif = vif;
 endfunction
 
 task start();
  forever  begin
   monitor();
   mon_ref.put(trans_h);
   mon_scb.put(trans_h);
   
   end
 endtask
 
 
 task monitor();
   //if(vif.monitor_cb.empty==0)
   begin
   //create trans_h
   @(vif.monitor_cb)
   trans_h=new();
   trans_h.rst=vif.monitor_cb.rst;
   trans_h.rd_data = vif.monitor_cb.rd_data;
   trans_h.wr_data = vif.monitor_cb.wr_data;

   trans_h.full=vif.monitor_cb.full;
   trans_h.empty=vif.monitor_cb.empty;
   trans_h.almost_empty=vif.monitor_cb.almost_empty;
   trans_h.almost_full=vif.monitor_cb.almost_full;
   trans_h.half=vif.monitor_cb.half;

   $cast(trans_h.trans_enum_1,{vif.monitor_cb.wr_enb,vif.monitor_cb.rd_enb});
   end
 endtask
 
endclass
