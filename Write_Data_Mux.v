module Write_Data_Mux(
    input clk,
    input memResult,                // writeData = 0 
    input aluResult,                // writeData = 1
    input CONTROL_WRITE_DATA,

    output reg writeData
);

always @(posedge clk) begin
    if (CONTROL_WRITE_DATA == 1) begin   // use aluResult
        writeReg <= aluResult;
    end
    else begin
        writeReg <= memResult;
    end
end

endmodule
