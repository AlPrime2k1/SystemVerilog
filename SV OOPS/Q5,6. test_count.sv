//Q6. Write a snippet to track the number of times class object has been created.
//Q5. Write a class having a method to print “hello world”.

module test_count();
  static int count=0;  

  class trial;
    
  function void disp();
    $display("Hello world!");
  endfunction

  function new();
	count++;
  endfunction

  function count_disp();
	$display("Count=%2d",count);
  endfunction
  endclass

  trial t1;  
  
  initial  
  begin
    repeat($urandom_range(20,30)) 
    begin
      t1=new();			// to create new object
	end
	t1.disp();
	t1.count_disp();	// to count and display the count
	end
endmodule
