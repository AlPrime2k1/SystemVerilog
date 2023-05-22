library verilog;
use verilog.vl_types.all;
entity dff_prog is
    port(
        clk             : out    vl_logic;
        rst             : out    vl_logic;
        d               : out    vl_logic;
        q               : in     vl_logic
    );
end dff_prog;
