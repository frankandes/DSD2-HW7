library ieee;
use ieee.std_logic_1164.all;

entity Hw7Q1FSM is port (
    clk , rst : in std_logic;
    w : in std_logic vector (1 downto 0);
    z , InIdle: out std_logic);
end entity Hw7Q1FSM;

architecture obehavior of Hw7Q1FSM is
    type state_type is (idle, s1, s2, s3, s4);
    signal state, next_state: state_type;
begin

state_proc: process (clk) is begin
    if rising_edge (clk) then
        if rst = '1' then
            state <= idle;
        else
            state <= next_state;
        end if;
    end if;
end process;

next_state_proc: process (state, w) is begin
    case state is
        when idle => if (w(0) = w(1)) then
                        next_state <= s1;
                     else
                        next_state <= idle;
        when s1 =>   if (w(0) = w(1)) then
                        next_state <= s2;
                     else
                        next_state <= idle;
        when s2 =>   if (w(0) = w(1)) then
                        next_state <= s3;
                     else
                        next_state <= idle;
        when s3 =>   if (w(0) = w(1)) then
                        next_state <= s4;
                     else
                        next_state <= idle;
        when s4 =>   if (w(0) = w(1)) then
                        next_state <= s4;
                     else
                        next_state <= idle;
    end case;
end process;

InIdle_proc: process (clk) is begin
    if rising_edge (clk) then
        case next_state is
            when idle => InIdle <= '1';
            when others => InIdle <= '0';
        end case;
    end if;
end process;

z_proc: process (clk) is begin
    if rising_edge (clk) then
        case next_state is
            when s4 => z <= '1';
            when others => z <= '0';
        end case;
    end if;
end process;

end obehavior;
