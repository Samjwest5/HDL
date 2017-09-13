`timescale 1ns / 1ps
`default_nettype none
//synchronous adder

module adder_synchronous(Carry_reg, Sum_reg, Clk, A, B);
	output reg Carry_reg; //reg so that output can hold state
	output reg [1:0] Sum_reg;
	
	input wire Clk;//inputs
	input wire [1:0] A, B;
	
	reg [1:0] A_reg, B_reg;//intermediate nets
	wire Carry;
	wire [1:0] Sum;
	
	adder_2bit(Carry, Sum, A,B);
	
	always@ (posedge Clk)//positive edge of clock
		begin
			A_reg <= A;//intermediate nets set to inputs
			B_reg <= B;
		end
	always@ (posedge Clk)
		begin
			Carry_reg <= Carry;//outputs, wires driving reg
			Sum_reg <= Sum;
		end
endmodule//end of module
