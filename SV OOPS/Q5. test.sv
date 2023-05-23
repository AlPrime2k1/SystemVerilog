//Q5. Write a class having a method to print "hello world". Call this method with and without creating object of class.



module test();
    

  class trial;
    
  
  function void disp();
    $display("Hello world!");
  endfunction
  
  endclass

  
  
  initial 
  begin 
  trial t1;
  
  t1.disp();    //without making object
  
  t1=new();
  t1.disp();    //after making object
  end


endmodule
