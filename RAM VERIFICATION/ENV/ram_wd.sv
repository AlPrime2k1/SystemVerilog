//////////////////////////////////////////////////////////////////////////////////
// Company: Scaledge Technology
// Engineer: Kirti Kumar
// 
// Module Name: ram_wd
// Project Name: RAM Verification
// Description: Read driver used to drive values to DUT through virtual interface
//////////////////////////////////////////////////////////////////////////////////
class ram_wd;

 ram_trans trans_h;
 
 //mailbox
  mailbox #(ram_trans) gen_wd;

 //interface
 virtual ram_if.WR_DRV_MP vif;


 function new (mailbox #(ram_trans) gen_wd, 
               virtual ram_if.WR_DRV_MP vif);
	this.gen_wd = gen_wd;
	this.vif = vif;
 endfunction
 
 task start();
   forever
   begin
     gen_wd.get(trans_h);
	   send_to_dut();
   end
 endtask
 
 task send_to_dut();
   //drive data to design
   @(vif.wr_drv_cb)
   //trans_h.count();
   vif.wr_drv_cb.wr_enb <= (trans_h.trans_enum_1==WRITE|| trans_h.trans_enum_1==SIM_RW)?1:0;
   vif.wr_drv_cb.wr_addr<=trans_h.wr_addr;
   vif.wr_drv_cb.rst<=trans_h.rst;
   vif.wr_drv_cb.wr_data<=trans_h.wr_data;

   $info("-------------[Write_Driver]-------------");
   //$display("WRITE DR MAIL=%p",trans_h);
   trans_h.disp();
   //trans_h.return_tran_count();
 endtask
 
endclass