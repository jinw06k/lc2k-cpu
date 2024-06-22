module Clock (
    output reg clk
);

    initial begin
        clk = 1'b0;
        #50 $finish;
    end

    always begin 
        #1 clk = ~clk;
    end

endmodule