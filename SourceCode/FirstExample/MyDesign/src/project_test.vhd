--TESTBENCH

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

	 --ENTITY OF MY BLOCK
entity project_tb is																			  
END project_tb;


architecture ProjectTest of project_tb is	  

--AN ISTANCE OF MY COMPONENT
Component project 
	
		port (	 
	p_in	: in std_logic_vector;	 	
	q_in	: in std_logic_vector;
	output  : out std_logic_vector); 
end Component;	

CONSTANT N       :  INTEGER  := 2;       -- Bus Width  
CONSTANT N_BIT   :  INTEGER  := 9;
	CONSTANT MckPer: Time:= 1000 ns;
	CONSTANT TestLen: Integer:=24;
	
	---- INPUT SIGNAL
	SIGNAL clk  : std_logic := '0';
	SIGNAL p_in_tb: std_logic_vector (0 to N_BIT):="0000000000";	 	
	SIGNAL q_in_tb: std_logic_vector (0 to N_BIT):="0000000000";
	
	---- OUTPUT SIGNAL
	SIGNAL output_tb : std_logic_vector (0 to N_BIT);		 
	SIGNAL clk_cycle: Integer;
	SIGNAL Testing: Boolean:=true;
	
	begin
		I : project
		port map(p_in_tb,q_in_tb,output_tb); --   
		
	clk <=Not clk after MckPer/2 when Testing else '0';
		Test_Proc: process(clk)	
		 VARIABLE count: INTEGER:=0;
		BEGIN	  	 
			clk_cycle <=  (count+1)/2;
			CASE count IS	 	
				
				--corner cases
				--p and q both 0										   
		 WHEN  2   => p_in_tb  <= "1111111111";	   q_in_tb <= "0000000000";
		 WHEN  4   => p_in_tb  <= "1111111111";	   q_in_tb <= "1111111111";
		 WHEN  6   => p_in_tb  <= "0111111111";	   q_in_tb <= "0000000001";	
		 WHEN  8   => p_in_tb  <= "0111111111";	   q_in_tb <= "0111111111";						  
		 WHEN  10   => p_in_tb  <= "0000000000";	   q_in_tb <= "1000000000";	--PARTICOULAR CASE
		 																		  
		 	 --|P|=4 |Q|=290 
		 WHEN  12   => p_in_tb  <= "1111111100";	   q_in_tb <= "1011011110"; --P AND Q NEG. |P|<|Q|		 
		 --|P|=16  --|Q|=16
		 WHEN  14   => p_in_tb  <= "1111110000";	   q_in_tb <= "1111110000"; --P AND Q NEG. |P|=|Q| 			 
		  --|P|=16 |Q|=8
		 WHEN  16   => p_in_tb  <= "1111110000";	   q_in_tb <= "1111111100"; --P AND Q NEG. |P|>|Q| 		 
		 	--p=50 q=4
         WHEN  18   => p_in_tb  <= "0000110010";	   q_in_tb <= "0000000100"; --P AND Q POS. P>Q
		 --p=15 q=15
		 WHEN  20   => p_in_tb  <= "0000001111";	   q_in_tb <= "0000001111"; --P AND Q POS. P=Q 			 
		  --p=70 q=221
		 WHEN  22   => p_in_tb  <= "0001000110";	   q_in_tb <= "0011011101"; --P AND Q POS. P<Q 
		 
          WHEN (TestLen - 1) =>   Testing <= False;
          WHEN OTHERS => NULL;
     END CASE;			  
	 
	 count:= count + 1;
   END PROCESS Test_Proc; 
   End ProjectTest;