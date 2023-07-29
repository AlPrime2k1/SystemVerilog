///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Company: Scaledge Technology
// Engineer: Kirti Kumar
// 
// Module Name: simultaneous
// Project Name: FIFO Verification
// Description: Testcase for simultaneous write read operation 
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

`ifndef SIMULTANEOUS
`define SIMULTANEOUS

//description
class simultaneous extends fifo_gen;

 
  function new (mailbox #(fifo_trans) gen_drv);
	super.new(gen_drv);
  endfunction
  
  //description
  
  task start();
    trans_h = new();
    trans_h.randomize() with {rst==1;};
    put_trans();
    
    repeat(10) begin
    if (!trans_h.randomize() with {rst==0;trans_enum_1==SIM_RW;})
     $error("FIFO_GEN","RANDOMIZATION FAILED");
    put_trans();
    end
  endtask

endclass

`endif
