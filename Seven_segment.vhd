LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_SIGNED.ALL;


ENTITY seven_segment IS
    PORT(   threeBITinput  : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
            eightBIToutput : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END ENTITY;

ARCHITECTURE behavioral OF seven_segment IS

BEGIN
    PROCESS(threeBITinput)
    BEGIN
        CASE threeBITinput IS
            WHEN "000"  => eightBIToutput <= "1111110";
            WHEN "001"  => eightBIToutput <= "0110000";
            WHEN "010"  => eightBIToutput <= "1101101";
            WHEN "011"  => eightBIToutput <= "1111001";
            WHEN "100"  => eightBIToutput <= "0110011";
            WHEN "101"  => eightBIToutput <= "1011011";
            WHEN "110"  => eightBIToutput <= "1011111";
            WHEN OTHERS => eightBIToutput <= "1110000";
        END CASE;
    END PROCESS;
END ARCHITECTURE;

