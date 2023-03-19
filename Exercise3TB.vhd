library ieee;
use ieee.std_logic_1164.all;

entity Exc3tb is
end Exc3tb;

architecture Behavioral of Exc3tb is
    signal shift_amt : std_logic_vector(1 downto 0) := (others => '0');
    signal a0, a1, a2, a3 : std_logic_vector(7 downto 0) := (others => '0');
    signal y : std_logic_vector(7 downto 0);
begin
    dut : entity work.Hw6Q5Mux
        port map(
            shift_amt => shift_amt,
            a0 => a0,
            a1 => a1,
            a2 => a2,
            a3 => a3,
            y => y
        );
    
    stim_proc : process
        begin
            a0 <= x"aa";
            a1 <= x"bb";
            a2 <= x"cc";
            a3 <= x"dd";
            shift_amt <= "11";
            wait for 10 ns;
            assert y = x"aa" report "Error" severity error;

            shift_amt <= "10";
            wait for 10 ns;
            assert y = x"bb" report "Error" severity error;

            shift_amt <= "01";
            wait for 10 ns;
            assert y = x"cc" report "Error" severity error;

            shift_amt <= "00";
            wait for 10 ns;
            assert y = x"dd" report "Error" severity error;
        end process;
end Behavioral;