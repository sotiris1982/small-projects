----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.07.2021 22:51:12
-- Design Name: 
-- Module Name: Comparator - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Comparator is
    Port ( A, B : in STD_LOGIC_VECTOR (3 downto 0);         
           greater_val : out STD_LOGIC_VECTOR (3 downto 0));
end Comparator;

architecture Behavioral of Comparator is

begin
process (A,B)
    begin
    if (unsigned(A) > unsigned(B)) then
        greater_val <= A;
    else
        greater_val <= B;
    end if;
    
end process;
end Behavioral;
