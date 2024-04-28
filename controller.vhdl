library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Controller is
    Port (
        opcode : in STD_LOGIC_VECTOR(1 downto 0);
        RegWrite, ALUSrc, ALUop : out STD_LOGIC_VECTOR(1 downto 0)
    );
end Controller;

architecture Behavioral of Controller is
begin
    process(opcode)
    begin
        case opcode is
            when "00" => -- ADD
                RegWrite <= '1';
                ALUSrc <= '0';
                ALUop <= "00"; -- ADD
            when "01" => -- SUBTRACT
                RegWrite <= '1';
                ALUSrc <= '0';
                ALUop <= "01"; -- SUBTRACT
            when "10" => -- PRINT
                RegWrite <= '0';
                ALUSrc <= '1';
                ALUop <= "10"; -- PRINT
            when "11" => -- LOAD
                RegWrite <= '1';
                ALUop <= "11"; -- LOAD
            when others =>
                RegWrite <= '0'; -- Undefined
        end case;
    end process;
end Behavioral;

