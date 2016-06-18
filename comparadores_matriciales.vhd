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
    generic (COUNT: integer range 1 to 12:= 5);
    type vector is array(COUNT-1 downto 0) of STD_LOGIC_VECTOR (SIZE-1 downto 0);
    Port ( ops1, ops2 : in  vector;-- declararlo como array (x[n])
          estado : out  STD_LOGIC);
end comparador1;







--architecture IGUAL of comparador1 is 
--signal counts : out  STD_LOGIC_VECTOR (5 downto 0);
--begin       

--process(op)
--    begin   -- 
--    counts <= (others => '0');
--    for j in 0 to COUNT-2 loop
--        IF (op(j) = op(j+1)) THEN
--            counts = counts + 1;
--            /=;
--        end if;
--    end loop;

--    if counts = COUNT-1 then
--        estado := '1';
--    else 
--        estado := '0';
--    end if ;
--end process ;

--end IGUAL;

architecture IGUAL_MATRICIAL of comparador1 is 
signal aux : out  STD_LOGIC;
constant TRUE: STD_LOGIC := '1';
constant FALSE: STD_LOGIC := '0';
begin       

process(ops1, ops2)
    begin   -- 
    aux <= '1';
    for i in 0 to COUNT-1 loop
        IF (ops1(i) /= ops2(i)) THEN
            aux <= '0';
            exit;
        end if;
    end loop;
    estado <= aux;

end process ;

end IGUAL_MATRICIAL;

