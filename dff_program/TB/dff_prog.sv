program dff_prog (output reg clk,output reg rst,output reg d,input wire q);

initial 
begin
clk=1'b0;
forever #5 clk=~clk;
end

initial 
begin

@(posedge clk) 
d=1;
rst=1;

@(posedge clk)
rst=0; 
d=1;

@(posedge clk)
rst=0; 
d=0;

@(posedge clk)
rst=0; 
d=1;

//@(posedge clk) $finish;

end
endprogram