`ifndef _macro_vh
`define _macro_vh

`define ADD 0
`define SUB 1
`define AND 2
`define OR  3
`define XOR 4
`define SLL 5
`define SRA 6
`define SRL 7

// Instructions ' Opcodes
`define lui     7'b0110111
`define auipc   7'b0010111
`define jal     7'b1101111
`define jalr    7'b1100111
`define branch  7'b1100011
`define load    7'b0000011
`define store   7'b0100011
`define I_op    7'b0010011
`define R_op    7'b0110011

// Branch func
`define beq     3'b000
`define bne     3'b001
`define blt     3'b100
`define bge     3'b101
`define bltu    3'b110
`define bgeu    3'b111

// R-op func
`define slt     3'b010
`define sltu    3'b011

// LOAD SIZE
`define BYTE    2'b10
`define HALF    2'b01
`define WORD    2'b00

`endif