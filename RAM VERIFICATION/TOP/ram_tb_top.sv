///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Company: Scaledge Technology
// Engineer: Kirti Kumar
// 
// Module Name: ram_tb_top
// Project Name: RAM Verification
// Description: Top file incluing interface and base test 
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
import ram_pkg::*;
module ram_tb_top();

  bit clk;

  ram_base_test test_h;
  
  ram_if inf(clk);
  
			ram DUT (.clk(clk),
           .rst(inf.rst),
     .wr_enb(inf.wr_enb),
     .wr_addr(inf.wr_addr),
     .wr_data(inf.wr_data),
     .rd_enb(inf.rd_enb),
     .rd_addr(inf.rd_addr),
     .rd_data(inf.rd_data));
			
  always
   #5 clk = ~clk;
   
  initial begin
   test_h = new(inf,inf,inf,inf);
   test_h.build_and_start();
   #200 $finish;
  end
  
endmodule