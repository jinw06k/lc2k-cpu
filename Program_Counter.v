module Program_Counter(
  input clk,
  input pcInput,

  output reg pcCurrent,
  output reg pcPlusOne
);

  always @(posedge clk) begin
    pcCurrent = pcInput;
    pcPlusOne = pcCurrent + 1;
  end
endmodule