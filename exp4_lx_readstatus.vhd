LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

entity exp4_lx_readstatus is
port(
	counter : in std_logic_vector(1 downto 0);
	swro : in std_logic_vector(3 downto 0);
	status : out std_logic_vector(3 downto 0)
);
end exp4_lx_readstatus;

architecture exp4_lx_readstatus_ar of exp4_lx_readstatus is
begin
process(counter)
begin
status <= swro;

end process;
end exp4_lx_readstatus_ar;
