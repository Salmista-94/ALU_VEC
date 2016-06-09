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







entity hay_Cero is
    generic (SIZE: integer range 1 to 32:= 16);
    Port ( op : in  STD_LOGIC_VECTOR (SIZE-1 downto 0);-- declararlo como array (x[n])
          estado : out  STD_LOGIC);
end hay_Cero;




architecture Detector_Cero of hay_Cero is
signal CERO : out  STD_LOGIC;
begin       

process( )
begin   -- 
    CERO <= '0';
    for j in 0 to n-1 loop
        IF (op(j) = '0') THEN
            CERO = '1';
            break;
        end if;
    end loop;
end process ;
estado := CERO;

end Detector_Cero;




architecture Detector_Nulo of hay_Cero is
signal count : out  STD_LOGIC_VECTOR (SIZE-1 downto 0);
begin       

process( )
begin   -- 
    count <= (others => '0');
    for j in 0 to n-1 loop
        IF (op(j) = '0') THEN
            count = count + 1;
            break;
        end if;
    end loop;
    if count = SIZE-1 then
        estado := CERO;
    end if ;
end process ;
 
end Detector_Nulo;
