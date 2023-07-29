///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Company: Scaledge Technology
// Engineer: Kirti Kumar
// 
// Module Name: fifo_pkg
// Project Name: FIFO Verification
// Description: Package file for FIFO consisting of all files
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

`include "fifo_interface.sv"
package fifo_pkg;
 
  //`include "fifo_trans.sv"
  
  `include "fifo_transaction.sv"
  `include "fifo_generator.sv"
  `include "fifo_driver.sv"
  `include "fifo_monitor.sv"
  `include "fifo_defines.sv"
  `include "fifo_reference_model.sv"
 // `include "fifo_scoreboard.sv"		// No difference -> Just different print statement style
  `include "fifo_scb1.sv"
 `include "fifo_environment.sv"
  `include "simultaneous.sv"
  `include "write_read.sv"
  `include "back_to_back.sv"
 `include "fifo_base_test.sv"
  
endpackage
