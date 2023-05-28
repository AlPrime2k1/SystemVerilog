///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Company: Scaledge Technology
// Engineer: Kirti Kumar
// 
// Module Name: ram_base_test
// Project Name: RAM Verification
// Description: Base test file consisting of all testcases for multiple testcase handling through $test$plusargs
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


//import ram_env_pkg::*;
 class ram_base_test;
 
  ram_env env_h;

    //testcases
    sim_rw sim_rw_h;
    write_read write_read_h;
    back_to_back back_to_back_h;
	reset_check reset_check_h;
  
    //interface
  virtual ram_if.WR_DRV_MP  wd_if;
  virtual ram_if.RD_DRV_MP  rd_if;
  virtual ram_if.WR_MON_MP wm_if;
  virtual ram_if.RD_MON_MP rm_if;
   
   
  function new (virtual ram_if.WR_DRV_MP  wd_if,
                virtual ram_if.RD_DRV_MP  rd_if,
                virtual ram_if.WR_MON_MP wm_if,
                virtual ram_if.RD_MON_MP rm_if);
	this.wd_if = wd_if;
	this.rd_if = rd_if;
	this.wm_if = wm_if;
	this.rm_if = rm_if;
  endfunction
  
  
  task build_and_start();
  env_h = new(wd_if,rd_if,wm_if,rm_if);
	env_h.build();

  if($test$plusargs("simultaneous"))
  begin
    sim_rw_h=new(env_h.gen_wd,env_h.gen_rd);
    env_h.gen_h=sim_rw_h;
  end

  if($test$plusargs("write_read"))
  begin
    write_read_h=new(env_h.gen_wd,env_h.gen_rd);
    env_h.gen_h=write_read_h;
  end

  if($test$plusargs("back_to_back"))
  begin
    back_to_back_h=new(env_h.gen_wd,env_h.gen_rd);
    env_h.gen_h=back_to_back_h;
  end

  if($test$plusargs("reset_check"))
  begin
	reset_check_h=new(env_h.gen_wd,env_h.gen_rd);
	env_h.gen_h=reset_check_h;
  end

  env_h.start();
  endtask
  
endclass
