module ALU_ValB_Mux(
    input [31:0] offsetExtended,               // aluValB = 0
    input [31:0] regBvalue,                    // aluValB = 1
    input CONTROL_ALUvalB,
 
    output [31:0] aluValB
);

    assign aluValB = (CONTROL_ALUvalB == 1) ? regBvalue : offsetExtended;

endmodule
