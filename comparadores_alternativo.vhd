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



entity comparador2 is
    generic (SIZE: integer range 1 to 32:= 16);
    generic (COUNT: integer range 1 to 12:= 5);
    type vector is array(COUNT-1 downto 0, SIZE-1 downto 0) of std_logic;
    Port ( ops : in  vector;-- declararlo como array (x[n])
        single_OP : in  STD_LOGIC_VECTOR (SIZE-1 downto 0);-- ó utilizando al primer entero del vector
        estado : out  STD_LOGIC);
end comparador2;









architecture IGUAL of comparador2 is 
signal aux : out  STD_LOGIC;
begin       

process(op, single_OP)
    begin   -- 
    aux <= '1';
    for j in 0 to COUNT-1 loop
        IF (op(j) /= single_OP) THEN
            aux <= '0';
            break;
        end if;
    end loop;

end process ;
estado <= aux;

end IGUAL;






architecture MAYOR of comparador2 is
begin       

process(op, single_OP)
    begin   -- 
    aux <= '1';
    for j in 0 to COUNT-1 loop
        IF (not (single_OP > op(j)) THEN
            aux <= '0';
            break;
        end if;
    end loop;

end process ;
estado <= aux;

end MAYOR;






architecture MENOR of comparador2 is
signal aux : out  STD_LOGIC;
begin       

process(op, single_OP)
    begin   -- 
    aux <= '1';
    for j in 0 to COUNT-1 loop
        IF (not (single_OP < op(j)) THEN
            aux <= '0';
            break;
        end if;
    end loop;

end process ;
estado <= aux;

end MENOR;






architecture DISTINTO of comparador2 is
signal aux : out  STD_LOGIC;
begin

process(op, single_OP)
    begin   -- 
    aux <= '1';
    for j in 0 to COUNT-1 loop
        IF (op(j) = single_OP) THEN
            aux <= '0';
            break;
        end if;
    end loop;
    estado <= aux;

end process ;

end DISTINTO;
