module Program_Mux(
    input [31:0] pcCurrent,
    input [31:0] pcPlusOne,
    input CONTROL_BEQ,
    input [31:0] offsetExtended,
    input CONTROL_JALR,
    input [31:0] aluValA,

    output reg [31:0] pcOutput
); 
 
    always @(pcCurrent, CONTROL_BEQ, CONTROL_JALR) begin
        if (CONTROL_BEQ == 1) begin
            pcOutput = pcPlusOne + offsetExtended;
        end
        else if (CONTROL_JALR == 1) begin
            pcOutput = aluValA;
        end
        else begin
            pcOutput = pcPlusOne;
        end
    end
    
endmodule
