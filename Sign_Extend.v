module Sign_Extend(
    input [15:0] offset,
    output reg [31:0] offsetExtended
);

    always @(offset) begin
        offsetExtended[31:0] <= { {16{extend[15]}}, extend[15:0] };
    end

endmodule