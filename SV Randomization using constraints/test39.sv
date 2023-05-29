// Testing constraints with interrelations

module randomization_in_sv();

class randomization;

rand logic [15:0] a,b,c;

constraint c_abc {a<c;b==a; c< 30;b > 25;}
endclass

randomization rand_h;

initial begin
 rand_h = new();
 repeat(20) 
 begin
   
    assert(rand_h.randomize());
    $display("a=%0d\tb=%0d\tc=%0d",rand_h.a,rand_h.b,rand_h.c);
 end
#10 $finish;
end
endmodule
