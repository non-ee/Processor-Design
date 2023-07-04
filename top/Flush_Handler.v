module Flush_Handler(clk, rst, stall, pcsrc, flush_id, flush_ex);
    input clk, rst, stall, pcsrc;
    output flush_id, flush_ex;

    wire flush_reg;

    rst_en_Reg #(2) flush_ex_reg(.clk(clk), .rst(rst), .en(1'b1), .IN({flush_id, pcsrc}), .OUT({flush_ex, flush_reg}));

    assign flush_id = stall | pcsrc | flush_reg;


endmodule