`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2024 02:11:55 PM
// Design Name: 
// Module Name: debouncer
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


module debouncer(
    input clk, button,
    output reg clean = 1'b0
);

    reg [16:0] counter;
    parameter max = 100;
     
    
    always@(posedge clk)
    begin
        if (button == clean)begin
            counter = 0;
        end
        else if (counter == max)begin
            clean = button;
        end
        else begin
            counter = counter + 1;
        end
    end

endmodule
