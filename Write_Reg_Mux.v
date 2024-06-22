module Write_Reg_Mux(
    input clk,
    input [2:0] regB,               // writeReg = 0
    input [2:0] destReg,            // writeReg = 1
    input CONTROL_WRITE_REG,

    output reg [2:0] write_reg
);

    always @(posedge clk) begin
        if (CONTROL_WRITE_REG == 1) begin   // use destReg
            write_reg <= destReg;
        end
        else begin
            write_reg <= regB;
        end
    end

endmodule
