////////////////////////////////////////////////////////////////////////////////////////
// Company: Scaledge Technology
// Engineer: Kirti Kumar
// 
// Module Name: ram_sb
// Project Name: RAM Verification
// Description: Scoreboard for the project which compares actual and expected outputs
////////////////////////////////////////////////////////////////////////////////////////
`ifndef RAM_SB_SV
`define RAM_SB_SV

//description
class ram_sb;

 ram_trans act_trans, exp_trans;
 
 mailbox #(ram_trans) rf_sb;
 mailbox #(ram_trans) rm_sb;
 ///////////////////////////////////////////////////////

covergroup cvg();

RD_ADDR: coverpoint act_trans.rd_addr{
  bins low={['d0:'d3]};
  bins mid={['d4:'d6]};
  bins high={['d7:'d10]};
}

RD_DATA: coverpoint act_trans.rd_data{
   //filling 8bit data
      bins low_cb={['d00:'d85]}; 
      bins mid_cb={['d86:'d170]};
      bins high_cb={['d171:'d255]};
          }

WR_ENUM: coverpoint act_trans.trans_enum_1{
      bins write={WRITE,SIM_RW};
          }

RD_ENUM: coverpoint exp_trans.trans_enum_1{
      bins read={READ,SIM_RW};
          }

RD_DATAxRD_ENUM: cross RD_DATA,RD_ENUM{}

endgroup : cvg
////////////////////////////////////////////////////////
 //description
 function new(mailbox #(ram_trans) rf_sb,
              mailbox #(ram_trans) rm_sb);
   
   this.rf_sb = rf_sb;
   this.rm_sb = rm_sb;
   cvg=new();
 endfunction
 
 //description
 task start();
   forever begin
	 rf_sb.get(act_trans);

	 rm_sb.get(exp_trans);
   //$display("Time = %2t\tRMON to SCB=%p",$time,exp_trans);
   //$display("ACT_TRANS=%p\tEXP_TRANS=%p",act_trans,exp_trans);
   cvg.sample();
	 check_data(act_trans,exp_trans);

   end
 endtask	
 
 //description
 task check_data(ram_trans act_trans, ram_trans exp_trans);
  
  $display("-----------[SCOREBOARD]----------");
   if(act_trans.rd_data == exp_trans.rd_data)
     $info("-------SUCCESS-------\n| act_data = %4d | exp_data = %4d | time = %4t |",act_trans.rd_data,exp_trans.rd_data,$time);
   else
     $error("--------DATA_MISMATCH---------\n| act_data = %4d | exp_data = %4d | time = %4t |",act_trans.rd_data,exp_trans.rd_data,$time);
  $display("-----------------------------------------------------------------------------------");
  
 endtask
 
endclass :ram_sb

`endif