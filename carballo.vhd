library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity carballo is
    Port ( clk       : in  STD_LOGIC;
           reset     : in  STD_LOGIC;
           seg1      : out STD_LOGIC_VECTOR(6 downto 0);
           seg2      : out STD_LOGIC_VECTOR(6 downto 0);
           an        : out STD_LOGIC_VECTOR(1 downto 0) ); -- For multiplexing 7-segment displays
end carballo;

architecture Behavioral of carballo is
    signal clk_div  : STD_LOGIC;
    signal counter  : STD_LOGIC_VECTOR(3 downto 0);
    signal bcd1     : STD_LOGIC_VECTOR(3 downto 0);
    signal bcd2     : STD_LOGIC_VECTOR(3 downto 0);
    signal seg_temp : STD_LOGIC_VECTOR(6 downto 0);
begin

    -- Instantiate Frequency Divider
    reloj: entity work.reloj
    port map (
        clk   => clk,
        reset => reset,
        clk_out => clk_div
    );

    -- Instantiate 4-bit Counter
    contar: entity work.contar
    port map (
        clk   => clk_div,
        reset => reset,
        q     => counter
    );

    -- BCD Conversion
    process(counter)
    begin
        bcd1 <= std_logic_vector(to_unsigned(to_integer(unsigned(counter)) mod 10, bcd1'length));
        bcd2 <= std_logic_vector(to_unsigned(to_integer(unsigned(counter)) / 10, bcd2'length));
    end process;
    -- Instantiate 7-segment Display Driver for BCD1
    bcd1_inst: entity work.bcd
    port map (
        bcd  => bcd1,
        seg  => seg1
    );

    -- Instantiate 7-segment Display Driver for BCD2
    bcd2_inst: entity work.bcd
    port map (
        bcd  => bcd2,
        seg  => seg2
    );

    -- Enable the appropriate display (assuming common anode)
    an <= "01"; -- Display selection logic (this needs to be expanded for multiplexing)
end Behavioral;