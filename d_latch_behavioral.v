`timescale 1ns / 1ps
`default_nettype none
//d latch behavioral

module d_latch_behavioral(
	output reg Q,//driven with behavioral
	output wire notQ,//driven with a dataflow
	input wire D, En//wires can drive regs
);

	always@(En or D)
		if(En)//if En != 1'b0
			Q = D; //transparent!
		else //this part is actually not needed
			Q = Q; //if left out, it will be implied
			
		assign notQ = ~Q;
		
endmodule
