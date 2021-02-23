LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_SIGNED.ALL;


ENTITY test_comp IS

END ENTITY;

ARCHITECTURE test OF test_comp IS

COMPONENT n_bit_comparator IS
    GENERIC (length : INTEGER := 4);
    PORT (  a,b : IN STD_LOGIC_VECTOR(length-1 DOWNTO 0);
    led_upper,led_less,led_correct : OUT STD_LOGIC := '0';
    led_lock                        : OUT STD_LOGIC := '0');
END COMPONENT;

SIGNAL x1,y1      : STD_LOGIC_vector(3 DOWNTO 0); 
SIGNAL UPPER1,LESS1,EQUAL1    : STD_LOGIC;

--SIGNAL x2,y2      : STD_LOGIC_vector(3 DOWNTO 0); 
--SIGNAL UPPER2,LESS2,EQUAL2    : STD_LOGIC;

--SIGNAL x3,y3      : STD_LOGIC_vector(3 DOWNTO 0); 
--SIGNAL UPPER3,LESS3,EQUAL3    : STD_LOGIC;

--stage :n_bit_comparator USE ENTITY work.n_bit_comparator(structural);

BEGIN
    subbin : entity work.n_bit_comparator(SUB_structural) 
    GENERIC MAP (length => 4) PORT MAP (x1,y1,UPPER1,LESS1,EQUAL1);

    --bitcomp : entity work.n_bit_comparator(bitwise_structural) 
    --GENERIC MAP (length => 4) PORT MAP (x2,y2,UPPER2,LESS2,EQUAL2);

    --behave : entity work.n_bit_comparator(behavioral) 
    --GENERIC MAP (length => 4) PORT MAP (x3,y3,UPPER3,LESS3,EQUAL3);

    x1  <= X"1",X"5" AFTER 200 NS,X"2" AFTER 400 NS,X"A" AFTER 600 NS,X"B" AFTER 800 NS; 
    y1  <= X"2",X"4" AFTER 200 NS,X"2" AFTER 400 NS,X"F" AFTER 600 NS,X"B" AFTER 800 NS; 

    --x2  <= X"1",X"5" AFTER 200 NS,X"2" AFTER 400 NS,X"A" AFTER 600 NS,X"B" AFTER 800 NS;
    --y2  <= X"2",X"4" AFTER 200 NS,X"2" AFTER 400 NS,X"F" AFTER 600 NS,X"B" AFTER 800 NS;

    --x3  <= X"1",X"5" AFTER 200 NS,X"2" AFTER 400 NS,X"A" AFTER 600 NS,X"B" AFTER 800 NS;
    --y3  <= X"2",X"4" AFTER 200 NS,X"2" AFTER 400 NS,X"F" AFTER 600 NS,X"B" AFTER 800 NS;
    END ARCHITECTURE;
    END ARCHITECTURE;