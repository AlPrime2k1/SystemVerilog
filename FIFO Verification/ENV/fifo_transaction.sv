///////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Company: Scaledge Technology
// Engineer: Kirti Kumar
// 
// Module Name: fifo_trans
// Project Name: FIFO Verification
// Description: Transaction class for fifo
///////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef FIFO_TRANS_SV
`define FIFO_TRANS_SV

typedef enum bit [1:0] {IDLE,READ,WRITE,SIM_RW} trans_enum;

class fifo_trans;
   static int rd_tran_count,wr_tran_count;				// Variables for transaction count

   rand trans_enum trans_enum_1;						// Enum for IDLE,READ,WRITE,SIM
   rand bit rst;

  //write_signals
   rand bit [`DATA_WIDTH-1:0] wr_data;

  //read_signals
   bit [`DATA_WIDTH-1:0] rd_data;

  //flags
   bit full, almost_full, empty, almost_empty, half;
   
  //default constraint
   constraint ENABLE {trans_enum_1>=1;}
      
   function void count();
    if((trans_enum_1==READ || trans_enum_1==SIM_RW) && rst==0)				// Function to count transactions
      rd_tran_count++;
    if((trans_enum_1==WRITE || trans_enum_1==SIM_RW) && rst==0)
      wr_tran_count++;
   endfunction : count


  task disp();
    $display("\t\t\tDRIVER\t\t\t");
  
    $display("-------------------------------------------------------");

    $display("|    Name          |     Data         |       Time    |");
    $display("-------------------------------------------------------");				
    $display("|    RST           |    %6d        |      %4t     |",this.rst,$time);
    $display("|    ENUM          |    %6p        |      %4t     |",this.trans_enum_1,$time);
    $display("|    WR_DATA       |    %6d        |      %4t     |",this.wr_data,$time);

    $display("-------------------------------------------------------");
 
  endtask

  
  task return_tran_count();
   $info("WR_COUNT=%0d\tRD_COUNT=%0d",wr_tran_count,rd_tran_count);
   $display("\n");
  endtask

endclass

`endif
