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

ENTITY register_nbit IS 
    GENERIC(length : NATURAL := 8);
    PORT (  data_in     :   IN  STD_LOGIC_VECTOR(length-1 DOWNTO 0);
            data_out    :   BUFFER STD_LOGIC_VECTOR(length-1 DOWNTO 0);
            Notdata_out :   OUT STD_LOGIC_VECTOR(length-1 DOWNTO 0);
            clk,rst     :   IN  STD_LOGIC);
END ENTITY;


ARCHITECTURE behavioral OF register_nbit IS

BEGIN 
    PROCESS(clk,rst)
    BEGIN
        IF rst = '1' THEN 
            data_out <= (OThERS => '0');
        ELSIF clk'EVENT and clk = '1' THEN 
            data_out <= data_in;
        END IF;
    END PROCESS;
        Notdata_out <= NOT data_out;


END ARCHITECTURE;