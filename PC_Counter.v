module PC_Counter(
    input clk,
    input pcInput,
    input offsetExtended,
    input CONTROL_JUMP,

    output reg pcCurrent,
    output reg pcPlusOne         // PC + 1
);

always @(posedge clk) begin
    if (CONTROL_JUMP == 0) begin
      pcNext <= pcPrev + 1;
    end

    else begin
      pcNext <= pcPrev + 1 + offsetExtended;
    end
  end
endmodule