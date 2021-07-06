// -------------------------------------------------------------------------
//test bench for reed solomon codec
//luk
// --------------------------------------------------------------------------

module top;
	wire [7:0] message;
	wire [7:0] error;
	reg clk, clrn;
	reg [7:0] k;
	wire [7:0] encoded;
	wire valid;
	reg dec_ena, enc_ena, data_present;
	reg [7:0] noise, received;
	reg [7:0] address;
	reg [7:0] count;
	reg [7:0] position;
	reg dec_trigger, enc_trigger;
	
	
	// tick the clock
	always #50 clk = ~clk;

	// you provide a rom as the message to encode
	sigin x0 (message, address);
		
	// the encoder
	// encoded: the output
	// message: the input
	// enc_ena: clock enable
	// data_present: input latch enable
	// clk: postive edge triggered clock
	// clrn: low active reset
	rs_enc  x1 (encoded, message, enc_ena, data_present, clk, clrn);

	// conditions enable signal for encoder
	always @ (posedge clk or negedge clrn)
	begin
		if (~clrn)
		begin
			enc_ena <= 0;
			data_present <= 0;
			address <= 0;
		end
		else 
		begin
			if (enc_trigger && address == 0)
			begin
				enc_ena <= 1;
				data_present <= 1;
			end
			// the last 32 clocks are for check bytes
			else if (address == k-17)
				data_present <= 0;
			else if (address == k-1)
			begin
				enc_ena <= 0;
			end
			if (enc_ena) address <= address + 1;
			else address <= 0;
		end
	end
	
	// you provide the noise
	always @ (address)
		if (address == 0) noise = 10;
		else if (address == 1) noise = 20;
		else if (address == 2) noise = 30;
		//else if (address == 3) noise = 40;
		//else if (address == 4) noise = 50;
		//else if (address == 5) noise = 60;
		//else if (address == 6) noise = 70;
		//else if (address == 7) noise = 80;
		//else if (address == 8) noise = 90;
		//else if (address == 192) noise = 1;
		//else if (address == 193) noise = 2;
		//else if (address == 194) noise = 3;
		//else if (address == 195) noise = 4;
		//else if (address == 196) noise = 5;
		//else if (address == 197) noise = 6;
		//else if (address == 198) noise = 7;
		//else if (address == 199) noise = 8;
		else noise = 0;
	
	// data for decoder
	always @ (posedge clk or negedge clrn)
		if (~clrn) received <= 0;
		else received <= encoded ^ noise;

	// the decoder
	// received: received signal
	// error: the decoded noise signal
	// with_error: a signal indicates noise exists
	// dec_ena: clock enable
	// valid: output valid
	// k: the length of message, read only once at reset time
	// clk: positive edge triggered clock
	// clrn: low active reset
	decode x2 (received, error, with_error, dec_ena, valid, k, clk, clrn); //rsdec
	
	// conditions enable signal for decoder
	always @ (posedge clk or negedge clrn)
	begin
		if (~clrn)
			dec_ena <= 0;
		else if (dec_trigger)
			dec_ena <= 1;
		else if (count == k)
			dec_ena <= 0;
		if (~clrn) 
			count <= 0;
		else if (dec_ena)
			count <= count + 1;
	end


	// keep track of error position
	always @ (posedge clk or negedge clrn)
		if (~clrn) position <= 0;
		else if (valid) position <= position + 1;
		else position <= 0;

	

	// input stimuli	 
	initial
	begin
		// view the file with gtkwave
		$dumpfile("wave.vcd");
		$dumpvars(0, top);
		clk = 0;
		clrn = 1;
		data_present = 0;
		enc_trigger = 0;
		dec_trigger = 0;
		k = 255;
		#1 clrn = 0;
		#20 clrn = 1;
		
		// wait for decoder initializes
		// waiting_clocks >= 255 - 2*k
		#25620 
		
		#100 enc_trigger = 1;
		#100 enc_trigger = 0; dec_trigger = 1;
		#100 dec_trigger = 0;
		#160000 $finish;
	end
	
	// output monitor
	always @ (negedge clk)
	begin
		if (enc_ena) $display("enc: %d @ %d", encoded, address);
		else if (valid) $display("dec: %d @ %d", error, position);
	end	
endmodule
