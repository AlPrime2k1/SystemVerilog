///////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Company: Scaledge Technology
// Engineer: Kirti Kumar
// 
// Module Name: fifo_gen
// Project Name: FIFO Verification
// Description: Generator for FIFO with virtual start method to be extended to testcases
///////////////////////////////////////////////////////////////////////////////////////////////////////////////

`ifndef FIFO_GEN_SV
`define FIFO_GEN_SV

//description
class fifo_gen;

  fifo_trans trans_h,trans_h_copy;
  
  //mailbox
  mailbox #(fifo_trans) gen_drv;
    
  //description
  function new (mailbox #(fifo_trans) gen_drv);
	this.gen_drv = gen_drv;
  endfunction
  

 virtual task start();
 endtask

 protected task put_trans();
  trans_h_copy= new trans_h;
  gen_drv.put(trans_h_copy);
 endtask : put_trans
   
endclass

`endif


