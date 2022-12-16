`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CECS 301
// Engineer: Michelle Tran
// 
// Create Date: 03/01/2022 12:45:38 PM
// Module Name: BCD_To_7Seg decoder
// Project Name: LAB 2 
// Notes: 0 -> cathode -> turn LED on (the board uses transistors -> inverts anode enables)
//////////////////////////////////////////////////////////////////////////////////


module BCD_To_7Seg(
    input [2:0] Q, // will be input from counter when connected in top module
    output reg [7:0] cathode, // drive the cathodes of the 7-seg display & decimal point
    output reg [7:0] cathode_L, // to display 'L'
    output reg [7:0] anode // control which LED is on
    );
    
    // probably will not work
    // to make the 2nd to last LED from the right to only display 'L'
    always@(*) begin
        anode = 8'b11111101; 
        cathode_L = 8'b11100011;//'L' symbol in 7-segment LED
    end
    
    
    // common anode -> cathodes become active low
    always@(*) begin // describing combinational logic using a decoder
        anode = 8'b11111110; 
        case(Q)
            3'b0000 : cathode = 8'b00000011;
            3'b0001 : cathode = 8'b10011111;
            3'b0010 : cathode = 8'b00100101;
            3'b0011 : cathode = 8'b00001101;
            3'b0100 : cathode = 8'b10011001;
            3'b0101 : cathode = 8'b01001001;
            3'b0110 : cathode = 8'b01000001;
            3'b0111 : cathode = 8'b00011111;
            default : cathode = 8'b11111110; // decimal point is turned ON
        endcase
    end
endmodule
