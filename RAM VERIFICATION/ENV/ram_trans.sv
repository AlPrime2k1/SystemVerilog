//////////////////////////////////////////////////////////////////////////////////
// Company: Scaledge Technology
// Engineer: Kirti Kumar
// 
// Module Name: ram_trans
// Project Name: RAM Verification
// Description: Transaction class for ram verification 
//////////////////////////////////////////////////////////////////////////////////

`ifndef RAM_TRANS_SV
`define RAM_TRANS_SV

typedef enum bit [1:0] {IDLE,READ,WRITE,SIM_RW} trans_enum;

class ram_trans;
   static int rd_tran_count,wr_tran_count;
   rand trans_enum trans_enum_1;
   rand bit rst;

  randc bit [`ADDR_WIDTH-1:0] wr_addr;
  rand bit [`DATA_WIDTH-1:0] wr_data;

  //read_signals
  //rand bit rd_enb;
  randc bit [`ADDR_WIDTH-1:0] rd_addr;
  bit [`DATA_WIDTH-1:0] rd_data;
   
   //default constraint
  //constraint ENB {soft wr_enb==1'b1; soft rd_enb==1'b1;}
   constraint ENABLE {trans_enum_1>=1;}
   //constraint range {wr_addr inside {[1:10]};}
   constraint range {wr_addr<10;wr_addr>0;}
   constraint range1 {rd_addr<10;}
 
   //constraint range1 {rd_addr inside {[1:10]};}
  //add static variables to record no. of write and read transaction
  function void count();

   if((trans_enum_1==READ || trans_enum_1==SIM_RW) && rst !=1)
      rd_tran_count++;
   if((trans_enum_1==WRITE || trans_enum_1==SIM_RW) && rst !=1)
      wr_tran_count++;
  endfunction : count

  
  //add custom print/display method to print transaction attributes


  task disp();
   
   $display("---------------------------------------------------");
   $display("|    Name     |     Data         |       Time      |");
   $display("---------------------------------------------------");
   $display("|    RST       |    %6d        |      %4t     |",this.rst,$time);
   $display("|    ENUM      |    %6p        |      %4t     |",this.trans_enum_1,$time);
   $display("|    WR_ADDR   |    %6d        |      %4t     |",this.wr_addr,$time);  
   $display("|    WR_DATA   |    %6d        |      %4t     |",this.wr_data,$time);
   $display("\t------------------------------------------");
   $display("|    RD_ADDR   |    %6d        |      %4t     |",this.rd_addr,$time);
   $display("|    RD_DATA   |    %6d        |      %4t     |",this.rd_data,$time);
   $display("-----------------------------------------------");
  endtask

  task return_tran_count();
   $display("WR_COUNT=%0d\tRD_COUNT=%0d",wr_tran_count,rd_tran_count);
   $display("\n");
  endtask

endclass


`endif
