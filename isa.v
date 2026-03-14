`define ADD 4'b0000
`define SUB 4'b0001
`define MUL 4'b0010
`define LOAD 4'b0011
`define STORE 4'b0100

`define INSTR(op, dest, a, b) {op, dest, a, b, 4'b0000}
