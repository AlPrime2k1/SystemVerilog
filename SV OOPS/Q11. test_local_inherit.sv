// Q11.  Can we access local property of parent class inside child? 
// If yes how can we restrict to access the parent class property from outside the class

module test_local_inherit();
    

  class parent;
    local int a=123;
    protected int b=789;
    function loc();
      $display("Reading values of local a : %0d and protected b : %0d",a,b);         // method to access local and protected property in child class
    endfunction
  endclass

  class child extends parent;
    int c=222;
    int d=555;
  endclass

  initial 
  begin 
  child c1_h=new();                              // obj of child class
  parent p1_h=new();
  c1_h.loc();

  $display("CHILD= %p \nPARENT=%p",c1_h,p1_h);
  
  end


endmodule
