///////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Company: Scaledge Technology
// Engineer: Kirti Kumar
// 
// Module Name: back_to_back
// Project Name: RAM Verification
// Description: Testcase in which back to back write-read operation in done
///////////////////////////////////////////////////////////////////////////////////////////////////////////////

`ifndef BACK_TO_BACK
`define BACK_TO_BACK

//description
class back_to_back extends ram_gen;

 
  function new (mailbox #(ram_trans) gen_wd,
                mailbox #(ram_trans) gen_rd);
	super.new(gen_wd,gen_rd);
  endfunction
  
  //description
  
  task start();
    trans_h = new();
    trans_h.randomize() with {rst==1;};
    put_trans();
    
    repeat(25) 
    begin

    if (!trans_h.randomize() with {rst==0;trans_enum_1==WRITE;})
     $error("RAM_GEN","RANDOMIZATION FAILED");
    put_trans();

    if (!trans_h.randomize() with {rst==0;trans_enum_1==READ;})
     $error("RAM_GEN","RANDOMIZATION FAILED");
    put_trans();
    
    end
 endtask

endclass

`endif
