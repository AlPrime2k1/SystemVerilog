//Q. Randomize an int such that it has ten consectuive ones always.
//Q. Randomize an int and count the number of ones it has.

module consecutive_ones();
bit [9:0] a=10'b11111_11111;
int count;

class rando;
rand int b,pos;
rand int x;

constraint range_a{pos inside {[0:21]};}
constraint cons_1 {b==a<<pos;solve pos before b;}   // b has 10 consecutive ones left shifted randomly by pos positions
                           

function void pre_randomize();
  count=0;
endfunction
 
function void post_randomize();
	foreach(x[i]) 
  begin
    if (x[i]==1)
    begin
      count++;                          // x has random number of ones which is being counted by count variable
      
    end
  end
  $display("B:%b\tPOSITION:%0d\nX:%b\tCOUNT:%0d",b,pos,x,count);
  $display("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-");
  
endfunction : post_randomize
endclass

rando rand_h;

initial begin
 rand_h = new();
 repeat(5) 
 begin
   assert(rand_h.randomize());
 end
 #10 $finish;
end
endmodule