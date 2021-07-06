// -------------------------------------------------------------------------
//Reed-Solomon decoder
//luk
// --------------------------------------------------------------------------

module decode(x, error, with_error, enable, valid, k, clk, clrn);
	input enable, clk, clrn;
	input [7:0] k, x;
	output [7:0] error;
	wire [7:0] error;
	output with_error, valid;
	reg with_error, valid;

	wire [7:0] s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15;
	wire [7:0] lambda, omega;
	reg [5:0] count;
	reg [16:0] phase;
	wire [7:0] D0, D1, DI;
	reg [7:0] D, D2;
	reg [7:0] u, length0, length1, length2, length3;
	reg syn_enable, syn_init, syn_shift, berl_enable;
	reg chien_search, chien_load;

	always @ (chien_search )
		valid = chien_search;
	//例化 s(x)，BM算法，chien搜索
	rsdec_syn x0 (s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, 
		u, syn_enable, syn_shift&phase[0], syn_init, clk, clrn);
	//D0输出，D2输入
	rsdec_berl x1 (lambda, omega,
		s0, s15, s14, s13, s12, s11, s10, s9, s8, s7, s6, s5, s4, s3, s2, s1, 
		D0, D2, count, phase[0], phase[16], berl_enable, clk, clrn);
	//DI输入，even->D1
	rsdec_chien x2 (error, lambda, omega,
		D1, DI, chien_search, chien_load, clk, clrn);
	//例花inverse传输回bm模块
	inverse x3 (DI, D);

	always @ (posedge clk or negedge clrn)
	begin
		if (~clrn)
		begin
			syn_enable <= 0;
			syn_shift <= 0;
			berl_enable <= 0;
			chien_search <= 1;
			chien_load <= 0;
			length0 <= 0;
			length2 <= 255 - k;
			count <= -1;
			phase <= 1;
			u <= 0;
			syn_init <= 0;
		end
		else begin
			if (enable & ~syn_enable & ~syn_shift)
			begin
				syn_enable <= 1;
				syn_init <= 1;
			end
			if (syn_enable)
			begin
				length0 <= length1;
				syn_init <= 0;
				if (length1 == k)
				begin
					syn_enable <= 0;
					syn_shift <= 1;
					berl_enable <= 1;
				end
			end
			if (berl_enable & with_error)
			begin
				if (phase[0])
				begin
					count <= count + 1;
					if (count == 11)
					begin
						syn_shift <= 0;
						length0 <= 0;
						chien_load <= 1;
						length2 <= length0;
					end
				end
				phase <= {phase[15:0], phase[16]};
			end
			if (berl_enable & ~with_error)
				if (&count)
				begin
					syn_shift <= 0;
					length0 <= 0;
					berl_enable <= 0;
				end
				else
					phase <= {phase[15:0], phase[16]};
			if (chien_load & phase[16])
			begin
				berl_enable <= 0;
				chien_load <= 0;
				chien_search <= 1;
				count <= -1;
				phase <= 1;
			end
			if (chien_search)
			begin
				length2 <= length3;
				if (length3 == 0)
					chien_search <= 0;
			end
			if (enable) u <= x;
		end
	end

	always @ (chien_search or D0 or D1)
		if (chien_search) D = D1;
		//berl期间为bm算法服务，输出D0到D
		else D = D0;

	always @ (DI or chien_load)
		//berl期间为bm算法服务，由D0计算DI到D2
		if (!chien_load) D2 = DI;
	

	always @ (length0) length1 = length0 + 1;
	always @ (length2) length3 = length2 - 1;
	always @ (syn_shift or s0 or s1 or s2 or s3 or s4 or s5 or s6 or s7 
	                     or s8 or s9 or s10 or s11 or s12 or s13 or s14 or s15)
		if (syn_shift && (s0 | s1 | s2 | s3 | s4 | s5 | s6 | s7 | s8 | s9 | s10 | s11 | s12 | s13 | s14 | s15)!= 0)
			with_error = 1;
		else with_error = 0;

endmodule
