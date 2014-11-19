module demuxFFT(
	outFFT,seldemuxFFT,inFIFO2Re,outdemuxFFT);
	
	input [31:0]outFFT;
	input seldemuxFFT;
	output [31:0]inFIFO2Re;
	output [31:0]outdemuxFFT;
	
	//wire [31:0]inFIFO2Im_32;
	
	assign inFIFO2Re = (seldemuxFFT)?32'bz:outFFT;
	assign outdemuxFFT = (seldemuxFFT)?outFFT:32'bz;
	
endmodule