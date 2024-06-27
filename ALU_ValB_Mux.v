module ALU_ValB_Mux(
    input [31:0] offsetExtended,               // aluValB = 0
    input [31:0] regBvalue,                    // aluValB = 1
    input CONTROL_ALUvalB,
 
    output reg [31:0] aluValB
);

    always @(offsetExtended, regBvalue, CONTROL_ALUvalB) begin
        if (CONTROL_ALUvalB == 1) begin   // use regBvalue
            aluValB <= regBvalue;
        end
        else begin
            aluValB <= offsetExtended;
        end
    end

endmodule