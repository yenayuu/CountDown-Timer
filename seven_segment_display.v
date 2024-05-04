`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/10/2024 01:46:28 PM
// Design Name: 
// Module Name: seven_segment_display
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


module seven_segment_display(
    input[3:0] bcd_input,
    output reg [6:0] cathode
    );
    
    initial begin
        cathode = 7'b0000001;
    end
    
    always @(bcd_input) begin
        case(bcd_input)
            0:cathode<=7'b0000001;
            1:cathode<=7'b1001111;
            2:cathode<=7'b0010010;
            3:cathode<=7'b0000110;
            4:cathode<=7'b1001100;
            5:cathode<=7'b0100100;
            6:cathode<=7'b0100000;
            7:cathode<=7'b0001111;
            8:cathode<=7'b0000000;
            9: cathode<=7'b0000100;
            default: cathode <= 7'b1111111;
        endcase
    end
    
endmodule
