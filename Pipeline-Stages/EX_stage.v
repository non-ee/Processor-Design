`include "header/macro.vh"
`include "modules/Alu3bit.v"
`include "modules/Comparator.v"

module EX_stage (opcode, func, alusrc, aluctrl, flush, 
                reg1_out, reg2_out, Imm, rs1_hzd, rs2_hzd, m_data_hzd, wb_data_hzd,
                Alu_Out, mem_in, data_in, PC, PC_4, PC_IN, pcsrc);
    input [6:0] opcode;
    input [2:0] func;
    input [1:0] alusrc;
    input [2:0] aluctrl;
    input flush;
    input [31:0] reg1_out, reg2_out, Imm;
    input [1:0] rs1_hzd, rs2_hzd;
    input [31:0] m_data_hzd, wb_data_hzd;
    output [31:0] Alu_Out, mem_in, data_in;

    input [31:0] PC, PC_4;
    output [31:0] PC_IN;
    output pcsrc;

/***************************************************************************************/
/***************************************** ALU *****************************************/
/***************************************************************************************/
    
    wire [31:0] ex_A, ex_B, A, B, Out;
    wire comp;

    assign ex_A =   rs1_hzd[0] ? m_data_hzd  :
                    rs1_hzd[1] ? wb_data_hzd : reg1_out;
    assign ex_B =   rs2_hzd[0] ? m_data_hzd  :
                    rs2_hzd[1] ? wb_data_hzd : reg2_out;

    assign A =  alusrc[0] ? PC  : ex_A;
    assign B =  alusrc[1] ? Imm : ex_B;

    Alu3bit ex_calc(.Ctrl(aluctrl), .A(A), .B(B), .Out(Out));
    Comparator #(32) ex_comp(.func(func), .a(ex_A), .b(ex_B), .comp(comp));

    wire   CALC, LT;
    assign CALC =  opcode == `R_op | opcode == `I_op;
    assign LT   =  func == `slt | func == `sltu;   

    assign Alu_Out =  CALC & LT ? comp : Out;
                                                            

/***************************************************************************************/
/*********************************** Jump & Branch  ************************************/
/***************************************************************************************/
    
    wire   JAL, JALR, BRANCH;
    assign JAL    = opcode == `jal;
    assign JALR   = opcode == `jalr;
    assign BRANCH = opcode == `branch && comp == 1'b1;

    assign pcsrc  = flush ? 1'b0 : JAL | JALR | BRANCH;
    assign PC_IN  = Alu_Out;

/***************************************************************************************/
/********************* Memory Store Data & Register Write Back Data ********************/
/***************************************************************************************/

    assign mem_in = ex_B;
    
    wire   LUI, AUIPC;
    assign LUI   = opcode == `lui;
    assign AUIPC = opcode == `auipc;

    assign data_in =    LUI   ? Imm :
                        JAL   | JALR ? PC_4 : Alu_Out; 
    
endmodule
