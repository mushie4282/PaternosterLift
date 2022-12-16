`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CECS 361 - FALL 2022
// Engineer: Michelle Tran, Grecia Francisco, Shane Lobsinger
// 
// Create Date: 10/16/2022 12:26:15 PM
// Module Name: top 
// Project Name: Elevator Mechanism
// Target Devices: xc7a100tcsg324-1
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module top(
    input clk, // 100 Mhz internal driven clk
    input reset, // for synchronous logic 
    // individual switches for input
    input buttonG,
    input button1,
    input button2,
    input button3,
    input button4, 
    input button5,
    input button6, 
    input button7, button8, button9,
    output [7:0] Cathode, // drive the cathodes of the 7-seg display & decimal point
    output [7:0] Anode, // controls which 7-seg display to use
    // connect to switches to LEDs
    output LED0, LED1, LED2, LED3, LED4, LED5, LED6, LED7, LEDreset, LED8, LED9
    );
    
    // To turn on the LED when a switch is flipped
    assign LEDreset = (reset) ? 1 : 0;
    assign LED0 = (buttonG) ? 1 : 0; 
    assign LED1 = (button1) ? 1 : 0;
    assign LED2 = (button2) ? 1 : 0; 
    assign LED3 = (button3) ? 1 : 0;
    assign LED4 = (button4) ? 1 : 0; 
    assign LED5 = (button5) ? 1 : 0;
    assign LED6 = (button6) ? 1 : 0; 
    assign LED7 = (button7) ? 1 : 0;
    assign LED8 = (button8) ? 1 : 0;
    assign LED9 = (button9) ? 1 : 0; 
    
    wire [4:0] leds; // output of engine -> decoder
    wire [7:0] cath; // wire the connection between decoder to input of time multiplexer

    elevatorTwo engine(.clk(clk), .reset(reset), .in0(buttonG), .in1(button1), .in2(button2), .in3(button3), 
                   .in4(button4), .in5(button5), .in6(button6), .in7(button7), .floorLED(leds), .in8(button8), .in9(button9)); 
               
    BCD_To_7Seg decoder(.Q(leds), .cathode(cath));
    
    Time_Mux display(.clk(clk), .reset(reset), .an(Anode), .sseg(Cathode), .display(cath));
     
endmodule
