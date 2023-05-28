//////////////////////////////////////////////////////////////////////////////////
// Company: Scaledge Technology
// Engineer: Kirti Kumar
// 
// Module Name: ram_sim_rw
// Project Name: RAM Verification
// Description: Testcase for simultaneous read write condition
//////////////////////////////////////////////////////////////////////////////////

`ifndef SIMUL_READ_WRITE
`define SIMUL_READ_WRITE

//description
class sim_rw extends ram_gen;

 
  function new (mailbox #(ram_trans) gen_wd,
                mailbox #(ram_trans) gen_rd);
	super.new(gen_wd,gen_rd);
  endfunction
  
  //description
  
  task start();
    trans_h = new();
    
    trans_h.randomize() with {rst==1;};
    put_trans();
    
    repeat(25) begin
    if (!trans_h.randomize() with {rst==0;trans_enum_1==SIM_RW;});
     $error("RAM_GEN","RANDOMIZATION FAILED");
    put_trans();
    end
 endtask

endclass

`endif
