`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:13:02 06/04/2024 
// Design Name: 
// Module Name:    WriteAsciiLCD 
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
module WriteAsciiLCD(
input clk,
input reset_n,
input [7:0] data_btn ,
input button,
input debounce_en,
output RW_btn_lcd,
output RS_btn_lcd,
output E_btn_lcd,
output [7:0] data_btn_lcd
);

wire prell_flag;


debouncer debouncer1(
.clk(clk),
.reset_n(reset_n),
.button(button),
.debounce_en(debounce_en),
.prell_flag(prell_flag)
);


write_lcd_block write_lcd_block1(
.clk(clk),
.reset_n(reset_n),
.data_btn(data_btn),
.prell_flag(prell_flag),
.RW_btn_lcd(RW_btn_lcd),
.RS_btn_lcd(RS_btn_lcd),
.E_btn_lcd(E_btn_lcd),
.data_btn_lcd(data_btn_lcd)
);


endmodule
