`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:12:16 06/04/2024 
// Design Name: 
// Module Name:    InitLCD 
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
module InitLCD(
		input clk, 
		input reset_n, 
		output reg RS_init_lcd, 
		output reg RW_init_lcd, 
		output reg E_init_lcd,
		output reg init_complete_flag,
		output reg [7:0] data_init_lcd
    );
	 
	 
	 
	 
	 parameter power_on     =  3'b000;
	 parameter function_set =  3'b001;
	 parameter display_on_off =3'b010;
	 parameter display_clear = 3'b011;
	 parameter mode_set      = 3'b100;
	 parameter init_complete = 3'b101;
	 
	 
	 
	 reg [15:0] counter;
	 reg [2:0] state;
	 
	 
	 always @(posedge clk or negedge reset_n) begin 
		if(!reset_n) begin 
		
			state <= power_on;
			counter <= 3906;
			init_complete_flag <= 0;
			RS_init_lcd <= 0;
			RW_init_lcd <= 0;
			E_init_lcd <= 0;
			data_init_lcd <= 8'b00000000;
		
			
		end else begin

	
	case (state)
	
		power_on: begin
			
			data_init_lcd <= 8'b00111000;
			E_init_lcd <= 1;
			if(counter != 0) begin
				counter <= counter - 1'b1;
				
			end else begin
			E_init_lcd <= 0;
			state <= function_set;
			counter <=4 ;
			end
			end
			
			
		function_set:begin
			
			data_init_lcd <=8'b00001110;
			E_init_lcd <=1;
		   if(counter!=0) begin
				counter <= counter - 1'b1;
			
			end else begin
			E_init_lcd <= 0 ;
			state <= display_on_off;
			counter <= 4;
			

			end
			end
			
			
		display_on_off:begin
		
				data_init_lcd <= 8'b00000001;
				E_init_lcd <=1 ;
				
			if(counter!=0) begin
				counter <= counter - 1'b1;
				
			end else begin
				E_init_lcd <=0;
				state <= display_clear;
				counter <= 148;
				
				end
			end
			
			
		display_clear:begin
				data_init_lcd <= 8'b00000110;
				E_init_lcd <= 1 ;
				
			if(counter!=0) begin
				counter <= counter - 1'b1;
				
			end else begin
			
				E_init_lcd <= 0 ;
				state<=mode_set;
				counter <= 0;
				
			end
			end
			
			
		mode_set:begin
		
				E_init_lcd <= 1 ;
			
			if(counter!=0) begin
				counter <= counter - 1'b1;
				
			end else begin
				E_init_lcd <= 0 ;
				state <= init_complete;
				counter <= 4;
				
			end
			end
			
			
		init_complete:begin
			init_complete_flag <= 1;
			
		end
	endcase
end

end


endmodule
