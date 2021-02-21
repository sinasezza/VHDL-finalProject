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

ENTITY Reg_test IS
END ENTITY;


ARCHITECTURE Reg_test_tb of Reg_test IS
------------------------------------DECLARATION BEGIN
COMPONENT register_nbit IS 
    GENERIC(length : NATURAL := 8);
    PORT (  data_in     :   IN  STD_LOGIC_VECTOR(length-1 DOWNTO 0);
            data_out    :   BUFFER STD_LOGIC_VECTOR(length-1 DOWNTO 0);
            Notdata_out :   OUT STD_LOGIC_VECTOR(length-1 DOWNTO 0);
            clk,rst     :   IN  STD_LOGIC);
END COMPONENT;

SIGNAL din,dout,NOT_dout    :   STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL clock , reset        :   STD_LOGIC := '0';
--------------------------------------END DECLARATION
BEGIN
    RegStage : register_nbit PORT MAP (din,dout,NOT_dout,clock,reset);
    clock <= NOT clock AFTER 100 NS;
    din   <= X"22" , X"33" AFTER 200 ns , X"11" AFTER 400 NS , X"10" AFTER 600 ns , X"AA" AFTER 800 ns;
    reset <= '0' , '1' AFTER 100 NS , '0' AFTER 200 NS , '1' AFTER 300 ns , '0' AFTER 400 ns;

END ARCHITECTURE;