//////////////////////////////////////////////////////////////////////////////////
// Company: Scaledge Technology
// Engineer: Kirti Kumar
// 
// Module Name: ram_pkg
// Project Name: RAM Verification
// Description: Package file containing all the components of the project
//////////////////////////////////////////////////////////////////////////////////

`include "ram_interface.sv"
package ram_pkg;
 
  //`include "ram_trans.sv"
  
  `include "ram_trans.sv"
  `include "ram_gen.sv"
  `include "ram_wd.sv"
  `include "ram_wm.sv"
  `include "ram_rd.sv"
  `include "ram_rm.sv"
  `include "ram_defines.sv"
  `include "ram_rf.sv"
  `include "ram_sb.sv"
  `include "ram_env.sv"
  `include "sim_rw.sv"
  `include "write_read.sv"
  `include "back_to_back.sv"
  `include "reset_check.sv"
 `include "ram_base_test.sv"
  
endpackage
