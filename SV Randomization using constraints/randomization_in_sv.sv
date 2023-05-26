//Randomize a class property without using rand or randc. (try std::randomize() and argument to randomize method)
//Randomisation of a variable such that it generates odd members with difference between current value and previous value equals 4
//Randomisation of dynamic array such that each element is greate than previous.

module randomization_in_sv();
int temp;
class randomization;

rand bit [4:0] a;
rand int x=1;
randc bit [3:0] b;
bit [7:0] c;//=$urandom_range(10,100);
rand bit [8:0] dyn [];
  
constraint test {foreach (dyn[i]) if (i!=0)  dyn[i]>dyn[i-1];}    // dyn each element greater than  prev
constraint size_c {dyn.size()<10;}
constraint oddonly {a%2!=0;}                                      // odd only for a
constraint forx {x-temp==4;x%2!=0;}                               // difference of 4 and odd members

function void std_rand();
  std::randomize(this.c);  
endfunction : std_rand

function void pre_randomize();
temp=x;
endfunction : pre_randomize

function void post_randomize();
 $display("dyn = %p\n",dyn);
 $display("\nc : %0d\t a : %0d\t x : %0d",c,a,x);
endfunction
endclass

randomization rand_h;

initial begin
 rand_h = new();
 repeat(20) 
 begin
    rand_h.std_rand();              // using std::randomize 
    assert(rand_h.randomize());
 end
#10 $finish;
end
endmodule
