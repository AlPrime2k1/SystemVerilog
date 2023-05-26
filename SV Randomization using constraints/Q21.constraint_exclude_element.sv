//Q21. Write a piece of code to constraint a variable in such a way that the value of the variable must not contain 10,20
//and it should not fall in the range of 50 and 65.

/*
not in range 50 to 65
must not contain 10,20
*/

module constraint_exclude_element();
int i,j;
class rando;

//rand int x,y;
rand bit [6:0]x;
  
constraint range {!(x  inside{[50:65]});x!=10;x!=20;}

function void post_randomize();
	$display("X:%d",x);
endfunction : post_randomize

endclass

rando rand_h;

initial begin
 rand_h = new();
 repeat(2) assert(rand_h.randomize());

 $display("=-=-Rand mode OFF-=-=");
 rand_h.x.rand_mode(0);
 repeat(3) assert(rand_h.randomize());

 $display("=-=-Rand mode ON-=-=",);
 rand_h.x.rand_mode(1);
 repeat(15) assert(rand_h.randomize());
 
 #10 $finish;
end

endmodule