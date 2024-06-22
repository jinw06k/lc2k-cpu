module Program_Counter(
  input clk,
  input pcInput,

  output reg pcCurrent,
  output reg pcPlusOne
);

  initial begin
    pcCurrent = 0;
    pcPlusOne = 1;
  end

  always @(posedge clk) begin
    pcCurrent = pcInput;
    pcPlusOne = pcCurrent + 1;
  end
  
endmodule