library verilog;
use verilog.vl_types.all;
entity dff_design is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        d               : in     vl_logic;
        q               : out    vl_logic
    );
end dff_design;
