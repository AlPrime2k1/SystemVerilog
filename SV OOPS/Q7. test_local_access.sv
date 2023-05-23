//Q7. Write a code to access the local property of a class from outside the class.

module test_local_access();
    

  class test;
    
  local int a1=6666;
  local int a2=8888;
  int b=55,c;

  function void test_disp_write(int a1);
      $display("Input a1 from function=%0d",a1);           // input from function 
      $display("Local property a1 before writing = %0d",this.a1);
      this.a1=a1;
      $display("Ater writing on class property a1 = %0d",this.a1);      // input from local property a1
  endfunction 

  function void test_disp_read();
      $display("Reading local property a2 = %0d",this.a2);      // input from local property a2
  endfunction 
  endclass

  test t1;
  
  initial 
  begin 
  t1=new();
  t1.test_disp_write(9999);         
  t1.test_disp_read();
  
  t1.c=70;
  $display("CLASS_T1=%p\n",t1);
  end


endmodule
