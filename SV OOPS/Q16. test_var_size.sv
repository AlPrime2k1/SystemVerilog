// Q16. Write a class with one variable having default size 8. Take four objects of this class with below conditions:
//1. Two objects with size remain 8
//2. Third object with size 10
//3. Fourth object with size 16
//`define size 8

module test_var_size();

class parent #(int size=8);
	int a=size;
endclass

initial begin

parent p_h1=new();
parent p_h2=new();
parent #(10)p_h3=new();
parent #(16)p_h4=new();

$display("%p\t%p\t%p\t%p",p_h1,p_h2,p_h3,p_h4);

end
endmodule
/*
/*
P_h=new[4];
P_h[0]=new();
P_h[1]=new();

foreach (P_h[i]) begin
	P_h[i]=new();
	
	if(i==1 || i==0)
		//P_h[i].xyz(0);
		P_h.a=8;
	else if(i==2)
		//P_h[i].xyz(2);
		P_h.a=10;
	else
		//P_h[i].xyz(8);
		P_h.a=16;
end
*/
//P_h.a[1]=16;
//foreach(P_h[i])

//foreach(P_h[i])
//P_h[0].xyz(10);
//P_h[1]
/*
P_h[i].xyz(0);
P_h[i].xyz(2);
P_h[i].xyz(8);
*/

