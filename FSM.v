`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2024 01:10:11 PM
// Design Name: 
// Module Name: FSM
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module FSM(
    input clock, set, reset,
    input [7:0] switch_number,
    output reg [6:0] cathode,
    output reg [7:0] anode
    //output newclock2
    );
    
    reg [3:0] four_bit_number;
    reg [1:0] state;
    wire [6:0] minutes, seconds_tens, seconds_ones;
    wire newclock, newclock2;
    wire clean, clean2;
        
    clk_divider D1(clock, reset, newclock);
    clk_divider2 D2(clock, reset, newclock2);
    debouncer d1(clock, reset, clean);
    debouncer d2(clock, set, clean2);
    CountdownTimer C1(newclock, switch_number, clean, clean2, seconds_ones, seconds_tens, minutes);
    
    
    initial begin
        state = 0;
        anode = 8'b11111111;
    end
    
    always @(posedge newclock2) begin
        if (state == 2'b00)begin
            cathode <= seconds_ones;
            anode = 8'b11111110;
            state <= state + 1;
        end
        else if (state == 2'b01)begin
            cathode <= seconds_tens;
            anode = 8'b11111101;
            state <= state + 1;
        end
        else if (state == 2'b10)begin
            cathode <= minutes;
            anode = 8'b11111011;
            state = 0;
        end
    end
endmodule
