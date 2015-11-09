LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

--The functionality of this block is the following:
--The output is the sum of the two inputs.

entity Adder is
 			 generic(N: Integer:=9);
	port (	 					
	op1	: in std_logic_vector (0 to N-1);	 	
	op2	: in std_logic_vector (0 to N-1);
	
	sum  : out std_logic_vector (0 to N)); 
	
END Adder;	  							  	 
																							 

architecture behav of Adder is

 --The sum computation is made from this function.
function sumOperators(op1, op2: in std_logic_vector)
return std_logic_vector is
variable sum: std_logic_vector(0 to N);	   
variable carry: std_logic;	

begin	  
		carry:='0';
	  	   for  i in 0 to N loop	
			sum(i):='0';
	end loop;		   
	
	
	
		for  i in N downto 1 loop
			sum(i):=	op1(i-1) xor op2(i-1) xor carry;
			carry:= (op1(i-1) and op2(i-1)) or (carry and op1(i-1)) or (carry and op2(i-1));
		end loop;
	sum(0):=carry;
	
	return sum;
end sumOperators;			


signal tmp:std_logic_vector (0 to N); 
			begin
	   tmp<=sumOperators(op1,op2); 	  --I CALL THE sumOperators function
	   sum<=tmp;
end behav;

