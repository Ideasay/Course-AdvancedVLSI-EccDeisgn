/*****************************************************/
// name    :rscode.v
// edit by : luk
// function:根据编码的电路图进行描述。依照GF域乘法器原理生成各个乘法器。
// 
//  
//
//
/****************************************************/

// g0 = 79
module rs_enc_m0(y,x);
output	[7:0]	y;
input	[7:0]	x;
reg		[7:0]	y;

always@(x)
begin
	y[0] = x[0] ^ x[2] ^ x[5];
	y[1] = x[0] ^ x[1] ^ x[3] ^ x[6];
	y[2] = x[0] ^ x[1] ^ x[4] ^ x[5] ^ x[7];
	y[3] = x[0] ^ x[1] ^ x[6];
	y[4] = x[1] ^ x[5] ^ x[7];
	y[5] = x[2] ^ x[6];
	y[6] = x[0] ^ x[3] ^ x[7];
	y[7] = x[1] ^ x[4];
end
endmodule


//g1 = 44
module rs_enc_m1(y,x);
output	[7:0]	y;
input	[7:0]	x;
reg		[7:0]	y;

always@(x)
begin
   y[0] = x[3] ^ x[5] ^ x[6] ^ x[7];
   y[1] = x[4] ^ x[6] ^ x[7];
   y[2] = x[0] ^ x[3] ^ x[6];
   y[3] = x[0] ^ x[1] ^ x[3] ^ x[4] ^ x[5] ^ x[6];
   y[4] = x[1] ^ x[2] ^ x[3] ^ x[4];
   y[5] = x[0] ^ x[2] ^ x[3] ^ x[4] ^ x[5];
   y[6] = x[1] ^ x[3] ^ x[4] ^ x[5] ^ x[6];
   y[7] = x[2] ^ x[4] ^ x[5] ^ x[6] ^ x[7];
/*	y[0] = x[3] ^ x[5] ^ x[6] ^ x[7];
	y[1] = x[4] ^ x[7] ^ x[6];
	y[2] = x[0] ^ x[3] ^ x[6];// ^ x[5] ^ x[7];
	y[3] = x[0] ^ x[1] ^ x[3] ^ x[4] ^ x[5] ^ x[6];
	y[4] = x[1] ^ x[5] ^ x[7];
	y[5] = x[2] ^ x[6];
	y[6] = x[0] ^ x[3] ^ x[7];
	y[7] = x[1] ^ x[4];    */
end
endmodule


// g2 = 81
module rs_enc_m2(y,x);
output	[7:0]	y;
input	[7:0]	x;
reg		[7:0]	y;

always@(x)
begin
   y[0] = x[0] ^ x[2] ^ x[4] ^ x[6] ^ x[7];
   y[1] = x[1] ^ x[3] ^ x[5] ^ x[7];
   y[2] = x[7];
   y[3] = x[2] ^ x[4] ^ x[6] ^ x[7];
   y[4] = x[0] ^ x[2] ^ x[3] ^ x[4] ^ x[5] ^ x[6];
   y[5] = x[1] ^ x[3] ^ x[4] ^ x[5] ^ x[6] ^ x[7];
   y[6] = x[0] ^ x[2] ^ x[4] ^ x[5] ^ x[6] ^ x[7];
   y[7] = x[1] ^ x[3] ^ x[5] ^ x[6] ^ x[7];
end
endmodule


// g3 = 100 
module rs_enc_m3(y,x);
output	[7:0]	y;
input	[7:0]	x;
reg		[7:0]	y;

always@(x)
begin
   y[0] = x[2] ^ x[3];
   y[1] = x[3] ^ x[4];
   y[2] = x[0] ^ x[2] ^ x[3] ^ x[4] ^ x[5];
   y[3] = x[1] ^ x[2] ^ x[4] ^ x[5] ^ x[6];
   y[4] = x[5] ^ x[6] ^ x[7];
   y[5] = x[0] ^ x[6] ^ x[7];
   y[6] = x[0] ^ x[1] ^ x[7];
   y[7] = x[1] ^ x[2];
end
endmodule


// g4 = 49
module rs_enc_m4(y,x);
output	[7:0]	y;
input	[7:0]	x;
reg		[7:0]	y;

always@(x)
begin
   y[0] = x[0] ^ x[3] ^ x[4] ^ x[7];
   y[1] = x[1] ^ x[4] ^ x[5];
   y[2] = x[2] ^ x[3] ^ x[4] ^ x[5] ^ x[6] ^ x[7];
   y[3] = x[5] ^ x[6];
   y[4] = x[0] ^ x[3] ^ x[4] ^ x[6];
   y[5] = x[0] ^ x[1] ^ x[4] ^ x[5] ^ x[7];
   y[6] = x[1] ^ x[2] ^ x[5] ^ x[6];
   y[7] = x[2] ^ x[3] ^ x[6] ^ x[7];
end
endmodule


// g5 = 183
module rs_enc_m5(y,x);
output	[7:0]	y;
input	[7:0]	x;
reg		[7:0]	y;

always@(x)
begin
   y[0] = x[0] ^ x[1] ^ x[3] ^ x[4] ^ x[5] ^ x[7];
   y[1] = x[0] ^ x[1] ^ x[2] ^ x[4] ^ x[5] ^ x[6];
   y[2] = x[0] ^ x[2] ^ x[4] ^ x[6];
   y[3] = x[4];
   y[4] = x[0] ^ x[1] ^ x[3] ^ x[4] ^ x[7];
   y[5] = x[0] ^ x[1] ^ x[2] ^ x[4] ^ x[5];
   y[6] = x[1] ^ x[2] ^ x[3] ^ x[5] ^ x[6];
   y[7] = x[0] ^ x[2] ^ x[3] ^ x[4] ^ x[6] ^ x[7];
end
endmodule


// g6 = 56
module rs_enc_m6(y,x);
output	[7:0]	y;
input	[7:0]	x;
reg		[7:0]	y;

always@(x)
begin
   y[0] = x[3] ^ x[4] ^ x[5] ^ x[7];
   y[1] = x[4] ^ x[5] ^ x[6];
   y[2] = x[3] ^ x[4] ^ x[6];
   y[3] = x[0] ^ x[3];
   y[4] = x[0] ^ x[1] ^ x[3] ^ x[5] ^ x[7];
   y[5] = x[0] ^ x[1] ^ x[2] ^ x[4] ^ x[6];
   y[6] = x[1] ^ x[2] ^ x[3] ^ x[5] ^ x[7];
   y[7] = x[2] ^ x[3] ^ x[4] ^ x[6];

end
endmodule

// g7 = 17
module rs_enc_m7(y,x);
output	[7:0]	y;
input	[7:0]	x;
reg		[7:0]	y;

always@(x)
begin
   y[0] = x[0] ^ x[4];
   y[1] = x[1] ^ x[5];
   y[2] = x[2] ^ x[4] ^ x[6];
   y[3] = x[3] ^ x[4] ^ x[5] ^ x[7];
   y[4] = x[0] ^ x[5] ^ x[6];
   y[5] = x[1] ^ x[6] ^ x[7];
   y[6] = x[2] ^ x[7];
   y[7] = x[3];
end
endmodule


// g8 = 232
module rs_enc_m8(y,x);
output	[7:0]	y;
input	[7:0]	x;
reg		[7:0]	y;

always@(x)
begin
   y[0] = x[1] ^ x[2] ^ x[3] ^ x[7];
   y[1] = x[2] ^ x[3] ^ x[4];
   y[2] = x[1] ^ x[2] ^ x[4] ^ x[5] ^ x[7];
   y[3] = x[0] ^ x[1] ^ x[5] ^ x[6] ^ x[7];
   y[4] = x[3] ^ x[6];
   y[5] = x[0] ^ x[4] ^ x[7];
   y[6] = x[0] ^ x[1] ^ x[5];
   y[7] = x[0] ^ x[1] ^ x[2] ^ x[6];
end
endmodule


// g9 = 187
module rs_enc_m9(y,x);
output	[7:0]	y;
input	[7:0]	x;
reg		[7:0]	y;

always@(x)
begin
   y[0] = x[0] ^ x[1] ^ x[3] ^ x[4] ^ x[6] ^ x[7];
   y[1] = x[0] ^ x[1] ^ x[2] ^ x[4] ^ x[5] ^ x[7];
   y[2] = x[2] ^ x[4] ^ x[5] ^ x[7];
   y[3] = x[0] ^ x[1] ^ x[4] ^ x[5] ^ x[7];
   y[4] = x[0] ^ x[2] ^ x[3] ^ x[4] ^ x[5] ^ x[7];
   y[5] = x[0] ^ x[1] ^ x[3] ^ x[4] ^ x[5] ^ x[6];
   y[6] = x[1] ^ x[2] ^ x[4] ^ x[5] ^ x[6] ^ x[7];
   y[7] = x[0] ^ x[2] ^ x[3] ^ x[5] ^ x[6] ^ x[7];
end
endmodule


// g10 = 126 
module rs_enc_m10(y,x);
output	[7:0]	y;
input	[7:0]	x;
reg		[7:0]	y;

always@(x)
begin
   y[0] = x[2] ^ x[3] ^ x[4] ^ x[5] ^ x[7];
   y[1] = x[0] ^ x[3] ^ x[4] ^ x[5] ^ x[6];
   y[2] = x[0] ^ x[1] ^ x[2] ^ x[3] ^ x[6];
   y[3] = x[0] ^ x[1] ^ x[5];
   y[4] = x[0] ^ x[1] ^ x[3] ^ x[4] ^ x[5] ^ x[6] ^ x[7];
   y[5] = x[0] ^ x[1] ^ x[2] ^ x[4] ^ x[5] ^ x[6] ^ x[7];
   y[6] = x[0] ^ x[1] ^ x[2] ^ x[3] ^ x[5] ^ x[6] ^ x[7];
   y[7] = x[1] ^ x[2] ^ x[3] ^ x[4] ^ x[6] ^ x[7];
end
endmodule


// g11 = 104
module rs_enc_m11(y,x);
output	[7:0]	y;
input	[7:0]	x;
reg		[7:0]	y;

always@(x)
begin
   y[0] = x[2] ^ x[3] ^ x[5] ^ x[6];
   y[1] = x[3] ^ x[4] ^ x[6] ^ x[7];
   y[2] = x[2] ^ x[3] ^ x[4] ^ x[6] ^ x[7];
   y[3] = x[0] ^ x[2] ^ x[4] ^ x[6] ^ x[7];
   y[4] = x[1] ^ x[2] ^ x[6] ^ x[7];
   y[5] = x[0] ^ x[2] ^ x[3] ^ x[7];
   y[6] = x[0] ^ x[1] ^ x[3] ^ x[4];
   y[7] = x[1] ^ x[2] ^ x[4] ^ x[5];
end
endmodule


// g12 = 31
module rs_enc_m12(y,x);
output	[7:0]	y;
input	[7:0]	x;
reg		[7:0]	y;

always@(x)
begin
   y[0] = x[0] ^ x[4] ^ x[5] ^ x[6] ^ x[7];
   y[1] = x[0] ^ x[1] ^ x[5] ^ x[6] ^ x[7];
   y[2] = x[0] ^ x[1] ^ x[2] ^ x[4] ^ x[5];
   y[3] = x[0] ^ x[1] ^ x[2] ^ x[3] ^ x[4] ^ x[7];
   y[4] = x[0] ^ x[1] ^ x[2] ^ x[3] ^ x[6] ^ x[7];
   y[5] = x[1] ^ x[2] ^ x[3] ^ x[4] ^ x[7];
   y[6] = x[2] ^ x[3] ^ x[4] ^ x[5];
   y[7] = x[3] ^ x[4] ^ x[5] ^ x[6];
end
endmodule


// g13 = 103
module rs_enc_m13(y,x);
output	[7:0]	y;
input	[7:0]	x;
reg		[7:0]	y;

always@(x)
begin
   y[0] = x[0] ^ x[2] ^ x[3] ^ x[7];
   y[1] = x[0] ^ x[1] ^ x[3] ^ x[4];
   y[2] = x[0] ^ x[1] ^ x[3] ^ x[4] ^ x[5] ^ x[7];
   y[3] = x[1] ^ x[3] ^ x[4] ^ x[5] ^ x[6] ^ x[7];
   y[4] = x[3] ^ x[4] ^ x[5] ^ x[6];
   y[5] = x[0] ^ x[4] ^ x[5] ^ x[6] ^ x[7];
   y[6] = x[0] ^ x[1] ^ x[5] ^ x[6] ^ x[7];
   y[7] = x[1] ^ x[2] ^ x[6] ^ x[7];

end
endmodule


// g14 = 52
module rs_enc_m14(y,x);
output	[7:0]	y;
input	[7:0]	x;
reg		[7:0]	y;

always@(x)
begin
   y[0] = x[3] ^ x[4] ^ x[6] ^ x[7];
   y[1] = x[4] ^ x[5] ^ x[7];
   y[2] = x[0] ^ x[3] ^ x[4] ^ x[5] ^ x[7];
   y[3] = x[1] ^ x[3] ^ x[5] ^ x[7];
   y[4] = x[0] ^ x[2] ^ x[3] ^ x[7];
   y[5] = x[0] ^ x[1] ^ x[3] ^ x[4];
   y[6] = x[1] ^ x[2] ^ x[4] ^ x[5];
   y[7] = x[2] ^ x[3] ^ x[5] ^ x[6];
end
endmodule


// g15 = 118
module rs_enc_m15(y,x);
output	[7:0]	y;
input	[7:0]	x;
reg		[7:0]	y;

always@(x)
begin
   y[0] = x[2] ^ x[3] ^ x[4] ^ x[7];
   y[1] = x[0] ^ x[3] ^ x[4] ^ x[5];
   y[2] = x[0] ^ x[1] ^ x[2] ^ x[3] ^ x[5] ^ x[6] ^ x[7];
   y[3] = x[1] ^ x[6];
   y[4] = x[0] ^ x[3] ^ x[4];
   y[5] = x[0] ^ x[1] ^ x[4] ^ x[5];
   y[6] = x[0] ^ x[1] ^ x[2] ^ x[5] ^ x[6];
   y[7] = x[1] ^ x[2] ^ x[3] ^ x[6] ^ x[7];
end
endmodule


// g16 = 1
/*
module rs_enc_m16(y,x);
output	[7:0]	y;
input	[7:0]	x;
reg		[7:0]	y;

always@(x)
begin
   y[0] = x[0];
   y[1] = x[1];
   y[2] = x[2];
   y[3] = x[3];
   y[4] = x[4];
   y[5] = x[5];
   y[6] = x[6];
   y[7] = x[7];
end
endmodule
*/

// this is the symthesis form of all multipliers above...
// we need to change the wire 
module rs_enc (y, x, enable, data, clk, clrn);
//x为输入，每次输入为8bit。
	input [7:0] x;
	input clk, clrn, enable, data;
	output [7:0] y;
	reg [7:0] y;
//乘法器输入
	wire [7:0] scale0;
	wire [7:0] scale1;
	wire [7:0] scale2;
	wire [7:0] scale3;
	wire [7:0] scale4;
	wire [7:0] scale5;
	wire [7:0] scale6;
	wire [7:0] scale7;
	wire [7:0] scale8;
	wire [7:0] scale9;
	wire [7:0] scale10;
	wire [7:0] scale11;
	wire [7:0] scale12;
	wire [7:0] scale13;
	wire [7:0] scale14;
	wire [7:0] scale15;
//	wire [7:0] scale16;

//寄存器R
	reg [7:0] mem0;
	reg [7:0] mem1;
	reg [7:0] mem2;
	reg [7:0] mem3;
	reg [7:0] mem4;
	reg [7:0] mem5;
	reg [7:0] mem6;
	reg [7:0] mem7;
	reg [7:0] mem8;
	reg [7:0] mem9;
	reg [7:0] mem10;
	reg [7:0] mem11;
	reg [7:0] mem12;
	reg [7:0] mem13;
	reg [7:0] mem14;
	reg [7:0] mem15;
//	reg [7:0] mem11;
	reg [7:0] feedback;    

	rs_enc_m0 m0 (scale0, feedback);
	rs_enc_m1 m1 (scale1, feedback);
	rs_enc_m2 m2 (scale2, feedback);
	rs_enc_m3 m3 (scale3, feedback);
	rs_enc_m4 m4 (scale4, feedback);
	rs_enc_m5 m5 (scale5, feedback);
	rs_enc_m6 m6 (scale6, feedback);
	rs_enc_m7 m7 (scale7, feedback);
	rs_enc_m8 m8 (scale8, feedback);
	rs_enc_m9 m9 (scale9, feedback);
	rs_enc_m10 m10 (scale10, feedback);
	rs_enc_m11 m11 (scale11, feedback);
	rs_enc_m12 m12 (scale12, feedback);
	rs_enc_m13 m13 (scale13, feedback);
	rs_enc_m14 m14 (scale14, feedback);
	rs_enc_m15 m15 (scale15, feedback);

	always @ (posedge clk or negedge clrn)
	begin
		if (~clrn)
		begin
			mem0 <= 0;
			mem1 <= 0;
			mem2 <= 0;
			mem3 <= 0;
			mem4 <= 0;
			mem5 <= 0;
			mem6 <= 0;
			mem7 <= 0;
			mem8 <= 0;
			mem9 <= 0;
			mem10 <= 0;
			mem11 <= 0;
			mem12 <= 0;
			mem13 <= 0;
			mem14 <= 0;
			mem15 <= 0;
		end
		else if (enable)
      //完成GF域加法
		begin
			mem15 <= mem14 ^ scale15;
			mem14 <= mem13 ^ scale14;
			mem13 <= mem12 ^ scale13;
			mem12 <= mem11 ^ scale12;
			mem11 <= mem10 ^ scale11;
			mem10 <= mem9 ^ scale10;
			mem9 <= mem8 ^ scale9;
			mem8 <= mem7 ^ scale8;
			mem7 <= mem6 ^ scale7;
			mem6 <= mem5 ^ scale6;
			mem5 <= mem4 ^ scale5;
			mem4 <= mem3 ^ scale4;
			mem3 <= mem2 ^ scale3;
			mem2 <= mem1 ^ scale2;
			mem1 <= mem0 ^ scale1;
			mem0 <= scale0;
		end
	end

   //连个mux输出
	always @ (data or x or mem15)
		if (data) feedback = x ^ mem15;
		else feedback = 0;

	always @ (data or x or mem15)
		if (data) y = x;
		else y = mem15;





endmodule

