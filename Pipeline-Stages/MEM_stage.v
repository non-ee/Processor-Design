`include "header/macro.vh"

module MEM_stage (
                MREQ_i, WRITE_i, SIZE_i, data_in_i,
                Alu_Out, mem_in, 
                MREQ, WRITE, SIZE, DAD, 
                DDT, data_in
                );
    input MREQ_i, WRITE_i;
    input [1:0] SIZE_i;
    input [31:0] data_in_i, Alu_Out;
    input [31:0] mem_in;
    output MREQ, WRITE;
    output [1:0] SIZE;
    output [31:0] DAD;
    inout [31:0] DDT;
    output [31:0] data_in;

    assign MREQ   = MREQ_i;
    assign WRITE  = WRITE_i;
    assign SIZE   = SIZE_i;
    
    assign DAD = Alu_Out;
    assign DDT = mem_in;

    assign data_in = MREQ ? DDT : data_in_i;


endmodule
