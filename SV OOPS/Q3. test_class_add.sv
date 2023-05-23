//Q3. Write a subroutine to add two properties and assign it to third property

module test_class_add();
   int sum; 

  class addition;
    
  int a,b,c;

  function void test_disp(input int a,b,output int c);
    c=a+b;
    $display("SUM=%d",c);
  endfunction 

  function void test_sum(int a,b);
    this.c=a+b;
    $display("SUM of a & b is %0d",c);
  endfunction
  endclass

  addition t1;
  
  initial 
  begin 
  t1=new();
  t1.test_disp(10,9,sum);
  t1.test_sum(14,7);

  $display("CLASS_T1=%p\n",t1);//,t2,t3);
  end


endmodule
