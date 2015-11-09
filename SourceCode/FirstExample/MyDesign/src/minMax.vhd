LIBRARY IEEE;
USE IEEE.std_logic_1164.all;


--The functionality of this block is the following:

--This block compute the maximum and the minumum between two inputs.

entity minMax is
 			 generic(N: Integer:=9);
	port (	 
	in1	: in std_logic_vector (0 to N-1);	 	
	in2	: in std_logic_vector (0 to N-1);
	
	min  : out std_logic_vector (0 to N-1);
	max  : out std_logic_vector (0 to N-1)); 
	
END minMax;

architecture behav of minMax is

signal tmpMin:std_logic_vector (0 to N-1); 	
signal tmpMax:std_logic_vector (0 to N-1);	

begin
	   tmpMax<=in1 when(in1>in2) else in2;
	   tmpMin<=in1 when(in1<=in2) else in2;
	   min<=tmpMin;	 
	   max<=tmpMax;
		   
end behav;