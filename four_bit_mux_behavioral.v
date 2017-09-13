`timescale 1ns / 1ps
`default_nettype none
//1-bit wide multiplexer using behavioral constructs

module four_bit_mux(Y, A, B, S);//defined module name and interface
	//output and input ports
	output reg [3:0]Y;//modified in an always block
	input wire [3:0]A, B;//input wires 4-bit wide
	input wire S;//select is still 1 bit
	
	always@(A or B or S)//always block which triggers when A,B, or S change
		begin//block constructs together
			//Note: 1`b0 represents a 1-bit binary value of 0
			if(S == 1'b0)//comparison if
				Y = A; //drive Y with A
			else
				Y = B; //drive Y with B
		end//end of block
		
endmodule //end of module