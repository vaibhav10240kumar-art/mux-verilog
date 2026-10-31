module mux8to1 (
    input  [7:0] d,
    input  [2:0] sel,
    output       y
);
    wire y0, y1;

    mux4to1 m0 (.d0(d[0]), .d1(d[1]), .d2(d[2]), .d3(d[3]),
                .sel(sel[1:0]), .y(y0));
    mux4to1 m1 (.d0(d[4]), .d1(d[5]), .d2(d[6]), .d3(d[7]),
                .sel(sel[1:0]), .y(y1));
    mux2to1 m2 (.d0(y0), .d1(y1), .sel(sel[2]), .y(y));
endmodule
