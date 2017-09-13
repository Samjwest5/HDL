`timescale 1ns / 1ps

module add_2bit_tb;//a test bench does not have any ports of its own!

	/* Input nets */
	reg [1:0] A; //these are regs because they are modified in 
	reg [1:0] B; //a behavioral block

	/* Output nets */
	wire [1:0] Sum; //these are wires because they will be driven
	wire Carry;//by the inantiated module

	/* Instantiate the Unit Under Test (UUT) */
	adder_2bit uut ( //this is a different way
		.A(A),       //to instantiate a module.
		.B(B),       //the nice thing about this style
		.Sum(Sum),   //is that the order does not matter!
		.Carry(Carry)//notice the ports are in a different order!
	);


    /*-this is a behavioral block which is executed only once!  *
     *-the statements within this behavioral block are executed *
     *-sequentially because we are using blocking statements    *
     *-an '=' sign within a behavioral construct is considered a*
     * blocking statement. We will talk more about this later...*/
	initial 
      begin

        /* Initialize inputs*/
        A = 0;
        B = 0;

        #25; //just delay 25 ns  
        {A,B} = 4'b0000; //stimulate the inputs
        #25; //wait a bit for the result to propagate
        //here is where we could put a check to see if the results 
        //are as expected!
        if({Carry, Sum} != 3'b000)//you could put your own message here
            $display("Ah crap... something went wrong here...");
			else
				$display("Hey! The UUT passed this test vector1...");
        //let's do it again with a different input...
        {A,B} = 4'b0001; //stimulate the inputs
        #25; //wait a bit for the result to propagate
        //check output
        if({Carry, Sum} != 3'b001)
            $display("Your own message here...");
			else
				$display("Test vector2 passed!!!");
        //okay this is fun... you try it now... 
        
        //go through all possible input combinations (2^4 = 16)
        //cut and paste makes this task a lot easier
		  
		  //let's do it again with a different input...
        {A,B} = 4'b0010; //stimulate the inputs
        #25; //wait a bit for the result to propagate
        //check output
        if({Carry, Sum} != 3'b010)
            $display("Your own message here...");
			else
				$display("Test vector3 passed!!!");
				
				//let's do it again with a different input...
        {A,B} = 4'b0011; //stimulate the inputs
        #25; //wait a bit for the result to propagate
        //check output
        if({Carry, Sum} != 3'b011)
            $display("Your own message here...");
			else
				$display("Test vector4 passed!!!");
				
			{A,B} = 4'b0100; //stimulate the inputs
        #25; //wait a bit for the result to propagate
        //check output
        if({Carry, Sum} != 3'b001)
            $display("Your own message here...");
			else
				$display("Test vector5 passed!!!");
				
			{A,B} = 4'b0101; //stimulate the inputs
        #25; //wait a bit for the result to propagate
        //check output
        if({Carry, Sum} != 3'b010)
            $display("Your own message here...");
			else
				$display("Test vector6 passed!!!");
				
		  {A,B} = 4'b0110; //stimulate the inputs
        #25; //wait a bit for the result to propagate
        //check output
        if({Carry, Sum} != 3'b011)
            $display("Your own message here...");
			else
				$display("Test vector7 passed!!!");
				
		{A,B} = 4'b0111; //stimulate the inputs
        #25; //wait a bit for the result to propagate
        //check output
        if({Carry, Sum} != 3'b100)
            $display("Your own message here...");
			else
				$display("Test vector8 passed!!!");	
				
		      {A,B} = 4'b1000; //stimulate the inputs
        #25; //wait a bit for the result to propagate
        //check output
        if({Carry, Sum} != 3'b010)
            $display("Your own message here...");
			else
				$display("Test vector9 passed!!!");
		
		   {A,B} = 4'b1001; //stimulate the inputs
        #25; //wait a bit for the result to propagate
        //check output
        if({Carry, Sum} != 3'b011)
            $display("Your own message here...");
			else
				$display("Test vector10 passed!!!");
				
				{A,B} = 4'b1010; //stimulate the inputs
        #25; //wait a bit for the result to propagate
        //check output
        if({Carry, Sum} != 3'b100)
            $display("Your own message here...");
			else
				$display("Test vector11 passed!!!");
				
				{A,B} = 4'b1011; //stimulate the inputs
        #25; //wait a bit for the result to propagate
        //check output
        if({Carry, Sum} != 3'b101)
            $display("Your own message here...");
			else
				$display("Test vector12 passed!!!");
				
			{A,B} = 4'b1100; //stimulate the inputs
        #25; //wait a bit for the result to propagate
        //check output
        if({Carry, Sum} != 3'b011)
            $display("Your own message here...");
			else
				$display("Test vector13 passed!!!");
				
			{A,B} = 4'b1101; //stimulate the inputs
        #25; //wait a bit for the result to propagate
        //check output
        if({Carry, Sum} != 3'b100)
            $display("Your own message here...");
			else
				$display("Test vector14 passed!!!");
				
				{A,B} = 4'b1110; //stimulate the inputs
        #25; //wait a bit for the result to propagate
        //check output
        if({Carry, Sum} != 3'b101)
            $display("Your own message here...");
			else
				$display("Test vector15 passed!!!");
				
				
				{A,B} = 4'b1111; //stimulate the inputs
        #25; //wait a bit for the result to propagate
        //check output
        if({Carry, Sum} != 3'b110)
            $display("Your own message here...");
			else
				$display("Test vector16 passed!!!");

        //when we are done, let's stop the simulation
        $stop;
	end
      
endmodule

