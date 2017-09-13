`timescale 1ns / 1ps
`default_nettype none
//4:2 encoder using behavioral constructs

module priority_encoder(
	input wire [3:0] W,
	output wire zero,
	output reg [1:0] Y
);

	//can mix levels of abstraction
	assign zero = (W == 4'b0000); //zero test
	
	//behavioral portion
	always@(W)
		casex(W)//selection based on W
			4'b0001: Y = 2'b00;//W[0] lit
			4'b001X: Y = 2'b01;//W[1] lit
			4'b01XX: Y = 2'b10;//W[2] lit
			4'b1XXX: Y = 2'b11;//W[3] lit
			default: Y = 2'bXX; //Default to 2 bits that we don't care about
	endcase
endmodule
