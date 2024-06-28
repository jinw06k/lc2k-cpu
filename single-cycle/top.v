module top(
    //input Clock,

    output LED0,
    output LED1,
    output LED2,
    output LED3,
    output LED4,
    output LED5
);

wire [31:0] reg1;
reg led0, led1, led2, led3, led4, led5;

// always @(posedge Clock)
//     clk <= clk + 1;

CPU lc2k_cpu(
    .clk(clk),
    .reg1out(reg1)
);

reg clk;

initial begin
    clk = 1;
end

always begin 
    #100 clk = ~clk;
end

always @(posedge clk) begin
    led0 = reg1[0];
    led1 = reg1[1];
    led2 = reg1[2];
    led3 = reg1[3];
    led4 = reg1[4];
    led5 = reg1[5];
end

assign LED0 = led0;
assign LED1 = led1;
assign LED2 = led2;
assign LED3 = led3;
assign LED4 = led4;
assign LED5 = led5;

initial begin
        $dumpfile("test.vcd");
        $dumpvars(0,top);
    end

    initial
    $monitor("At time %t, %0d,%0d,%0d,%0d,%0d,%0d,",
              $time, LED5, LED4, LED3, LED2, LED1, LED0);

endmodule