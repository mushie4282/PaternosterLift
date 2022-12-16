`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CECS 361 - FALL 2022
// Engineer: Michelle Tran, Grecia Francisco, Shane Lobsinger
// 
// Create Date: 10/26/2022 01:58:38 PM
// Design Name: 
// Module Name: fsm_tb
// Project Name: Elevator Mechanism
// Target Devices: Nexys A7-100T
// Tool Versions: 
// Description: Testing the top module's FSM's ability. 
// This testbench was originally for fsm.v, but now it is the testbench for elevatorTwo.v
//////////////////////////////////////////////////////////////////////////////////


module fsm_tb();
    reg clk_tb; 
    reg reset_tb; 
    wire [3:0] floorLED_tb;
    reg in0_tb, in1_tb, in2_tb, in3_tb, in4_tb, in5_tb, in6_tb, in7_tb, in8_tb, in9_tb;
    
    localparam delay = 20; // the delay should be twice as long as the clock delay in order for FSM to work properly
    
     elevatorTwo uut(.clk(clk_tb), .floorLED(floorLED_tb), .reset(reset_tb), 
                      .in0(in0_tb), .in1(in1_tb), .in2(in2_tb), .in3(in3_tb), 
                      .in4(in4_tb), .in5(in5_tb), .in6(in6_tb), .in7(in7_tb),
                      .in8(in8_tb), .in9(in9_tb));
    
    
    // clock generation
    always #10 clk_tb = ~clk_tb;
    
    // self-checking that the circuit stays on certain floors and also increments / decrements 
    initial begin
        clk_tb = 0;
        reset_tb = 1;
        {in9_tb, in8_tb, in7_tb, in6_tb, in5_tb, in4_tb, in3_tb, in2_tb, in1_tb, in0_tb} = 0;
        #delay;
        
        reset_tb = 0;
        {in9_tb, in8_tb, in7_tb, in6_tb, in5_tb, in4_tb, in3_tb, in2_tb, in1_tb, in0_tb} = 0; 
        
        #delay; 
        {in9_tb, in8_tb, in7_tb, in6_tb, in5_tb, in4_tb, in3_tb, in2_tb, in1_tb, in0_tb} = 2; 

        #delay;
        {in9_tb, in8_tb, in7_tb, in6_tb, in5_tb, in4_tb, in3_tb, in2_tb, in1_tb, in0_tb} = 2;

        #delay;
        {in9_tb, in8_tb, in7_tb, in6_tb, in5_tb, in4_tb, in3_tb, in2_tb, in1_tb, in0_tb} = 0; 
        
        #delay; 
        {in9_tb, in8_tb, in7_tb, in6_tb, in5_tb, in4_tb, in3_tb, in2_tb, in1_tb, in0_tb} = 0; 
        
        #delay;
        {in9_tb, in8_tb, in7_tb, in6_tb, in5_tb, in4_tb, in3_tb, in2_tb, in1_tb, in0_tb} = 8; 
        
        #delay;
        {in9_tb, in8_tb, in7_tb, in6_tb, in5_tb, in4_tb, in3_tb, in2_tb, in1_tb, in0_tb} = 1;
        
        #delay;
        {in9_tb, in8_tb, in7_tb, in6_tb, in5_tb, in4_tb, in3_tb, in2_tb, in1_tb, in0_tb} = 16; 
        
        #delay; 
        {in9_tb, in8_tb, in7_tb, in6_tb, in5_tb, in4_tb, in3_tb, in2_tb, in1_tb, in0_tb} = 2; 
        
    
    end // end of intial block
endmodule
