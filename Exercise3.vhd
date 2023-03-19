library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

entity Hw6Q5Mux is
    port (
        shift_amt: in std_logic_vector(1 downto 0);
        y: out std_logic_vector(7 downto 0);
        a0: in std_logic_vector(7 downto 0);
        a1: in std_logic_vector(7 downto 0);
        a2: in std_logic_vector(7 downto 0);
        a3: in std_logic_vector(7 downto 0)
    );
end Hw6Q5Mux;

architecture oh_behavior of Hw6Q5Mux is
    -- create an array of vectors to hold each of n shifters
    type shifty_array is array (3 downto 0) of std_logic_vector(7 downto 0);
    signal y_array: shifty_array := (x"F3", x"A2", x"51", x"00");
begin

    y_array(0) <= a0;
    y_array(1) <= a1;
    y_array(2) <= a2;
    y_array(3) <= a3;
    
    process(shift_amt, y_array) is begin
        case shift_amt is
            when "00" => y <= y_array(0);
            when "01" => y <= y_array(1);
            when "10" => y <= y_array(2);
            when "11" => y <= y_array(3);
            when others => y <= (others => '0');
        end case;
    end process;

end oh_behavior;
