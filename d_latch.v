`timescale 1ns / 1ps //1ns for each delay unit
`default_nettype none
//D Latch

module d_latch(Q, notQ, En, D);

	//all ports should be wires
	output wire Q, notQ;
	input wire En, D;
	
	//intermediate nets
	wire nandDEN, nandNEN, notD;
	
	not #2 not0(notD,D);
	nand #2 nand0(Q, nandDEN, notQ);//2ns gate delay
	nand #2 nand1(notQ, nandNEN, Q);
	nand #2 nand2(nandDEN, D, En);
	nand #2 nand3(nandNEN, notD, En);
	
endmodule//end of module
