
module test_obj_assign1();
    

  class test;
    int a=7;  
  endclass

  class main;
    int D=159;
  endclass

  initial 
  begin 
  main p1_h,p2_h;                       // obj of main class

  p1_h=new();
  
  $display("ORIGINAL CLASS CLASS_P1=%p \tCLASS_P2=%p",p1_h,p2_h);

  p2_h=new p1_h;                                            // shallow copy
  $display("SHALLOW COPY CLASS_P1=%p\tCLASS_P2=%p",p1_h,p2_h);

  p1_h.D=78;
  p2_h.D=999;
  $display("SHALLOW COPY after change CLASS_P1=%p\tCLASS_P2=%p",p1_h,p2_h);
  $display("\n");
  $display("OG CLASS_P1=%p \tCLASS_P2=%p",p1_h,p2_h);           // obj assignment
  p2_h=p1_h;
  $display("OBJ ASS CLASS_P1=%p \tCLASS_P2=%p",p1_h,p2_h);
  p1_h.D=78;
  $display("P1 CHANGE CLASS_P1=%p \tCLASS_P2=%p",p1_h,p2_h);
  p2_h.D=999;
  $display("P2 CHANGE CLASS_P1=%p \tCLASS_P2=%p",p1_h,p2_h);
  

end
endmodule
