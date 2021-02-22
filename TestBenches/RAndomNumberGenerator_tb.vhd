library ieee;
use ieee.std_logic_1164.all;


ENTITY random_generator_tb IS
END ENTITY;


ARCHITECTURE test of random_generator_tb IS

COMPONENT linear is
    GENERIC (length : INTEGER := 8);
    PORT (  active  : IN STD_LOGIC; 
            clk     : IN STD_LOGIC; 
            Rset    : IN STD_LOGIC;
            c_out   : OUT STD_LOGIC_VECTOR (length-1 DOWNTO 0));
end COMPONENT;

SIGNAL enable,clock,reset   : STD_LOGIC := '0';
SIGNAL num                  : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');

BEGIN 
    stage: linear GENERIC MAP(length => 8) PORT MAP (enable,clock,reset,num);
    clock   <= NOT clock AFTER 50 NS;
    enable  <= '1' , '0' AFTER 200 NS , '1' after 400 ns;
    reset   <= '0' , '1' AFTER 200 NS , '0' after 400 ns;
END ARCHITECTURE;