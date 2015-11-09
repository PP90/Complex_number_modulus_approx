LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

--This vhd file has the following functionality:

--It contains one B1 block, one b2 block, one B3 block and one sottrattore block.
--P_in and Q_in are the inputs of this block. The are the real and imaginary parts of a complex number. 
--The port mapping is made according to diagram block. 
--The output of this module returns the result of the algorithm used for compute the complex number module by approximated formula.

--For more details see the B1, B2, B3 and sottrattore implementation.
entity Project is  			 generic(N: Integer:=9);
	port (	 
	p_in	: in std_logic_vector (0 to N);	 	
	q_in	: in std_logic_vector (0 to N);
	output  : out std_logic_vector (0 to N)); 	 
end Project; 

	architecture behav of Project is	
	signal minTmp: std_logic_vector(0 to N-1);
	signal maxTmp: std_logic_vector(0 to N-1);
	signal sumTmp: std_logic_vector(0 to N);  
	signal outTmp: std_logic_vector(0 to N);	
	
	
		 component b1
				port (	 
	P	: in std_logic_vector (0 to N);	 	
	Q	: in std_logic_vector (0 to N);
	minOut  : out std_logic_vector (0 to N-1);
	maxOut  : out std_logic_vector (0 to N-1));  
	end Component;
	
	
	  component b2
			port (	 
	min	: in std_logic_vector (0 to N-1);	 	
	max	: in std_logic_vector (0 to N-1);
	sumMinMax  : out std_logic_vector (0 to N)); 
	end Component;	
	
	component b3
		   port (	 
	min	: in std_logic_vector (0 to N-1);	 	
	max	: in std_logic_vector (0 to N-1);
	outputB3  : out std_logic_vector (0 to N));
		end Component;
	
	
    component diff_block
			  port (	 
	minuendo	: in std_logic_vector (0 to N);	 	
	sottraendo	: in std_logic_vector (0 to N);
	differenza  : out std_logic_vector (0 to N)
	); 
		end component;
		
		
begin		  
	  b1Block: b1  port map(p=>p_in, q=>q_in,minOut=>minTmp,maxOut=>maxTmp);	
	  b2Block: b2  port map(min=>mintmp, max=>maxtmp,sumMinMax=>sumTmp); 
	  b3Block: b3  port map(min=>mintmp, max=>maxtmp,outputB3=>outtmp); 
	  s: diff_block  port map(minuendo=>sumTmp, sottraendo=>outtmp,differenza=>output);
	  
	  
end behav;