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


entity sum is
    generic (SIZE: integer range 1 to 32:= 16);
    Port ( op1, op2 : in STD_LOGIC_VECTOR (SIZE-1 downto 0);
            sal : out STD_LOGIC_VECTOR (SIZE downto 0));
end sum;



architecture SUMAR of sum is
signal suma : STD_LOGIC_VECTOR (SIZE downto 0);
signal A : STD_LOGIC_VECTOR (SIZE downto 0);
signal B : STD_LOGIC_VECTOR (SIZE downto 0);
begin       

A <= "0"&op1;
B <= "0"&op2;
process
begin
	suma <= (others => '0');
	suma(0) <= A(0) XOR B(0);
   for i in 1 to SIZE loop
        suma(i) <= ( (A(i) XOR B(i)) and (( not A(i-1) and not B(i-1)) or (suma(i-1) and (A(i-1) XOR B(i-1))) ))
            or (not (A(i) XOR B(i)) and ( (A(i-1) and B(i-1)) or (not suma(i-1) and (A(i-1) or B(i-1))) ));
   end loop;
end process;
sal <= suma;

end SUMAR;
      

--SUM[i] = (XOR(op1, op2, i) and ( (not mask(op1,i-1) and not mask(op2,i-1)) or (SUM[i-1] and XOR(op1, op2, i-1)) )) \
--        or (not XOR(op1, op2, i) and ( (mask(op1,i-1) and mask(op2,i-1)) or (not SUM[i-1] and (mask(op1,i-1) or mask(op2,i-1))) ))