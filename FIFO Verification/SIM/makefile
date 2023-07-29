all:
	vlog -coveropt 3 +cover +acc ../RTL/fifo.v ../TEST/fifo_pkg.sv ../TOP/fifo_tb_top.sv +incdir+../TEST +incdir+../ENV

	vsim -coverage -vopt work.fifo_tb_top -c -do "coverage save -onexit -directive -cvg -codeAll fifoCOV1.ucdb;run -all" +write_read

	vsim -coverage -vopt work.fifo_tb_top -c -do "coverage save -onexit -directive -cvg -codeAll fifoCOV2.ucdb;run -all" +simultaneous

	vsim -coverage -vopt work.fifo_tb_top -c -do "coverage save -onexit -directive -cvg -codeAll fifoCOV3.ucdb;run -all" +back_to_back

	vcover merge MERGEDreport.ucdb fifoCOV1.ucdb fifoCOV2.ucdb fifoCOV3.ucdb

	vcover report -html -htmldir MERGECOV MERGEDreport.ucdb

sim:
	vlog ../RTL/fifo.v ../TEST/fifo_pkg.sv ../TOP/fifo_tb_top.sv +incdir+../TEST +incdir+../ENV

	vsim -novopt fifo_tb_top -c -do "run;exit" +simultaneous

	vsim -novopt fifo_tb_top -c -do "run;exit" +write_read

	vsim -novopt fifo_tb_top -c -do "run;exit" +back_to_back

b2b:
	vlog ../RTL/fifo.v ../TEST/fifo_pkg.sv ../TOP/fifo_tb_top.sv +incdir+../TEST +incdir+../ENV
	vsim -coverage -vopt work.fifo_tb_top -c -do "coverage save -onexit -directive -cvg -codeAll fifoCOV.ucdb;run -all" +back_to_back
	vcover report -html -htmldir B2BCOV fifoCOV.ucdb