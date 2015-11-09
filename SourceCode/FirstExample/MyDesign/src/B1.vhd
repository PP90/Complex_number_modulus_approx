LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

--This block has the following functionality:

--It contains two absBlock blocks and one minmax block.
--P and Q are the input of the overall system. 
--Min and max are respectively the minimum and the maximum between the absolute values of P and Q. 

--For more details see the MinMax implementation and absBlock implementation.
	
entity B1 is  			 generic(N: Integer:=9);
	port (	 
	P	: in std_logic_vector (0 to N);	 	
	Q	: in std_logic_vector (0 to N);
	minOut  : out std_logic_vector (0 to N-1);
	maxOut  : out std_logic_vector (0 to N-1)); 	 
end B1;								 

	architecture behav of B1 is
	signal q1, p1: std_logic_vector(0 to N-1);
	
	component absBlock
			port (	 
	input	: in std_logic_vector (0 to N);	 	  	 
	output  : out std_logic_vector (0 to N-1));
	end Component;
	
		component minmax
				port (	 
	in1	: in std_logic_vector (0 to N-1);	 	
	in2	: in std_logic_vector (0 to N-1);
	
	min  : out std_logic_vector (0 to N-1);
	max  : out std_logic_vector (0 to N-1));
	end component;
	
	begin		 		
		a1: absBlock  port map(input=>P, output=>p1);		
		a2: absBlock port map(input=>Q, output=>q1);
		m: minmax	 port map(p1,q1,minOut,maxOut);
		end behav;
				 