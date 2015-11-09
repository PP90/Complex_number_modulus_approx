--TESTBENCH

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

	
entity b2_tb is																					
END b2_tb;


architecture b2Test of b2_tb is	  


Component b2 
	port (	 
	min	: in std_logic_vector;	 	
	max	: in std_logic_vector;
	sumMinMax  : out std_logic_vector);
end Component;	

CONSTANT N       :  INTEGER  := 2;         
CONSTANT N_BIT   :  INTEGER  := 9;
	CONSTANT MckPer: Time:= 1000 ns;
	CONSTANT TestLen: Integer:=24;
	
	---- INPUT SIGNALS
	SIGNAL clk  : std_logic := '0';
	SIGNAL min_tb: std_logic_vector (0 to N_BIT-1):="000000000";	 	
	SIGNAL max_tb: std_logic_vector (0 to N_BIT-1):="000000000";
	
	---- OUTPUT SIGNALS
	SIGNAL sum_tb : std_logic_vector (0 to N_BIT);		 
	SIGNAL clk_cycle: Integer;
	SIGNAL Testing: Boolean:=true;
	
	begin
		I : B2
		port map(min_tb,max_tb,sum_tb); --   
		
	clk <=Not clk after MckPer/2 when Testing else '0';
		Test_Proc: process(clk)	
		 VARIABLE count: INTEGER:=0;
		BEGIN	  	 
			clk_cycle <=  (count+1)/2;
						    CASE count IS
         WHEN  3   => min_tb <= "111111111";	   max_tb <= "111111111"; 
		 WHEN  5   => min_tb <= "000000000";	   max_tb <= "111111111";  
		 WHEN  7   => min_tb <= "111111010";	   max_tb <= "000000111"; 
          WHEN (TestLen - 1) =>   Testing <= False;
          WHEN OTHERS => NULL;
     END CASE;			  
	 
	 count:= count + 1;
   END PROCESS Test_Proc; 
   End b2Test;