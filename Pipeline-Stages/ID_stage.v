`include "header/macro.vh"
`include "modules/rf32x32.v"
`include "modules/Decoder.v"

module ID_stage (
    clk, rst, inst, flush,
    regwrite, wr_addr, data_in,
    opcode, func,
    data1_out, data2_out, Imm,
    rs1, rs2, alusrc, aluctrl,
    MREQ, WRITE, SIZE, 
    rw, rd
    );

    input clk, rst, flush;
    input [31:0] inst;
    input regwrite;
    input [4:0] wr_addr;
    input [31:0] data_in;

    output [6:0] opcode;
    output [2:0] func;
    output [31:0] data1_out, data2_out;
    output [31:0] Imm;
    output [4:0] rs1, rs2; 
    output [1:0] alusrc;
    output [2:0] aluctrl;
    output MREQ, WRITE;
    output [1:0] SIZE;
    output rw;
    output [4:0] rd;
    
    assign opcode = inst[6:0];
    assign func = inst[14:12];

    wire [31:0] data1_w, data2_w;
    
    assign data1_out = regwrite && rs1 == wr_addr ? data_in : data1_w;  
    assign data2_out = regwrite && rs2 == wr_addr ? data_in : data2_w;

    Decoder id_decoder(
        .inst(inst), .flush(flush),
        .rd(rd), .rs1(rs1), .rs2(rs2),
        .Imm(Imm),
        .AluSrc(alusrc), .AluCtrl(aluctrl),
        .MREQ(MREQ), .WRITE(WRITE), .SIZE(SIZE), 
        .RegWrite(rw)
    );

    rf32x32 u_regfile(
        .clk(~clk), .reset(rst),
        .wr_n(~regwrite),
        .rd1_addr(rs1), .rd2_addr(rs2), .wr_addr(wr_addr),
        .data_in(data_in),
        .data1_out(data1_w), .data2_out(data2_w)
    );

endmodule
