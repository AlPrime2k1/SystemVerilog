///////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Company: Scaledge Technology
// Engineer: Kirti Kumar
// 
// Module Name: fifo_driver
// Project Name: FIFO Verification
// Description: FIFO driver responsible for driving transaction values to DUT
///////////////////////////////////////////////////////////////////////////////////////////////////////////////


class fifo_drv;

 fifo_trans trans_h;
 
 //mailbox
  mailbox #(fifo_trans) gen_drv;

 //interface
 virtual fifo_if.DRIVER_MP vif;


 function new (mailbox #(fifo_trans) gen_drv, 
               virtual fifo_if.DRIVER_MP vif);
	this.gen_drv = gen_drv;
	this.vif = vif;
 endfunction
 
 task start();
   forever begin
	 
     gen_drv.get(trans_h);
	 send_to_dut();
    end
 endtask
 
 task send_to_dut();
   
   begin
   @(vif.driver_cb)
   trans_h.count();
   vif.driver_cb.rd_enb <= (trans_h.trans_enum_1==READ||trans_h.trans_enum_1==SIM_RW)?1:0;
   vif.driver_cb.wr_enb <= (trans_h.trans_enum_1==WRITE||trans_h.trans_enum_1==SIM_RW)?1:0;
   vif.driver_cb.rst    <= trans_h.rst;
   vif.driver_cb.wr_data<= trans_h.wr_data;
   trans_h.disp();
   trans_h.return_tran_count();
   end
 endtask
 
endclass
