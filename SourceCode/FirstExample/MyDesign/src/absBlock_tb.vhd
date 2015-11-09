--TESTBENCH

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

	 
entity absBlock_tb is
END absBlock_tb;


architecture AbsBlockTest of absBlock_tb is	  

Component absBlock 
	
	port (
	input	: in std_logic_vector;    
	output  : out std_logic_vector); 
	
end Component;	

	CONSTANT N       :  INTEGER  := 2;     
	CONSTANT N_BIT       :  INTEGER  := 9;
	CONSTANT MckPer: Time:= 1000 ns;
	CONSTANT TestLen: Integer:=24;
	
	---- INPUT SIGNALS
	SIGNAL clk  : std_logic := '0';
	SIGNAL input_tb: std_logic_vector (0 to N_BIT):="0000000000"; 
	
	---- OUTPUT SIGNALS
	SIGNAL output_tb: std_logic_vector (0 to N_BIT-1);
	SIGNAL clk_cycle: Integer;
	SIGNAL Testing: Boolean:=true;
	
	begin
		I : absBlock
		port map(input_tb,output_tb);   
		
	clk <=Not clk after MckPer/2 when Testing else '0';
		Test_Proc: process(clk)	
		VARIABLE count: INTEGER:=0;
		BEGIN	  	 
			clk_cycle <=  (count+1)/2;
		 CASE count IS			
			 --List of tested cases.
       	 	WHEN  1   => input_tb  <= "0000000000";	  
		 	WHEN  2   => input_tb  <= "1111111111";	  
		 	WHEN  5   => input_tb  <= "0111111111";	 
		 	WHEN  8   => input_tb  <= "1111111100";		    			 
		 	WHEN  12  => input_tb  <= "1111110000";	 		 
         	WHEN  15  => input_tb  <= "0000110010";	 
		 	WHEN  18  => input_tb  <= "0000001111";
			WHEN  21  => input_tb  <= "1000000000";
			--The above input is particular:in complementar 2 logic is equal to -512, but actually is equal to 0 because
			--the leftest bit will be ignored since the output bits are N-1.
			
         	WHEN (TestLen - 1) =>   Testing <= False;
         	WHEN OTHERS => NULL;
     		END CASE;			  
	 
	 count:= count + 1;
     END PROCESS Test_Proc;
   	 END AbsBlockTest;