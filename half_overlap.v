module half_overlap(data_a,data_b,data_out);
	
	input [31:0]data_a;
	input [31:0] data_b;
	output [31:0]data_out;
	
	wire [31:0] jumlah;
	
	assign jumlah = data_a[31:16] + data_b[31:16];
	
	assign data_out = jumlah / 2;
	
	
endmodule
	