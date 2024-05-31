library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity reloj is
    Port ( clk      : in  STD_LOGIC;
           reset    : in  STD_LOGIC;
           clk_out  : out STD_LOGIC );
end reloj;

architecture Behavioral of reloj is
    constant DIVISOR : integer := 50_000_000; -- Adjust based on input clock frequency
    signal count     : integer := 0;
    signal clk_reg   : STD_LOGIC := '0';
begin
    process(clk, reset)
    begin
        if reset = '1' then
            count <= 0;
            clk_reg <= '0';
        elsif rising_edge(clk) then
            if count = DIVISOR/2 - 1 then
                clk_reg <= not clk_reg;
                count <= 0;
            else
                count <= count + 1;
            end if;
        end if;
    end process;

    clk_out <= clk_reg;
end Behavioral;