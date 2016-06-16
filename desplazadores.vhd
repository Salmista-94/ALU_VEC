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

entity desplazador1 is
    generic (SIZE: integer range 1 to 32:= 16);
    Port ( op1, op2 : in  STD_LOGIC_VECTOR (SIZE-1 downto 0);-- declararlo como array (x[n])
            sal : out  STD_LOGIC_VECTOR (SIZE downto 0));    
end desplazador1;



architecture DESPLAZAR_D of desplazador1 is
begin       

sal <= op1 * op2;
        
end DESPLAZAR_D;









architecture DESPLAZAR_I of desplazador1 is
begin       

sal <= (op1(3)& op1) - op2;
        
end DESPLAZAR_I;




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

entity desplazador1 is
    generic (SIZE: integer range 1 to 32:= 16);
    Port ( op1, op2 : in  STD_LOGIC_VECTOR (SIZE-1 downto 0);   -- declararlo como array (x[n])
            c : out  STD_LOGIC;                                 -- podría implementarlo sin 'CARRY'
            sal : out  STD_LOGIC_VECTOR (SIZE downto 0));    
end desplazador1;





architecture DESPLAZAR_D of desplazador1 is
tmp1 : out  STD_LOGIC_VECTOR (SIZE downto 0);
tmp2 : out  STD_LOGIC_VECTOR (SIZE downto 0);
begin       

process(op1, op2)
    begin       
    tmp1 <= (0&op1)/2;
    tmp2 <= (0&op2)/2;
    sal1 <= tmp1(SIZE-1 to 0);
    sal2 <= tmp2(SIZE-1 to 0);

    --podría tambien hacer 'carries' y 'zeros' para cada elemento del bus...
    c <= '1' when tmp1(SIZE) = '1' or tmp2(SIZE) = '1' else '0';
end process;
        
end DESPLAZAR_D;





architecture DESPLAZAR_I of rotador1 is
tmp1 : out  STD_LOGIC_VECTOR (SIZE downto 0);
tmp2 : out  STD_LOGIC_VECTOR (SIZE downto 0);
begin       

process(op1, op2)
    begin       
    tmp1 <= (0&op1)*2;
    tmp2 <= (0&op2)*2;
    sal1 <= tmp1(SIZE-1 to 0);
    sal2 <= tmp2(SIZE-1 to 0);

    --podría tambien hacer 'carries' y 'zeros' para cada elemento del bus...
    c <= '1' when tmp1(SIZE) = '1' or tmp2(SIZE) = '1' else '0';
end process;     

        
end DESPLAZAR_I;

