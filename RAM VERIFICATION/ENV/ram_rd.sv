//////////////////////////////////////////////////////////////////////////////////////////////
// Company: Scaledge Technology
// Engineer: Kirti Kumar
// 
// Module Name: ram_rd
// Project Name: RAM Verification
// Description: Read driver used to drive values taken from the generator and pass them to DUT
///////////////////////////////////////////////////////////////////////////////////////////////
class ram_rd;

 ram_trans trans_h;
 
 //mailbox
  mailbox #(ram_trans) gen_rd;

 //interface
 virtual ram_if.RD_DRV_MP vif;


 function new (mailbox #(ram_trans) gen_rd, 
               virtual ram_if.RD_DRV_MP vif);
	this.gen_rd = gen_rd;
	this.vif = vif;
 endfunction
 
 task start();
   forever begin
     gen_rd.get(trans_h);
	   send_to_dut();
    end
 endtask
 
 task send_to_dut();
  @(vif.rd_drv_cb)
  trans_h.count();
   vif.rd_drv_cb.rd_enb <= (trans_h.trans_enum_1==READ||trans_h.trans_enum_1==SIM_RW)?1:0;
   vif.rd_drv_cb.rd_addr<=trans_h.rd_addr;

   $info("-------------[Read_Driver]-------------");
   //$display("READ DR MAIL=%p",trans_h);
   //trans_h.return_tran_count();
   trans_h.disp();
   trans_h.return_tran_count();
   $display("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-",);
 endtask
 
endclass