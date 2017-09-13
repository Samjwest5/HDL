`timescale 1ns / 1ps
`default_nettype none
//4-bit, 4:1 MUX using behavioral constructs

module mux_4bit_4to1(Y, A, B, C, D, S);
	//output and input
	output reg [3:0] Y; //output 4-bit wide reg
	input wire [3:0] A, B, C, D; //4-bit wide input
	input wire [1:0] S; //Select is 2-bit wire
	
	always@(*)//trigger when ANYTHING changes
		//don't use begin/end with case
		case(S)//selection based on S
			2'b00: Y = A; //when S == 2'b00
			2'b01: Y = B;
			2'b10: Y = C;
			2'b11: Y = D;
		endcase //designates the end of case statement
endmodule
