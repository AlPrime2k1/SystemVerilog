///////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Company: Scaledge Technology
// Engineer: Kirti Kumar
// 
// Module Name: fifo_if
// Project Name: FIFO Verification
// Description: Interfaces used in the FIFO project from driver to DUT and DUT to monitor
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
`include "fifo_defines.sv"

interface fifo_if(input bit clk);

  logic rst;
  
  //write_signals
   logic wr_enb;
   logic [`DATA_WIDTH-1:0] wr_data;

//read_signals
   logic rd_enb;
   logic [`DATA_WIDTH-1:0] rd_data;

//flags
   logic full,empty,almost_full,almost_empty,half;

   clocking driver_cb@(posedge clk);
    default input #1 output #1;
	  output rst;
	  output wr_enb, wr_data;
	  output rd_enb;
	  //input full, empty, almost_full, almost_empty, half; 

   endclocking
   
   clocking monitor_cb@(posedge clk);
    default input #1 output #1;
	  input rst;
	  input wr_enb, rd_enb, rd_data, wr_data;
	  input full, empty, almost_full, almost_empty, half; 
   endclocking
   
     
   modport DRIVER_MP (clocking driver_cb);
   
   modport MONITOR_MP (clocking monitor_cb);
   
     
 endinterface : fifo_if
