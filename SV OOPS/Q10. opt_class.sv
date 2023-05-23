// Q10. Optimize the below code

module opt_class();

class MEGA;
int a,b;
byte c;
function xyz();
	$display("XYZ in MEGA");
endfunction

function write();
	$display("WRITE TASK");
endfunction

function read();
	$display("READ FUNCTION");
endfunction
endclass


//////////////////////////
class A;
int a,b;
MEGA X;

function void dispa();
$display(X.xyz);
endfunction

endclass
/////////////////////////

class B;
int a;
byte c;
MEGA Y;
function void dispb();
$display(Y.xyz);
endfunction

task writeb();
$display(Y.write);
endtask

endclass
////////////////////////
class C;
int a;
MEGA Z;
function void dispc();
$display(Z.xyz);
endfunction

function readc();
$display(Z.read);
endfunction
endclass

initial begin
A A1;
B B1;
C C1;

A1=new();
B1=new();
C1=new();
A1.a=10;
A1.b=50;
$display("A=%d\nB=%d",A1.a,A1.b);
A1.dispa();


B1.a=16;
B1.c=797;
$display("A=%d\nC=%d",B1.a,B1.c);
B1.dispb();
B1.writeb();

C1.a=555;
$display("A=%d",C1.a);
C1.dispc();
C1.readc();
end

endmodule