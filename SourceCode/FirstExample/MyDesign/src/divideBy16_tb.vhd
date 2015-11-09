--TESTBENCH

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;


entity divideBy16_tb is	 
END divideBy16_tb; 

architecture divideBy16Test of divideBy16_tb is	  

Component divideBy16 is
 			 generic(N: Integer:=9);
	port  (
	input	: in std_logic_vector (0 to N);	
	output  : out std_logic_vector (0 to N)
	); 
end Component;

	CONSTANT N       :  INTEGER  := 2;       -- Bus Width  
	CONSTANT N_BIT       :  INTEGER  := 9;
	CONSTANT MckPer: Time:= 1000 ns;
	CONSTANT TestLen: Integer:=24;
	
	---- INPUT SIGNALS
	SIGNAL clk  : std_logic := '0';
	SIGNAL input_tb: std_logic_vector (0 to N_BIT):="0000000000";
	---- OUTPUT SIGNALS						   
	SIGNAL output_tb: std_logic_vector (0 to N_BIT);
	SIGNAL clk_cycle: Integer;
	SIGNAL Testing: Boolean:=true; 
	
	begin
		I : divideBy16
		port map(input_tb,output_tb);  	
		
		clk <=Not clk after MckPer/2 when Testing else '0';
		Test_Proc: process(clk)	
		 VARIABLE count: INTEGER:=0;
		BEGIN	  	 
			clk_cycle <=  (count+1)/2;
						    CASE count IS
         WHEN  3   => input_tb <= "0111111111";
		 WHEN  5   => input_tb <= "0000001111"; 
		 WHEN  8   => input_tb <= "0011110000";
		 WHEN  9   => input_tb <= "0110000000";					   
		 WHEN (TestLen - 1) =>   Testing <= False;
         WHEN OTHERS => NULL;
     END CASE;			  
	 
	 count:= count + 1;
   END PROCESS Test_Proc;
   	  END divideBy16Test;