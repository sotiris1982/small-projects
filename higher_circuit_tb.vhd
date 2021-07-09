----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.07.2021 22:58:18
-- Design Name: 
-- Module Name: higher_circuit_tb - Behavioral
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
use STD.ENV.ALL;

entity higher_circuit_tb is
   
end higher_circuit_tb;

architecture Behavioral of higher_circuit_tb is

component higher_circuit
 Port (   A       : in STD_LOGIC_VECTOR (3 downto 0);
          B       : in STD_LOGIC_VECTOR (3 downto 0);
          C       : in STD_LOGIC_VECTOR (3 downto 0);
          D       : in STD_LOGIC_VECTOR (3 downto 0);
          CLK     : in STD_LOGIC;
          RESET   : in STD_LOGIC;
          GREATER : out STD_LOGIC_VECTOR (3 downto 0);
          ONES    : out STD_LOGIC_VECTOR (2 downto 0));
 end component;
 
 signal A            : STD_LOGIC_VECTOR(3 downto 0);
 signal B            : STD_LOGIC_VECTOR(3 downto 0);
 signal C            : STD_LOGIC_VECTOR(3 downto 0);
 signal D            : STD_LOGIC_VECTOR(3 downto 0);
 signal CLK          : STD_LOGIC := '0';
 signal RESET        : STD_LOGIC;
 signal GREATER      : STD_LOGIC_VECTOR(3 downto 0);
 signal ONES         : STD_LOGIC_VECTOR(2 downto 0);
 constant CLK_period : time := 10 ns;

begin
-- UUT Instantition
uut : higher_circuit
        port map (
            A => A,
            B => B,
            C => C,
            D => D,
            CLK => CLK,
            RESET => RESET,
            GREATER => GREATER,
            ONES => ONES );

CLK_process : process 
    begin 
        CLK <= '0';
        wait for CLK_period/2;
        CLK <= '1';
        wait for CLK_period/2;
    end process;
    
 stimulus_process : process
    begin 
        RESET <= '1'; A <= "0000"; B<="0001"; C <= "0111"; D <= "0110";
        wait for 10 * CLK_period;
        RESET <= '0'; A <= "0001"; B<="0010"; C <= "0011"; D <= "0100";
        wait for 10 * CLK_period;
        RESET <= '0'; A <= "1101"; B<="1110"; C <= "1111"; D <= "1001";
        wait for 10 * CLK_period;
        RESET <= '0'; A <= "0101"; B<="0111"; C <= "1000"; D <= "0011";
        wait for 10 * CLK_period;
        RESET <= '0'; A <= "0100"; B<="0101"; C <= "0111"; D <= "1111";
        wait for 10 * CLK_period;
       -- RESET <= '0'; A <= "0000"; B<="0001"; C <= "0011"; D <= "0100";
       -- wait for 10 * CLK_period;
       -- RESET <= '0'; A <= "0000"; B<="0001"; C <= "0011"; D <= "0100";
       --wait for 10 * CLK_period;
       --RESET <= '0'; A <= "0000"; B<="0001"; C <= "0011"; D <= "0100";
        
    stop(2);
    end process;    
end Behavioral;
