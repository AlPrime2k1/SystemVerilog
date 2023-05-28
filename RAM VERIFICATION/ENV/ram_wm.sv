////////////////////////////////////////////////////////////////////////////////////////////
// Company: Scaledge Technology
// Engineer: Kirti Kumar
// 
// Module Name: ram_wm
// Project Name: RAM Verification
// Description: Write monitor used to get transaction from DUT and send to reference model
////////////////////////////////////////////////////////////////////////////////////////////
class ram_wm;

  ram_trans trans_h;
  
  mailbox #(ram_trans) wm_rf;
  
  virtual ram_if.WR_MON_MP vif;
  
  //
   function new (mailbox #(ram_trans) wm_rf, 
               virtual ram_if.WR_MON_MP vif);
	this.wm_rf = wm_rf;
	this.vif = vif;
 endfunction
 
 task start();
  forever  begin
   monitor();
   wm_rf.put(trans_h);
   $display("Time = %2t\tWMON to REF=%p",$time,trans_h);
   end
 endtask
 
 
 task monitor();
   //sample data from design
   //create trans_h
   @(vif.wr_mon_cb)
   trans_h=new();

   trans_h.wr_addr = vif.wr_mon_cb.wr_addr;
   trans_h.rst = vif.wr_mon_cb.rst;
   trans_h.wr_data = vif.wr_mon_cb.wr_data;
   //trans_h.rd_enb = vif.wr_mon_cb.rd_enb;
   $cast(trans_h.trans_enum_1,{vif.wr_mon_cb.wr_enb,vif.wr_mon_cb.rd_enb});
  endtask
 
endclass