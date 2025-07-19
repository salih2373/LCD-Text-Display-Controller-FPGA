`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:03:12 06/04/2024 
// Design Name: 
// Module Name:    write_lcd_block 
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
module write_lcd_block(
   input clk,
	input reset_n,
	input [7:0] data_btn,
	input prell_flag,
	output reg RW_btn_lcd,
	output reg RS_btn_lcd,
	output reg E_btn_lcd,
	output reg [7:0] data_btn_lcd
);
		
		
		reg[1:0] state = 2'b00; 
		
	parameter state_idle = 2'b00;
	parameter state_buffer = 2'b01;
	parameter state_write =  2'b10;
	parameter state_reset = 2'b11;
	
	always @ (posedge clk or negedge reset_n) begin 
	
		if (!reset_n) begin 
			state <= state_idle;
			RW_btn_lcd <= 0;
			RS_btn_lcd <= 0;
			E_btn_lcd <= 0;
			data_btn_lcd <=0;
		end else begin 
		
		case (state)
		
			state_idle:
				
				if(prell_flag)begin
					state <= state_buffer;
				end 
				
			state_buffer:begin 
				
				RW_btn_lcd <= 0;
				RS_btn_lcd <= 1;
				E_btn_lcd  <= 1;
				data_btn_lcd <= data_btn;
				state <= state_write;
		  end
		  
		  
			state_write:begin 
			
				RW_btn_lcd <= 0;
				RS_btn_lcd <= 1;
				E_btn_lcd <= 0;
				data_btn_lcd <=data_btn;
				state <= state_reset;
				end
				
			state_reset:
			
				if(!prell_flag) begin
				
						state <= state_idle;
				end

	
			endcase
			
		end 
	end

endmodule
