`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:02:32 06/11/2024
// Design Name:   WriteAsciiLCD
// Module Name:   H:/FPGA_Prak/LCD_Module/WriteAsciiLCD_Testbenche.v
// Project Name:  LCD_Module
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: WriteAsciiLCD
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module WriteAsciiLCD_Testbenche;

	// Inputs
	wire clk;
	reg reset_n;
	reg [7:0] data_btn;
	reg button;
	reg debounce_en;

	// Outputs
	wire RW_btn_lcd;
	wire RS_btn_lcd;
	wire E_btn_lcd;
	wire [7:0] data_btn_lcd;

	// Instantiate the Unit Under Test (UUT)
	WriteAsciiLCD uut (
		.clk(clk), 
		.reset_n(reset_n), 
		.data_btn(data_btn), 
		.button(button), 
		.debounce_en(debounce_en), 
		.RW_btn_lcd(RW_btn_lcd), 
		.RS_btn_lcd(RS_btn_lcd), 
		.E_btn_lcd(E_btn_lcd), 
		.data_btn_lcd(data_btn_lcd)
	);


		clock_generator clock_generator1(.clk(clk));
		
	initial begin
		// Initialize Inputs
		reset_n = 0;
		data_btn = 0;
		button = 0;
		debounce_en = 0;

		// Wait 100 ns for global reset to finish
		#100;
       reset_n = 1;
		 
		 debounce_en = 1;
		 #20 button = 1;
		 data_btn = 8'b10000011;
		
		 
		 

		// Add stimulus here

	end
      
endmodule

