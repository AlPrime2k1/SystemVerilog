// Q13. Analyse below code, write your expectation. Run the code and observe the actuals.

module test_override();

class parent;
	virtual function void xyz();
		$display("Parent Method");
	endfunction
endclass

class child extends parent;
	function void xyz();
		$display("Child Method");
	endfunction
endclass

parent p_h;
child c_h;

initial begin
p_h = new();
c_h = new();
p_h.xyz();
c_h.xyz();
p_h = c_h;		// overridden due to virtual parent method
p_h.xyz();		// Child method printed due to polymorphism
end
endmodule