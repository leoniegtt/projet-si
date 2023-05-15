----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.05.2023 13:10:19
-- Design Name: 
-- Module Name: test_ALU - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test_ALU is

end test_ALU;

architecture Behavioral of test_ALU is
COMPONENT ALU 


     Port (A : in STD_LOGIC_VECTOR (7 downto 0);
          B : in STD_LOGIC_VECTOR (7 downto 0);
          N : out STD_LOGIC;
          O : out STD_LOGIC;
          Z : out STD_LOGIC;
          C : out STD_LOGIC;
          S : out STD_LOGIC_VECTOR (7 downto 0);
          Ctrl_Alu : in STD_LOGIC_VECTOR (2 downto 0)); 
          
  end COMPONENT;
            SIGNAL A_test : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
            SIGNAL B_test : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
            SIGNAL N_test : std_logic :='0';
            SIGNAL O_test : std_logic :='0';
            SIGNAL Z_test : std_logic :='0';
            SIGNAL C_test : std_logic :='0';
            SIGNAL S_test : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
            SIGNAL Ctrl_Alu_test : STD_LOGIC_VECTOR (2 downto 0) := (others => '0');
begin
ALUtest : ALU PORT MAP (
            A => A_test,
            B => B_test,
            N => N_test,
            O => O_test,
            Z => Z_test,
            C => C_test,
            S => S_test,
            Ctrl_Alu => Ctrl_Alu_test);
--test add
--A_test <= "10000000";
--B_test <= "10000000";
--Ctrl_Alu_test <= "001";

--test sub S=0
--A_test <= "00010000";
--B_test <= "00010000";
--Ctrl_Alu_test <= "011";

--test sub S<0
A_test <= "00000100";
B_test <= "00010000";
Ctrl_Alu_test <= "011";

----test mul
--A_test <= "10000000";
--B_test <= "10000000";
--Ctrl_Alu_test <= "010";
----test mul
--A_test <= "11111111";
--B_test <= "11111111";
--Ctrl_Alu_test <= "010";


end Behavioral;