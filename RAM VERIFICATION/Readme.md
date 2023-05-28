<h2>About</h2>
This project is the verification of a 16x8 RAM done in QuestaSIM with support for simultaneous read and write operation when both read enable and write enable are high. 
<ul>
<li> RTL folder consists of the design file for RAM written in verilog. 
<li> ENV folder contains all the components of layered testbench. Two drivers and two monitors are used, one pair for read and other pair for write operation.
<li> SIM folder consists of makefile, coverage in pdf report format, waveform file and transcript.
<li> TEST folder consists of testcases implemented to verify the functionality of RAM.
<li> TOP folder consists of top file which contains DUT, interfaces and testcases. </ul><br><hr>
<img src="https://github.com/AlPrime2k1/SystemVerilog/blob/main/RAM%20VERIFICATION/RAM_ARCHITECTURE.PNG"></br>
Following this architecture, mailboxes are connected from generator to drivers, monitor to reference model and scoreboard. Connections with DUV are done using interfaces as in from Drivers to DUV and from DUV to monitors. Makefile for compilation of individual tescases as well as for regression or for code coverage is provided.

<h2>How to use</h2>
<ol>
  <li> Download the folder RAM VERIFICATION.
  <li> Open SIM folder and type cmd in the address bar. Alternatively open cmd and go inside the SIM folder.
  <li> In cmd, type vlib work to create directory for Questa.
  <li> Makefile info : <ul>
    <li> Type make or make regression to compile and execute all testcases one after another.
    <li> Type make comp to execute write_read testcase. Also the sv_seed number can be changed for different randomization pattern.
    <li> Type make all to compile, execute all testcases and generate merged report of all those cases in MERGECOV folder in SIM folder. 
    </ul>
  <li> Open MERGECOV folder and open index.html for coverage report.
    </ol>
 
<footer>
  For more information, contact me here<br>
  <a href="mailto:kirti.kumar2k1@gmail.com">E-mail</a></p>
</footer>
