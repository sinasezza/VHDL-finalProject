LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_SIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;


ENTITY RandomNumberRegister_tb IS
END ENTITY;

ARCHITECTURE test of RandomNumberRegister_tb IS

COMPONENT RandomNumberRegister IS
    GENERIC (length : INTEGER := 8);
    PORT (  data_in     : IN  STD_LOGIC_VECTOR (length-1 DOWNTO 0);
            data_out    : OUT STD_LOGIC_VECTOR (length-1 DOWNTO 0);
            clk,rst     : IN  STD_LOGIC);
END COMPONENT;

SIGNAL  din         : STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL  clock,reset : STD_LOGIC := '0';
SIGNAL  dout        : STD_LOGIC_VECTOR (7 DOWNTO 0);

BEGIN
    register_uut : RandomNumberRegister GENERIC MAP(length => 8) PORT MAP(din,dout,clock,reset);
    
    clock <= NOT clock AFTER 50 NS;
    din <= X"22" , X"33" AFTER 200 NS , X"AA" AFTER 400 NS , X"10" AFTER 600 NS , X"55" AFTER 800 NS;
    reset <= '0' , '1' AFTER 200 NS , '0' AFTER 400 ns;

END ARCHITECTURE;