module dff_top();
reg clk,rst,d;
wire q;

dff_prog  PROG(clk,rst,d,q);
dff_design  DUT(clk,rst,d,q);


initial #150 $finish;

endmodule