module pack_arr_test3();

bit ar[0:3][7:0];
integer i,j,k;
bit [3:0][7:0] pa;

initial 
begin
for(i=0;i<4;i++)
begin
    for(j=0;j<8;j++)                // Filling random values in unpacked array
        ar[i][j]={$random};
end
$display("UNPACKED ARRAY : %0p",ar);

for(k=0;k<4;k++)
begin
pa[k]= {>>{ar[k]}};                 // assigning unpacked array data with streaming operator to packed array 
$display("%0h",pa[k]);
end
#10 $finish;
end
initial $monitor("array=%h",pa);

endmodule
