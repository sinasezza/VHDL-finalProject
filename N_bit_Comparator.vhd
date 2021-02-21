LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_SIGNED.ALL;

ENTITY n_bit_comparator IS
    GENERIC (length : INTEGER := 8);
    PORT (  a,b                             : IN STD_LOGIC_VECTOR(length-1 DOWNTO 0);
            led_upper,led_less,led_correct  : OUT STD_LOGIC := 'Z');
END ENTITY;


ARCHITECTURE behavioral OF n_bit_comparator IS
------------------------------------DECLARATION BEGIN


--------------------------------------END DECLARATION
BEGIN
    PROCESS(a,b)
    BEGIN   
        IF (a<b)    THEN
        led_less    <= '1';
        led_upper   <= 'Z';
        led_correct <= 'Z';
    ELSIF(a>b)  THEN
        led_less    <= 'Z';
        led_upper   <= '1';
        led_correct <= 'Z';
    ELSE
        led_less    <= 'Z';
        led_upper   <= 'Z';
        led_correct <= '1';
    END IF;
    END PROCESS;
END ARCHITECTURE;

