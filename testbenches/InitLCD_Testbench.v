`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:24:28 06/04/2024
// Design Name:   InitLCD
// Module Name:   H:/FPGA_Prak/LCD_Module/InitLCD_Testbench.v
// Project Name:  LCD_Module
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: InitLCD
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module InitLCD_Testbench;

	// Inputs
	wire clk;
	reg reset_n;

	// Outputs
	wire RS_init_lcd;
	wire RW_init_lcd;
	wire E_init_lcd;
	wire init_complete_flag;
	wire [7:0] data_init_lcd;

	// Instantiate the Unit Under Test (UUT)
	InitLCD uut (
		.clk(clk), 
		.reset_n(reset_n),  
		.RS_init_lcd(RS_init_lcd), 
		.RW_init_lcd(RW_init_lcd), 
		.E_init_lcd(E_init_lcd), 
		.init_complete_flag(init_complete_flag), 
		.data_init_lcd(data_init_lcd)
	);
	
	
	
	clock_generator clock_generator1(.clk(clk));

	initial begin
		// Initialize Inputs
		
		reset_n = 0; #100;
		reset_n = 1; #100000;
		

		// Wait 100 ns for global reset to finish
		
        
		// Add stimulus here

	end
      
endmodule

