// Q10. Optimize the below code

module opt_class();

class parent;
int a=10;
function xyz();
	$display("XYZ function from parent class");
endfunction
endclass
////////////////////////////////
class A extends parent;
int b=20;
endclass : A
////////////////////////////////
class B extends parent;
byte c=30;
task write();
	$display("write task in class B");
endtask
endclass : B
////////////////////////////////
class C extends parent;
function read();
	$display("read function in class C");
endfunction
endclass : C
////////////////////////////////
initial begin
A A1=new();
B B1=new();
C C1=new();

$display("A:%p\nB:%p\nC:%p\n",A1,B1,C1);		// displying properties of classes A,B and C
B1.write();										// using method of class B
C1.read();										// Using method of class C

A1.xyz();
B1.xyz();										// Using method inherited from parent class
C1.xyz();
end

endmodule