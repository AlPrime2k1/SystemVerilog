regression:
	vlog ../RTL/ram_16x8.v ../TEST/ram_pkg.sv ../TOP/ram_tb_top.sv +incdir+../TEST +incdir+../ENV 
	
	vsim -novopt ram_tb_top -c -do "run;exit" +write_read

	vsim -novopt ram_tb_top -c -do "run;exit" +simultaneous

	vsim -novopt ram_tb_top -c -do "run;exit" +back_to_back

	vsim -novopt ram_tb_top -c -do "run;exit" +reset_check

comp:
	vlog -coveropt 3 +cover +acc ../RTL/ram_16x8.v ../TEST/ram_pkg.sv ../TOP/ram_tb_top.sv +incdir+../TEST +incdir+../ENV 

	vsim -coverage -vopt work.ram_tb_top -c -do "coverage save -onexit -directive -cvg -codeAll RAMCOV.ucdb;run -all" +write_read -sv_seed 8585

	vcover report -html -htmldir RAMCOVERGAE RAMCOV.ucdb

romp:
	vlog -coveropt 3 +cover +acc ../RTL/ram_16x8.v ../TEST/ram_pkg.sv ../TOP/ram_tb_top.sv +incdir+../TEST +incdir+../ENV 

	vsim -coverage -vopt work.ram_tb_top -c -do "coverage save -onexit -directive -cvg -codeAll RAMCOV.ucdb;run -all" +simultaneous

	vcover report -html -htmldir RAMCOVERGAE RAMCOV.ucdb

all:
	vlog -coveropt 3 +cover +acc ../RTL/ram_16x8.v ../TEST/ram_pkg.sv ../TOP/ram_tb_top.sv +incdir+../TEST +incdir+../ENV

	vsim -coverage -vopt work.ram_tb_top -c -do "coverage save -onexit -directive -cvg -codeAll RAMCOV1.ucdb;run -all" +write_read

	vsim -coverage -vopt work.ram_tb_top -c -do "coverage save -onexit -directive -cvg -codeAll RAMCOV2.ucdb;run -all" +simultaneous

	vsim -coverage -vopt work.ram_tb_top -c -do "coverage save -onexit -directive -cvg -codeAll RAMCOV3.ucdb;run -all" +reset_check

	vsim -coverage -vopt work.ram_tb_top -c -do "coverage save -onexit -directive -cvg -codeAll RAMCOV4.ucdb;run -all" +back_to_back

	vcover merge MERGEDreport.ucdb RAMCOV1.ucdb RAMCOV2.ucdb RAMCOV3.ucdb RAMCOV4.ucdb

	vcover report -html -htmldir MERGECOV MERGEDreport.ucdb
