LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

--This block has the following functionality:
--The output is the division by 16 from the input.		   		
--The division is made by right shift of four place.	

entity divideBy16 is
 			 generic(N: Integer:=9);
	port (	 
	input	: in std_logic_vector (0 to N);
	output  : out std_logic_vector (0 to N)); 
	
END divideBy16;	

architecture behav of divideBy16 is

function shiftRightFourPlaces(a: in std_logic_vector)

	return std_logic_vector is
	variable shifted: std_logic_vector(0 to N);

	begin	  		  
	for  i in 0 to N loop	
		shifted(i):='0';
	end loop;		  
	
	for  i in N downto 4 loop
			shifted(i):=a(i-4);
	end loop;
	
	return shifted;

end shiftRightFourPlaces;

signal tmp:std_logic_vector (0 to N); 
	begin					   
	   tmp<=shiftRightFourPlaces(input);	 
	   output<=tmp; 
end behav;