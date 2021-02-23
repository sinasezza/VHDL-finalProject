LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_SIGNED.ALL;

ENTITY n_bit_comparator IS
    GENERIC (length : INTEGER := 8);
    PORT (  A,B                             : IN STD_LOGIC_VECTOR(length-1 DOWNTO 0);
            led_upper,led_less,led_correct  : OUT STD_LOGIC := '0';
            led_lock                        : OUT STD_LOGIC := '0');
END ENTITY;




ARCHITECTURE SUB_structural OF n_bit_comparator IS 

COMPONENT fulladder IS
    PORT (bit1 ,bit2,carryin : IN STD_LOGIC;
            sum,carryout    : OUT STD_LOGIC);
END COMPONENT;

SIGNAL S        : STD_LOGIC_VECTOR(length-1 DOWNTO 0) ;
SIGNAL C        : STD_LOGIC_VECTOR(1 TO length) ;
signal Z,V,N    : STD_LOGIC;

BEGIN

    label1: FOR i IN 0 TO length-1 GENERATE
        label2: IF (i = 0) GENERATE
            fulladder1 : fulladder PORT MAP(A(i), NOT b(i),'1',S(i),C(i+1));
        END GENERATE;
        label3: IF ((i <= length-1) AND (i>0)) GENERATE
            fulladder2 : fulladder PORT MAP(A(i), NOT b(i),C(i),S(i),C(i+1));
        END GENERATE;
    END GENERATE;
    V <= C(length) XOR C(length-1) ;
    N <= S(length-1) ;
    Z <= '1' WHEN S = 0 ELSE '0';

    led_correct <= z;
    led_upper   <= NOT(Z OR (N XOR V) );
    led_less    <= N XOR V;
END ARCHITECTURE;

--====================================================================
--====================================================================
--====================================================================
--====================================================================

ARCHITECTURE bitwise_structural OF n_bit_comparator IS 

COMPONENT bit_comparator is
    PORT (    bit1,bit2 : IN STD_LOGIC;
              UP,LESS,EQ: OUT STD_LOGIC := '0') ;
END COMPONENT;

SIGNAL equality     : STD_LOGIC_VECTOR(length-1 DOWNTO 0) := (OTHERS => '0');
SIGNAL deficiency   : STD_LOGIC_VECTOR(length-1 DOWNTO 0) := (OTHERS => '0');
SIGNAL excess       : STD_LOGIC_VECTOR(length-1 DOWNTO 0) := (OTHERS => '0');

BEGIN
    label1: FOR i IN length-1 DOWNTO 0 GENERATE
        compare1 : bit_comparator PORT MAP(A(i),b(i),excess(i),deficiency(i),equality(i));
    END GENERATE;

    led_upper       <= '1' when (excess > deficiency) else '0';
    led_less        <= '1' when (excess < deficiency) else '0';
    led_correct     <= '1' when (led_upper = '0' and led_less = '0') else '0';


END ARCHITECTURE;








ARCHITECTURE behavioral OF n_bit_comparator IS
------------------------------------DECLARATION BEGIN


--------------------------------------END DECLARATION
BEGIN
    PROCESS(a,b)
    BEGIN   
        IF (a<b)    THEN
        led_less    <= '1';
        led_upper   <= '0';
        led_correct <= '0';
    ELSIF(a>b)  THEN
        led_less    <= '0';
        led_upper   <= '1';
        led_correct <= '0';
    ELSE
        led_less    <= '0';
        led_upper   <= '0';
        led_correct <= '1';
    END IF;
    END PROCESS;
END ARCHITECTURE;

