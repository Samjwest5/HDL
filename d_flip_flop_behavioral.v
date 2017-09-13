`timescale 1ns / 1ps
`default_nettype none
//D Flip-Flip behavioral

module d_flip_flop_behavioral(
	output reg Q,//yeah y'all know what this stuff does
	output wire notQ,
	input wire D,
	input wire Clk//clock is our trigger signal
);

	always@(posedge Clk)//trigger edge is the rising edge
		Q <= D; //non-blocking assignment statement
		
	assign notQ = ~Q; //regs can drive wires!
	
endmodule
