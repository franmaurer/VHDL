library ieee;
use ieee.std_logic_1164.all;

entity dff_async_tb is
end entity;

architecture tb of dff_async_tb is
    signal clk : std_logic := '0';
    signal rst : std_logic := '0';
    signal d : std_logic := '0';
    signal q : std_logic;
begin

    --DUT
    uut: entity work.dff_async
        port map(
            clk => clk,
            rst => rst,
            d => d,
            q => q
        );
    --Clock generation (10 ns)
    clk <= not clk after 5 ns;

    --Stimulus
    process
    begin
        rst <= '1'; d <= '0'; wait for 12 ns;
        rst <= '0'; d <= '1'; wait for 10 ns;
        d <= '0'; wait for 10 ns;
        rst <= '1'; wait for 7 ns;
        rst <= '0'; d <= '1'; wait for 10 ns;
        wait;
    end process;

end architecture tb;








