library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RegisterFile is
    Port (
        clk : in STD_LOGIC;
        rs1, rs2, ws : in STD_LOGIC_VECTOR(1 downto 0);
        wd : in STD_LOGIC_VECTOR(7 downto 0);
        we : in STD_LOGIC;
        rd1, rd2 : out STD_LOGIC_VECTOR(7 downto 0)
    );
end RegisterFile;

architecture Behavioral of RegisterFile is
    type reg_array is array (0 to 3) of STD_LOGIC_VECTOR(7 downto 0);
    signal registers : reg_array := (others => (others => '0'));
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if we = '1' then
                registers(to_integer(unsigned(ws))) <= wd;
            end if;
        end if;
    end process;

    rd1 <= registers(to_integer(unsigned(rs1)));
    rd2 <= registers(to_integer(unsigned(rs2)));
end Behavioral;

