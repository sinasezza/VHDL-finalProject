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

ENTITY COUNT_NB_tb IS

END COUNT_NB_tb;

ARCHITECTURE test OF COUNT_NB_tb IS

COMPONENT COUNT_NB IS
    GENERIC (length : INTEGER := 8);
    port (  RESET,CLK,load,UP : IN STD_LOGIC;
            DIN : in STD_LOGIC_VECTOR (length-1 downto 0);
            COUNT : out STD_LOGIC_VECTOR (length-1 downto 0));
END COMPONENT;

SIGNAL rst,clock,loading,upCounter  : STD_LOGIC := '0';
SIGNAL dataIN,counter               : STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN
    counting_stage : COUNT_NB GENERIC MAP(length => 4) PORT MAP (rst,clock,loading,upCounter,dataIN,counter);
    rst         <= '0' , '1' AFTER 400 NS , '0' AFTER 600 NS;
    clock       <= not clock AFTER 50 NS;
    loading     <= '0' , '1' AFTER 50 ns ,'0' AFTER 150 NS,'1' AFTER 800 NS;
    upCounter   <= '1' , '0' AFTER 500 NS,'1' AFTER 800 ns;
    dataIN      <= X"0" , X"A" AFTER 600 NS;  
END ARCHITECTURE;