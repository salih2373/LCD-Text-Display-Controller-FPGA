`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:03:44 06/04/2024 
// Design Name: 
// Module Name:    Mux2 
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
module Mux2(

	input [7:0] data_init_lcd,
	input RS_init_lcd,
	input RW_init_lcd,
	input E_init_lcd,
	input RS_btn_lcd,
	input RW_btn_lcd,
	input E_btn_lcd,
	input [7:0]data_btn_lcd,
	input  init_complete_flag,
	
	output reg[7:0] data,
	output reg RW,
	output reg RS,
	output reg E
);




always @ (*) begin


	case(init_complete_flag) 
		0:begin
			data<=data_init_lcd ;
			RS<=RS_init_lcd;
			RW<= RW_init_lcd;
			E<=E_init_lcd;


			end


		1:begin 
			data<=data_btn_lcd ;
			RS<=RS_btn_lcd;
			RW<= RW_btn_lcd;
			E<=E_btn_lcd;
			end
	endcase
end
endmodule


