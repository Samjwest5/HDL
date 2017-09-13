`timescale 1ns / 1ps
`default_nettype none

module full_adder (S, Cout, A, B, Cin);

	//1-bit wires
	input wire A, B, Cin;
	output wire Cout, S;
	
	//internal nets
	wire andAB, andACin, andBCin;
	
	//dataflow to describe gate-level activity
	assign #6 S = A ^ B ^ Cin; //^ is XOR
	assign #4 andAB = A & B; //& is AND
	assign #4 andBCin = B & Cin;
	assign #4 andACin = A & Cin;
	assign #6 Cout = andAB | andBCin | andACin; //| is OR
	
endmodule
