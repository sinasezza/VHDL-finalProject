LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_SIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;


ENTITY RandomNumberRegister IS
    GENERIC (length : INTEGER := 8);
    PORT (  data_in     : IN  STD_LOGIC_VECTOR (length-1 DOWNTO 0);
            data_out    : OUT STD_LOGIC_VECTOR (length-1 DOWNTO 0) := (OTHERS => '0');
            clk,rst     : IN  STD_LOGIC);
END ENTITY;


ARCHITECTURE behavioral OF RandomNumberRegister IS      

BEGIN
    PROCESS (clk,rst)
    BEGIN
        IF rst='1' THEN
            data_out <= (OTHERS => '0');
        ELSIF rising_edge(clk) THEN
            data_out <= data_in;
        END IF;
    END PROCESS;
END behavioral ; 