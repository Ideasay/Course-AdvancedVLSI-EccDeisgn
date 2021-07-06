// data in
//进行数据的输入，并非encode的组件。不需要在进行后端实现
module sigin(data, address);
	input [7:0] address;
	output [7:0] data;
	reg [7:0] data;
	
	// an arbitrary data source here
	always @ (address) data = address + 1;//这里通过该式子完成数据的初始化
endmodule

