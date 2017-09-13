`timescale 1ns / 1ps //1ns for each delay unit
`default_nettype none
//SR Latch

module sr_latch(Q, notQ, En, S, R);

	//all ports should be wires
	output wire Q, notQ;
	input wire En, S, R;
	
	//intermediate nets
	wire nandSEN, nandREN;
	
	nand #2 nand0(Q, nandSEN, notQ);//2ns gate delay
	nand #2 nand1(notQ, nandREN, Q);
	nand #2 nand2(nandSEN, S, En);
	nand #2 nand3(nandREN, R, En);
	
endmodule//end of module
