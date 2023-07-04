`timescale 1ns/1ps

`include "header/macro.vh"
`include "modules/rf32x32.v"
`include "modules/Alu3bit.v"
`include "modules/Comparator.v"
`include "modules/Decoder.v"
`include "modules/rst_en_Reg.v"
`include "modules/rst_default_Reg.v"


module top(
    input clk, rst,                
    input ACKD_n, 
    input ACKI_n,
    input [31:0] IDT,               // Instruction Data
    input [2:0] OINT_n,
    input [31:0] Reg_temp,

    output [31:0] IAD,              // Instruction Address  (Next PC)
    output [31:0] DAD,              // Data Address         (Memory address for load inst)
    output MREQ,                    // Enable access to Data Memory     (for load/store inst)
    output WRITE,                   // Enable writing into Data Memory  (for store inst)
    output [1:0] SIZE,              // Specify size of data to read/write (for load/store)
    output IACK_n,

    inout [31:0] DDT                // for load inst, as an input read from data memory
                                    // for store inst, as an output to be read by data memory
);

    wire [31:0] inst = IDT;
    wire [31:0] init_INST = 32'h08030137;
    wire [7:0] opcode = inst[6:0];
    wire [2:0] func   = inst[14:12];

/*******************************************************************************/
/*                                 Program Counter                             */
/*******************************************************************************/
    parameter PC_ORIGIN = 32'h10000;
    
    wire [31:0] PC, PC_w;
    wire pcsrc;
    wire [31:0] PC_IN, PC_4;
    wire LOAD  = opcode == `load;
    wire load_ff;
    wire stall = LOAD && load_ff == 1'b0;

    rst_default_Reg #(32) PC_Register(.clk(clk), .rst(rst), .en(~stall), .DEFAULT(PC_ORIGIN), .IN(PC_w), .OUT(PC));
    rst_en_Reg #(1) stall_ff(.clk(clk), .rst(rst), .en(LOAD), .IN(~load_ff), .OUT(load_ff));

    assign PC_4 = PC + 32'h04;
    assign PC_w = pcsrc ? PC_IN : PC_4;


/*******************************************************************************/
/*                              Instruction Decoder                            */
/*******************************************************************************/
    wire [4:0] rs1, rs2, rd;
    wire flush;
    wire RegWrite;
    wire [1:0] AluSrc;
    wire [2:0] AluCtrl;
    wire [31:0] Imm;

    Decoder u_decoder(
        .inst(inst), .flush(flush),
        .rd(rd), .rs1(rs1), .rs2(rs2),
        .Imm(Imm),
        .AluSrc(AluSrc), .AluCtrl(AluCtrl),
        .MREQ(MREQ), .WRITE(WRITE), .SIZE(SIZE),
        .RegWrite(RegWrite)
    );

   assign flush = stall; 

/*******************************************************************************/
/*                                  Register File                              */
/*******************************************************************************/
    wire [31:0] data1_out, data2_out;         // Data read from rs1, rs2
    wire [31:0] data_in;                  // Data to be written into register

    rf32x32 u_regfile(
        .clk(~clk), .reset(rst),
        .wr_n(~RegWrite), 
        .rd1_addr(rs1), .rd2_addr(rs2), .wr_addr(rd),
        .data_in(data_in),
        .data1_out(data1_out), .data2_out(data2_out)
    );
    
/*******************************************************************************/
/*                                     Alu                                     */
/*******************************************************************************/
    wire CALC, LT;

    wire [31:0] A, B, Out;                   // ALU operand
    wire [31:0] Alu_Out;                     // ALU output
    wire comp;                               // Comparison of the two operands

    assign A = AluSrc[0] ? PC  : data1_out;                
    assign B = AluSrc[1] ? Imm : data2_out;

    Alu3bit u_alu(.Ctrl(AluCtrl), .A(A), .B(B), .Out(Out));
    Comparator #(32) u_comp(.func(func), .a(data1_out), .b(data2_out), .comp(comp));

    assign CALC = opcode == `I_op | opcode == `R_op;
    assign LT   = func == `slt | func == `sltu;
    assign Alu_Out = CALC & LT ? comp : Out;

/*******************************************************************************/
/*                                   Next PC                                   */
/*******************************************************************************/
    wire JAL, JALR, BRANCH;
    assign JAL    = opcode == `jal;
    assign JALR   = opcode == `jalr;
    assign BRANCH = opcode == `branch && comp == 1'b1;

    assign pcsrc  = flush ? 1'b0 : JAL | JALR | BRANCH;
    assign PC_IN  = Alu_Out;


/*******************************************************************************/
/*                            Write Back to Register                           */
/*******************************************************************************/
    wire   LUI, AUIPC;
    assign LUI   = opcode == `lui;
    assign AUIPC = opcode == `auipc;

    assign data_in =    LOAD ? DDT :
                        LUI  ? Imm :
                        JAL | JALR ? PC_4 : Alu_Out;

/*******************************************************************************/
/*                           Output Ports Assignments                          */
/*******************************************************************************/
    assign IAD = PC;
    assign DAD = Out;

    assign IACK_n = 1;
    assign DDT = data2_out;

endmodule
