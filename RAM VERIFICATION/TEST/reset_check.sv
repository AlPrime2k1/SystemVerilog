///////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Company: Scaledge Technology
// Engineer: Kirti Kumar
// 
// Module Name: reset_check
// Project Name: RAM Verification
// Description: Testcase in which firstly 10 write transactions are done then 10 read transactions are done
///////////////////////////////////////////////////////////////////////////////////////////////////////////////

`ifndef RESET_CHECK
`define RESET_CHECK

//description
class reset_check extends ram_gen;

 
  function new (mailbox #(ram_trans) gen_wd,
                mailbox #(ram_trans) gen_rd);
	super.new(gen_wd,gen_rd);
  endfunction
  
  //description
  
  task start();
    trans_h = new();
    
    repeat(10) begin
    if (!trans_h.randomize() with {rst==1;trans_enum_1==SIM_RW;})
     $error("RAM_GEN","RANDOMIZATION FAILED");
    put_trans();
    end

  endtask

endclass

`endif
