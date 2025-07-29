`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:29:17 06/11/2024
// Design Name:   LCDDisplay
// Module Name:   H:/FPGA_Prak/LCD_Module/LCDDisplay_Testbench.v
// Project Name:  LCD_Module
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: LCDDisplay
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module LCDDisplay_Testbench;

	// Inputs
	wire clk;
	reg reset_n;
	reg [7:0] data_btn;
	reg button;
	reg debounce_en;

	// Outputs
	wire RW;
	wire RS;
	wire E;
	wire [7:0] data;

	// Instantiate the Unit Under Test (UUT)
	LCDDisplay uut (
		.clk(clk), 
		.reset_n(reset_n), 
		.data_btn(data_btn), 
		.button(button), 
		.debounce_en(debounce_en), 
		.RW(RW), 
		.RS(RS), 
		.E(E), 
		.data(data)
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
		
		
		reset_n = 1 ; 
		debounce_en = 1;
		data_btn = 8'b10000011;
		#10 button = 1;
        
		// Add stimulus here

	end
      
endmodule

