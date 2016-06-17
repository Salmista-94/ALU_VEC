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

entity rotador1 is
    generic (SIZE: integer range 1 to 32:= 16);
    generic (COUNT: integer range 1 to 12:= 5);
    type vector is array(COUNT-1 downto 0) of STD_LOGIC_VECTOR (SIZE-1 downto 0);
    Port ( ops : in  vector;
            c : out  STD_LOGIC;                                 -- podría implementarlo sin 'CARRY'
            sal : out  STD_LOGIC_VECTOR (SIZE downto 0));    
end rotador1;





architecture ROTAR_D of rotador1 is
tmp : out  STD_LOGIC_VECTOR (SIZE downto 0);
begin       

process(ops)
    begin
    Ctmp = '0';
    Ztmp = '0';
    for i in 0 to COUNT-1 loop
        tmp <= (ops(i)&0)/2;
        if Ctmp = '0' then 
            Ctmp <= tmp(0);
        end if;--podría tambien hacer 'carries' y 'zeros' para cada elemento del bus...
        if Ztmp = '0' then 
            Ztmp <= '1' when sal(i) = (others => '0') else '0';
        end if;
        sal(i) <= tmp(0)&tmp(SIZE-1 to 1);
    end loop;
    c = Ctmp;
    z = Ztmp;

end process;
        
end ROTAR_D;





architecture ROTAR_I of rotador1 is
tmp : out  STD_LOGIC_VECTOR (SIZE downto 0);
begin       

process(ops)
    begin
    Ctmp = '0';
    Ztmp = '0';
    for i in 0 to COUNT-1 loop
        tmp <= (0&ops(i))*2;
        if Ctmp = '0' then 
            Ctmp <= tmp(SIZE);
        end if;--podría tambien hacer 'carries' y 'zeros' para cada elemento del bus...
        if Ztmp = '0' then 
            Ztmp <= '1' when sal(i) = (others => '0') else '0';
        end if;
        sal(i) <= tmp(SIZE-1 to 1)&tmp(SIZE);
    end loop;
    c = Ctmp;
    z = Ztmp;

end process;   

        
end ROTAR_I;


