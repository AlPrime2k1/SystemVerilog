////////////////////////////////////////////////////////////////////////////////////////////
// Company: Scaledge Technology
// Engineer: Kirti Kumar
// 
// Module Name: ram_rf
// Project Name: RAM Verification
// Description: Reference model which passes actual values to scoreboard for comparison
////////////////////////////////////////////////////////////////////////////////////////////
class ram_rf;
  bit [`DEPTH-1:0]mem[0:`DATA_WIDTH-1];
  ram_trans trans_h1,trans_h2; 
  
  //mailbox
   mailbox #(ram_trans) wm_rf;
   mailbox #(ram_trans) rm_rf;
   mailbox #(ram_trans) rf_sb;
   
   function new (mailbox #(ram_trans) wm_rf,
                 mailbox #(ram_trans) rm_rf,
                 mailbox #(ram_trans) rf_sb);
	this.wm_rf = wm_rf;
	this.rm_rf = rm_rf;
	this.rf_sb = rf_sb;
  endfunction
  
  
  task start();
   forever begin
    wm_rf.get(trans_h1);
    //$display("WMON to REF rf side =%p",trans_h1);
	rm_rf.get(trans_h2);
  //$display("RMON to REF rf side =%p",trans_h2);
	predict_exp_rd_data(trans_h1,trans_h2);
	rf_sb.put(trans_h2);
  $display("REF to SCB =%p",trans_h2);
  $display("MEMORY =%p",mem);
   end
  endtask : start
    
  //description
 task predict_exp_rd_data(ram_trans wr_trans_h, rd_trans_h);
  //trans_h2=new();
  if (wr_trans_h.rst)
  begin
    rd_trans_h.rd_data=0;
    foreach (mem[i]) 
    begin
      mem[i]=0;  
    end
  end

  else
  begin
    if(wr_trans_h.trans_enum_1==WRITE || wr_trans_h.trans_enum_1==SIM_RW)
      mem[wr_trans_h.wr_addr]=wr_trans_h.wr_data;

    if(rd_trans_h.trans_enum_1==READ || rd_trans_h.trans_enum_1==SIM_RW)
      trans_h2.rd_data=mem[rd_trans_h.rd_addr];    
  end
 endtask
  
 endclass
	