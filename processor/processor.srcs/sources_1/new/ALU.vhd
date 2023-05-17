----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.05.2023 10:18:50
-- Design Name: 
-- Module Name: ALU - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIgned.all;
use ieee.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           N : out STD_LOGIC;
           O : out STD_LOGIC;
           Z : out STD_LOGIC;
           C : out STD_LOGIC;
           S : out STD_LOGIC_VECTOR (7 downto 0);
           Ctrl_Alu : in STD_LOGIC_VECTOR (2 downto 0));
end ALU;

architecture Behavioral of ALU is
    
    signal Aux1 : STD_LOGIC_VECTOR (15 downto 0) := (others => '0'); --signal aux pour MUL
    signal Aux2 : STD_LOGIC_VECTOR (8 downto 0) := (others => '0'); --signal aux pour ADD
    signal Aux3 : STD_LOGIC_VECTOR (7 downto 0) := (others => '0'); --signal aux pour SUB
    signal S_inter : STD_LOGIC_VECTOR (7 downto 0) := (others => '0'); --signal aux pour testSortie
  begin
  
  S <= S_inter;
  with S_inter select 
    Z <= '1' when "00000000",
    '0' when others; 
     

  process (A,B,Ctrl_Alu,Aux1, Aux2, Aux3)     
   
    begin
    
        if (Ctrl_Alu="001") then --ADD
            Aux2 <=(('0' & A) + ('0' & B));
            C <= Aux2 (8);
            S_inter <= Aux2 (7 downto 0);
            --for warnings
            Aux1<= "0000000000000000";
            Aux3 <= "00000000";
            O <= '0';
            N <= '0';
        elsif (Ctrl_Alu="010") then --MUL
        --for warnings
            Aux2 <= "000000000";
            N <= '0';
            C <= '0';
            O <= '0';
            Aux3 <= "00000000";
            --actual code
            Aux1 <=(A * B);
            if (Aux1 > "0000000011111111") then
                O <= '1'; -- overflow
            end if;
            S_inter <= Aux1 (7 downto 0);
        elsif (Ctrl_Alu="011") then --SUB
            Aux3 <=(A - B);
            S_inter <= Aux3 (7 downto 0);
            N <= Aux3 (7);
            --for warnings
            Aux1<= "0000000000000000";
            O <= '0';
            Aux2 <= "000000000";
            C <= '0';
--            if (A < B) then
--                --Aux3 <= (B-A);
--                N <= '1';
--                --S_inter <= Aux3 (7 downto 0);
--            end if;

        end if;
end process;
        
end Behavioral;
