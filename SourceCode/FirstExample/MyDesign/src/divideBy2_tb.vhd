--TESTBENCH

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;


entity divideBy2_tb is																			 
END divideBy2_tb; 

architecture divideBy2Test of divideBy2_tb is	  


Component divideBy2 is
 			 generic(N: Integer:=9);
	port (	 
	input	: in std_logic_vector (0 to N-1);	
	output  : out std_logic_vector (0 to N-1)); 
end Component;

	CONSTANT N       :  INTEGER  := 2;     
	CONSTANT N_BIT       :  INTEGER  := 9;
	CONSTANT MckPer: Time:= 1000 ns;
	CONSTANT TestLen: Integer:=24;
	
	---- INPUT SIGNALS
	SIGNAL clk  : std_logic := '0';
	SIGNAL input_tb: std_logic_vector (0 to N_BIT-1):="000000000";
	---- OUTPUT SIGNALS		   
	SIGNAL output_tb: std_logic_vector (0 to N_BIT-1);
	SIGNAL clk_cycle: Integer;
	SIGNAL Testing: Boolean:=true; 
	
	begin
		I : divideBy2
		port map(input_tb,output_tb); --  	
		
		clk <=Not clk after MckPer/2 when Testing else '0';
		Test_Proc: process(clk)	
		 VARIABLE count: INTEGER:=0;
		BEGIN	  	 
			clk_cycle <=  (count+1)/2;
			CASE count IS	
				--Test input incases:
         WHEN  3   => input_tb <= "111111111"; 
		 WHEN  8   => input_tb <= "011110001";
		 WHEN  9   => input_tb <= "110000110";					   
		 
          WHEN (TestLen - 1) =>   Testing <= False;
          WHEN OTHERS => NULL;
     END CASE;			  
	 
	 count:= count + 1;
   END PROCESS Test_Proc;
   	  END divideBy2Test;