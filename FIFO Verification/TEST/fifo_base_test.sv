///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Company: Scaledge Technology
// Engineer: Kirti Kumar
// 
// Module Name: fifo_base_test
// Project Name: FIFO Verification
// Description: Base testcase for fifo consisting of all testcases with multiple handling through $test$plusargs
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

 class fifo_base_test;
 
  fifo_env env_h;

    //testcases
    simultaneous sim_h;
    write_read write_read_h;
	back_to_back back_to_back_h;
  
    //interface
  virtual fifo_if.DRIVER_MP  drv_if;
  virtual fifo_if.MONITOR_MP mon_if;
     
  function new (virtual fifo_if.DRIVER_MP  drv_if,
                virtual fifo_if.MONITOR_MP mon_if);
	
	this.drv_if = drv_if;
	this.mon_if = mon_if;
	
  endfunction
  
  
  task build_and_start();
  env_h = new(drv_if,mon_if);
	env_h.build();

  if($test$plusargs("simultaneous"))
  begin
    sim_h=new(env_h.gen_drv);
    env_h.gen_h=sim_h;
  end

  if($test$plusargs("write_read"))
  begin
    write_read_h=new(env_h.gen_drv);
    env_h.gen_h=write_read_h;
  end
if($test$plusargs("back_to_back"))
  begin
    back_to_back_h=new(env_h.gen_drv);
    env_h.gen_h=back_to_back_h;
  end

	env_h.start();
  endtask
  
endclass
