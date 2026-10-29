// 4-to-1 multiplexer built from three 2-to-1 muxes
// sel[1:0] picks which input goes to y:
//   00 -> d0, 01 -> d1, 10 -> d2, 11 -> d3

module mux4to1 (
 input d0,
 input d1,
 input d2,
 input d3,
 input [1:0] sel,
 output y
);
 wire y0, y1;
 mux2to1 m0 (.d0(d0), .d1(d1), .sel(sel[0]), .y(y0));
 mux2to1 m1 (.d0(d2), .d1(d3), .sel(sel[0]), .y(y1));
 mux2to1 m2 (.d0(y0), .d1(y1), .sel(sel[1]), .y(y));
endmodule

