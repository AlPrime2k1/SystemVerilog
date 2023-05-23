// Q12. Write a snippet constituting a parent class, a child class with set of different properties 
//with a scenario of having one property as in common to both the classes.
//now write a method inside child class, to access the parent property i.e. the property which is common to both the classes.
//Can we give value to parent property via child handle????...If yes then how?

// Can we access local property of parent class inside child? 
// If yes how can we restrict to access the parent class property from outside the class 

module test_common_inherit();
  class parent;
    int a=10;
    int b=20;
    int e=79;
  endclass

  class child extends parent;
    int c=100;
    int d=200;
    int a=5;            // common property to both parent and child

    function void disp();
      $display("parent a value is displayed =%0d",super.a); 
    endfunction

    function void write(int X);
      //parent::a=X;  
      this.e=X;                  // method inside child to access parent property 
    endfunction
  endclass

  initial 
  begin 
  parent p1_h=new();                             // obj of parent class
  child c1_h=new();                              // obj of child class

  //$display("Child access prop in child class =%0d",c1_h.a);
  //c1_h.disp();
  $display("BEFORE writing from child to parent =%0d",c1_h.e);   //def value of e as declared in parent
  p1_h=c1_h;
  c1_h.write(777);
  $display("AFTER writing from child to parent =%0d",p1_h.e);    // value of e updated due to child method 'write'
  c1_h.b=369;                                                   // changing value of non common prop of parent from child
  $display("Changing parent prop from child class =%0d",p1_h.b);

  $display("CHILD= %p",c1_h);
  $display("PARENT= %p",p1_h);
  
  end


endmodule
