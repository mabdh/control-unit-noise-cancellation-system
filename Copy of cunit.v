module cunit(reset,clock,start,
	usedw1a,usedw1b,wrreq1a,wrreq1b,
	rdreq1a,rdreq1b,empty1a,empty1b,
	selmuxFIFO,selmuxFFT,fft_enable,
	niosread2,niosread5,nioswrite,
	empty3Re,rdreq3,wrreq4b,
	wrreq4a, rdreq4,empty2Re,
	wrreq2,empty5,wrreq5,
	full1a,full4a,full4b,full5,full3Re,empty4a,
	state,next_state);
	
	input reset,clock;
	input start;
	input [5:0]usedw1a;
	input [5:0]usedw1b;
	output reg wrreq1a;
	output reg wrreq1b;
	output reg rdreq1a;
	output reg rdreq1b;
	input empty1a,empty1b;
	output reg selmuxFIFO;
	output reg selmuxFFT;
	output reg fft_enable;
	output reg niosread2,niosread5;
	input nioswrite;
	input empty3Re;
	output reg wrreq4b;
	output reg wrreq4a;
	output reg rdreq4;
	input empty2Re;
	output reg rdreq3,wrreq2,wrreq5;
	input empty5,empty4a;
	
	input full1a,full4a,full4b,full5,full3Re;
	

	parameter [3:0]
		INIT	= 4'd0,
		S1		= 4'd1,
		S2		= 4'd2,
		S3		= 4'd3,
		S4		= 4'd4,
		S5		= 4'd5,
		S6		= 4'd6,
		S7		= 4'd7,
		S8		= 4'd8,
		S9		= 4'd9,
		S10		= 4'd10,
		S11		= 4'd11,
		S12		= 4'd12,
		S13		= 4'd13,
		S14		= 4'd14;
		
		output reg [3:0] state,next_state;
		
		always @ (state or usedw1a)
		begin
			case (state)
			INIT :
			begin
				rdreq1a = 0;
				wrreq1a = 0;
				wrreq1b = 0;
				rdreq1b = 0;
				wrreq2 = 0;
				niosread2 = 0;
				//nioswrite = 0;
				rdreq3 = 0;
				wrreq4a = 0;
				wrreq4b = 0;
				rdreq4 = 0;
				wrreq5 = 0;
				niosread5 = 0;
				fft_enable = 0;
				selmuxFIFO = 0;
				selmuxFFT = 0;
			end
			S1 :
			begin
					wrreq1a = 1;
					if(usedw1a[5]==1 | usedw1a[4]==1)
						wrreq1b = 1;
					else
						wrreq1b = 0;
			end
			S2 :
			begin
				rdreq1a = 1;
				fft_enable = 1;
			end
			S3 :
			begin
				rdreq1b = 1;
				wrreq2 = 1;
				rdreq1a = 0;
				selmuxFIFO = 1;
			end
			S4 :
			begin
				wrreq2 = 1;
				niosread2 = 1;
				fft_enable =0;
				rdreq1b = 0;
			end
			S5 :
			begin
				wrreq2 = 0;
			end
			S6 :
			begin
				niosread2 = 0;
				selmuxFIFO = 0;
			end
			S7 :
			begin
				selmuxFFT = 1;
			end
			S8 :
			begin
				rdreq3 = 1;
				fft_enable = 1;
			end
			S9 :
			begin
				wrreq4a = 1;
			end
			S10 :
			begin
				wrreq4a = 0;
				wrreq4b = 1;
				selmuxFIFO = 1;
			end
			S11 :
			begin
				rdreq4 = 1;
				selmuxFIFO = 0;
			end
			S12 :
			begin
			//DENGAN LATENCY
				rdreq4 = 0;
				wrreq5 = 1;
			end
			S13 :
			begin
				wrreq5 = 0;
				niosread5 = 1;
			end
			S14 :
			begin
				niosread5 = 0;
				selmuxFFT = 0;
			end
			default :
			begin
				rdreq1a = 0;
				wrreq1a = 0;
				wrreq1b = 0;
				rdreq1b = 0;
				wrreq2 = 0;
				niosread2 = 0;
				//nioswrite = 0;
				rdreq3 = 0;
				wrreq4a = 0;
				wrreq4b = 0;
				rdreq4 = 0;
				wrreq5 = 0;
				niosread5 = 0;
				fft_enable = 0;
				selmuxFIFO = 0;
				selmuxFFT = 0;

			end
			endcase
		end
	
	always @(posedge clock or posedge reset)
     begin
          if (reset)
               state = INIT;
          else
            case (state)
			INIT :
			begin
				if(start)
					next_state = S1;
				else
					next_state = INIT;
			end
			S1 :
			begin
					if(full1a)
						next_state = S2;
					else
						next_state = S1;
			end
			S2 :
			begin
				if(empty1a)
					next_state = S3;
				else
					next_state = S2;
			end
			S3 :
			begin
				if(empty1b)
					next_state = S4;
				else
					next_state = S3;
			end
			S4 :
			begin
				if(empty2Re)
					next_state = S5;
				else
					next_state = S4;
			end
			S5 :
			begin
				if(empty2Re)
					next_state = S6;
				else
					next_state = S5;
			end
			S6 :
			begin
				if(nioswrite)
					next_state = S7;
				else
					next_state = S6;
			end
			S7 :
			begin
				if(full3Re)
					next_state = S8;
				else
					next_state = S7;
			end
			S8 :
			begin
				if(empty3Re)
					next_state = S9;
				else
					next_state = S8;
			end
			S9 :
			begin
				if(full4a)
					next_state = S10;
				else
					next_state = S9;
			end
			S10 :
			begin
				if(full4b)
					next_state = S11;
				else
					next_state = S10;
			end
			S11 :
			begin
				if(empty4a)
					next_state = S12;
				else
					next_state = S11;
			end
			S12 :
			begin
				if (full5)
					next_state = S13;
				else
					next_state = S12;
			end
			S13 :
			begin
				if(empty5)
					next_state = S14;
				else
					next_state = S13;
			end
			S14 :
			begin
				if(start)
					next_state = S1;
				else
					next_state = S14;
			end
			endcase
     end

endmodule

