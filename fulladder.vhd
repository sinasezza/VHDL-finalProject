LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;


ENTITY fulladder IS
    PORT (bit1 ,bit2,carryin : IN STD_LOGIC;
            sum,carryout    : OUT STD_LOGIC);
END fulladder;


ARCHITECTURE fulladder_architecture OF fulladder IS
BEGIN
    sum         <= bit1 XOR bit2 XOR carryin;
    carryout    <= (bit1 AND bit2) OR (bit1 AND carryin) OR (bit2 AND carryin);
END fulladder_architecture;
