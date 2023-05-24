// System Verilog program to write data into a structure with streaming operator and read the data from the structure back to register.

module streaming_op();
reg [11:0] result;
reg [3:0] ar [0:2]={4'hA,4'hB,4'hC};//,4'hD,4'hE,4'hF,4'h0};    
typedef struct{
                bit [3:0] addr;
                bit [7:0] data;}packet;
packet s1;           
 
initial begin   
s1={>>{ar}};                //forward order
$display("S1 : %h\t%h",s1.addr,s1.data);

{>>{result}}=s1;
$display("Unpack result : %h",result);
#10

s1.addr = {<<{ar[0]}};      //reverse order
s1.data={<<{ar[1:2]}}; 

$display("S1 : %h\t%h",s1.addr,s1.data);

{>>{result}}=s1;
$display("Unpack result : %h",result);
#10 $finish;
end
//initial $monitor("s1=%0p\t result=%p",s1,result);

endmodule
