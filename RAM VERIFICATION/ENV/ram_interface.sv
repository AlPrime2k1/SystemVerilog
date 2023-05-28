//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Company: Scaledge Technology
// Engineer: Kirti Kumar
// 
// Module Name: ram_if
// Project Name: RAM Verification
// Description: Interface file consists of clocking blocks required throughout the project and modports for them
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

interface ram_if(input bit clk);

  logic rst;
  
  //write_signals
   logic wr_enb;
   logic [3:0] wr_addr;
   logic [7:0] wr_data;

//read_signals
   logic rd_enb;
   logic [3:0] rd_addr;
   logic [7:0] rd_data;
   
   clocking wr_drv_cb@(posedge clk);
    default input #1 output #1;
	  output rst;
	  output wr_enb, wr_addr, wr_data;
   endclocking
   
   clocking wr_mon_cb@(posedge clk);
    default input #1 output #1;
	  input rst;
	  input wr_enb, rd_enb, wr_addr, wr_data;
   endclocking
   
   clocking rd_drv_cb@(posedge clk);
    default input #1 output #1;
	  input rst;
	  output rd_enb, rd_addr;
   endclocking
   
   clocking rd_mon_cb@(posedge clk);
    default input #1 output #1;
	  input rst;
	  input rd_enb, wr_enb, rd_addr, rd_data;
   endclocking
   
   modport WR_DRV_MP (clocking wr_drv_cb);
   
   modport WR_MON_MP (clocking wr_mon_cb);
   
   modport RD_DRV_MP (clocking rd_drv_cb);
   
   modport RD_MON_MP (clocking rd_mon_cb);
   
 endinterface