--TESTBENCH

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;


entity b3_tb is

END b3_tb;


architecture b3Test of b3_tb is	  


Component b3 
	
	port (	 
	min	: in std_logic_vector;	 	
	max	: in std_logic_vector;
	outputB3  : out std_logic_vector); 
end Component;	

CONSTANT N       :  INTEGER  := 2;       -- Bus Width  
CONSTANT N_BIT   :  INTEGER  := 9;
	CONSTANT MckPer: Time:= 1000 ns;
	CONSTANT TestLen: Integer:=24;
	
	---- INPUT SIGNAL
	SIGNAL clk  : std_logic := '0';
	SIGNAL min_tb: std_logic_vector (0 to N_BIT-1):="000000000";	 	
	SIGNAL max_tb: std_logic_vector (0 to N_BIT-1):="000000000";
	
	---- OUTPUT SIGNAL
	SIGNAL outputB3_tb : std_logic_vector (0 to N_BIT);		 
	SIGNAL clk_cycle: Integer;
	SIGNAL Testing: Boolean:=true;
	
	begin
		I : B3
		port map(min_tb,max_tb,outputB3_tb); --   
		
	clk <=Not clk after MckPer/2 when Testing else '0';
		Test_Proc: process(clk)	
		 VARIABLE count: INTEGER:=0;
		BEGIN	  	 
			clk_cycle <=  (count+1)/2;
						    CASE count IS
         WHEN  3   => min_tb <= "100000111";	   max_tb <= "100111000"; 
		 WHEN  5   => min_tb <= "111111111";	   max_tb <= "111111111";
		 WHEN  8   => min_tb <= "100000111";	   max_tb <= "100111000"; 
		 WHEN  11  => min_tb <= "110000111";	   max_tb <= "001111111";
          WHEN (TestLen - 1) =>   Testing <= False;
          WHEN OTHERS => NULL;
     END CASE;			  
	 
	 count:= count + 1;
   END PROCESS Test_Proc; 
   End b3Test;