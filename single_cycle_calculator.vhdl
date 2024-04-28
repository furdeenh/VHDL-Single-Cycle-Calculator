library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity SingleCycleCalculator is
    Port (
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        instruction : in STD_LOGIC_VECTOR(7 downto 0);
        result : out STD_LOGIC_VECTOR(7 downto 0)
    );
end SingleCycleCalculator;

architecture Behavioral of SingleCycleCalculator is
    signal reg_write, alu_src, alu_op : STD_LOGIC_VECTOR(1 downto 0);
    signal wd, rs1, rs2, rd1, rd2 : STD_LOGIC_VECTOR(7 downto 0);

    component RegisterFile
        Port (
            clk : in STD_LOGIC;
            rs1, rs2, ws : in STD_LOGIC_VECTOR(1 downto 0);
            wd : in STD_LOGIC_VECTOR(7 downto 0);
            we : in STD_LOGIC;
            rd1, rd2 : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    component ALU
        Port (
            a, b : in STD_LOGIC_VECTOR(7 downto 0);
            op : in STD_LOGIC_VECTOR(1 downto 0);
            result : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    component Controller
        Port (
            opcode : in STD_LOGIC_VECTOR(1 downto 0);
            RegWrite, ALUSrc, ALUop : out STD_LOGIC_VECTOR(1 downto 0)
        );
    end component;

begin
    -- Register File instance
    reg_file : RegisterFile
        Port map (
            clk => clk,
            rs1 => rs1,
            rs2 => rs2,
            ws => instruction(3 downto 2),
            wd <= instruction,
            we => reg_write,
            rd1 => rd1,
            rd2 => rd2
        );

    -- ALU instance
    alu : ALU
        Port map (
            a => rd1,
            b => rd2,
            op => alu_op,
            result => result
        );

    -- Controller instance
    controller : Controller
        Port map (
            opcode => instruction(7 downto 6),
            RegWrite <= reg_write,
            ALUSrc <= alu_src,
            ALUop <= alu_op
        );

    -- Additional signal assignments
    rs1 <= instruction(5 downto 4);
    rs2 <= instruction(1 downto 0);

end Behavioral;

