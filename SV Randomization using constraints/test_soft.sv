// Using soft keyword and overriding

module test_soft();

class rando;

rand bit [6:0] x,y;

constraint try {soft x>50;}
  
function void post_randomize();
	$display("X:%d\tY:%d",x,y);
endfunction : post_randomize

endclass

rando rand_h;

initial begin
 rand_h = new();
 repeat(20) 
 begin
   assert(rand_h.randomize() with {x<50;});		//inline constraint overriding soft constraint above
 end
 #10 $finish;
end
endmodule
