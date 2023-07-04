`define LOW 1'b0
`define X0  5'b0

module HZD_Handler(
    id_rs1, id_rs2,
    ex_MREQ,
    ex_rw, m_rw, 
    ex_rd, m_rd,
    stall, rs1_hzd, rs2_hzd
);
    input [4:0] id_rs1, id_rs2;
    input ex_MREQ;
    input ex_rw, m_rw;
    input [4:0] ex_rd, m_rd;

    output stall;
    output [1:0] rs1_hzd, rs2_hzd;


    wire rs1_mem_hazard =   ex_rw  ? ex_rd  == id_rs1 : `LOW;
    wire rs2_mem_hazard =   ex_rw  ? ex_rd  == id_rs2 : `LOW;
    wire rs1_wb_hazard  =   m_rw ? m_rd == id_rs1 : `LOW;
    wire rs2_wb_hazard  =   m_rw ? m_rd == id_rs2 : `LOW;

    assign rs1_hzd = { rs1_wb_hazard, rs1_mem_hazard };
    assign rs2_hzd = { rs2_wb_hazard, rs2_mem_hazard };                             

    assign stall = ex_MREQ & (rs1_mem_hazard | rs2_mem_hazard);
endmodule
