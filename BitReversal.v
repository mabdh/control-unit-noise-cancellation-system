module BitReversal(clk,rst,in,out);
	input	clk;
	input	rst;
	input	[15:0]	in;
	output	[15:0]	out;
	
	wire	S0;
	wire	S1;
	wire	S2;
	
	wire	[15:0]	buff1_1;
	wire	[15:0]	buff1_2;
	wire	[15:0]	buff2_1;
	wire	[15:0]	buff2_2;
	wire	[15:0]	buff2_3;
	wire	[15:0]	buff3_1;
	wire	[15:0]	buff3_2;
	wire	[15:0]	buff3_3;

S0_gen	S0_1(
		.clk	(clk),
		.rst	(rst),
		.sel	(S0)
	);
	
mux	mux1_1(
		.d0		(buff1_2),
		.d1		(in),
		.sel	(S0),
		.y		(buff1_1)
	);
	
delay31	delay31_1(
		.clk	(clk),
		.rst	(rst),
		.a		(buff1_1),
		.b		(buff1_2)
	);

mux	mux1_2(
		.d0		(in),
		.d1		(buff1_2),
		.sel	(S0),
		.y		(buff2_1)
	);

S1_gen	S1_1(
		.clk	(clk),
		.rst	(rst),
		.sel	(S1)
	);
	
mux	mux2_1(
		.d0		(buff2_3),
		.d1		(buff2_1),
		.sel	(S1),
		.y		(buff2_2)
	);

delay14	delay14_1(
		.clk	(clk),
		.rst	(rst),
		.a		(buff2_2),
		.b		(buff2_3)
	);

mux	mux2_2(
		.d0		(buff2_1),
		.d1		(buff2_3),
		.sel	(S1),
		.y		(buff3_1)
	);

S2_gen	S2_1(
		.clk	(clk),
		.rst	(rst),
		.sel	(S2)
	);

mux	mux3_1(
		.d0		(buff3_3),
		.d1		(buff3_1),
		.sel	(S2),
		.y		(buff3_2)
	);

delay4	delay4_1(
		.clk	(clk),
		.rst	(rst),
		.a		(buff3_2),
		.b		(buff3_3)
	);

mux	mux3_2(
		.d0		(buff3_1),
		.d1		(buff3_3),
		.sel	(S2),
		.y		(out)
	);
endmodule
