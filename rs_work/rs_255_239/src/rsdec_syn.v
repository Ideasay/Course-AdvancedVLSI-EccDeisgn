//通过matlab获得GF(2^8)上的根α^15...α^0
//
//
//
//

// a0=2
module rsdec_syn_m0 (y, x);
	input  [7:0] x;
	output [7:0] y;
	reg    [7:0] y;
	always @ (x)
	begin
	   y[0] = x[7];
	   y[1] = x[0];
	   y[2] = x[1] ^ x[7];
	   y[3] = x[2] ^ x[7];
	   y[4] = x[3] ^ x[7];
	   y[5] = x[4];
	   y[6] = x[5];
	   y[7] = x[6];
	end
endmodule

// a1 = 4
module rsdec_syn_m1 (y, x);
	input  [7:0] x;
	output [7:0] y;
	reg    [7:0] y;
	always @ (x)
	begin
	   y[0] = x[6];
	   y[1] = x[7];
	   y[2] = x[0] ^ x[6];
	   y[3] = x[1] ^ x[6] ^ x[7];
	   y[4] = x[2] ^ x[6] ^ x[7];
	   y[5] = x[3] ^ x[7];
	   y[6] = x[4];
	   y[7] = x[5];
	end
endmodule

// a2 = 8
module rsdec_syn_m2 (y, x);
	input  [7:0] x;
	output [7:0] y;
	reg    [7:0] y;
	always @ (x)
	begin
	   y[0] = x[5];
	   y[1] = x[6];
	   y[2] = x[5] ^ x[7];
	   y[3] = x[0] ^ x[5] ^ x[6];
	   y[4] = x[1] ^ x[5] ^ x[6] ^ x[7];
	   y[5] = x[2] ^ x[6] ^ x[7];
	   y[6] = x[3] ^ x[7];
	   y[7] = x[4];
	end
endmodule

// a3 = 16 
module rsdec_syn_m3 (y, x);
	input  [7:0] x;
	output [7:0] y;
	reg    [7:0] y;
	always @ (x)
	begin
	   y[0] = x[4];
	   y[1] = x[5];
	   y[2] = x[4] ^ x[6];
	   y[3] = x[4] ^ x[5] ^ x[7];
	   y[4] = x[0] ^ x[4] ^ x[5] ^ x[6];
	   y[5] = x[1] ^ x[5] ^ x[6] ^ x[7];
	   y[6] = x[2] ^ x[6] ^ x[7];
	   y[7] = x[3] ^ x[7];
	end
endmodule

// a4 = 32
module rsdec_syn_m4 (y, x);
	input  [7:0] x;
	output [7:0] y;
	reg    [7:0] y;
	always @ (x)
	begin
	   y[0] = x[3] ^ x[7];
	   y[1] = x[4];
	   y[2] = x[3] ^ x[5] ^ x[7];
	   y[3] = x[3] ^ x[4] ^ x[6] ^ x[7];
	   y[4] = x[3] ^ x[4] ^ x[5];
	   y[5] = x[0] ^ x[4] ^ x[5] ^ x[6];
	   y[6] = x[1] ^ x[5] ^ x[6] ^ x[7];
	   y[7] = x[2] ^ x[6] ^ x[7];
	end
endmodule

// a5 = 64
module rsdec_syn_m5 (y, x);
	input  [7:0] x;
	output [7:0] y;
	reg    [7:0] y;
	always @ (x)
	begin
	   y[0] = x[2] ^ x[6] ^ x[7];
	   y[1] = x[3] ^ x[7];
	   y[2] = x[2] ^ x[4] ^ x[6] ^ x[7];
	   y[3] = x[2] ^ x[3] ^ x[5] ^ x[6];
	   y[4] = x[2] ^ x[3] ^ x[4];
	   y[5] = x[3] ^ x[4] ^ x[5];
	   y[6] = x[0] ^ x[4] ^ x[5] ^ x[6];
	   y[7] = x[1] ^ x[5] ^ x[6] ^ x[7];
	end
endmodule

// a6 = 128
module rsdec_syn_m6 (y, x);
	input  [7:0] x;
	output [7:0] y;
	reg    [7:0] y;
	always @ (x)
	begin
	   y[0] = x[1] ^ x[5] ^ x[6] ^ x[7];
	   y[1] = x[2] ^ x[6] ^ x[7];
	   y[2] = x[1] ^ x[3] ^ x[5] ^ x[6];
	   y[3] = x[1] ^ x[2] ^ x[4] ^ x[5];
	   y[4] = x[1] ^ x[2] ^ x[3] ^ x[7];
	   y[5] = x[2] ^ x[3] ^ x[4];
	   y[6] = x[3] ^ x[4] ^ x[5];
	   y[7] = x[0] ^ x[4] ^ x[5] ^ x[6];
	end
endmodule

// a7 = 29
module rsdec_syn_m7 (y, x);
	input  [7:0] x;
	output [7:0] y;
	reg    [7:0] y;
	always @ (x)
	begin
	   y[0] = x[0] ^ x[4] ^ x[5] ^ x[6];
	   y[1] = x[1] ^ x[5] ^ x[6] ^ x[7];
	   y[2] = x[0] ^ x[2] ^ x[4] ^ x[5] ^ x[7];
	   y[3] = x[0] ^ x[1] ^ x[3] ^ x[4];
	   y[4] = x[0] ^ x[1] ^ x[2] ^ x[6];
	   y[5] = x[1] ^ x[2] ^ x[3] ^ x[7];
	   y[6] = x[2] ^ x[3] ^ x[4];
	   y[7] = x[3] ^ x[4] ^ x[5];
	end
endmodule

// a8 = 58 
module rsdec_syn_m8 (y, x);
	input  [7:0] x;
	output [7:0] y;
	reg    [7:0] y;
	always @ (x)
	begin
	   y[0] = x[3] ^ x[4] ^ x[5];
	   y[1] = x[0] ^ x[4] ^ x[5] ^ x[6];
	   y[2] = x[1] ^ x[3] ^ x[4] ^ x[6] ^ x[7];
	   y[3] = x[0] ^ x[2] ^ x[3] ^ x[7];
	   y[4] = x[0] ^ x[1] ^ x[5];
	   y[5] = x[0] ^ x[1] ^ x[2] ^ x[6];
	   y[6] = x[1] ^ x[2] ^ x[3] ^ x[7];
	   y[7] = x[2] ^ x[3] ^ x[4];
	end
endmodule

// a9 = 
module rsdec_syn_m9 (y, x);
	input  [7:0] x;
	output [7:0] y;
	reg    [7:0] y;
	always @ (x)
	begin
	   y[0] = x[2] ^ x[3] ^ x[4];
	   y[1] = x[3] ^ x[4] ^ x[5];
	   y[2] = x[0] ^ x[2] ^ x[3] ^ x[5] ^ x[6];
	   y[3] = x[1] ^ x[2] ^ x[6] ^ x[7];
	   y[4] = x[0] ^ x[4] ^ x[7];
	   y[5] = x[0] ^ x[1] ^ x[5];
	   y[6] = x[0] ^ x[1] ^ x[2] ^ x[6];
	   y[7] = x[1] ^ x[2] ^ x[3] ^ x[7];
	end
endmodule

// a10 = 232
module rsdec_syn_m10 (y, x);
	input  [7:0] x;
	output [7:0] y;
	reg    [7:0] y;
	always @ (x)
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

// a11 = 54
module rsdec_syn_m11 (y, x);
	input  [7:0] x;
	output [7:0] y;
	reg    [7:0] y;
	always @ (x)
	begin
	   y[0] = x[0] ^ x[1] ^ x[2] ^ x[6];
	   y[1] = x[1] ^ x[2] ^ x[3] ^ x[7];
	   y[2] = x[0] ^ x[1] ^ x[3] ^ x[4] ^ x[6];
	   y[3] = x[0] ^ x[4] ^ x[5] ^ x[6] ^ x[7];
	   y[4] = x[2] ^ x[5] ^ x[7];
	   y[5] = x[3] ^ x[6];
	   y[6] = x[0] ^ x[4] ^ x[7];
	   y[7] = x[0] ^ x[1] ^ x[5];
	end
endmodule

// a12 = 135
module rsdec_syn_m12 (y, x);
	input  [7:0] x;
	output [7:0] y;
	reg    [7:0] y;
	always @ (x)
	begin
	   y[0] = x[0] ^ x[1] ^ x[5];
	   y[1] = x[0] ^ x[1] ^ x[2] ^ x[6];
	   y[2] = x[0] ^ x[2] ^ x[3] ^ x[5] ^ x[7];
	   y[3] = x[3] ^ x[4] ^ x[5] ^ x[6];
	   y[4] = x[1] ^ x[4] ^ x[6] ^ x[7];
	   y[5] = x[2] ^ x[5] ^ x[7];
	   y[6] = x[3] ^ x[6];
	   y[7] = x[0] ^ x[4] ^ x[7];
	end
endmodule

// a13 = 19
module rsdec_syn_m13 (y, x);
	input  [7:0] x;
	output [7:0] y;
	reg    [7:0] y;
	always @ (x)
	begin
	   y[0] = x[0] ^ x[4] ^ x[7];
	   y[1] = x[0] ^ x[1] ^ x[5];
	   y[2] = x[1] ^ x[2] ^ x[4] ^ x[6] ^ x[7];
	   y[3] = x[2] ^ x[3] ^ x[4] ^ x[5];
	   y[4] = x[0] ^ x[3] ^ x[5] ^ x[6] ^ x[7];
	   y[5] = x[1] ^ x[4] ^ x[6] ^ x[7];
	   y[6] = x[2] ^ x[5] ^ x[7];
	   y[7] = x[3] ^ x[6];
	end
endmodule

// a14 = 38 
module rsdec_syn_m14 (y, x);
	input  [7:0] x;
	output [7:0] y;
	reg    [7:0] y;
	always @ (x)
	begin
	   y[0] = x[3] ^ x[6];
	   y[1] = x[0] ^ x[4] ^ x[7];
	   y[2] = x[0] ^ x[1] ^ x[3] ^ x[5] ^ x[6];
	   y[3] = x[1] ^ x[2] ^ x[3] ^ x[4] ^ x[7];
	   y[4] = x[2] ^ x[4] ^ x[5] ^ x[6];
	   y[5] = x[0] ^ x[3] ^ x[5] ^ x[6] ^ x[7];
	   y[6] = x[1] ^ x[4] ^ x[6] ^ x[7];
	   y[7] = x[2] ^ x[5] ^ x[7];
	end
endmodule

// a15 = 76
module rsdec_syn_m15 (y, x);
	input  [7:0] x;
	output [7:0] y;
	reg    [7:0] y;
	always @ (x)
	begin
	   y[0] = x[2] ^ x[5] ^ x[7];
	   y[1] = x[3] ^ x[6];
	   y[2] = x[0] ^ x[2] ^ x[4] ^ x[5];
	   y[3] = x[0] ^ x[1] ^ x[2] ^ x[3] ^ x[6] ^ x[7];
	   y[4] = x[1] ^ x[3] ^ x[4] ^ x[5];
	   y[5] = x[2] ^ x[4] ^ x[5] ^ x[6];
	   y[6] = x[0] ^ x[3] ^ x[5] ^ x[6] ^ x[7];
	   y[7] = x[1] ^ x[4] ^ x[6] ^ x[7];	
	   end
endmodule





module rsdec_syn(y0, y1, y2,  y3,  y4,  y5,  y6,  y7, 
				 y8, y9, y10, y11, y12, y13, y14, y15, 
				 u,  enable,  shift,   init, clk, clrn);
output [7:0] y0;
output [7:0] y1;
output [7:0] y2;
output [7:0] y3;
output [7:0] y4;
output [7:0] y5;
output [7:0] y6;
output [7:0] y7;
output [7:0] y8;
output [7:0] y9;
output [7:0] y10;
output [7:0] y11;
output [7:0] y12;
output [7:0] y13;
output [7:0] y14;
output [7:0] y15;
input  [7:0] u;
input clk, clrn, shift, init, enable;


reg [7:0] y0;
reg [7:0] y1;
reg [7:0] y2;
reg [7:0] y3;
reg [7:0] y4;
reg [7:0] y5;
reg [7:0] y6;
reg [7:0] y7;
reg [7:0] y8;
reg [7:0] y9;
reg [7:0] y10;
reg [7:0] y11;
reg [7:0] y12;
reg [7:0] y13;
reg [7:0] y14;
reg [7:0] y15;

//乘法器输出
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

rsdec_syn_m0 m0 (scale0, y0);
rsdec_syn_m1 m1 (scale1, y1);
rsdec_syn_m2 m2 (scale2, y2);
rsdec_syn_m3 m3 (scale3, y3);
rsdec_syn_m4 m4 (scale4, y4);
rsdec_syn_m5 m5 (scale5, y5);
rsdec_syn_m6 m6 (scale6, y6);
rsdec_syn_m7 m7 (scale7, y7);
rsdec_syn_m8 m8 (scale8, y8);
rsdec_syn_m9 m9 (scale9, y9);
rsdec_syn_m10 m10 (scale10, y10);
rsdec_syn_m11 m11 (scale11, y11);
rsdec_syn_m12 m12 (scale12, y12);
rsdec_syn_m13 m13 (scale13, y13);
rsdec_syn_m14 m14 (scale14, y14);
rsdec_syn_m15 m15 (scale15, y15);

	// main code here...
always @ (posedge clk or negedge clrn)
begin
	if (~clrn)
	begin
		y0 <= 0;
		y1 <= 0;
		y2 <= 0;
		y3 <= 0;
		y4 <= 0;
		y5 <= 0;
		y6 <= 0;
		y7 <= 0;
		y8 <= 0;
		y9 <= 0;
		y10 <= 0;
		y11 <= 0;
		y12 <= 0;
		y13 <= 0;
		y14 <= 0;
		y15 <= 0;
	end
	else if (init)
	begin
		y0 <= u;
		y1 <= u;
		y2 <= u;
		y3 <= u;
		y4 <= u;
		y5 <= u;
		y6 <= u;
		y7 <= u;
		y8 <= u;
		y9 <= u;
		y10 <= u;
		y11 <= u;
		y12 <= u;
		y13 <= u;
		y14 <= u;
		y15 <= u;
	end
	else if (enable)
	begin
		y0 <= scale0 ^ u;
		y1 <= scale1 ^ u;
		y2 <= scale2 ^ u;
		y3 <= scale3 ^ u;
		y4 <= scale4 ^ u;
		y5 <= scale5 ^ u;
		y6 <= scale6 ^ u;
		y7 <= scale7 ^ u;
		y8 <= scale8 ^ u;
		y9 <= scale9 ^ u;
		y10 <= scale10 ^ u;
		y11 <= scale11 ^ u;
		y12 <= scale12 ^ u;
		y13 <= scale13 ^ u;
		y14 <= scale14 ^ u;
		y15 <= scale15 ^ u;
	end
	//
	else if (shift)
	begin
		y0 <= y1;
		y1 <= y2;
		y2 <= y3;
		y3 <= y4;
		y4 <= y5;
		y5 <= y6;
		y6 <= y7;
		y7 <= y8;
		y8 <= y9;
		y9 <= y10;
		y10 <= y11;
		y11 <= y12;
		y12 <= y13;
		y13 <= y14;
		y14 <= y15;
		y15 <= y0;
		
	end
end



endmodule






