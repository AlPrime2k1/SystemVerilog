//Q9. Write one class having sub object of another class. Perform shallow copy and observe the results.

module test_shallow_copy();
    

  class sub;
  int a;  
  endclass

  class main;
    int b;
    sub sub_h=new();                       // obj of test class
  endclass

  main m1,m2;

  initial 
  begin 
    m1=new();
    m1.b=7;
    m1.sub_h.a=77;

    m2=new m1;
    $display("copied m1=%p\tm2=%p",m1,m2);
    $display("sub class=%p\t\t\t\t%p",m1.sub_h,m2.sub_h);     // m1 was copied into m2
    $display("---------------------------------");

    m2.b=123;
    $display("M2B change m1=%p\tm2=%p",m1,m2);
    $display("sub class=%p\t\t\t\t%p",m1.sub_h,m2.sub_h);     // changing m2.b applies only to m2 
    $display("---------------------------------");

    m1.b=456;
    $display("M1B change m1=%p\tm2=%p",m1,m2);
    $display("sub class=%p\t\t\t\t%p",m1.sub_h,m2.sub_h);     // changing m1.b applies only to m1
    $display("---------------------------------");

    m2.sub_h.a=789;
    $display("M2H_sub_a change m1=%p\tm2=%p",m1,m2);
    $display("sub class=%p\t\t\t\t%p",m1.sub_h,m2.sub_h);     // changing m2 or m1 subclass property applies to both m1.sub.a and m2.sub.a
    $display("---------------------------------");

    m1.sub_h.a=999;
    $display("M1H_sub_a change m1=%p\tm2=%p",m1,m2);
    $display("sub class=%p\t\t\t\t%p",m1.sub_h,m2.sub_h);
    $display("---------------------------------");
  end
endmodule
