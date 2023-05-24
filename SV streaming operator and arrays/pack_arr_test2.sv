/*
Writing to packed array with unpacked array with width
*/
module pack_arr_test2();

bit [7:0]ar[0:3]={16,255,69,82};
integer i;
bit [3:0][7:0] pa;

initial 
begin

foreach(ar[i])
pa[i]=ar[i];        

#10 $finish;
end
initial $monitor("array=%p\npa=%p",ar,pa);

endmodule
