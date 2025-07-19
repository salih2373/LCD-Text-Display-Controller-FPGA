`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:11:46 06/04/2024 
// Design Name: 
// Module Name:    LCDDisplay 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module LCDDisplay(

	input clk,
	input reset_n,
	input [7:0] data_btn,
	input button,
	input debounce_en,
	output RW,
	output RS,
	output E,
	output [7:0] data
);


	 wire RS_init_lcd, RW_init_lcd, E_init_lcd;
	 wire [7:0] data_init_lcd;
	 wire [1:0] init_complete_flag;
	 wire RS_btn_lcd, RW_btn_lcd, E_btn_lcd;
	 wire [7:0] data_btn_lcd;
	 wire clk_new;
	  
 ClkDiv ClkDiv1( .clk(clk),
 .reset(reset_n),
 .clk_1024(clk_new) 
	 );


InitLCD InitLCD1(
.clk(clk_new),
.reset_n(reset_n),
.RS_init_lcd( RS_init_lcd), 
.RW_init_lcd( RW_init_lcd), 
.E_init_lcd( E_init_lcd), 
.data_init_lcd(data_init_lcd),
.init_complete_flag(init_complete_flag)
);




 WriteAsciiLCD WriteAsciiLCD1( 
 .clk(clk_new), 
 .reset_n(reset_n),
 .data_btn(data_btn),
 .debounce_en(debounce_en),
 .button( button), 
 .RS_btn_lcd( RS_btn_lcd), 
 .RW_btn_lcd( RW_btn_lcd), 
 .E_btn_lcd( E_btn_lcd), 
 .data_btn_lcd(data_btn_lcd)
 );
 
 
  Mux2 Mux21(
  .RS_init_lcd( RS_init_lcd), 
  .RW_init_lcd( RW_init_lcd), 
  .E_init_lcd( E_init_lcd), 
  .data_init_lcd(data_init_lcd),
  .init_complete_flag(init_complete_flag),
  .RS_btn_lcd( RS_btn_lcd), 
  .RW_btn_lcd( RW_btn_lcd), 
  .E_btn_lcd( E_btn_lcd), 
  .data_btn_lcd(data_btn_lcd),
  .RW(RW), 
  .RS(RS),
  .E(E),
  .data(data)
  );
  










endmodule
