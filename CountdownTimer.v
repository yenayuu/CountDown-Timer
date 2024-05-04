`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 04/17/2024 12:26:01 PM
// Design Name:
// Module Name: CountdownTimer
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


module CountdownTimer(
    input clock,
    input [7:0] switches,
    input set, reset,
    output [6:0] seven_segment_second_ones, seven_segment_second_tens,
seven_segment_minutes
    );

    wire [3:0] minutes;
    wire [3:0] seconds_tens;
    wire [3:0] seconds_ones;
    reg [7:0] switches2;
    reg [7:0] switches3;
    reg [1:0] state;

    BinarytoBCD B1(switches2, minutes, seconds_tens, seconds_ones);


    seven_segment_display S1(minutes, seven_segment_minutes);
    seven_segment_display S2(seconds_tens, seven_segment_second_tens);
    seven_segment_display S3(seconds_ones, seven_segment_second_ones);

    initial begin
        state = 0;
    end

    always @(posedge reset or posedge set)
    begin
        if (reset)
        begin
            state <= 0;
        end
        else if(set)
        begin
            if (state == 0 || state == 2)
                state = 1;
            else if (state == 1)
                state = 2;

//            if (state == 0 || state == 2 || state == 3) begin
//                switches2 = switches;
//                state <= 1;
//            end
//            else if (state == 1) begin
//                state <= 2;
//            end
        end
    end

    always @(posedge clock)
    begin
        if (state == 0)
            switches2 = 0;
        else if (state == 2)
            if (switches2 == 0)
               switches2 = 0; 
         else switches2 = switches2 - 1;
        else if (state == 1)
            switches2 = switches;
        else if (state == 3)
            switches2 = 0;
//        else if (switches2 == 0)
//            state = 0;
      
     end

endmodule