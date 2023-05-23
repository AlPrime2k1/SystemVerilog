// Q14. Write a piece of code with the scenario having multiple child classes and try to override the existing parent method.

module test_override_inherit();

class parent;

	int a=10;
	bit [3:0] b=4'd5;
	int c=123;

	virtual function void fnc();
		$display("This is the function of parent");
	endfunction : fnc
endclass : parent

class child1 extends parent;
	int c=456;

	function void fnc();
		$display("This is function of child 1");
	endfunction : fnc
endclass : child1

class child2 extends parent;
	int x=20;
	bit c=1;
	function void fnc();
		$display("This is function of child 2");
	endfunction : fnc
endclass : child2

class Gchild1 extends child1;
	int c=789;

	function void disp(int c);
		$display("C of function disp is %0d",c);			// method input will be displayed		
		$display("C of class grandchild is %0d",this.c);	// class property will be displayed
		$display("C of class child1 is %0d",super.c);		// super here can only access one level above i.e child1 here
		$display("C of class parent is %0d",parent::c);		// parent class property will be displayed
	endfunction : disp
endclass : Gchild1


parent p_h;
child1 c1_h1;
child2 c2_h1;
Gchild1 gc_h=new();

initial begin

p_h = new();
c1_h1 = new();
c2_h1 = new();

p_h.fnc();																// Initial
c1_h1.fnc();
c2_h1.fnc();
$display("PARENT : %p\nCHILD 1 : %p\nCHILD 2 :%p",p_h,c1_h1,c2_h1);	
$display("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=");
p_h=c1_h1;																// parent poinitng to child 1 handle
p_h.fnc();
$display("PARENT : %p\nCHILD 1 : %p\nCHILD 2 :%p",p_h,c1_h1,c2_h1);	
$display("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=");
p_h=c2_h1;																// parent poinitng to child 2 handle
p_h.fnc();
$display("PARENT : %p\nCHILD 1 : %p\nCHILD 2 :%p",p_h,c1_h1,c2_h1);	
$display("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=");

$display("PARENT : %p\nCHILD 1 : %p\nCHILD 2 :%p",p_h,c1_h1,c2_h1);	
$display("-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=");
gc_h.disp(888);

end
endmodule