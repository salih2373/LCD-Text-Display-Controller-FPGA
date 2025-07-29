`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:33:40 06/11/2024
// Design Name:   write_lcd_block
// Module Name:   H:/FPGA_Prak/LCD_Module/write_lcd_block_Testbench.v
// Project Name:  LCD_Module
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: write_lcd_block
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module write_lcd_block_Testbench;

	// Inputs
	wire clk;
	reg reset_n;
	reg [7:0] data_btn;
	reg prell_flag;

	// Outputs
	wire RW_btn_lcd;
	wire RS_btn_lcd;
	wire E_btn_lcd;
	wire [7:0] data_btn_lcd;

	// Instantiate the Unit Under Test (UUT)
	write_lcd_block uut (
		.clk(clk), 
		.reset_n(reset_n), 
		.data_btn(data_btn), 
		.prell_flag(prell_flag), 
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
		prell_flag = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		reset_n = 1;
		
		#20;
		
		prell_flag = 1;
		data_btn = 8'b10001100;
		
		
        
		// Add stimulus here

	end
      
endmodule

