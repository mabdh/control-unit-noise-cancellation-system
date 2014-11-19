module muxpreFFT(selmuxpreFFT,outmuxFIFO,outFIFO3Re,outmuxpreFFT);
	input selmuxpreFFT;
	input [31:0]outmuxFIFO;
	input [31:0]outFIFO3Re;
	output [31:0]outmuxpreFFT;
	
	//wire [31:0] outFIFO3Re_con;
	
	assign outmuxpreFFT = (selmuxpreFFT)?outFIFO3Re:outmuxFIFO;
	
endmodule