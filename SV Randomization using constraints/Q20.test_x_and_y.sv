//Q20. Write a class with two variables ‘x’ and ‘y’, constraint the randomisation of these variables as follows:
//• If the value of x is ranging from 5 to 10 then the value of y should be less than 20.
//• If the value of x is ranging in between 20 to 40 then the value of y should be greater than 30 and less than 70 
//otherwise the value of y should be greater than 70.

/*
5<x<10 -------- y<20
20<x<40 -------- 30<y<70
else ------------y>70
*/

module test_x_and_y();

class rando;

//rand int x,y;
rand bit [6:0] x,y;

constraint both {if(x>5&&x<10) y<20; else if (x>20&&x<40) y>30&&y<70; else y>70;}

function void post_randomize();
	$display("X:%d\tY:%d",x,y);
endfunction : post_randomize

endclass

rando rand_h;

initial begin
 rand_h = new();
 repeat(20) 
 begin
   assert(rand_h.randomize());
 end
 #10 $finish;
end
endmodule
