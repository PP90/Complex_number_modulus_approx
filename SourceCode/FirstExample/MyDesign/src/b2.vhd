LIBRARY IEEE;
USE IEEE.std_logic_1164.all;


--This block has the following functionality:

--It contains one divideBy2 block and one adder block.
--min and max are the input of this block. 
--Min and max are respectively the minimum and the maximum between the absolute values of P and Q. 
--sumMinMax is the following algebric expression: 1/2min+max.

--For more details see the divideBy2 implementation and Adder implementation.
	
entity B2 is  			 generic(N: Integer:=9);
	port (	 
	min	: in std_logic_vector (0 to N-1);	 	
	max	: in std_logic_vector (0 to N-1);
	sumMinMax  : out std_logic_vector (0 to N)); 	 
end B2; 

	architecture behav of B2 is	
	signal tmp: std_logic_vector(0 to N-1);

	  component DivideBy2
			port (	 
	input	: in std_logic_vector (0 to N-1);	
	output  : out std_logic_vector (0 to N-1)); 
	end Component;	
	
	 component Adder
			port (	 
	op1	: in std_logic_vector (0 to N-1);	 	
	op2	: in std_logic_vector (0 to N-1);
	sum  : out std_logic_vector (0 to N)); 
	end Component;	
	
	begin	
		d1: divideBy2 
		port map(input=>min, output=>tmp);	
		a1: adder	port map(op1=>tmp, op2=>max,sum=>sumMinMax);	
	
end behav;