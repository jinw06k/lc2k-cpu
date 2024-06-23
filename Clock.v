module Clock (
    input CONTROL_HALT,
    output reg clk
);

    initial begin
        clk = 0;
    end

    always begin 
        if (CONTROL_HALT == 1) begin
            $finish;
        end
        #100 clk = ~clk;
    end

endmodule