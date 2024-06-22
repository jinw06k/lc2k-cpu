module Program_Mux(
    input clk,
    input pcPlusOne,
    input CONTROL_BEQ,
    input [31:0] offsetExtended,
    input CONTROL_JALR,
    input aluValA,

    output reg pcOutput
); 

    initial begin
        pcOutput <= 1;
    end

    always @(posedge clk, CONTROL_BEQ, CONTROL_JALR) begin
        if (CONTROL_BEQ == 1) begin
            pcOutput <= pcPlusOne + offsetExtended;
        end
        else if (CONTROL_JALR == 1) begin
            pcOutput <= aluValA;
        end
        else begin
            pcOutput <= pcPlusOne;
        end
    end
    
endmodule