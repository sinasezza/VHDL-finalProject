library IEEE;
use IEEE.std_logic_1164.all;
--use IEEE.std_logic_textio.all;
use IEEE.std_logic_arith.all;
--use IEEE.numeric_bit.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_signed.all;
--use IEEE.std_logic_unsigned.all;
--use IEEE.math_real.all;
--use IEEE.math_complex.all;

ENTITY COUNT_NB IS
    GENERIC (length : INTEGER := 8);
    port (  RESET,CLK,load,UP : IN STD_LOGIC;
            DIN : in STD_LOGIC_VECTOR (length-1 downto 0);
            COUNT : out STD_LOGIC_VECTOR (length-1 downto 0));
END COUNT_NB;


ARCHITECTURE my_count of COUNT_NB IS
    SIGNAL t_cnt : STD_LOGIC_VECTOR(length-1 downto 0);
    BEGIN
        process (CLK, RESET)
        BEGIN
        IF (RESET = '1') THEN
            t_cnt <= (others => '0'); -- clear
        elsIF (rISing_edge(CLK)) THEN
            IF (load = '1') THEN 
                t_cnt <= DIN; -- load
            ELSIF (UP = '1') THEN 
                t_cnt <= t_cnt + 1; -- incr
            ELSE 
                t_cnt <= t_cnt - 1; -- decr
            END IF;
        END IF;
        END PROCESS;
    COUNT <= t_cnt;
END ARCHITECTURE;