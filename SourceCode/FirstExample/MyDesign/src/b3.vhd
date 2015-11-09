LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

--This block has the following functionality:

--It contains one Adder block and one divideBy16 block.
--min and max are the input of this block. 
--Min and max are respectively the minimum and the maximum between the absolute values of P and Q, which are the inputs of overall system. 
--outPutB3 is the following algebric expression: 1/16(min+max).

--For more details see the divideBy16 implementation and Adder implementation.
	
entity B3 is  			 generic(N: Integer:=9);
	port (	 
	min	: in std_logic_vector (0 to N-1);	 	
	max	: in std_logic_vector (0 to N-1);
	outputB3  : out std_logic_vector (0 to N)); 	 
end B3; 

	architecture behav of B3 is	
	signal tmp: std_logic_vector(0 to N);

		 component Adder
			port (	 
	op1	: in std_logic_vector (0 to N-1);	 	
	op2	: in std_logic_vector (0 to N-1);
	sum  : out std_logic_vector (0 to N)); 
	end Component;
	
	
	  component DivideBy16
			port  (
	input	: in std_logic_vector (0 to N);	 
	output  : out std_logic_vector (0 to N)	); 
	end Component;	
	
	
begin		  
	a1: Adder	port map(op1=>min, op2=>max,sum=>tmp); 
	
	d1: divideBy16 	   	port map(input=>tmp, output=>outputB3);	
		
	
end behav;