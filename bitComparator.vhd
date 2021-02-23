LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_SIGNED.ALL;


entity bit_comparator is
  port (    bit1,bit2 : IN STD_LOGIC;
            UP,LESS,EQ: OUT STD_LOGIC := '0') ;
end bit_comparator;


architecture behavioral of bit_comparator is


begin
    process (bit1,bit2)
    BEGIN
        IF(bit1>bit2) THEN
            LESS    <= '0';
            UP      <= '1';
            EQ      <= '0';
        ELSIF(bit1<bit2) THEN
            LESS    <= '1';
            UP      <= '0';
            EQ      <= '0';
        ELSIF(bit1>bit2) THEN
            LESS    <= '0';
            UP      <= '0';
            EQ      <= '1';
        END IF;
    END PROCESS;

end behavioral ; 