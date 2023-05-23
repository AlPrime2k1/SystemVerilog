// Q15. Write a code to add some extra behaviour/line_of_code in the exiting parent method through child class.

module test_virtual();

class parent;
	virtual function void xyz();
		$display("Parent Method");
	endfunction
endclass

class child extends parent;
	function void abc();
		super.xyz();
		$display("Child Method");
	endfunction
endclass

parent p_h;
child c_h;

initial begin
p_h = new();
c_h = new();

p_h.xyz();
$display("-=-=-=-=-=-=-");
c_h.abc();
$display("-=-=-=-=-=-=-");

end
endmodule