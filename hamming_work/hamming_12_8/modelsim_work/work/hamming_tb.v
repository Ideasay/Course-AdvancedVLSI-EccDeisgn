`timescale 1ns/1ns
module hamming_tb;

reg [7:0] data_in;
reg [7:0] memory[0:255];
wire [11:0] encoded_data;
wire [7:0] decoded_data;
wire error_flag; // if there is 1-bit error, signaling '1' otherwise '0'
wire correct_flag; // Singaling '1' whilst error correction is done 
reg sys_clk;
reg rstn;
reg [7:0] received_data;
reg bit_id;



hamming_encoder_8bit u0 (
	.data_in (data_in),
	.code_out(encoded_data)
);

hamming_decoder_8bit u1 (
	.data_out     (decoded_data),
	.error_flag   (error_flag), 
	.correct_flag (correct_flag), 
	.data_in      ({received_data[7:0], encoded_data[3:0]}),
	.sys_clk      (sys_clk),
	.rstn         (rstn)
);

initial begin
	$dumpfile("hamming_tb.vcd");
	$dumpvars;
	//output datain and dataout
	$monitor("%t:0x%h\tox%h",$time,data_in,decoded_data);
end

initial begin
	#0 rstn <= 1'b1;
	
	repeat (256) begin
		#1 rstn <= 1'b0;
		#1 rstn <= 1'b1;

		#8;
	end
end

initial begin
	#0 sys_clk <= 1'b0;
	forever #5 sys_clk <= ~sys_clk;
end

// Simulating the 1-bit error occurance
// integer bit_id; // randomly deciding one bit to be flipped
initial begin
	$srandom(8); // set the seed
	#0 received_data <= 'd0;
	
	repeat (256) begin
		#2 received_data <= encoded_data[12-1:4]; 
		//(SystemVerilog) #1 bit_id <= $urandom_range(8-1:0);
		#1 bit_id <= {$random} % 8;
	
		#1 received_data[bit_id] <= received_data[bit_id] ^ 1'b1; // error occur
		#6; 
	end
end

// test_read_write
//integer	file_rd;       //读入指针      
//initial begin
//	file_rd = $fopen("C:/Users/zhengxjie/Desktop/ECC/hamming/hamming_12_8/modelsim_work/test.txt","r");
//end
reg [7:0] n;

initial begin
	n = 'd0;
	$readmemh("C:/Users/zhengxjie/Desktop/ECC/hamming/hamming_12_8/modelsim_work/test.txt",memory);


	
end
always @(negedge rstn)
	begin
		data_in <= memory[n];
		n <= n+1;
	end

endmodule
