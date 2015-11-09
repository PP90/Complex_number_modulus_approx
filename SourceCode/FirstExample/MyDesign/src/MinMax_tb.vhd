--TESTBENCH

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;


entity minmax_tb is	
END minmax_tb; 

architecture minMaxTest of minmax_tb is	  

Component minMax 
			 generic(N: Integer:=9);
	port (	 
	in1	: in std_logic_vector (0 to N-1);	 	
	in2	: in std_logic_vector (0 to N-1);
	
	min  : out std_logic_vector (0 to N-1);
	max  : out std_logic_vector (0 to N-1)); 
end Component;

CONSTANT N       :  INTEGER  := 2;         
CONSTANT N_BIT       :  INTEGER  := 8;
	CONSTANT MckPer: Time:= 1000 ns;
	CONSTANT TestLen: Integer:=24;
	
	---- INPUT SIGNALS
	SIGNAL clk  : std_logic := '0';
	SIGNAL op1_tb: std_logic_vector (0 to N_BIT):="000000000"; 
	SIGNAL op2_tb: std_logic_vector (0 to N_BIT):="000000000";
	---- OUTPUT SIGNALS
	SIGNAL min_tb: std_logic_vector (0 to N_BIT);
	SIGNAL max_tb: std_logic_vector (0 to N_BIT);
	SIGNAL clk_cycle: Integer;
	SIGNAL Testing: Boolean:=true; 
	
	begin
		I : minMax
		port map(op1_tb,op2_tb,min_tb,max_tb);  	
		
		clk <=Not clk after MckPer/2 when Testing else '0';
		Test_Proc: process(clk)	
		 VARIABLE count: INTEGER:=0;
		BEGIN	  	 
			clk_cycle <=  (count+1)/2;
			CASE count IS						
				--Input cases:
				--Some input tests are made in order to figure out the behaviour of the block.
				--Some inputs are also corner cases.
         WHEN  3   => op1_tb <= "111111111"; op2_tb <= "111111111";	 
		 WHEN  5   => op1_tb <= "000000000"; op2_tb <= "111111111";
		 WHEN  8   => op1_tb <= "011110000"; op2_tb <= "100000000";
		 WHEN  11  => op1_tb <= "110000000"; op2_tb <= "000001111";
		 WHEN  14  => op1_tb <= "010111000"; op2_tb <= "110000111";
		 WHEN (TestLen - 1) =>   Testing <= False;
         WHEN OTHERS => NULL;
     END CASE;			  
	 
	 count:= count + 1;
   END PROCESS Test_Proc;
   	  END minMaxTest;