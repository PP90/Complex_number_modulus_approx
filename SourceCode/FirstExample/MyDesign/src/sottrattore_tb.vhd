--TESTBENCH

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

entity diff_block_tb is																			 
END diff_block_tb;


architecture sottrattoreTest of sottrattore_tb is	  

Component diff_block 
	
	port (
	minuendo	: in std_logic_vector;--INPUT 1    
    sottraendo	: in std_logic_vector;--INPUT 2 
	differenza  : out std_logic_vector   --OUTPUT 1	
	);
end Component;	

	CONSTANT N  :  INTEGER  := 2;       -- Bus Width  
	CONSTANT N_BIT :  INTEGER  := 9;
	CONSTANT MckPer: Time:= 1000 ns;
	CONSTANT TestLen: Integer:=24;
	
	---- INPUT SIGNALS
	SIGNAL clk  : std_logic := '0';
	SIGNAL min_tb: std_logic_vector (0 to N_BIT):="0000000000"; 
	SIGNAL sot_tb: std_logic_vector (0 to N_BIT):="0000000000";
	---- OUTPUT SIGNALS
	SIGNAL diff_tb: std_logic_vector (0 to N_BIT);
	SIGNAL clk_cycle: Integer;
	SIGNAL Testing: Boolean:=true;
	
	begin
		I : diff_block
		port map(min_tb,sot_tb,diff_tb); --   
		
	clk <=Not clk after MckPer/2 when Testing else '0';
		Test_Proc: process(clk)	
		 VARIABLE count: INTEGER:=0;
		BEGIN	  	 
			clk_cycle <=  (count+1)/2;
						    CASE count IS
           WHEN  3   => min_tb <= "0000001010"; sot_tb <= "0000000101";	 
		   WHEN  6   => min_tb <= "1100001010"; sot_tb <= "0000110101";	
		   WHEN  9   => min_tb <= "0111001010"; sot_tb <= "0000110101";	
		   WHEN  12  => min_tb <= "1111111110"; sot_tb <= "0000100101";	
		   WHEN  15  => min_tb <= "1111111111"; sot_tb <= "1111111111";	
		  
		   --METTERE ALTRI TEST
          WHEN (TestLen - 1) =>   Testing <= False;
          WHEN OTHERS => NULL;
     END CASE;			  
	 
	 count:= count + 1;
   END PROCESS Test_Proc;
   	  END sottrattoreTest;