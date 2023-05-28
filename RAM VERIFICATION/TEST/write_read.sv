///////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Company: Scaledge Technology
// Engineer: Kirti Kumar
// 
// Module Name: write_read
// Project Name: RAM Verification
// Description: Testcase in which firstly 10 write transactions are done then 10 read transactions are done
///////////////////////////////////////////////////////////////////////////////////////////////////////////////

`ifndef WRITE_THEN_READ
`define WRITE_THEN_READ

//description
class write_read extends ram_gen;

 
  function new (mailbox #(ram_trans) gen_wd,
                mailbox #(ram_trans) gen_rd);
	super.new(gen_wd,gen_rd);
  endfunction
  
  //description
  
  task start();
    trans_h = new();
    trans_h.randomize() with {rst==1;};
    put_trans();
    
    repeat(10) begin
    if (!trans_h.randomize() with {rst==0;trans_enum_1==WRITE;})
     $error("RAM_GEN","RANDOMIZATION FAILED");
    put_trans();
    end

    repeat(10) begin
    if (!trans_h.randomize() with {rst==0;trans_enum_1==READ;})
     $error("RAM_GEN","RANDOMIZATION FAILED");
    put_trans();
    end
 endtask

endclass

`endif