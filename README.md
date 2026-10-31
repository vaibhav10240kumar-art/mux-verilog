# 4-to-1 multiplexer

4-to-1 mux in Verilog, built from three 2-to-1 muxes. Two muxes in the first stage select between (d0, d1) and (d2, d3) using `sel[0]`, and the second stage picks between those results using `sel[1]`.

## Files

```
rtl/mux2to1.v      1-bit 2-to-1 mux
rtl/mux4to1.v      4-to-1 mux made from three mux2to1
tb/mux4to1_tb.v    exhaustive testbench
```

## Truth table

| sel[1:0] | y  |
|----------|----|
| 00       | d0 |
| 01       | d1 |
| 10       | d2 |
| 11       | d3 |

## Simulation

Needs Icarus Verilog.

```bash
iverilog -o sim rtl/mux2to1.v rtl/mux4to1.v tb/mux4to1_tb.v
vvp sim
```

Expected output:

```
PASS: all 64 cases correct
```

The testbench tries all 16 values of the data inputs with all 4 select values and compares `y` against `d[sel]`.

## Not done yet

- only 1 bit wide, no parameterized width
- no synthesis or timing run

## 8-to-1 mux

`rtl/mux8to1.v` is built from two `mux4to1` and one `mux2to1`. `sel[1:0]` selects inside each group of four inputs (`d[3:0]` and `d[7:4]`), and `sel[2]` selects which group reaches the output. The path from any data input to `y` goes through three 2-to-1 stages, which is why it matches a plain 8-to-1 mux in function but is built hierarchically.

```bash
iverilog -o sim8 rtl/mux2to1.v rtl/mux4to1.v rtl/mux8to1.v tb/mux8to1_tb.v
vvp sim8
```

Expected output: `PASS: all 2048 cases correct`

The testbench tries all 256 data patterns with all 8 select values and compares `y` against `d[sel]`.
