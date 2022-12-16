`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CECS 361 - Fall 2022
// Engineer: Michelle Tran, Grecia Francisco, Shane Lobsinger 
// 
// Create Date: 11/29/2022 10:05:14 PM
// Design Name: 
// Module Name: timeMux_tb
// Additional Comments: To see whether the anodes switches back and forth 
// 
//////////////////////////////////////////////////////////////////////////////////


module timeMux_tb();
    reg clk;
    reg reset; 
    wire [7:0] anode; 
    wire [7:0] cathode; 
    
    Time_Mux uut(.clk(clk), .reset(reset), .an(anode), .sseg(cathode)); 
    
    initial begin
        clk = 0;
        reset = 1;
        #10;
        reset = 0;
        forever begin  
            #5; 
            clk = ~clk;
        end        
    end

endmodule
