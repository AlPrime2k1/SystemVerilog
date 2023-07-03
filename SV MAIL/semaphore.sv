// Semaphore example

module sem_exp();

semaphore sem=new(1); 

class driver;

task run(string a, int b); 
sem.get(1);

$display($time," driver %s got key",a);

#20

$display($time," @20 driver %s put key",a);

sem.put (b);

endtask

endclass

driver drv_h[3];

initial begin

foreach (drv_h[i]) 
  drv_h[i]=new();

repeat (3) begin

fork

drv_h[0].run("1",2); 
drv_h[1].run("2",1);
drv_h[2].run("3", 1);

join 
end

#10 $finish;

end

endmodule
