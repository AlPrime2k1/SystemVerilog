//Q8. Write a class with two objects of same class and perform the object assignment of one class object handle to another handle.
//• Update the property using both handles and observe the changes accordingly.
//• Deallocate the assigned object

module test_obj_assign();

  class obj_assign;
    int a,b;
  endclass

  obj_assign a1_h,a2_h,a3_h=new();  
  
  initial  
  begin
    
    a1_h=new();
    a1_h.a=15;
    a1_h.b=78;
$display("INITIAL");
$display("A1_H=%p\tA2_H =%p\tA3_H =%p\n",a1_h,a2_h,a3_h);

$display("Change in A3_H property before object assignment");
a3_h.a=6969;
a3_h.b=2828;
$display("A1_H=%p\tA2_H =%p\tA3_H =%p\n",a1_h,a2_h,a3_h);
 
a2_h=a1_h;
a3_h=a2_h;

$display("After object assignment of A3_H to A2_H and A2_H to A1_H");
$display("A2_H =%p\tA3_H =%p\n",a2_h,a3_h);

a2_h.b=555;
a1_h.a=666;
a3_h.b=2486;

$display("Change in property after object assignment");
$display("A1_H=%p\tA2_H =%p\tA3_H =%p\n",a1_h,a2_h,a3_h);

$display("Making A2_H null");
a2_h=null;
$display("A1_H=%p\tA2_H =%p\tA3_H =%p\n",a1_h,a2_h,a3_h);

$display("Making A1_H null");
a1_h=null;
$display("A1_H=%p\tA2_H =%p\tA3_H =%p\n",a1_h,a2_h,a3_h);

end
endmodule
