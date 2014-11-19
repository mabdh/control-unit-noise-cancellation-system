module cunit(reset,clock,start,
	usedw1a,//usedw1b,
	wrreq1a,wrreq1b,
	rdreq1a,rdreq1b,empty1a,empty1b,
	selmuxFIFO,selmuxFFT,fft_enable,
	niosread2,niosread5,nioswrite,
	empty3Re,rdreq3,wrreq4b,
	wrreq4a, rdreq4,empty2Re,
	wrreq2,empty5,wrreq5,usedw1b,
	full1a,full4a,full4b,full5,full3Re,empty4a,full2Re,
	f642Re,usedw2Re,usedw3Re);
//	state,next_state);
	
	input reset,clock;
	input start;
	input [6:0]usedw1a;
	input [6:0]usedw1b;
	input [6:0]usedw2Re;
	input [6:0]usedw3Re;
	output wrreq1a;
	output  wrreq1b;
	output  rdreq1a;
	output  rdreq1b;
	input empty1a,empty1b;
	output  selmuxFIFO;
	output  selmuxFFT;
	output  fft_enable;
	output  niosread2,niosread5;
	input nioswrite;
	input empty3Re;
	output  wrreq4b;
	output  wrreq4a;
	output  rdreq4;
	input empty2Re;
	output rdreq3,wrreq2,wrreq5;
	input empty5,empty4a;
	
	input full1a,full4a,full4b,full5,full3Re,full2Re;
	input f642Re;
	
	wire usedw1a32,usedw1b64,usedw1a64,usedw2Re64,usedw3Re64;
	//assign usedw1a32 = (usedw1a==31)?1:0;
	assign usedw1a32 = usedw1a[5];
	//assign usedw1a64 = usedw1a[6];
	assign usedw1a64 = (usedw1a==63)?1:0;
	
	assign usedw1b64 = usedw1b[6];
	//assign usedw1b64 = (usedw1b==63)?1:0;
	assign usedw2Re64 =  (usedw2Re==63)?1:0;
	assign usedw3Re64 =  (usedw3Re==63)?1:0; 
	//wire reset,clock,start,usedw1a32,empty1a,empty1b,nioswrite,empty3Re,empty2Re,empty5,empty4a,full1a,full4a,full4b,full5,full3Re,
    //wrreq1a,wrreq1b,rdreq1a,rdreq1b,wrreq2,niosread2,rdreq3,wrreq4a,wrreq4b,rdreq4,wrreq5,niosread5,fft_enable,selmuxFIFO,selmuxFFT;
	//assign usedw1a32 = (usedw1a[5])?1:0;
	
 SM1 statemachine(
    .reset (reset),
    .clock (clock),
    .start (start),
    .usedw1a32(usedw1a32),
    .empty1a (empty1a),
   // .empty1b (empty1b),
    .nioswrite (nioswrite),
    .empty3Re (empty3Re),
    .empty2Re (empty2Re),
    .empty5 (empty5),
    .empty4a (empty4a),
    //.full1a (full1a),
    .full4a (full4a),
    .full4b (full4b),
    .full5 (full5),
    //.full3Re (full3Re),
    .wrreq1a (wrreq1a),
    .wrreq1b (wrreq1b),
    .rdreq1a (rdreq1a),
    .rdreq1b (rdreq1b),
    .wrreq2 (wrreq2),
    .niosread2 (niosread2),
    .rdreq3 (rdreq3),
    .wrreq4a (wrreq4a),
    .wrreq4b (wrreq4b),
    .rdreq4 (rdreq4),
    .wrreq5 (wrreq5),
    .niosread5 (niosread5),
    .fft_enable (fft_enable),
    .selmuxFIFO (selmuxFIFO),
    .selmuxFFT (selmuxFFT),
    .usedw1b64 (usedw1b64),
	.f642Re (f642Re),
	.usedw1a64 (usedw1a64),
	.usedw2Re64 (usedw2Re64),
	.usedw3Re64 (usedw3Re64));


endmodule

