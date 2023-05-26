//Write a code to randomise a queue array in such a way that the array contains only even numbers and must bounded in a range of 50 to 100.

module rando_queue_arr();

class randomization;

rand bit [6:0] dyn [];

constraint size_c {dyn.size()<10;}
constraint rangecons {foreach(dyn[i]) {dyn[i] inside {[50:100]};dyn[i]%2==0;}}

function void post_randomize();
	$display("dyn = %p\n",dyn);
endfunction

endclass

randomization rand_h;

initial begin
 rand_h = new();
 repeat(20) begin
    assert(rand_h.randomize());// with {a<15;});
 end
 #10 $finish;
end

endmodule
