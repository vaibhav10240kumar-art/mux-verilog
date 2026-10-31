`timescale 1ns/1ps

// Exhaustive self-checking testbench for mux8to1
module mux8to1_tb;
    reg  [7:0] d;
    reg  [2:0] sel;
    wire       y;

    integer i, j;
    integer errors = 0;

    mux8to1 dut (.d(d), .sel(sel), .y(y));

    initial begin
        $dumpfile("waves8.vcd");
        $dumpvars(0, mux8to1_tb);

        for (i = 0; i < 256; i = i + 1)
            for (j = 0; j < 8; j = j + 1) begin
                d = i; sel = j;
                #1;
                if (y !== d[sel]) begin
                    $display("FAIL: d=%b sel=%0d y=%b (expected %b)",
                             d, sel, y, d[sel]);
                    errors = errors + 1;
                end
            end

        if (errors == 0) $display("PASS: all 2048 cases correct");
        else             $display("FAILED: %0d errors", errors);
        $finish;
    end
endmodule
