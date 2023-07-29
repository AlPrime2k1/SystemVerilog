///////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Company: Scaledge Technology
// Engineer: Kirti Kumar
// 
// Module Name: fifo_ref
// Project Name: FIFO Verification
// Description: Reference model to generate actual values for comapison in scoreboard
///////////////////////////////////////////////////////////////////////////////////////////////////////////////

class fifo_ref;
  bit [`DATA_WIDTH-1:0]mem[0:`DEPTH-1];
  fifo_trans trans_h1; 
  
  //ref model//
   logic [`PTR-1:0] wr_pt=0;
   logic [`PTR-1:0] rd_pt=0;
   integer i;

  //mailbox
   mailbox #(fifo_trans) mon_ref;
   mailbox #(fifo_trans) ref_scb;
   
   function new (mailbox #(fifo_trans) mon_ref,
                 mailbox #(fifo_trans) ref_scb);
	this.mon_ref = mon_ref;
	this.ref_scb = ref_scb;
  endfunction
  
  
  task start();
   forever begin
    mon_ref.get(trans_h1);
   
	predict_exp_rd_data(trans_h1);

	ref_scb.put(trans_h1);
  //$display("REF to SCB =%p",trans_h2);
  //$display("MEMORY =%p",mem);
   end
  endtask : start
    
  //description
 task predict_exp_rd_data(fifo_trans trans_h);
  //trans_h2=new();
  if (trans_h.rst)
  begin
    trans_h.rd_data=0;
	wr_pt=0;
	rd_pt=0;
    foreach (mem[i]) 
    begin
      mem[i]=0;  
    end
  end

  else
  begin
    if((trans_h.trans_enum_1==WRITE || trans_h.trans_enum_1==SIM_RW) && !trans_h.full)
	  begin
      mem[wr_pt[2:0]]=trans_h.wr_data;
	  wr_pt++;
	  end

    if((trans_h.trans_enum_1==READ || trans_h.trans_enum_1==SIM_RW) && !trans_h.empty)
	  begin
      trans_h.rd_data=mem[rd_pt[2:0]];
	  mem[rd_pt]='bz;
	  rd_pt++;
	  end
  end

  trans_h.full=(wr_pt-rd_pt==8)?1:0;
  trans_h.empty=(wr_pt==rd_pt)?1:0;
  trans_h.almost_full=(wr_pt-rd_pt>=6 && !trans_h.full)?1:0;
  trans_h.almost_empty=(wr_pt-rd_pt<=2 && !trans_h.empty)?1:0;
  trans_h.half=(wr_pt-rd_pt==4)?1:0;
 endtask
  
 endclass
	
