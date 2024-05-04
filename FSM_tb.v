`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2024 01:35:33 PM
// Design Name: 
// Module Name: FSM_tb
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


`timescale 1ns / 1ps

module FSM_tb;

    // Parameters
    parameter CLOCK_PERIOD = 10; // Clock period in ns

    // Signals
    reg clock;
    reg set;
    reg reset;
    reg [7:0] switch_number;
    wire [6:0] cathode;
    wire [7:0] anode;
    wire newclock2;

    // Instantiate the FSM module
    FSM dut (
        .clock(clock),
        .set(set),
        .reset(reset),
        .switch_number(switch_number),
        .cathode(cathode),
        .anode(anode)
    );

    // Clock generation
    always #((CLOCK_PERIOD)/2) clock = ~clock;

    // Testbench stimulus
    initial begin
        // Initialize inputs
        clock = 0;
        set = 0;
        reset = 0;
        switch_number = 8'b00000000;

        // Reset FSM
        reset = 1;
        #10;
        reset = 0;
        #40;

        // Test case 1: Set the switches to a value
        switch_number = 8'b01010101; // For example
        #40;
        set = 1;
        #50;
        set = 0;
        #100; // Wait for some time

        // Test case 2: Reset the countdown
        reset = 1;
        #50;
        reset = 0;
        #100; // Wait for some time

        // Add more test cases as needed...

        // End simulation
        $finish;
    end

endmodule
