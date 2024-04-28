library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;  -- Modern library for numeric operations

entity Testbench is
end Testbench;

architecture Behavioral of Testbench is
    -- Signal declarations
    signal clk : STD_LOGIC := '0';  -- Clock signal
    signal reset : STD_LOGIC := '0';  -- Reset signal
    signal instruction : STD_LOGIC_VECTOR(7 downto 0);  -- Instruction signal
    signal result : STD_LOGIC_VECTOR(7 downto 0);  -- Result signal
    
    -- Single-Cycle Calculator Component
    component SingleCycleCalculator
        Port (
            clk : in STD_LOGIC,
            reset : in STD_LOGIC,
            instruction : in STD_LOGIC_VECTOR(7 downto 0),
            result : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;
    
begin
    -- Instantiate the Single-Cycle Calculator
    UUT: SingleCycleCalculator
        Port map (
            clk => clk,
            reset => reset,
            instruction => instruction,
            result => result
        );
    
    -- Clock generation process
    clk_process: process
    begin
        while True loop
            clk <= '0';  -- Low state
            wait for 10 ns;  -- Half cycle
            clk <= '1';  -- High state
            wait for 10 ns;  -- Half cycle
        end loop;
    end process;
    
    -- Stimulus process for test cases
    process
    begin
        -- Apply reset signal
        reset <= '1';
        wait for 20 ns;
        reset <= '0';
        
        -- Test ADD instruction
        instruction <= "00000000";  -- ADD instruction
        wait for 20 ns;  -- Wait for response
        
        -- Test SUB instruction
        instruction <= "01010001";  -- SUB instruction
        wait for 20 ns;
        
        -- Test LOAD instruction
        instruction <= "11000000";  -- LOAD instruction
        wait for 20 ns;
        
        -- Test PRINT instruction
        instruction <= "10000000";  -- PRINT instruction
        wait for 20 ns;
        
        -- Keep the simulation running
        wait;
    end process;
    
end Behavioral;

