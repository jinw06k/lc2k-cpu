module ALU_ValB_Mux(
    input clk,
    input [31:0] offsetExtended,               // aluValB = 0
    input regBvalue,                    // aluValB = 1
    input CONTROL_ALUvalB,

    output reg aluValB
);

    always @(posedge clk) begin
        if (CONTROL_ALUvalB == 1) begin   // use regBvalue
            aluValB <= regBvalue;
        end
        else begin
            aluValB <= offsetExtended;
        end
    end

endmodule