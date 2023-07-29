///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Company: Scaledge Technology
// Engineer: Kirti Kumar
// 
// Module Name: write_read
// Project Name: FIFO Verification
// Description: Testcase for multiple write then multiple read operation
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

`ifndef WRITE_THEN_READ
`define WRITE_THEN_READ

//description
class write_read extends fifo_gen;

 
  function new (mailbox #(fifo_trans) gen_drv);
	super.new(gen_drv);
  endfunction
  
  //description
  
  task start();
    trans_h = new();
    trans_h.randomize() with {rst==1;};
    put_trans();
    
    repeat(9) begin
    if (!trans_h.randomize() with {rst==0;trans_enum_1==WRITE;})
     $error("FIFO_GEN","RANDOMIZATION FAILED");
    put_trans();
    end

    repeat(9) begin
    if (!trans_h.randomize() with {rst==0;trans_enum_1==READ;})
     $error("FIFO_GEN","RANDOMIZATION FAILED");
    put_trans();
    end
	
 endtask

endclass

`endif
