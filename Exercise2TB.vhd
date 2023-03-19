library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity Hw7Q1FSMSolnTB is
end Hw7Q1FSMSolnTB;

architecture tb of Hw7Q1FSMSolnTB is
signal clk, rst: std_logic := '0';
signal w: std_logic_vector (1 downto 0) := (others => '0');
signal z, Idle: std_logic;
constant clk_period: time := 10 ns;
signal state_cnt: integer := 0;
begin
dut: entity work.Hw7Q1FSMSoln
port map (clk => clk, rst => rst, w => w,
z => z, Idle => Idle);

clk <= not clk after clk_period/2;

stimuli: process is begin
rst <= '1';
wait for clk_period;
wait until clk = '0';
rst <= '0';

w <= "11";
wait for clk_period;
assert z = '0' report "w same 1 time, z should be 0";

-- complete. leaving w bits the same for 2 more clk periods
-- check z = 0 after each period
w <=
wait for clk_period;
assert
w <=
wait for clk_period;
assert

w <= "11";
wait for clk_period;
assert z = '1' report "w same 4 times, z should be 1";

-- complete. making w bits different
-- check Idle is 1
w <=
wait for clk_period;
assert

wait;
end process;

end tb;
