///////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Company: Scaledge Technology
// Engineer: Kirti Kumar
// 
// Module Name: fifo_scb
// Project Name: FIFO Verification
// Description: Scoreboard for FIFO for comparison between actual and expected values
///////////////////////////////////////////////////////////////////////////////////////////////////////////////

`ifndef FIFO_SB_SV
`define FIFO_SB_SV

//description
class fifo_scb;

 fifo_trans act_trans, exp_trans;
covergroup cvg();
	option.comment="transition for Full flag"; 
	Flag_full: coverpoint exp_trans.full{
			bins trans_full=(0=>1);
			bins trans_full1=(1=>0);
		//	bins high={1};
	}
 	Flag_empty: coverpoint {exp_trans.empty}{
			bins trans_empty=(1=>0);
			bins trans_empty1=(0=>1);

		//	bins high={1};
	}
	Flag_exp_almost_empty: coverpoint {exp_trans.almost_empty}{
			bins trans_almost_empty=(1=>0);
				bins trans_almost_empty_1=(0=>1);
			//bins high={1};
	}
	Flag_exp_almost_full: coverpoint {exp_trans.almost_full}{
			bins trans_almost_full=(0=>1);
			bins trans_almost_full1=(1=>0);
		//	bins high={1};
	} 
	Flag_exp_half: coverpoint {exp_trans.half}{
			bins trans_half=(0=>1);
			bins trans_half1=(1=>0);

			//bins high={1};
	}
 	
    RD_DATA_EXP: coverpoint exp_trans.rd_data{
      bins low_cb={['d00:'d85]}; 
      bins mid_cb={['d86:'d170]};
      bins high_cb={['d171:'d255]};
    }
  
    WR_DATA_EXP: coverpoint exp_trans.wr_data{
     //filling 8bit data
      bins low_cb={['d00:'d85]}; 
      bins mid_cb={['d86:'d170]};
      bins high_cb={['d171:'d255]};
    }
  //writting cross coverage for read and write enable
 
    WR_ENUM_EXP: coverpoint exp_trans.trans_enum_1{
      bins write={WRITE,SIM_RW};
    }

    RD_ENUM_EXP: coverpoint exp_trans.trans_enum_1{
      bins read={READ,SIM_RW};
    }
    EXP_WR_ENUMxWR_DATA: cross WR_DATA_EXP,WR_ENUM_EXP{}
  
    EXP_RD_ENUMxWR_ENUM: cross RD_ENUM_EXP,WR_ENUM_EXP{}

	EXP_RD_ENUMxRD_DATA: cross RD_DATA_EXP,RD_ENUM_EXP{}
  endgroup

 
 
 mailbox #(fifo_trans) ref_scb;
 mailbox #(fifo_trans) mon_scb;
 
 //description
 function new(mailbox #(fifo_trans) ref_scb,
              mailbox #(fifo_trans) mon_scb);
   this.ref_scb = ref_scb;
   this.mon_scb = mon_scb;
   cvg=new();
 endfunction
 
 //description
 task start();
   forever begin
	 ref_scb.get(act_trans);
   //cvg.sample();
	 mon_scb.get(exp_trans);
   //$display("Time = %2t\tRMON to SCB=%p",$time,exp_trans);
   //$display("ACT_TRANS=%p\tEXP_TRANS=%p",act_trans,exp_trans);
   cvg.sample();
	 check_data(act_trans,exp_trans);

   end
 endtask	
 
 //description
 task check_data(fifo_trans act_trans, fifo_trans exp_trans);
  
   $display("------------------------------------------[SCOREBOARD]-----------------------------------------------");
   if(act_trans.rd_data == exp_trans.rd_data)
     $info("-------SUCCESS IN RD DATA-------\n|	 	act_data = %4d		 |	 	exp_data = %4d		 |	 time = %4t  |",act_trans.rd_data,exp_trans.rd_data,$time);
   else
     $error("------DATA_MISMATCH---------\n| act_data = %4d | exp_data = %4d | time = %4t |",act_trans.rd_data,exp_trans.rd_data,$time);
  
   $display("|---------------------------------------------------------------------------------------------------|");

   if(act_trans.full == exp_trans.full)
     $info("-------SUCCESS IN FULL-------\n|		act_val = %1b		 |		 exp_val = %1b		 |	 time = %4t  |",act_trans.full,exp_trans.full,$time);
   else
     $error("--------FULL FLAG_MISMATCH---------\n| act_data = %4d | exp_data = %4d | time = %4t |",act_trans.full,exp_trans.full,$time);

   $display("|---------------------------------------------------------------------------------------------------|");

   if(act_trans.empty == exp_trans.empty)
     $info("-------SUCCESS IN EMPTY-------\n|		 act_val = %1b		 |		 exp_val = %1b		 |	 time = %4t  |",act_trans.empty,exp_trans.empty,$time);
   else
     $error("--------EMPTY FLAG_MISMATCH---------\n| act_data = %4d | exp_data = %4d | time = %4t |",act_trans.empty,exp_trans.empty,$time);

   $display("|---------------------------------------------------------------------------------------------------|");


   if(act_trans.almost_empty == exp_trans.almost_empty)
     $info("-------SUCCESS IN ALMOST EMPTY-------\n|		 act_val = %1b		 |		 exp_val = %1b		 |	 time = %4t  |",act_trans.almost_empty,exp_trans.almost_empty,$time);
   else
     $error("--------ALMOST EMPTY FLAG_MISMATCH---------\n|	act_data = %4d | exp_data = %4d | time = %4t |",act_trans.almost_empty,exp_trans.almost_empty,$time);

   $display("|---------------------------------------------------------------------------------------------------|");

   if(act_trans.almost_full == exp_trans.almost_full)
     $info("-------SUCCESS IN ALMOST FULL-------\n|		 act_val = %1b		 |		 exp_val = %1b		 |	 time = %4t  |",act_trans.almost_full,exp_trans.almost_full,$time);
   else
     $error("--------ALMOST FULL FLAG_MISMATCH---------\n| act_data = %4d | exp_data = %4d | time = %4t |",act_trans.almost_full,exp_trans.almost_full,$time);

   $display("|---------------------------------------------------------------------------------------------------|");

   if(act_trans.half == exp_trans.half)
     $info("-------SUCCESS IN HALF-------\n|		 act_val = %1b		 |		 exp_val = %1b		 |	 time = %4t  |",act_trans.half,exp_trans.half,$time);
   else
     $error("--------HALF FLAG_MISMATCH---------\n| act_data = %4d | exp_data = %4d | time = %4t |",act_trans.half,exp_trans.half,$time);

   $display("|---------------------------------------------------------------------------------------------------|");
  
 endtask
 
endclass :fifo_scb

`endif
