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


entity prod_div1 is
    generic (SIZE: integer range 1 to 32:= 16);
    generic (COUNT: integer range 1 to 12:= 5);
    type vector is array(COUNT-1 downto 0) of STD_LOGIC_VECTOR (SIZE-1 downto 0);
    Port ( ops : in  vector;
	        sal : in  vector;
            c,z : out  STD_LOGIC;
            zeroDivision : out  STD_LOGIC);   	 
end prod_div1;





architecture MULTIPLICAR of prod_div1 is
tmp : out  STD_LOGIC_VECTOR (SIZE downto 0);
Ztmp : out  STD_LOGIC;
begin       

process(ops)
begin
    for i in 1 to COUNT-1 loop
        tmp <= (ops(i,SIZE-1)& ops(i)) * ops(0);
        sal <= tmp(SIZE-1 to 0);
        c <= '1' when tmp(SIZE) /= op1(SIZE-1) and op1(SIZE-1) = op2(SIZE-1) else '0';
        if Ztmp = '0' then 
            Ztmp <= '1' when sal(i) = (others => '0') else '0';
        end if;
    end loop;
end process;
        
end MULTIPLICAR;






architecture DIVIDIR of prod_div1 is
Ztmp : out  STD_LOGIC;
begin       

process(ops)
begin
    Ztmp <= '0';
    sal(0) <= ops(0);
    for i in 1 to COUNT-1 loop
        if ops(0) = (others => '0') then 
            zeroDivision <= '1';
            sal(i) <= ops(i);
        else
            zeroDivision <= '0';
            sal(i) <=  ops(i) / ops(0);
            if Ztmp = '0' then 
                Ztmp <= '1' when sal(i) = (others => '0') else '0';
            end if;
        end if;
    end loop;
    z <= Ztmp;
end process;
        
end DIVIDIR;







