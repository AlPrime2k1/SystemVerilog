////////////////////////////////////////////////////////////////////////////////////////////
// Company: Scaledge Technology
// Engineer: Kirti Kumar
// 
// Module Name: ram_gen
// Project Name: RAM Verification
// Description: Generator having task support for putting into mailbox.
//              Testcases can be extended from this class and start function can be made
////////////////////////////////////////////////////////////////////////////////////////////

`ifndef RAM_GEN_SV
`define RAM_GEN_SV

//description
class ram_gen;

  ram_trans trans_h,trans_h_copy;
  
  //mailbox
  mailbox #(ram_trans) gen_wd;
  mailbox #(ram_trans) gen_rd;
  
  //description
  function new (mailbox #(ram_trans) gen_wd,
                mailbox #(ram_trans) gen_rd);
	this.gen_wd = gen_wd;
	this.gen_rd = gen_rd;
  endfunction
  

 virtual task start();
 endtask

 protected task put_trans();
  trans_h_copy= new trans_h;
  gen_wd.put(trans_h_copy);
  gen_rd.put(trans_h_copy);
 endtask : put_trans
   
endclass

`endif


