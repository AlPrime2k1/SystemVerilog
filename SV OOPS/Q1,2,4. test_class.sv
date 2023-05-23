//Q1. Write a snippet for a class with three data members of int type and display the value of the properties.
//Q2. Write a snippet for a class ,take multiple objects assign values to the objects and delete one of the objects before finish.
//Q4. Write a piece of code with class having some properties and take values from user through method.

module test_class();
    

  class test;
    
  int a,b=55,c;
  function void test_disp(int a=10,b,c);
    $display("A=%0d,B=%0d,C=%0d",a,b,c); 
  endfunction 
  endclass

  test t1,t2,t3;
  
  initial 
  begin 
  t1=new();
  t1.test_disp(,9,8);

  t2=new();
  t3=new();
  t2.a=68;
  t3.b=69;
  t2.c=70;

  t3=null;

  $display("CLASS_T1=%p\nCLASS_T2=%p\nCLASS_T3=%p",t1,t2,t3);
  end


endmodule
