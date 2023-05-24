module pack_arr_test4();

bit ar[0:3][0:7];
bit [31:0] a;

integer i,j,k;

initial 
begin
for(i=0;i<4;i++)
begin
    for(j=0;j<8;j++)                //Filling random values in unpacked array
        ar[i][j]={$random};
end

a={>>{ar}}; 
/*
for(k=0;k<4;k++)
begin

a={>>{ar}};                     //pack the values in unpacked array to reg.
end
#10 $finish;
*/
end

initial $monitor("array=%h\nunpacked array=%p",a,ar);

endmodule
