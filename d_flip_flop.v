`timescale 1ns / 1ps //1ns for each delay unit
`default_nettype none
//D Flipflop

module d_flip_flop(Q, notQ, Clk, D);

	//all ports should be wires
	output wire Q, notQ;
	input wire Clk, D;
	
	//intermediate nets
	wire notClk, notNotClk;
	wire Q_m;//output of master latch
	wire notQ_m;//wired to d_latch but left unconnected from there
	
	not #2 not0(notClk,Clk);//not gates
	not #2 not1(notNotClk,notClk);
			
	d_latch latch0(Q_m, notQ_m, notClk, D);
	d_latch latch1(Q, notQ, notNotClk, Q_m);		
		

	
endmodule//end of module
