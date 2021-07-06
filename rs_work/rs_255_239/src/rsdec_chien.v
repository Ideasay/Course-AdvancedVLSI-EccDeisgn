// -------------------------------------------------------------------------
//Chien-Forney search circuit for Reed-Solomon decoder
// luk
// --------------------------------------------------------------------------

// g[0] = 1 
module rsdec_chien_scale0 (y, x);
input	[7:0] x;
output	[7:0] y;
reg		[7:0] y;

always @ (x)
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

// g[1] = 2 
module rsdec_chien_scale1 (y, x);
input	[7:0] x;
output	[7:0] y;
reg		[7:0] y;

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

// g[2] = 4 
module rsdec_chien_scale2 (y, x);
input	[7:0] x;
output	[7:0] y;
reg		[7:0] y;

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

// g[3] = 8
module rsdec_chien_scale3 (y, x);
input	[7:0] x;
output	[7:0] y;
reg		[7:0] y;

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
 
// g[4] = 16 
module rsdec_chien_scale4 (y, x);
input	[7:0] x;
output	[7:0] y;
reg		[7:0] y;

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

// g[5] = 32
module rsdec_chien_scale5 (y, x);
input	[7:0] x;
output	[7:0] y;
reg		[7:0] y;

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

// g[6] = 64 
module rsdec_chien_scale6 (y, x);
input	[7:0] x;
output	[7:0] y;
reg		[7:0] y;

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

// g[7] = 128 
module rsdec_chien_scale7 (y, x);
input	[7:0] x;
output	[7:0] y;
reg		[7:0] y;

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

// g[8] = 29 
module rsdec_chien_scale8 (y, x);
input	[7:0] x;
output	[7:0] y;
reg		[7:0] y;

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

// g[9] = 58
module rsdec_chien_scale9 (y, x);
input	[7:0] x;
output	[7:0] y;
reg		[7:0] y;

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

// g[10] = 116 
module rsdec_chien_scale10 (y, x);
input	[7:0] x;
output	[7:0] y;
reg		[7:0] y;

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

// g[11] = 232
module rsdec_chien_scale11 (y, x);
input	[7:0] x;
output	[7:0] y;
reg		[7:0] y;

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

// g[12] = 205 
module rsdec_chien_scale12 (y, x);
input	[7:0] x;
output	[7:0] y;
reg		[7:0] y;

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

// g[13] = 135 
module rsdec_chien_scale13 (y, x);
input	[7:0] x;
output	[7:0] y;
reg		[7:0] y;

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

// g[14] = 19 
module rsdec_chien_scale14 (y, x);
input	[7:0] x;
output	[7:0] y;
reg		[7:0] y;

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

// g[15] = 38  
module rsdec_chien_scale15 (y, x);
input	[7:0] x;
output	[7:0] y;
reg		[7:0] y;

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



module rsdec_chien (error,lambda, omega, even, D, search, load, clk, clrn);
	input clk, clrn, load, search;
	input [7:0] D;
	input [7:0] lambda;
	input [7:0] omega;
	output [7:0] even, error;
	reg [7:0] even, error;


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
	wire [7:0] scale16;
	wire [7:0] scale17;
	wire [7:0] scale18;
	wire [7:0] scale19;
	wire [7:0] scale20;
	wire [7:0] scale21;
	wire [7:0] scale22;
	wire [7:0] scale23;
	wire [7:0] scale24;
	wire [7:0] scale25;
	wire [7:0] scale26;
	wire [7:0] scale27;
	wire [7:0] scale28;
	wire [7:0] scale29;
	wire [7:0] scale30;
	wire [7:0] scale31;
	
	reg [7:0] data0;
	reg [7:0] data1;
	reg [7:0] data2;
	reg [7:0] data3;
	reg [7:0] data4;
	reg [7:0] data5;
	reg [7:0] data6;
	reg [7:0] data7;
	reg [7:0] data8;
	reg [7:0] data9;
	reg [7:0] data10;
	reg [7:0] data11;	
	reg [7:0] data12;
	reg [7:0] data13;	
	reg [7:0] data14;
	reg [7:0] data15;
	
	reg [7:0] l0;
	reg [7:0] l1;
	reg [7:0] l2;
	reg [7:0] l3;
	reg [7:0] l4;
	reg [7:0] l5;
	reg [7:0] l6;
	reg [7:0] l7;
	reg [7:0] l8;
	reg [7:0] l9;
	reg [7:0] l10;
	reg [7:0] l11;
	reg [7:0] l12;
	reg [7:0] l13;
	reg [7:0] l14;
	reg [7:0] l15;
	
	reg [7:0] o0;
	reg [7:0] o1;
	reg [7:0] o2;
	reg [7:0] o3;
	reg [7:0] o4;
	reg [7:0] o5;
	reg [7:0] o6;
	reg [7:0] o7;
	reg [7:0] o8;
	reg [7:0] o9;
	reg [7:0] o10;
	reg [7:0] o11;
	reg [7:0] o12;
	reg [7:0] o13;
	reg [7:0] o14;
	reg [7:0] o15;
	
	reg [7:0] odd, numerator;
	wire [7:0] tmp;
	integer j;

	rsdec_chien_scale0 x0 (scale0, data0);
	rsdec_chien_scale1 x1 (scale1, data1);
	rsdec_chien_scale2 x2 (scale2, data2);
	rsdec_chien_scale3 x3 (scale3, data3);
	rsdec_chien_scale4 x4 (scale4, data4);
	rsdec_chien_scale5 x5 (scale5, data5);
	rsdec_chien_scale6 x6 (scale6, data6);
	rsdec_chien_scale7 x7 (scale7, data7);
	rsdec_chien_scale8 x8 (scale8, data8);
	rsdec_chien_scale9 x9 (scale9, data9);
	rsdec_chien_scale10 x10 (scale10, data10);
	rsdec_chien_scale11 x11 (scale11, data11);
	rsdec_chien_scale12 x12 (scale12, data12);
	rsdec_chien_scale13 x13 (scale13, data13);
	rsdec_chien_scale14 x14 (scale14, data14);
	rsdec_chien_scale15 x15 (scale15, data15);
	
	//omega的钱搜索
	rsdec_chien_scale0 x16 (scale16, o0);
	rsdec_chien_scale1 x17 (scale17, o1);
	rsdec_chien_scale2 x18 (scale18, o2);
	rsdec_chien_scale3 x19 (scale19, o3);
	rsdec_chien_scale4 x20 (scale20, o4);
	rsdec_chien_scale5 x21 (scale21, o5);
	rsdec_chien_scale6 x22 (scale22, o6);
	rsdec_chien_scale7 x23 (scale23, o7);
	rsdec_chien_scale8 x24 (scale24, o8);
	rsdec_chien_scale9 x25 (scale25, o9);
	rsdec_chien_scale10 x26 (scale26, o10);
	rsdec_chien_scale11 x27 (scale27, o11);
	rsdec_chien_scale12 x28 (scale28, o12);
	rsdec_chien_scale13 x29 (scale29, o13);
	rsdec_chien_scale14 x30 (scale30, o14);
	rsdec_chien_scale15 x31 (scale31, o15);

	//这里shorten=0，我们始终不使用缩短的循环码
	always @ (l0)
		data0 = l0;

	always @ (l1)
		data1 = l1;

	always @ (l2)
		data2 = l2;

	always @ (l3)
		data3 = l3;

	always @ (l4)
		data4 = l4;

	always @ (l5)
		data5 = l5;

	always @ (l6)
		data6 = l6;

	always @ (l7)
		data7 = l7;

	always @ (l8)
		data8 = l8;

	always @ (l9)
		data9 = l9;

	always @ (l10)
		data10 = l10;

	always @ (l11)
		data11 = l11;

	always @ (l12)
		data12 = l12;

	always @ (l13)
		data13 = l13;

	always @ (l14)
		data14 = l14;

	always @ (l15)
		data15 = l15;

	always @ (posedge clk or negedge clrn)
	begin
		if (~clrn)
		begin
			l0 <= 0;
			l1 <= 0;
			l2 <= 0;
			l3 <= 0;
			l4 <= 0;
			l5 <= 0;
			l6 <= 0;
			l7 <= 0;
			l8 <= 0;
			l9 <= 0;
			l10 <= 0;
			l11 <= 0;
			l12 <= 0;
			l13 <= 0;
			l14 <= 0;
			l15 <= 0;
			o0 <= 0;
			o1 <= 0;
			o2 <= 0;
			o3 <= 0;
			o4 <= 0;
			o5 <= 0;
			o6 <= 0;
			o7 <= 0;
			o8 <= 0;
			o9 <= 0;
			o10 <= 0;
			o11 <= 0;
			o12 <= 0;
			o13 <= 0;
			o14 <= 0;
			o15 <= 0;
			
		end
		else if (search)
		begin
			l0 <= scale0;
			l1 <= scale1;
			l2 <= scale2;
			l3 <= scale3;
			l4 <= scale4;
			l5 <= scale5;
			l6 <= scale6;
			l7 <= scale7;
			l8 <= scale8;
			l9 <= scale9;
			l10 <= scale10;
			l11 <= scale11;
			l12 <= scale12;
			l13 <= scale13;
			l14 <= scale14;
			l15 <= scale15;
			o0 <= scale16;
			o1 <= scale17;
			o2 <= scale18;
			o3 <= scale19;
			o4 <= scale20;
			o5 <= scale21;
			o6 <= scale22;
			o7 <= scale23;
			o8 <= scale24;
			o9 <= scale25;
			o10 <= scale26;
			o11 <= scale27;
			o12 <= scale28;
			o13 <= scale29;
			o14 <= scale30;
			o15 <= scale31;
		end
		else if (load)
		begin
			l0 <= lambda;
			l1 <= l0;
			l2 <= l1;
			l3 <= l2;
			l4 <= l3;
			l5 <= l4;
			l6 <= l5;
			l7 <= l6;
			l8 <= l7;
			l9 <= l8;
			l10 <= l9;
			l11 <= l10;
			l12 <= l11;
			l13 <= l12;
			l14 <= l13;
			l15 <= l14;
			
			o0 <= omega;
			o1 <= o0;
			o2 <= o1;
			o3 <= o2;
			o4 <= o3;
			o5 <= o4;
			o6 <= o5;
			o7 <= o6;
			o8 <= o7;
			o9 <= o8;
			o10 <= o9;
			o11 <= o10;
			o12 <= o11;
			o13 <= o12;
			o14 <= o13;
			o15 <= o14;
			
		end
	end

	always @ (l0 or l2 or l4 or l6 or l8 or l10 or l12 or l14)
		even = l0 ^ l2 ^ l4 ^ l6 ^ l8 ^ l10 ^ l12 ^ l14;

	always @ (l1 or l3 or l5 or l7 or l9 or l11 or l13 or l15)
		odd = l1 ^ l3 ^ l5 ^ l7 ^ l9 ^ l11 ^ l13 ^ l15;

	always @ (o0 or o1 or o2 or o3 or o4 or o5 or o6 or o7 or o8 or o9 or o10 or o11 or o12 or o13 or o14 or o15)
		numerator = o0 ^ o1 ^ o2 ^ o3 ^ o4 ^ o5 ^ o6 ^ o7 ^ o8 ^ o9 ^ o10 ^ o11 ^ o12 ^ o13 ^ o14 ^ o15;

	multiply m0 (tmp, numerator, D);

	always @ (even or odd or tmp)
		if (even == odd) error = tmp;
		else error = 0;

	

endmodule

