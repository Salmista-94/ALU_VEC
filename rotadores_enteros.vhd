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


entity rotador_enteros is
    generic (SIZE: integer range 1 to 32:= 16);
    generic (COUNT: integer range 1 to 12:= 5);
    type vector is array(COUNT-1 downto 0) of STD_LOGIC_VECTOR (SIZE-1 downto 0);
    Port ( ops, sal : in  vector );
end rotador_enteros;








architecture ROTADOR_ENTEROS_D of rotador_enteros is
begin       

process(ops)
begin
    for i in 0 to COUNT-2 loop
        sal(i) <= op(i+1);
    end loop;
    sal(COUNT-1) <= op(0);
end process;
    
        
end ROTADOR_ENTEROS_D;







architecture ROTADOR_ENTEROS_I of rotador_enteros is
begin       

process(ops)
begin
    for i in 0 to COUNT-2 loop
        sal(i+1) <= op(i);
    end loop;
    sal(0) <= op(COUNT-1);
end process;
    
        
end ROTADOR_ENTEROS_I;
