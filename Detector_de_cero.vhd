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







entity hay_Cero_V is
    generic (SIZE: integer range 1 to 32:= 16);
    generic (COUNT: integer range 1 to 12:= 5);
    type vector is array(COUNT-1 downto 0) of STD_LOGIC_VECTOR (SIZE-1 downto 0);
    Port ( ops : in  vector;
          estado : out  STD_LOGIC);
end hay_Cero_V;


entity hay_Cero is
    generic (SIZE: integer range 1 to 32:= 16);
    Port ( op : in  STD_LOGIC_VECTOR (SIZE-1 downto 0);
          estado : out  STD_LOGIC);
end hay_Cero;



architecture Detector_Cero of hay_Cero is
signal CERO : out  STD_LOGIC;
begin       

process(op)
begin   -- 
    CERO <= '0';
    for j in 0 to SIZE-1 loop
        IF (op(j) = '0') THEN
            CERO = '1';
            exit;
        end if;
    end loop;
end process ;
estado := CERO;

end Detector_Cero;




--architecture Detector_Nulo of hay_Cero is
--signal count : out  STD_LOGIC_VECTOR (SIZE-1 downto 0);
--begin       

--process( )
--begin   -- 
--    count <= (others => '0');
--    for j in 0 to n-1 loop
--        IF (op(j) = '0') THEN
--            count = count + 1;
--            exit;
--        end if;
--    end loop;
--    if count = SIZE-1 then
--        estado := CERO;
--    end if ;
--end process ;
 
--end Detector_Nulo;




architecture Detector_Nulo of hay_Cero_V is
signal oper : out  STD_LOGIC_VECTOR (SIZE-1 downto 0);
signal CERO : out  STD_LOGIC;

constant TRUE: STD_LOGIC := '1';
constant FALSE: STD_LOGIC := '0';


-- Component Declarations
component Detector_Cero
Port ( op : in  STD_LOGIC_VECTOR (SIZE-1 downto 0);
          estado : out  STD_LOGIC);
end component;
begin       

es_cero: Detector_Cero Port ( op=>oper, estado=>CERO );

process
variable count: integer;
begin   -- 
    count <= 0;
    for i in 0 to COUNT-1 loop
        oper <= ops(j);
        IF (CERO = TRUE) THEN
            count := count + 1;
            exit;
        end if;
    end loop;
    if count = SIZE-1 then
        estado <= CERO;
    end if ;
end process ;

end Detector_Nulo;
