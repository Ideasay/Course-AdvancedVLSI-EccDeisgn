// -------------------------------------------------------------------------
//Berlekamp circuit for Reed-Solomon decoder
//
// --------------------------------------------------------------------------

module rsdec_berl (lambda_out, omega_out, syndrome0, syndrome1, syndrome2, syndrome3, syndrome4, 
    syndrome5, syndrome6, syndrome7, syndrome8, syndrome9, syndrome10, syndrome11, 
    syndrome12,syndrome13,syndrome14,syndrome15, 
		D, DI, count, phase0, phase16, enable, clk, clrn);
	input clk, clrn, enable, phase0, phase16;
	input [7:0] syndrome0;
	input [7:0] syndrome1;
	input [7:0] syndrome2;
	input [7:0] syndrome3;
	input [7:0] syndrome4;
	input [7:0] syndrome5;
	input [7:0] syndrome6;
	input [7:0] syndrome7;
	input [7:0] syndrome8;
	input [7:0] syndrome9;
	input [7:0] syndrome10;
	input [7:0] syndrome11;
	input [7:0] syndrome12;
	input [7:0] syndrome13;
	input [7:0] syndrome14;
	input [7:0] syndrome15;
	input [7:0] DI;
	input [5:0] count;
	output [7:0] lambda_out;
	output [7:0] omega_out;
	reg [7:0] lambda_out;
	reg [7:0] omega_out;
	output [7:0] D;
	reg [7:0] D;

	integer j;
	reg init, delta;
	reg [4:0] L;
	reg [7:0] lambda[15:0];
	reg [7:0] omega[15:0];
	reg [7:0] A[14:0];
	reg [7:0] B[14:0];
	wire [7:0] tmp0;
	wire [7:0] tmp1;
	wire [7:0] tmp2;
	wire [7:0] tmp3;
	wire [7:0] tmp4;
	wire [7:0] tmp5;
	wire [7:0] tmp6;
	wire [7:0] tmp7;
	wire [7:0] tmp8;
	wire [7:0] tmp9;
	wire [7:0] tmp10;
	wire [7:0] tmp11;
	wire [7:0] tmp12;
	wire [7:0] tmp13;
	wire [7:0] tmp14;
	wire [7:0] tmp15;

	always @ (tmp1) lambda_out = tmp1;
	always @ (tmp3) omega_out = tmp3;
	//delta=1进行迭代
	always @ (L or D or count)
		// delta = (D != 0 && 2*L <= i);
		if (D != 0 && count >= {L, 1'b0}) delta = 1;
		else delta = 0;

	rsdec_berl_multiply x0 (tmp0, B[14], D, lambda[0], syndrome0, phase0);
	rsdec_berl_multiply x1 (tmp1, lambda[15], DI, lambda[1], syndrome1, phase0);
	rsdec_berl_multiply x2 (tmp2, A[14], D, lambda[2], syndrome2, phase0);
	rsdec_berl_multiply x3 (tmp3, omega[15], DI, lambda[3], syndrome3, phase0);
	multiply x4 (tmp4, lambda[4], syndrome4);
	multiply x5 (tmp5, lambda[5], syndrome5);
	multiply x6 (tmp6, lambda[6], syndrome6);
	multiply x7 (tmp7, lambda[7], syndrome7);
	multiply x8 (tmp8, lambda[8], syndrome8);
	multiply x9 (tmp9, lambda[9], syndrome9);
	multiply x10 (tmp10, lambda[10], syndrome10);
	multiply x11 (tmp11, lambda[11], syndrome11);
	multiply x12 (tmp12, lambda[12], syndrome12);
	multiply x13 (tmp13, lambda[13], syndrome13);
	multiply x14 (tmp14, lambda[14], syndrome14);
	multiply x15 (tmp15, lambda[15], syndrome15);
	
	always @ (posedge clk or negedge clrn)
	begin
		// for (j = t-1; j >=0; j--)
		//	if (j != 0) lambda[j] += D * B[j-1];
		//clr
		if (~clrn)
		begin
			for (j = 0; j < 16; j = j + 1) lambda[j] <= 0;
			for (j = 0; j < 15; j = j + 1) B[j] <= 0;
			for (j = 0; j < 16; j = j + 1) omega[j] <= 0;
			for (j = 0; j < 15; j = j + 1) A[j] <= 0;
			L = 0;
			D = 0;
		end
		//init
		else if (~enable)
		begin
			lambda[0] <= 1;
			for (j = 1; j < 16; j = j +1) lambda[j] <= 0;
			B[0] <= 1;
			for (j = 1; j < 15; j = j +1) B[j] <= 0;
			omega[0] <= 1;
			for (j = 1; j < 16; j = j +1) omega[j] <= 0;
			for (j = 0; j < 15; j = j + 1) A[j] <= 0;
			L = 0;
			D = 0;
		end
		else
		//更新lambda
		begin
			if (~phase0)
			begin
				if (~phase16) lambda[0] <= lambda[15] ^ tmp0;
				else lambda[0] <= lambda[15];
				for (j = 1; j < 16; j = j + 1)
					lambda[j] <= lambda[j-1];
			end

		// for (j = t-1; j >=0; j--)
		//	if (delta) B[j] = lambda[j] *DI;
		//	else if (j != 0) B[j] = B[j-1];
		//	else B[j] = 0;更新B
			if (~phase0)
			begin
				if (delta)	B[0] <= tmp1;
				else if (~phase16) B[0] <= B[14];
				else B[0] <= 0;
				for (j = 1; j < 15; j = j + 1)
					B[j] <= B[j-1];
			end

		// for (j = t-1; j >=0; j--)
		//	if (j != 0) omega[j] += D * A[j-1];更新omega
			if (~phase0)
			begin
				if (~phase16) omega[0] <= omega[15] ^ tmp2;
				else omega[0] <= omega[15];
				for (j = 1; j < 16; j = j + 1)
					omega[j] <= omega[j-1];
			end

		// for (j = t-1; j >=0; j--)
		//	if (delta) A[j] = omega[j] *DI;
		//	else if (j != 0) A[j] = A[j-1];
		//	else A[j] = 0;更新A
			if (~phase0)
			begin
				if (delta)	A[0] <= tmp3;
				else if (~phase16) A[0] <= A[14];
				else A[0] <= 0;
				for (j = 1; j < 15; j = j + 1)
					A[j] <= A[j-1];
			end

		// if (delta) L = i - L + 1;对L进行更新
		//	if ((phase0 & delta) && (count != -1)) L = count - L + 1;
			if (delta != 1) begin
				L = count - L + 1;
			end
		//for (D = j = 0; j < t; j = j + 1)
		//	D += lambda[j] * syndrome[t-j-1];
			if (phase0)
				D = tmp0 ^ tmp1 ^ tmp2 ^ tmp3 ^ tmp4 ^ tmp5 ^ tmp6 ^ tmp7 ^ tmp8 ^ tmp9 ^ tmp10 ^ tmp11
				   ^tmp12^ tmp13^ tmp14^ tmp15;

		end // end else
	end // end always @ (posedge clk or negedge clrn)

endmodule


module rsdec_berl_multiply (y, a, b, c, d, e);
	input [7:0] a, b, c, d;
	input e;
	output [7:0] y;
	wire [7:0] y;
	reg [7:0] p, q;
	//e=1.c*d;e=0,a*b;
	always @ (a or c or e)
		if (e) p = c;
		else p = a;
	always @ (b or d or e)
		if (e) q = d;
		else q = b;

	multiply x0 (y, p, q);

endmodule

module multiply (y, a, b);
	input [7:0] a, b;
	output [7:0] y;
	reg [7:0] y;
	always @ (a or b)
	begin
	  /*
		y[0] = (a[0] & b[0]) ^ (a[1] & b[7]) ^ (a[2] & b[6]) ^ (a[2] & b[7]) ^ (a[3] & b[5]) ^ (a[3] & b[6]) ^ (a[3] & b[7]) ^ (a[4] & b[4]) ^ (a[4] & b[5]) ^ (a[4] & b[6]) ^ (a[4] & b[7]) ^ (a[5] & b[3]) ^ (a[5] & b[4]) ^ (a[5] & b[5]) ^ (a[5] & b[6]) ^ (a[5] & b[7]) ^ (a[6] & b[2]) ^ (a[6] & b[3]) ^ (a[6] & b[4]) ^ (a[6] & b[5]) ^ (a[6] & b[6]) ^ (a[6] & b[7]) ^ (a[7] & b[1]) ^ (a[7] & b[2]) ^ (a[7] & b[3]) ^ (a[7] & b[4]) ^ (a[7] & b[5]) ^ (a[7] & b[6]);
		y[1] = (a[0] & b[1]) ^ (a[1] & b[0]) ^ (a[1] & b[7]) ^ (a[2] & b[6]) ^ (a[3] & b[5]) ^ (a[4] & b[4]) ^ (a[5] & b[3]) ^ (a[6] & b[2]) ^ (a[7] & b[1]) ^ (a[7] & b[7]);
		y[2] = (a[0] & b[2]) ^ (a[1] & b[1]) ^ (a[1] & b[7]) ^ (a[2] & b[0]) ^ (a[2] & b[6]) ^ (a[3] & b[5]) ^ (a[3] & b[7]) ^ (a[4] & b[4]) ^ (a[4] & b[6]) ^ (a[4] & b[7]) ^ (a[5] & b[3]) ^ (a[5] & b[5]) ^ (a[5] & b[6]) ^ (a[5] & b[7]) ^ (a[6] & b[2]) ^ (a[6] & b[4]) ^ (a[6] & b[5]) ^ (a[6] & b[6]) ^ (a[6] & b[7]) ^ (a[7] & b[1]) ^ (a[7] & b[3]) ^ (a[7] & b[4]) ^ (a[7] & b[5]) ^ (a[7] & b[6]);
		y[3] = (a[0] & b[3]) ^ (a[1] & b[2]) ^ (a[2] & b[1]) ^ (a[2] & b[7]) ^ (a[3] & b[0]) ^ (a[3] & b[6]) ^ (a[4] & b[5]) ^ (a[4] & b[7]) ^ (a[5] & b[4]) ^ (a[5] & b[6]) ^ (a[5] & b[7]) ^ (a[6] & b[3]) ^ (a[6] & b[5]) ^ (a[6] & b[6]) ^ (a[6] & b[7]) ^ (a[7] & b[2]) ^ (a[7] & b[4]) ^ (a[7] & b[5]) ^ (a[7] & b[6]) ^ (a[7] & b[7]);
		y[4] = (a[0] & b[4]) ^ (a[1] & b[3]) ^ (a[2] & b[2]) ^ (a[3] & b[1]) ^ (a[3] & b[7]) ^ (a[4] & b[0]) ^ (a[4] & b[6]) ^ (a[5] & b[5]) ^ (a[5] & b[7]) ^ (a[6] & b[4]) ^ (a[6] & b[6]) ^ (a[6] & b[7]) ^ (a[7] & b[3]) ^ (a[7] & b[5]) ^ (a[7] & b[6]) ^ (a[7] & b[7]);
		y[5] = (a[0] & b[5]) ^ (a[1] & b[4]) ^ (a[2] & b[3]) ^ (a[3] & b[2]) ^ (a[4] & b[1]) ^ (a[4] & b[7]) ^ (a[5] & b[0]) ^ (a[5] & b[6]) ^ (a[6] & b[5]) ^ (a[6] & b[7]) ^ (a[7] & b[4]) ^ (a[7] & b[6]) ^ (a[7] & b[7]);
		y[6] = (a[0] & b[6]) ^ (a[1] & b[5]) ^ (a[2] & b[4]) ^ (a[3] & b[3]) ^ (a[4] & b[2]) ^ (a[5] & b[1]) ^ (a[5] & b[7]) ^ (a[6] & b[0]) ^ (a[6] & b[6]) ^ (a[7] & b[5]) ^ (a[7] & b[7]);
		y[7] = (a[0] & b[7]) ^ (a[1] & b[6]) ^ (a[1] & b[7]) ^ (a[2] & b[5]) ^ (a[2] & b[6]) ^ (a[2] & b[7]) ^ (a[3] & b[4]) ^ (a[3] & b[5]) ^ (a[3] & b[6]) ^ (a[3] & b[7]) ^ (a[4] & b[3]) ^ (a[4] & b[4]) ^ (a[4] & b[5]) ^ (a[4] & b[6]) ^ (a[4] & b[7]) ^ (a[5] & b[2]) ^ (a[5] & b[3]) ^ (a[5] & b[4]) ^ (a[5] & b[5]) ^ (a[5] & b[6]) ^ (a[5] & b[7]) ^ (a[6] & b[1]) ^ (a[6] & b[2]) ^ (a[6] & b[3]) ^ (a[6] & b[4]) ^ (a[6] & b[5]) ^ (a[6] & b[6]) ^ (a[7] & b[0]) ^ (a[7] & b[1]) ^ (a[7] & b[2]) ^ (a[7] & b[3]) ^ (a[7] & b[4]) ^ (a[7] & b[5]);
	  */
	y[0] = (a[0]&b[0])^(a[1]&b[7])^(a[2]&b[6])^(a[3]&b[5])^(a[4]&b[4])^
		(a[5]&b[3])^(a[6]&b[2])^(a[7]&b[1])^(a[5]&b[7])^(a[6]&b[6])^
		(a[7]&b[5])^(a[6]&b[7])^(a[7]&b[6])^(a[7]&b[7]);
	
	y[1] = (a[0]&b[1])^(a[1]&b[0])^(a[2]&b[7])^(a[3]&b[6])^(a[4]&b[5])^
		(a[5]&b[4])^(a[6]&b[3])^(a[7]&b[2])^(a[6]&b[7])^(a[7]&b[6])^
		(a[7]&b[7]);

	y[2] = (a[0]&b[2])^(a[1]&b[1])^(a[2]&b[0])^(a[1]&b[7])^(a[2]&b[6])^
		(a[3]&b[5])^(a[4]&b[4])^(a[5]&b[3])^(a[6]&b[2])^(a[7]&b[1])^
		(a[3]&b[7])^(a[4]&b[6])^(a[5]&b[5])^(a[6]&b[4])^(a[7]&b[3])^
		(a[5]&b[7])^(a[6]&b[6])^(a[7]&b[5])^(a[6]&b[7])^(a[7]&b[6]);
	
	y[3] = (a[0]&b[3])^(a[1]&b[2])^(a[2]&b[1])^(a[3]&b[0])^(a[1]&b[7])^
		(a[2]&b[6])^(a[3]&b[5])^(a[4]&b[4])^(a[5]&b[3])^(a[6]&b[2])^
		(a[7]&b[1])^(a[2]&b[7])^(a[3]&b[6])^(a[4]&b[5])^(a[5]&b[4])^
		(a[6]&b[3])^(a[7]&b[2])^(a[4]&b[7])^(a[5]&b[6])^(a[6]&b[5])^
		(a[7]&b[4])^(a[5]&b[7])^(a[6]&b[6])^(a[7]&b[5]);

	y[4] = (a[0]&b[4])^(a[1]&b[3])^(a[2]&b[2])^(a[3]&b[1])^(a[4]&b[0])^
		(a[1]&b[7])^(a[2]&b[6])^(a[3]&b[5])^(a[4]&b[4])^(a[5]&b[3])^
		(a[6]&b[2])^(a[7]&b[1])^(a[2]&b[7])^(a[3]&b[6])^(a[4]&b[5])^
		(a[5]&b[4])^(a[6]&b[3])^(a[7]&b[2])^(a[3]&b[7])^(a[4]&b[6])^
		(a[5]&b[5])^(a[6]&b[4])^(a[7]&b[3])^(a[7]&b[7]);

	y[5] = (a[0]&b[5])^(a[1]&b[4])^(a[2]&b[3])^(a[3]&b[2])^(a[4]&b[1])^
		(a[5]&b[0])^(a[2]&b[7])^(a[3]&b[6])^(a[4]&b[5])^(a[5]&b[4])^
		(a[6]&b[3])^(a[7]&b[2])^(a[3]&b[7])^(a[4]&b[6])^(a[5]&b[5])^
		(a[6]&b[4])^(a[7]&b[3])^(a[4]&b[7])^(a[5]&b[6])^(a[6]&b[5])^
		(a[7]&b[4]);

	y[6] = (a[0]&b[6])^(a[1]&b[5])^(a[2]&b[4])^(a[3]&b[3])^(a[4]&b[2])^
		(a[5]&b[1])^(a[6]&b[0])^(a[3]&b[7])^(a[4]&b[6])^(a[5]&b[5])^
		(a[6]&b[4])^(a[7]&b[3])^(a[4]&b[7])^(a[5]&b[6])^(a[6]&b[5])^
		(a[7]&b[4])^(a[5]&b[7])^(a[6]&b[6])^(a[7]&b[5]);

	y[7] = (a[0]&b[7])^(a[1]&b[6])^(a[2]&b[5])^(a[3]&b[4])^(a[4]&b[3])^
		(a[5]&b[2])^(a[6]&b[1])^(a[7]&b[0])^(a[4]&b[7])^(a[5]&b[6])^
		(a[6]&b[5])^(a[7]&b[4])^(a[5]&b[7])^(a[6]&b[6])^(a[7]&b[5])^
		(a[6]&b[7])^(a[7]&b[6]);
	end
endmodule

