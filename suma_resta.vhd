----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:33:38 05/28/2016 
-- Design Name: 
-- Module Name:    dec_hex_7_SEG - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sum_res1 is
    generic (SIZE: integer range 1 to 32:= 16);
    Port ( op1, op2 : in  STD_LOGIC_VECTOR (SIZE-1 downto 0);
	        sal : out  STD_LOGIC_VECTOR (SIZE downto 0));	 
end sum_res1;



architecture SUMAR of sum_res1 is
begin       

sal <= (op1(3)& op1) + op2;
        
end SUMAR;







entity sum_res2 is
    generic (SIZE: integer range 1 to 32:= 16);
    Port ( op1, op2 : in  STD_LOGIC_VECTOR (SIZE-1 downto 0);
          over : out  STD_LOGIC;  
          sal : out  STD_LOGIC_VECTOR (SIZE-1 downto 0));  
end sum_res2;




architecture SUMAR of sum_res2 is
begin       
        
sal <= op1 + op2;
IF (sal<0 AND op1>0 AND op2>0) OR (sal>0 AND op1<0 AND op2<0) OR (sal=(other=>"0") AND op1=sal="1"(other=>"0")) THEN
    over := '1';
ELSE
    over := '0';
END IF;
    
end SUMAR;





architecture RESTAR of sum_res1 is
begin       

sal <= (op1(3)& op1) - op2;
        
end RESTAR;






--Necesito verificar ésta arquitectura
architecture RESTAR of sum_res2 is
begin       
        
sal <= op1 - op2;
IF (sal<0 AND op1>0 AND op2<0) OR (sal>0 AND op1<0 AND op2>0) OR (sal=(other=>"0") AND op1=sal="1"(other=>"0")) THEN
    over := '1';
ELSE
    over := '0';
END IF;
    
end RESTAR;

