module PC_Mux(
    input clk,
    input pcPlusOne,
    input CONTROL_BEQ,
    input offsetExtended,
    input CONTROL_JALR,
    input aluValA,

    output reg pcOutput
);

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