`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/10/2024 01:26:29 PM
// Design Name: 
// Module Name: BinarytoBCD_tb
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


module BinarytoBCD_tb(

    );
    reg [7:0] binary_input;
    wire [3:0] minutes;
    wire [3:0] seconds_tens;
    wire [3:0] seconds_ones;
    BinarytoBCD DUT(binary_input, minutes, seconds_tens, seconds_ones);
    
    initial 
    begin
    
    binary_input = 8'b00000000; // 0
    #10 binary_input = 8'b00000001; // 1
    #10 binary_input = 8'b00000010; // 2
    #10 binary_input = 8'b00010000; // 10
    #10 binary_input = 8'b00010101; // 21
    #10 binary_input = 8'b00011011; // 43
    #10 binary_input = 8'b00011111; // 63
    #10 binary_input = 8'b11111111; // 255
    #10 $finish;
    end
endmodule
