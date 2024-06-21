module Data_Memory(
    input aluResult,
    input regBvalue,
    input CONTROL_MEM_ACCESS,               // 1 = accessed
    input CONTROL_ENABLE_MEM_WRITE,         // 1 = write, 0 = read
    
    output reg memResult
);

reg [63:0] Data[63:0];

integer ii;

initial begin
    for (ii = 0; ii < 8; ii = ii + 1) begin
      Data[ii] = 0;
    end
end

always @(aluResult, regBvalue, CONTROL_MEM_ACCESS, CONTROL_ENABLE_MEM_WRITE) begin
    if (CONTROL_MEM_ACCESS == 1) begin
        if (CONTROL_ENABLE_MEM_WRITE == 0) begin // read
            memResult <= Data[aluResult];
        end
        
        if (CONTROL_ENABLE_MEM_WRITE == 1) begin // write
            Data[aluResult] <= regBvalue;
        end
    end
end

endmodule