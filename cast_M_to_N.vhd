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


entity cast_ops_M_to_op_N is
    generic (SIZE: integer range 1 to 32:= 16);
    generic (COUNT: integer range 1 to 12:= 5);
    type vector is array(COUNT-1 downto 0) of STD_LOGIC_VECTOR (SIZE-1 downto 0);
    type vector_2 is array(COUNT-1 downto 0) of STD_LOGIC_VECTOR (2*SIZE-1 downto 0);
    Port ( in_ : in  vector_2;
            sal : in  vector;
            c : out  STD_LOGIC);      
end cast_ops_M_to_op_N;





architecture CAST_M_to_N of prod_div1 is
Ctmp : out  STD_LOGIC;
aux : out  STD_LOGIC;
begin       

process(in_)
begin
    for i in 0 to COUNT-1 loop
        sal(i) <= in_(i,2*SIZE-1) & in_(i, SIZE-1 to 0);
        aux <= '1';
        for j in SIZE-1 to 2*SIZE-1 loop
            if in_(i,j) = '0' then 
                aux <= '0';
                exit;
            end if;
        end loop;
        if Ctmp = '0' then 
            Ctmp <= aux;
        end if;
    end loop;
    c <= Ctmp;
end process;
        
end CAST_M_to_N;


