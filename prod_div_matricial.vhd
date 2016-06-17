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


entity prod_div_matricial1 is
    generic (SIZE: integer range 1 to 32:= 16);
    generic (COUNT: integer range 1 to 12:= 5);
    type vector is array(COUNT-1 downto 0) of STD_LOGIC_VECTOR (SIZE-1 downto 0);
    Port ( ops1, ops2 : in  vector;
	        sal : in  STD_LOGIC_VECTOR (SIZE-1 downto 0);
            c,z : out  STD_LOGIC;
            zeroDivision : out  STD_LOGIC);   	 
end prod_div_matricial1;





architecture MULTIPLICAR_MATRICIAL of prod_div_matricial1 is
tmp : out  STD_LOGIC_VECTOR (SIZE downto 0);
Ctmp : out  STD_LOGIC;
Ztmp : out  STD_LOGIC;
begin       

process(ops1, ops2)
begin
    sal <= (others => '0');
    for i in 1 to COUNT-1 loop
        tmp <= (ops1(i,SIZE-1)& ops1(i)) * ops2(i) + sal;
        sal <= tmp(SIZE-1 to 0);
        if Ctmp = '0' then --falta pensar la logica para un verdadero acarreo debido a '+ sal'.
            Ctmp <= '1' when tmp(SIZE) /= ops1(i,SIZE-1) and ops1(i,SIZE-1) = ops2(i,SIZE-1) else '0';
        end if;
        if Ztmp = '0' then 
            Ztmp <= '1' when sal(i) = (others => '0') else '0';
        end if;
    end loop;
    c <= Ctmp;
    z <= Ztmp;
end process;
        
end MULTIPLICAR_MATRICIAL;






--architecture DIVIDIR_MATRICIAL of prod_div_matricial1 is
--Ztmp : out  STD_LOGIC;
--begin       

--process(ops)
--begin
--    Ztmp <= '0';
--    sal(0) <= ops(0);
--    for i in 1 to COUNT-1 loop
--        if ops(0) = (others => '0') then 
--            zeroDivision <= '1';
--            sal(i) <= ops(i);
--        else
--            zeroDivision <= '0';
--            sal(i) <=  ops(i) / ops(0);
--            if Ztmp = '0' then 
--                Ztmp <= '1' when sal(i) = (others => '0') else '0';
--            end if;
--        end if;
--    end loop;
--    z <= Ztmp;
--end process;
        
--end DIVIDIR_MATRICIAL;







