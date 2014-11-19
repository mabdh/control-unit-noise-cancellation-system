module muxFIFO(sel,in1A,in1B,outmuxFIFO);
	input sel;
	input [31:0]in1A,in1B;
	output  [31:0]outmuxFIFO;
	
	assign outmuxFIFO = (sel)?in1B:in1A;
	/*always @ (sel or in1A or in1B)
	if (sel)
		outmuxFIFO <= in1A;
	else
		outmuxFIFO <= in1B;*/
endmodule