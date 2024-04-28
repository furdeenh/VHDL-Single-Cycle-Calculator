library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU is
    Port (
        a, b : in STD_LOGIC_VECTOR(7 downto 0);
        op : in STD_LOGIC_VECTOR(1 downto 0);
        result : out STD_LOGIC_VECTOR(7 downto 0)
    );
end ALU;

architecture Behavioral of ALU is
begin
    process(a, b, op)
    begin
        case op is
            when "00" => -- Add
                result <= a + b;
            when "01" => -- Subtract
                result <= a - b;
            when "10" => -- No Operation
                result <= (others => '0');
            when "11" => -- Load
                result <= b;
            when others =>
                result <= (others => 'X'); -- Undefined operation
        end case;
    end process;
end Behavioral;

