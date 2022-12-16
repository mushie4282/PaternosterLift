`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CECS 361 - Fall 2022
// Engineer: Michelle Tran, Grecia Francisco, Shane Lobsinger
// 
// Create Date: 11/18/2022 02:57:29 PM
// Module Name: timeMux
// Project Name: Elevator Mechanism
// 
//////////////////////////////////////////////////////////////////////////////////

module Time_Mux(
    input clk, reset,
    input [7:0] display,
    output reg [7:0] an, // anodes
    output reg [7:0] sseg // led segments 
    );

    //signal declaration 
    reg [26:0] tick; // 100,000,000 cyles = 1s -> log2(10^8) = 26.5 -> 27 bits 
    reg [1:0] digit; // switching anode variable

    // counter 
    always@(posedge clk,  posedge reset) begin
        if (reset) begin
            tick <= 27'b0;
            digit <= 2'b0;
            an <= 8'b11111111;
            sseg <= 8'b00000000;
        end
        
        else if (tick == 700000) begin // after 7 ms, restart timer 700000 
            tick <= 27'b0;
            if(digit == 2'b00) begin
                an <= 8'b11111110; // most right LED display
                sseg <= display; // out FSM's output
                //sseg <= 8'b01010101; // used with timeMux_tb.v
                digit <= 2'b01; // switch to 1
            end
            // enter double digits
            else if(digit == 2'b01) begin
                an <= 8'b11111101; // 2nd most right LED display
                if(display == 8'b11000000)
                    sseg <= 8'b11111001; // number 1
                else
                    sseg <= 8'b11111111; // turn off
                digit <= 2'b10; // switch to 2
                // instead of if-else have display / 10 to
            end
            
            else begin // digit == 2
                an <= 8'b11111011; // 3rd most right LED display
                sseg <= 8'b01000111; // letter L
                digit <= 2'b00; // switch to 0
            end
        end
        
        else begin
            tick <= tick + 1'b1; // increment the tick 
        end
    end
    
endmodule
