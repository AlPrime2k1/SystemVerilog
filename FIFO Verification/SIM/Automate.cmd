:start

vlog -coveropt 3 +cover +acc ../RTL/fifo.v ../TEST/fifo_pkg.sv ../TOP/fifo_tb_top.sv +incdir+../TEST +incdir+../ENV

vsim -coverage -vopt work.fifo_tb_top -c -do "coverage save -onexit -directive -cvg -codeAll fifoCOV1.ucdb;run -all" +write_read

vsim -coverage -vopt work.fifo_tb_top -c -do "coverage save -onexit -directive -cvg -codeAll fifoCOV2.ucdb;run -all" +simultaneous

vsim -coverage -vopt work.fifo_tb_top -c -do "coverage save -onexit -directive -cvg -codeAll fifoCOV3.ucdb;run -all" +back_to_back

vcover merge MERGEDreport.ucdb fifoCOV1.ucdb fifoCOV2.ucdb fifoCOV3.ucdb

vcover report -html -htmldir MERGECOV MERGEDreport.ucdb


SET /p ACTION="RESTART(R) "
IF /i "%ACTION%" == "R" GOTO start
IF /i "%ACTION%" == "r" GOTO start
IF /i "%ACTION%" == "" 



