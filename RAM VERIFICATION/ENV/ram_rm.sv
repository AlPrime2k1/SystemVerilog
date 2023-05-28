///////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Company: Scaledge Technology
// Engineer: Kirti Kumar
// 
// Module Name: ram_rm
// Project Name: RAM Verification
// Description: Read monitor which takes in values from DUT and passes them to reference model and scoreboard
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
class ram_rm;

  ram_trans trans_h;
  
  mailbox #(ram_trans) rm_rf;
  mailbox #(ram_trans) rm_sb;
  
  virtual ram_if.RD_MON_MP vif;
  
   function new (mailbox #(ram_trans) rm_rf, 
                 mailbox #(ram_trans) rm_sb, 
                 virtual ram_if.RD_MON_MP vif);
	this.rm_rf = rm_rf;
	this.rm_sb = rm_sb;
	this.vif = vif;
 endfunction
 
 task start();
  forever  begin
   monitor();
   rm_rf.put(trans_h);
   //$display("Time = %2t\tRMON to REF=%p",$time,trans_h);
   rm_sb.put(trans_h);
   
   end
 endtask
 
 
 task monitor();
   //create trans_h
   @(vif.rd_mon_cb)
   trans_h=new();
   trans_h.rd_addr = vif.rd_mon_cb.rd_addr;
   //trans_h.rd_enb = vif.rd_mon_cb.rd_enb;
   trans_h.rd_data = vif.rd_mon_cb.rd_data;
   $cast(trans_h.trans_enum_1,{vif.rd_mon_cb.wr_enb,vif.rd_mon_cb.rd_enb});

 endtask
 
endclass