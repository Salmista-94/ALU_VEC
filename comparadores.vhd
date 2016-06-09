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







entity comparador1 is
    generic (SIZE: integer range 1 to 32:= 16);
    Port ( op1, op2 : in  STD_LOGIC_VECTOR (SIZE-1 downto 0);-- declararlo como array (x[n])
          estado : out  STD_LOGIC);
end comparador1;




entity comparador2 is
    generic (SIZE: integer range 1 to 32:= 16);
    Port ( op1, op2 : in  STD_LOGIC_VECTOR (SIZE-1 downto 0);-- declararlo como array (x[n])
    Port ( c : in  STD_LOGIC_VECTOR (SIZE-1 downto 0);
          estado : out  STD_LOGIC);
end comparador2;




architecture IGUAL of comparador1 is
begin       

estado := '1' when op1 = op2 else '0';

end IGUAL;






architecture IGUAL of comparador2 is
begin       

estado := '1' when op1 = op2 = c else '0';

end IGUAL;






architecture MAYOR of comparador2 is
begin       

estado := '1' when c > op1 and c > op2 else '0';

end MAYOR;






architecture MENOR of comparador2 is
begin       

estado := '1' when c < op1 and c < op2 else '0';

end MENOR;






architecture DISTINTO of comparador1 is
begin       

estado := '1' when op1 ~= op2 else '0';

end IGUAL;






architecture DISTINTO of comparador2 is
begin       

estado := '1' when c ~= op1 and c ~= op2 else '0';

end IGUAL;