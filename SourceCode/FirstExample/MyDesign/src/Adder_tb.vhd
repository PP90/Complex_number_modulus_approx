--TESTBENCH

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;


entity Adder_tb is	   
END Adder_tb;


architecture AdderTest of Adder_tb is	  

Component Adder 
	
	port (
	op1	: in std_logic_vector;    
	op2	: in std_logic_vector; 
	sum  : out std_logic_vector  
	);
end Component;	

	CONSTANT N       :  INTEGER  := 2;     
	CONSTANT N_BIT       :  INTEGER  := 9;
	CONSTANT MckPer: Time:= 1000 ns;
	CONSTANT TestLen: Integer:=24;
	
	---- INPUT SIGNALS
	SIGNAL clk  : std_logic := '0';
	SIGNAL op1_tb: std_logic_vector (0 to N_BIT-1):="000000000"; 
	SIGNAL op2_tb: std_logic_vector (0 to N_BIT-1):="000000000";
	
	---- OUTPUT SIGNALS
	SIGNAL sum_tb: std_logic_vector (0 to N_BIT);
	SIGNAL clk_cycle: Integer;
	SIGNAL Testing: Boolean:=true;
	
	begin
		I : Adder
		port map(op1_tb,op2_tb,sum_tb); --   
		
	clk <=Not clk after MckPer/2 when Testing else '0';
		Test_Proc: process(clk)	
		 VARIABLE count: INTEGER:=0;
		BEGIN	  	 
			clk_cycle <=  (count+1)/2;
						    CASE count IS
         WHEN  3   => op1_tb <= "111111111"; op2_tb <= "000000001";	 --LIST OF THE INPUT SIGNALS USED TO TEST THE ADDER BLOCK
		 WHEN  5   => op1_tb <= "111111111"; op2_tb <= "111111111";
		 WHEN  8   => op1_tb <= "010011100"; op2_tb <= "011100000";
		 WHEN  9   => op1_tb <= "010010100"; op2_tb <= "000101001";
		 WHEN  10  => op1_tb <= "010000000"; op2_tb <= "000000000";
		 WHEN (TestLen - 1) =>   Testing <= False;
         WHEN OTHERS => NULL;
     END CASE;			  
	 
	 count:= count + 1;
   END PROCESS Test_Proc;
   	  END AdderTest;