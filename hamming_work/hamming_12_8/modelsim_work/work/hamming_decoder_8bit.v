`timescale 1ns/1ns

/************************************************
*												*
*	Module IO Definition-hamming (12,8)			*
*												*
************************************************/
module hamming_decoder_8bit (
	output reg [7:0] data_out,
	output error_flag, // 1-> 1 bit error
	output reg correct_flag, // 1-> correction done
	input [11:0] data_in,
	input sys_clk,
	input rstn
);

/************************************************
*												*
*				Wire Definition					*
*												*
************************************************/
	reg [3:0] error_detection;
	wire [7:0] mask_byte;

/************************************************
*												*
*	detect the error bit at	posedge sys_clk		*
*												*
************************************************/
	always @(posedge sys_clk, negedge rstn)
	begin
		if(rstn == 1'b0) 
			error_detection[3:0] <= 4'd0;
		else begin
			// error_detection[0] <= data_in[0] ^ data_in[0+4] ^ data_in[1+4] ^ data_in[3+4] ^ data_in[4+4] ^ data_in[6+4]; 
			// error_detection[1] <= data_in[1] ^ data_in[0+4] ^ data_in[2+4] ^ data_in[3+4] ^ data_in[5+4] ^ data_in[6+4]; 
			// error_detection[2] <= data_in[2] ^ data_in[1+4] ^ data_in[2+4] ^ data_in[3+4];
			// error_detection[3] <= data_in[3] ^ data_in[4+4] ^ data_in[5+4] ^ data_in[6+4]; 
			error_detection[0] <= data_in[0] ^ data_in[4] ^ data_in[5] ^ data_in[7] ^ data_in[8] ^ data_in[10]; 
			error_detection[1] <= data_in[1] ^ data_in[4] ^ data_in[6] ^ data_in[7] ^ data_in[9] ^ data_in[10]; 
			error_detection[2] <= data_in[2] ^ data_in[5] ^ data_in[6] ^ data_in[7] ^ data_in[11];
			error_detection[3] <= data_in[3] ^ data_in[8] ^ data_in[9] ^ data_in[10] ^ data_in[11]; 
		end			
	end

/************************************************
*												*
*	Correct the error bit at negedge sys_clk	*
*												*
************************************************/
	always @(negedge sys_clk, negedge rstn)
	begin
		if(rstn == 1'b0) begin 
			data_out[7:0] <= {8{1'bz}};
			correct_flag <= 1'b0;
		end
		else begin
			data_out[7:0] <= data_in[11:4] ^ mask_byte[7:0];
			correct_flag <= 1'b1;
		end
	end
	//comform the error bit
	assign mask_byte[7:0] =	(error_detection == 'd3 ) ? 'd1   : 
					       	(error_detection == 'd5 ) ? 'd2   :
					       	(error_detection == 'd6 ) ? 'd4   :
					       	(error_detection == 'd7 ) ? 'd8   :
					       	(error_detection == 'd9 ) ? 'd16  :
					       	(error_detection == 'd10) ? 'd32  :
					       	(error_detection == 'd11) ? 'd64  :
					       	(error_detection == 'd12) ? 'd128 : 0;

	assign error_flag = (error_detection[3:0] == 'd0) ? 1'b0 : 1'b1;
endmodule
