`timescale 1ns/1ps

// Exhaustive self-checking testbench for mux4to1
module mux4to1_tb;
    reg  [3:0] d;
    reg  [1:0] sel;
    wire       y;

    integer i, j;
    integer errors = 0;

    mux4to1 dut (
        .d0(d[0]), .d1(d[1]), .d2(d[2]), .d3(d[3]),
        .sel(sel), .y(y)
    );

    initial begin
        $dumpfile("waves.vcd");
        $dumpvars(0, mux4to1_tb);

        for (i = 0; i < 16; i = i + 1)
            for (j = 0; j < 4; j = j + 1) begin
                d = i; sel = j;
                #1;
                if (y !== d[sel]) begin
                    $display("FAIL: d=%b sel=%0d y=%b (expected %b)",
                             d, sel, y, d[sel]);
                    errors = errors + 1;
                end
            end

        if (errors == 0) $display("PASS: all 64 cases correct");
        else             $display("FAILED: %0d errors", errors);
        $finish;
    end
endmodule
