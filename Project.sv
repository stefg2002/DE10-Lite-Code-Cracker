module Project(KEY0, KEY1, LED,SW,HEX0,HEX1,HEX2,HEX3,HEX4,clk);
	
	
	//Setup
	input KEY0, KEY1, clk;
	input logic [9:0] SW;
	
	output logic [9:0] LED;

	//7-segment displays
	output logic [7:0] HEX0,HEX1,HEX2,HEX3,HEX4;
	
	logic [9:0] password, out;
	logic[24:0] counter;
	logic unlocked,set;
		
	always @(posedge clk)begin
	 	//If password was correct, set the unlocked state to 1 and display nothing on the 7-segment displays
		if(KEY0 == 0 && KEY1 == 1)begin
			
			if((SW ~^ password) == 10'b1111111111 )begin

				HEX0 = 8'b11111111;
				HEX1 = 8'b11111111;
				HEX2 = 8'b11111111;
				HEX3 = 8'b11111111;
				HEX4 = 8'b11111111;
				
				unlocked = 1;
				set = 0;
				
			end
			
			//If password is incorrect, then display 'Error', unlocked state set to 0
			else begin
			
				HEX0 = 8'b10101111;
				HEX1 = 8'b10100011;
				HEX2 = 8'b10101111;
				HEX3 = 8'b10101111;
				HEX4 = 8'b10000110;
				
				unlocked = 0;
				set = 0;
				
			end
			
		end
		
		else if(KEY0 == 1 && KEY1 == 0)begin
			
			//If password has been unlocked, then allow new password to be set

			if(unlocked == 1)begin
				password = SW;
				
				set = 1;
				
				HEX2 = 8'b10010010;
				HEX1 = 8'b10000110;
				HEX0 = 8'b10000111;
				
				LED[0] = 0;
				LED[1] = 0;
				
			end
			
			//If password has not been unlocked, then display "Error"
			else begin
				HEX0 = 8'b10101111;
				HEX1 = 8'b10100011;
				HEX2 = 8'b10101111;
				HEX3 = 8'b10101111;
				HEX4 = 8'b10000110;
			end
		
		end
		
		if(unlocked == 0)begin
			counter = counter+1;
			LED[0]<=counter[24];
			LED[1]<=counter[24];
			LED[2]<=counter[24];
			LED[3]<=counter[24];
			LED[4]<=counter[24];
			LED[5]<=counter[24];
			LED[6]<=counter[24];
			LED[7]<=counter[24];
			LED[8]<=counter[24];
			LED[9]<=counter[24];
		end
		
		else begin
			counter = 0;
			
			if(set == 1)begin
				LED[0] = 0;
				LED[1] = 0;
			end
			else begin
				LED[0] = 1;
				LED[1] = 1;
			end	
				
			LED[2] = 0;
			LED[3] = 0;
			LED[4] = 0;
			LED[5] = 0;
			LED[6] = 0;
			LED[7] = 0;
			LED[8] = 0;
			LED[9] = 0;
		end
		
	end
	 

endmodule
