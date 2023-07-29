///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Company: Scaledge Technology
// Engineer: Kirti Kumar
// 
// Module Name: fifo_tb_top
// Project Name: FIFO Verification
// Description: Top file consisting of base test and interfaces
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
import fifo_pkg::*;
module fifo_tb_top();

  bit clk;

  fifo_base_test test_h;
  
  fifo_if inf(clk);
  
			fifo DUT (.clk(clk),
           .rst(inf.rst),
     .wr_en(inf.wr_enb),
     .wr_data(inf.wr_data),
     .rd_data(inf.rd_data),
     .rd_en(inf.rd_enb),
     .full(inf.full),
     .empty(inf.empty),
	 .almost_empty(inf.almost_empty),
	 .almost_full(inf.almost_full),
	 .half(inf.half));
			
  always
   #5 clk = ~clk;
   
  initial begin
   test_h = new(inf,inf);
   test_h.build_and_start();
   #200 $finish;
  end
  
endmodule
