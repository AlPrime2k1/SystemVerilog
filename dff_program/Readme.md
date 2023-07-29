<h2>Contents</h2>
RTL folder consists of design code for D flip flop.<br>
SIM folder consists of files from QuestaSim work library.<br>
TB folder consists of program block for DFF and TB top file as well.<br>
<h2>How to use in QuestaSim</h2>
<ul>
<li> Create work directory using "vlib work" in cmd in SIM directory (only need to do once).</li>
<li> Compile using "vlog ..\RTL\dff_design.sv ..\TB\dff_top.sv"</li>
<li> Run using command "vsim dff_top"</li>
<li>Add signals in object window to wave window</li>
<li>Restart the wave</li>
