// 2-to-1 Multiplexer (1 bit)
// sel = 0 // y = d0
// sel = 1 // y = d1

module mux2to1 (
 input d0,
 input d1,
 input sel,
 output y
);
assign y = sel ? d1 : d0;
endmodule

