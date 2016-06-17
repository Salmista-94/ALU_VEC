
entity desplazador2 is
    generic (SIZE: integer range 1 to 32:= 16);
    Port ( op1, op2 : in  STD_LOGIC_VECTOR (SIZE-1 downto 0);-- declararlo como array (x[n])
          c, z : out  STD_LOGIC;  
          sal1, sal2 : out  STD_LOGIC_VECTOR (SIZE-1 downto 0));  
end desplazador2;






architecture DESPLAZAR_D of desplazador2 is
tmp1 : out  STD_LOGIC_VECTOR (SIZE downto 0);
tmp2 : out  STD_LOGIC_VECTOR (SIZE downto 0);
begin       

process(op1, op2)
    begin
    tmp1 <= (op1&0)/2;
    tmp2 <= (op2&0)/2;
    sal1 <= tmp1(SIZE-1 to 0);
    sal2 <= tmp2(SIZE-1 to 0);

    --podría tambien hacer 'carries' y 'zeros' para cada elemento del bus...
    c <= '1' when tmp1(SIZE) = '1' or tmp2(SIZE) = '1' else '0';
    z <= '1' when sal1 = (others => '0') or sal2 = (others => '0') else '0';
end process;
        
end DESPLAZAR_D;





architecture DESPLAZAR_I of desplazador2 is
tmp1 : out  STD_LOGIC_VECTOR (SIZE downto 0);
tmp2 : out  STD_LOGIC_VECTOR (SIZE downto 0);
begin     

process(op1, op2)
    begin
    tmp1 <= (0&op1)*2;
    tmp2 <= (0&op2)*2;
    sal1 <= tmp1(SIZE-1 to 0);
    sal2 <= tmp2(SIZE-1 to 0);

    --podría tambien hacer 'carries' y 'zeros' para cada elemento del bus...
    c <= '1' when tmp1(SIZE) = '1' or tmp2(SIZE) = '1' else '0';
    z <= '1' when sal = (others => '0') else '0';
end process;
        
end DESPLAZAR_I;

