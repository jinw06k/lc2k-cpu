module Clock (
    input CONTROL_HALT,
    output reg clk
);

    initial begin
        clk = 1'b0;
        #1;
    end

    always @(CONTROL_HALT == 0) begin 
        #1 clk = ~clk;
    end

endmodule