`include "header/macro.vh"

module Comparator #(parameter WIDTH = 32) (func, a, b, comp);
    input [2:0] func;
    input [WIDTH-1:0] a;
    input [WIDTH-1:0] b;
    output comp;
    
    wire zero, slt, sltu;

    assign zero = a == b;
    assign slt  = $signed(a) < $signed(b);
    assign sltu = a < b;
    
    assign comp =   func == `beq  ?  zero :
                    func == `bne  ? ~zero :
                    func == `blt  ?  slt  :
                    func == `bltu ?  sltu :
                    func == `bge  ? ~slt  :
                    func == `bgeu ? ~sltu :
                    func == `slt  ?  slt  :
                    func == `sltu ?  sltu : 1'bx;


    
endmodule