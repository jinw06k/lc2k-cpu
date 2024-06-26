module Clock (
    output reg clk
);

    initial begin
        clk = 0;
    end

    always begin 
        #100 clk = ~clk;
    end

endmodule