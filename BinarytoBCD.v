`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/10/2024 01:18:06 PM
// Design Name: 
// Module Name: BinarytoBCD
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


module BinarytoBCD(
    input [7:0] binaryinput,
    output [3:0] minutes,
    output [3:0] seconds_tens,
    output [3:0] seconds_ones
    );
    wire [5:0] seconds;

    
    assign seconds = binaryinput % 60;
    assign minutes = binaryinput / 60;
    
    assign seconds_tens = seconds / 10;
    assign seconds_ones = seconds % 10;
    
endmodule
