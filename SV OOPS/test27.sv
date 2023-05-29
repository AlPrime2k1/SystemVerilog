// Object assignment

module top();

class packet;

bit [3:0] x;

function new (int i=5);

x = 1;

endfunction: new

function void display();

$display ("\n x = %0d",x); 

endfunction

endclass: packet

packet p1, p2=new();

initial begin

p1 = new(); 
p1.x = 7;

p1 = p2;
p2.x = 10;

p1.display();

end

endmodule
