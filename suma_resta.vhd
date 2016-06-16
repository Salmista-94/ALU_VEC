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


entity sum_res1 is
    generic (SIZE: integer range 1 to 32:= 16);
    generic (COUNT: integer range 1 to 12:= 5);
    type vector is array(COUNT-1 downto 0) of STD_LOGIC_VECTOR (SIZE-1 downto 0);
    Port ( ops : in  vector;
            sal : out  STD_LOGIC_VECTOR (SIZE-1 downto 0);
            c,z : out  STD_LOGIC);   
end sum_res1;



architecture SUMAR of sum_res1 is
tmp : out  STD_LOGIC_VECTOR (SIZE downto 0);
Ztmp : out  STD_LOGIC;
Ctmp : out  STD_LOGIC;
begin       

process(ops)
begin
    for i in 0 to COUNT-2 loop
        tmp <= (ops(i,SIZE-1)& ops(i)) + ops(i+1);
        if Ctmp = '0' then 
            Ctmp <= '1' when tmp(SIZE) /= ops(i,SIZE-1) and ops(i,SIZE-1) = ops(i+1,SIZE-1) else '0';
        end if;
        if Ztmp = '0' then 
            Ztmp <= '1' when sal(i) = (others => '0') else '0';
        end if;
    end loop;
    c <= Ctmp;
    z <= Ztmp;
    sal <= tmp(SIZE-1 to 0);
end process;

end SUMAR;
      






--architecture RESTAR of sum_res1 is
--tmp : out  STD_LOGIC_VECTOR (SIZE downto 0);
--begin       

--process(ops)
--begin
--    tmp <= (op1(SIZE-1)& op1) - op2;
--    sal <= tmp(SIZE-1 to 0);
--    c <= '1' when tmp(SIZE) = ops(SIZE-1) and op1(SIZE-1) /= op2(SIZE-1) else '0';
--    z <= '1' when sal = (others => '0') else '0';
--end process;
        
--end RESTAR;
      
