///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Company: Scaledge Technology
// Engineer: Kirti Kumar
// 
// Module Name: back_to_back
// Project Name: FIFO Verification
// Description: Testcase for back to back write read operation 
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

`ifndef BACK_TO_BACK
`define BACK_TO_BACK

//description
class back_to_back extends fifo_gen;

 
  function new (mailbox #(fifo_trans) gen_drv);
	super.new(gen_drv);
  endfunction
  
  //description
  
  task start();
    trans_h = new();
    trans_h.randomize() with {rst==1;};
    put_trans();
    
    repeat(10) begin
    if (!trans_h.randomize() with {rst==0;trans_enum_1==WRITE;})
     $error("FIFO_GEN","RANDOMIZATION FAILED");
    put_trans();
    
	if(!trans_h.randomize() with {rst==0;trans_enum_1==READ;})
		$error("FIFO BACK_TO_BACK","Randomization failed");
	put_trans();
	end

  endtask

endclass

`endif
