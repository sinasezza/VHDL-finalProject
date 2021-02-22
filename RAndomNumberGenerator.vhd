library ieee;
use ieee.std_logic_1164.all;
--use IEEE.std_logic_textio.all;
use IEEE.std_logic_arith.all;
--use IEEE.numeric_bit.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_signed.all;
use IEEE.std_logic_unsigned.all;
--use IEEE.math_real.all;
--use IEEE.math_complex.all;

-- using lfsr

ENTITY linear is
    GENERIC (length : INTEGER := 8);
    PORT (  active  : IN STD_LOGIC; 
            clk     : IN STD_LOGIC; 
            Rset    : IN STD_LOGIC ;
            c_out   : OUT STD_LOGIC_VECTOR (length-1 DOWNTO 0));
end linear;

ARCHITECTURE behavioral OF linear IS

SIGNAL count           : STD_LOGIC_VECTOR (length-1 DOWNTO 0) := (others => '0');
SIGNAL linear_feedback : std_logic;


BEGIN
    --linear_feedback <= NOT(count(length-1) XOR count((length-1) / 2));
    linear_feedback <= not(count(length-1) xor count(0));
    PROCESS (clk, Rset) 
    BEGIN
        IF (Rset = '1') THEN
            count <= (OTHERS =>'0');
        ELSIF clk'EVENT AND clk = '1' AND active = '1' THEN
               count <= count(length-2 DOWNTO 0) & linear_feedback;
        END IF;
    END PROCESS;
    c_out <= count;
END ARCHITECTURE;