`timescale 1ns / 1ps

 module uart_tx(
    input clk,              // system clock (100 MHz on PYNQ Z2)
    input rst,
    input start,
    input [7:0] data_in,
    output reg tx,
    output reg busy
);

parameter CLK_FREQ = 100000000;
parameter BAUD_RATE = 9600;
parameter BAUD_COUNT = CLK_FREQ/BAUD_RATE;

reg [15:0] baud_counter = 0;
reg baud_tick = 0;

reg [3:0] bit_index = 0;
reg [9:0] shift_reg;

reg [1:0] state;

parameter IDLE  = 2'b00;
parameter START = 2'b01;
parameter DATA  = 2'b10;
parameter STOP  = 2'b11;

always @(posedge clk) begin
    if(baud_counter < BAUD_COUNT-1) begin
        baud_counter <= baud_counter + 1;
        baud_tick <= 0;
    end
    else begin
        baud_counter <= 0;
        baud_tick <= 1;
    end
end

always @(posedge clk or posedge rst) begin
    if(rst) begin
        state <= IDLE;
        tx <= 1;
        busy <= 0;
    end
    else begin
        case(state)

        IDLE: begin
            tx <= 1;
            busy <= 0;
            if(start) begin
                shift_reg <= {1'b1,data_in,1'b0}; 
                bit_index <= 0;
                busy <= 1;
                state <= START;
            end
        end

        START: begin
            if(baud_tick) begin
                tx <= shift_reg[0];
                shift_reg <= shift_reg >> 1;
                state <= DATA;
            end
        end

        DATA: begin
            if(baud_tick) begin
                tx <= shift_reg[0];
                shift_reg <= shift_reg >> 1;
                bit_index <= bit_index + 1;

                if(bit_index == 7)
                    state <= STOP;
            end
        end

        STOP: begin
            if(baud_tick) begin
                tx <= 1;
                state <= IDLE;
            end
        end

        endcase
    end
end

endmodule