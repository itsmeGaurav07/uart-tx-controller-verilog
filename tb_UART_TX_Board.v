`timescale 1ns / 1ps

module uart_tx_tb();

reg clk;
reg rst;
reg start;
reg [7:0] data_in;

wire tx;
wire busy;

uart_tx uut(
    .clk(clk),
    .rst(rst),
    .start(start),
    .data_in(data_in),
    .tx(tx),
    .busy(busy)
);

always #5 clk = ~clk;   // 100 MHz clock

initial begin

clk = 0;
rst = 1;
start = 0;
data_in = 8'h55;

#20
rst = 0;

#20
start = 1;

#10
start = 0;

#100000

$stop;

end

endmodule