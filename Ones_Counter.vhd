----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.07.2021 22:52:36
-- Design Name: 
-- Module Name: Ones_Counter - Behavioral
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

entity Ones_Counter is
    Port ( d_in : in STD_LOGIC_VECTOR (3 downto 0);
           ones_val : out STD_LOGIC_VECTOR (2 downto 0));
end Ones_Counter;  

architecture Behavioral of Ones_Counter is
begin
    process(d_in)
    variable count: unsigned(2 downto 0); -- using variable because it updates emediately and not at the end of the process like signals.
    begin
        count := "000";
        for i in 0 to 3 loop
            if (d_in(i) = '1') then
                count:= count + 1;
            end if; 
        end loop;
        ones_val <=  STD_LOGIC_VECTOR(count);
     end process;
end Behavioral;
