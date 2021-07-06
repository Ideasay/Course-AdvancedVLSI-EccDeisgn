`timescale 1ns/1ns
/************************************************
*												*
*	Module IO Definition-hamming (12,8)			*
*												*
************************************************/
module hamming_encoder_8bit (
	input [7:0] data_in,
	output wire [11:0] code_out
);
/************************************************
*												*
*				Wire Definition					*
*												*
************************************************/
wire [3:0] parity;
/************************************************
*												*
*				calc the parity bits			*
*												*
************************************************/	
	assign parity[0] = data_in[0] ^ data_in[1] ^ data_in[3] ^ data_in[4] ^ data_in[6];
	assign parity[1] = data_in[0] ^ data_in[2] ^ data_in[3] ^ data_in[5] ^ data_in[6];
	assign parity[2] = data_in[1] ^ data_in[2] ^ data_in[3] ^ data_in[7];
	assign parity[3] = data_in[4] ^ data_in[5] ^ data_in[6] ^ data_in[7]; 
	assign code_out[11:0] = {data_in[7:0], parity[3:0]};
endmodule
