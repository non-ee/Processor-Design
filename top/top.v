`include "header/macro.vh"
`include "modules/rst_en_Reg.v"
`include "modules/rst_default_Reg.v"
`include "Pipeline-Stages/IF_stage.v"
`include "Pipeline-Stages/ID_stage.v"
`include "Pipeline-Stages/EX_stage.v"
`include "Pipeline-Stages/MEM_stage.v"
`include "Pipeline-Stages/WB_stage.v"
`include "top/HZD_Handler.v" 
`include "top/Flush_Handler.v"  

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
    wire [31:0] init_INST = 32'h08050137;    // lui sp, 0x8050
    wire stall;

/******************************************************************************************/
/***************************** Pipeline Registers & Data pass *****************************/
/******************************************************************************************/

    wire [95:0] ifid_i, ifid_o;
    wire [194:0] idex_i, idex_o;
    wire [138:0] exmem_i, exmem_o;
    wire [69:0] memwb_i, memwb_o;

    rst_default_Reg #(96)  ifid(.clk(clk),  .rst(rst), .en(1'b1), .DEFAULT({64'h0, init_INST}), .IN(ifid_i), .OUT(ifid_o));
    rst_en_Reg #(195) idex(.clk(clk),  .rst(rst), .en(1'b1), .IN(idex_i), .OUT(idex_o));
    rst_en_Reg #(139) exmem(.clk(clk), .rst(rst), .en(1'b1), .IN(exmem_i), .OUT(exmem_o));
    rst_en_Reg #(70) memwb(.clk(clk),  .rst(rst), .en(1'b1), .IN(memwb_i), .OUT(memwb_o));

    /******************************* Declare all wires used in each stages *******************************/
    // IF stage 
    wire [31:0] if_PC, if_PC_4, if_INST;

    // ID stage
    wire [31:0] id_PC, id_PC_4, id_INST;
    wire [6:0] id_opcode;
    wire [2:0] id_func;
    wire [31:0] id_reg1_out, id_reg2_out, id_Imm;
    wire [4:0] id_rs1, id_rs2;
    wire [1:0] id_alusrc;
    wire [2:0] id_aluctrl;
    wire id_MREQ, id_WRITE;
    wire [1:0] id_SIZE;
    wire id_rw;
    wire [4:0] id_rd;

    // EX stage
    wire [31:0] ex_PC, ex_PC_4;
    wire [6:0] ex_opcode;
    wire [2:0] ex_func;
    wire [31:0] ex_reg1_out, ex_reg2_out, ex_Imm;
    wire [4:0] ex_rs1, ex_rs2;
    wire [1:0] ex_alusrc;
    wire [2:0] ex_aluctrl;
    wire [31:0] ex_Alu_Out, ex_mem_in, ex_data_in;
    wire ex_MREQ, ex_WRITE;
    wire [1:0] ex_SIZE;
    wire ex_rw;
    wire [4:0] ex_rd;

    // MEM stage
    wire [31:0] m_PC, m_Alu_Out, m_mem_in, i_m_data_in;
    wire m_MREQ, m_WRITE;
    wire [1:0] m_SIZE;
    wire m_rw;
    wire [4:0] m_rd;
    wire [31:0] m_data_in;

    // WB stage
    wire [31:0] wb_PC;
    wire wb_rw;
    wire [4:0] wb_rd;
    wire [31:0] wb_data_in;


    /******************************* Grouping all wires in each stages *******************************/
    assign ifid_i  = {  if_PC, if_PC_4, if_INST         };

    assign idex_i  = {  id_PC, id_PC_4, 
                        id_opcode, id_func,
                        id_reg1_out, id_reg2_out, id_Imm, 
                        id_rs1, id_rs2, 
                        id_alusrc, id_aluctrl, 
                        id_MREQ, id_WRITE, id_SIZE,
                        id_rw, id_rd                    };

    assign exmem_i = {  ex_PC, ex_Alu_Out, ex_mem_in, ex_data_in, 
                        ex_MREQ, ex_WRITE, ex_SIZE,
                        ex_rw, ex_rd                    };

    assign memwb_i = {  m_PC, m_rw, m_rd, m_data_in           };

    /******************************* Ungrouping all wires in each stages *******************************/
    assign {    id_PC, id_PC_4, id_INST            } = ifid_o;

    assign {    ex_PC, ex_PC_4, 
                ex_opcode, ex_func,
                ex_reg1_out, ex_reg2_out, ex_Imm, 
                ex_rs1, ex_rs2, 
                ex_alusrc, ex_aluctrl,
                ex_MREQ, ex_WRITE, ex_SIZE,
                ex_rw, ex_rd                       } = idex_o;

    assign {
                m_PC, m_Alu_Out, m_mem_in, i_m_data_in, 
                m_MREQ, m_WRITE, m_SIZE,
                m_rw, m_rd                         } = exmem_o;

    assign {    wb_PC, wb_rw, wb_rd, wb_data_in  } = memwb_o;

    /*************************************** Initialize IF stage ***************************************/
    
    assign if_INST = inst;


/******************************************************************************************/
/******************************** Instruction Fetch Stage *********************************/
/******************************************************************************************/

    wire pcsrc;
    wire [31:0] PC_IN;

    IF_stage u_if(
        .clk(clk), .rst(rst), 
        .stall(1'b0), .pcsrc(pcsrc), 
        .PC_START(32'h10000), .PC_IN(PC_IN), .PC(if_PC), .PC_4(if_PC_4)
    );    


/******************************************************************************************/
/******************************* Instruction Decoder Stage ********************************/
/******************************************************************************************/
    wire flush_id, flush_ex;
    wire [31:0] data_in;
    wire rwrite;
    wire [4:0] wr_addr;

    ID_stage u_id(
        .clk(clk), .rst(rst),
        .inst(id_INST), .flush(flush_id),
        .regwrite(rwrite), .wr_addr(wr_addr), .data_in(data_in), 
        .opcode(id_opcode), .func(id_func),
        .data1_out(id_reg1_out), .data2_out(id_reg2_out), .Imm(id_Imm),
        .rs1(id_rs1), .rs2(id_rs2), .alusrc(id_alusrc), .aluctrl(id_aluctrl), 
        .MREQ(id_MREQ), .WRITE(id_WRITE), .SIZE(id_SIZE),
        .rw(id_rw), .rd(id_rd)
    );



/******************************************************************************************/
/****************************** Instruction Execution Stage *******************************/
/******************************************************************************************/

    wire [1:0] rs1_hzd, rs2_hzd;

    EX_stage u_ex(
        .opcode(ex_opcode), .func(ex_func),
        .alusrc(ex_alusrc), .aluctrl(ex_aluctrl), .flush(flush_ex),
        .reg1_out(ex_reg1_out), .reg2_out(ex_reg2_out), 
        .rs1_hzd(rs1_hzd), .rs2_hzd(rs2_hzd), .m_data_hzd(m_data_in), .wb_data_hzd(wb_data_in),
        .Imm(ex_Imm), .Alu_Out(ex_Alu_Out), .mem_in(ex_mem_in), .data_in(ex_data_in),
        .PC(ex_PC), .PC_4(ex_PC_4), .PC_IN(PC_IN), .pcsrc(pcsrc)
    );


/******************************************************************************************/
/********************************** Memory Access Stage ***********************************/
/******************************************************************************************/

    MEM_stage u_mem(
        .MREQ_i(m_MREQ), .WRITE_i(m_WRITE), .SIZE_i(m_SIZE), .data_in_i(i_m_data_in), 
        .Alu_Out(m_Alu_Out), .mem_in(m_mem_in), 
        .MREQ(MREQ), .WRITE(WRITE), .SIZE(SIZE),
        .DAD(DAD), .DDT(DDT), .data_in(m_data_in)
    );


/******************************************************************************************/
/*********************************** Write Back Stage *************************************/
/******************************************************************************************/

    WB_stage u_wb (
        .rw(wb_rw), .rd(wb_rd), .reg_in(wb_data_in),
        .rwrite(rwrite), .wr_addr(wr_addr), .data_in(data_in)
    );


/******************************************************************************************/
/***************************** Hazard Handler && Flush Handler ****************************/
/******************************************************************************************/

    wire [1:0] i_rs1_hzd, i_rs2_hzd;

    HZD_Handler u_hzd_handler(
        .id_rs1(id_rs1), .id_rs2(id_rs2),
        .ex_MREQ(ex_MREQ),
        .ex_rw(ex_rw), .m_rw(m_rw),
        .ex_rd(ex_rd), .m_rd(m_rd),
        .stall(stall), .rs1_hzd(i_rs1_hzd), .rs2_hzd(i_rs2_hzd)
    );
    
    Flush_Handler u_flush_handler(.clk(clk), .rst(rst), .stall(1'b0), .pcsrc(pcsrc), .flush_id(flush_id), .flush_ex(flush_ex));

    rst_en_Reg #(4) hzd_ex(.clk(clk), .rst(rst), .en(1'b1), .IN({i_rs1_hzd, i_rs2_hzd}), .OUT({rs1_hzd, rs2_hzd}));


    assign IAD = if_PC;
    assign IACK_n = 1;

endmodule
