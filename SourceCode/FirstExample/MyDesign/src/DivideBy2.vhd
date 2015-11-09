LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

--This block has the following functionality:
--The output is the division by 2 from the input.		   		
--The division is made by right shift of one place.	  

entity divideBy2 is
 			 generic(N: Integer:=9);
	port (	 
	input	: in std_logic_vector (0 to N-1);	
	output  : out std_logic_vector (0 to N-1)); 
	
END divideBy2;	

architecture behav of divideBy2 is

function shiftRight(a: in std_logic_vector)
	return std_logic_vector is
	variable shifted: std_logic_vector(0 to N-1);
	begin	  		  
		for  i in 0 to N-1 loop	
			shifted(i):='0';
	end loop;		  
	
		for  i in N-1 downto 1 loop
				shifted(i):=a(i-1);
		end loop;
	
	return shifted;
end shiftRight;

signal tmp:std_logic_vector (0 to N-1); 
begin			
		   tmp<=shiftRight(input);	 
	       output<=tmp; 
end behav;