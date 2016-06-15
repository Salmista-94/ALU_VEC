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




entity rotador2 is
    generic (SIZE: integer range 1 to 32:= 16);
    Port ( op1, op2 : in  STD_LOGIC_VECTOR (SIZE-1 downto 0);-- declararlo como array (x[n])
          c, z : out  STD_LOGIC;  
          sal1, sal2 : out  STD_LOGIC_VECTOR (SIZE-1 downto 0));  
end rotador2;






architecture ROTAR_D of rotador2 is
tmp1 : out  STD_LOGIC_VECTOR (SIZE downto 0);
tmp2 : out  STD_LOGIC_VECTOR (SIZE downto 0);
begin       

process(op1, op2)
    begin
    tmp1 <= (0&op1)/2;
    tmp2 <= (0&op2)/2;
    sal1 <= tmp1(SIZE-1 to 1)&tmp1(SIZE);
    sal2 <= tmp2(SIZE-1 to 1)&tmp2(SIZE);

    --podría tambien hacer 'carries' y 'zeros' para cada elemento del bus...
    c := '1' when tmp1(SIZE) = '1' or tmp2(SIZE) = '1' else '0';
    z := '1' when sal1 = (others => '0') or sal2 = (others => '0') else '0';
end process;
        
end ROTAR_D;





architecture ROTAR_I of rotador2 is
tmp1 : out  STD_LOGIC_VECTOR (SIZE downto 0);
tmp2 : out  STD_LOGIC_VECTOR (SIZE downto 0);
begin     

process(op1, op2)
    begin
    tmp1 <= (0&op1)*2;
    tmp2 <= (0&op2)*2;
    sal1 <= tmp1(SIZE-1 to 1)&tmp1(SIZE);
    sal2 <= tmp2(SIZE-1 to 1)&tmp2(SIZE);

    --podría tambien hacer 'carries' y 'zeros' para cada elemento del bus...
    c := '1' when tmp1(SIZE) = '1' or tmp2(SIZE) = '1' else '0';
    z := '1' when sal = (others => '0') else '0';
end process;  

        
end ROTAR_I;

