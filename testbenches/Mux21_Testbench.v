`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:45:25 06/11/2024
// Design Name:   Mux2
// Module Name:   H:/FPGA_Prak/LCD_Module/Mux21_Testbench.v
// Project Name:  LCD_Module
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Mux2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Mux21_Testbench;

	// Inputs
	reg [7:0] data_init_lcd;
	reg RS_init_lcd;
	reg RW_init_lcd;
	reg E_init_lcd;
	reg RS_btn_lcd;
	reg RW_btn_lcd;
	reg E_btn_lcd;
	reg [7:0] data_btn_lcd;
	reg init_complete_flag;

	// Outputs
	wire [7:0] data;
	wire RW;
	wire RS;
	wire E;

	// Instantiate the Unit Under Test (UUT)
	Mux2 uut (
		.data_init_lcd(data_init_lcd), 
		.RS_init_lcd(RS_init_lcd), 
		.RW_init_lcd(RW_init_lcd), 
		.E_init_lcd(E_init_lcd), 
		.RS_btn_lcd(RS_btn_lcd), 
		.RW_btn_lcd(RW_btn_lcd), 
		.E_btn_lcd(E_btn_lcd), 
		.data_btn_lcd(data_btn_lcd), 
		.init_complete_flag(init_complete_flag), 
		.data(data), 
		.RW(RW), 
		.RS(RS), 
		.E(E)
	);

	initial begin
		// Initialize Inputs
		data_init_lcd = 0;
		RS_init_lcd = 0;
		RW_init_lcd = 0;
		E_init_lcd = 0;
		RS_btn_lcd = 0;
		RW_btn_lcd = 0;
		E_btn_lcd = 0;
		data_btn_lcd = 0;
		init_complete_flag = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
       data_init_lcd = 8'b10000011;
		 data_btn_lcd = 8'b01111100;
		 
		 
		 init_complete_flag = 0;
		 #100;
		 init_complete_flag = 1;
		 
		// Add stimulus here

	end
      
endmodule

