--TESTBENCH

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

entity b1_tb is		 
END b1_tb;


architecture b1Test of b1_tb is	  

Component b1 
	
	port (	 
	P	: in std_logic_vector;	 	
	Q	: in std_logic_vector;
	minOut  : out std_logic_vector ;
	maxOut  : out std_logic_vector
	);
end Component;	

	CONSTANT N       :  INTEGER  := 2;       -- Bus Width  
	CONSTANT N_BIT   :  INTEGER  := 9;
	CONSTANT MckPer: Time:= 1000 ns;
	CONSTANT TestLen: Integer:=24;
	
	---- INPUT SIGNALS
	SIGNAL clk  : std_logic := '0';
	SIGNAL P_tb: std_logic_vector (0 to N_BIT):="0000000000";	 	
	SIGNAL Q_tb: std_logic_vector (0 to N_BIT):="0000000000";
	
	---- OUTPUT SIGNALS
	SIGNAL minOut_tb : std_logic_vector (0 to N_BIT-1);
	SIGNAL maxOut_tb : std_logic_vector (0 to N_BIT-1);
	SIGNAL clk_cycle: Integer;
	SIGNAL Testing: Boolean:=true;
	
	begin
		I : B1
		port map(P_tb,Q_tb,minOut_tb,maxOut_tb); --   
		
		clk <=Not clk after MckPer/2 when Testing else '0';
		Test_Proc: process(clk)	
		VARIABLE count: INTEGER:=0;
		BEGIN	  	 
			clk_cycle <=  (count+1)/2;
						    CASE count IS
        
						--NEGATIVE VALUES		
		--|P|=8 |Q|=290 
		 WHEN  3   => P_tb  <= "1111111100";	   Q_tb <= "1011011110"; --P AND Q NEG. |P|<|Q|		 
		 --|P|=16  --|Q|=16
		 WHEN  5   => P_tb  <= "1111110000";	   Q_tb <= "1111110000"; --P AND Q NEG. |P|=|Q| 			 
		  --|P|=16 |Q|=8
		 WHEN  7   => P_tb  <= "1111110000";	   Q_tb <= "1111111100"; --P AND Q NEG. |P|>|Q| 
		 				 --	POSITIVE VALUES
		 	--p=50 q=4
         WHEN  9   => P_tb  <= "0000110010";	   Q_tb <= "0000000100"; --P AND Q POS. P>Q
		 --p=15 q=15
		 WHEN  11   => P_tb  <= "0000001111";	   Q_tb <= "0000001111"; --P AND Q POS. P=Q 			 
		  --p=70 q=221
		 WHEN  13   => P_tb  <= "0001000110";	   Q_tb <= "0011011101"; --P AND Q POS. P<Q 
		 
		 --TWO CORNER CASES
		 WHEN  15  => P_tb   <= "1111111111";	   Q_tb <= "1111111111";
		 WHEN  18   => P_tb  <= "1000000000";	   Q_tb <= "1000000000";  
		 
          WHEN (TestLen - 1) =>   Testing <= False;
          WHEN OTHERS => NULL;
     END CASE;			  
	 
	 count:= count + 1;
   END PROCESS Test_Proc; 
   End b1Test;