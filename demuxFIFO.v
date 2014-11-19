module demuxFIFO(
	outmult256,seldemuxFIFO,inFIFO4A,inFIFO4B);
	
	input [31:0]outmult256;
	input seldemuxFIFO;
	output [31:0]inFIFO4A;
	output [31:0]inFIFO4B;
	
	assign inFIFO4A = (seldemuxFIFO)?32'bz:outmult256;
	assign inFIFO4B = (seldemuxFIFO)?outmult256:32'bz;
endmodule