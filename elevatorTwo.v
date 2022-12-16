`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CECS 361 - FALL 2022
// Engineer: Michelle Tran, Grecia Francisco, Shane Lobsinger
// 
// Create Date: 11/30/2022 08:35:58 PM
// Design Name: Elevator FSM 2.0
// Module Name: elevatorTwo
// Target Devices: xc7a100tcsg324-1
// 
//////////////////////////////////////////////////////////////////////////////////


module elevatorTwo(
    input in0, in1, in2, in3, in4, in5, in6,
    input in7, in8, in9,
    input clk,
    input reset,
    output reg [3:0] floorLED // connect to input of BCD_To_7Seg
    );
    
    reg [4:0] c_floor, n_floor;
    reg [26:0] counter;

 localparam     upG = 5'b00000, 
                   up1 = 5'b00001, 
                   up2 = 5'b00010, 
                   up3 = 5'b00011, 
                   up4 = 5'b00100, 
                   up5 = 5'b00101, 
                   up6 = 5'b00110, 
                   up7 = 5'b00111,
                 up8 = 5'b01000,
                 up9 = 5'b01001,
                 down8 = 5'b01010,
                 down7 = 5'b01011,
                 down6 = 5'b01100,
                 down5 = 5'b01101,
                 down4 = 5'b01110,
                 down3 = 5'b01111,
                 down2 = 5'b10000,
                 down1 = 5'b10001;


                   
    always@(posedge clk, posedge reset) begin
       if(reset) begin
            c_floor = upG;
            floorLED = 3'b000; 
//            counter = 27'b0;
       end
       else begin // 1 second = 100000000 counts if(counter == 100000000)
//           counter = 27'b0;
           c_floor = n_floor;  
            // determine what floor number to show on LEDs
            case(c_floor) 
              upG : floorLED <= 4'b0000; 
              up1 : floorLED <= 4'b0001; 
              up2 : floorLED <= 4'b0010;
              up3 : floorLED <= 4'b0011; 
              up4 : floorLED <= 4'b0100; 
              up5 : floorLED <= 4'b0101; 
              up6 : floorLED <= 4'b0110; 
              up7 : floorLED <= 4'b0111;
              up8 : floorLED <= 4'b1000;
              up9 : floorLED <= 4'b1001;
              down8 : floorLED <= 4'b1000; 
              down7 : floorLED <= 4'b0111; 
              down6 : floorLED <= 4'b0110;
              down5 : floorLED <= 4'b0101;
              down4 : floorLED <= 4'b0100; 
              down3 : floorLED <= 4'b0011; 
              down2 : floorLED <= 4'b0010; 
              down1 : floorLED <= 4'b0001; 
          endcase
            
        end
//        else begin
//            counter <= counter + 1'b1; // incrementation
//        end
    end

    // next state logic
    always@(*) begin
       case(c_floor)
           upG: n_floor = (in0) ? upG : up1;
           up1: n_floor = (in1) ? up1 : up2;
           up2: n_floor = (in2) ? up2 : up3;
           up3: n_floor = (in3) ? up3 : up4;
           up4: n_floor = (in4) ? up4 : up5;
           up5: n_floor = (in5) ? up5 : up6;
           up6: n_floor = (in6) ? up6 : up7;
           up7: n_floor = (in7) ? up7 : up8;
           up8: n_floor = (in8) ? up8 : up9;
           up9: n_floor = (in9) ? up9 : down8;
           down8: n_floor = (in8) ? down8 : down7;
           down7: n_floor = (in7) ? down7 : down6;
           down6: n_floor = (in6) ? down6 : down5;
           down5: n_floor = (in5) ? down5 : down4; 
           down4: n_floor = (in4) ? down4 : down3;
           down3: n_floor = (in3) ? down3 : down2;
           down2: n_floor = (in2) ? down2 : down1;
           down1: n_floor = (in1) ? down1 : upG;
       endcase
   end

endmodule
