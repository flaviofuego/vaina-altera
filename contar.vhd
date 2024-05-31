library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity contar is
    Port ( clk  : in  STD_LOGIC;
           reset: in  STD_LOGIC;
           q    : out STD_LOGIC_VECTOR(3 downto 0) );
end contar;

architecture Behavioral of contar is
    signal count: STD_LOGIC_VECTOR(3 downto 0) := "0000";
begin
    process(clk, reset)
    begin
        if reset = '1' then
            count <= "0000";
        elsif rising_edge(clk) then
            if count = "1111" then
                count <= "0000";
            else
                count <= count + 1;
            end if;
        end if;
    end process;

    q <= count;
end Behavioral;