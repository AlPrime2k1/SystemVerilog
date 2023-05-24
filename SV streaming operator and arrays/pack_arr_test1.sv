/*
Packed array write operaton to understand how it works
*/
module pack_arr_test1();

bit[3:0][2:0][7:0] arr;
initial begin
arr={96{1'b1}};

#10 arr[3]=24'hfedcba;

#10 arr[2][2]=8'hcd;

#10 $finish;
end
initial $monitor("array=%h",arr);

endmodule

