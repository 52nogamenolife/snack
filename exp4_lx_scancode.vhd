LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

entity exp4_lx_scancode IS
port(
	counter : in std_logic_vector(1 downto 0);
	scancode : out std_logic_vector(3 downto 0)
);
end exp4_lx_scancode;

architecture exp4_lx_scancode_ar of exp4_lx_scancode is
begin
process(counter)
begin
case counter is
when "00" =>
scancode <= "1110";
when "01" =>
scancode <= "1101";
when "10" =>
scancode <= "1011";
when "11" =>
scancode <= "0111";
when others =>
scancode <= "1111";
end case;
end process;
end exp4_lx_scancode_ar;