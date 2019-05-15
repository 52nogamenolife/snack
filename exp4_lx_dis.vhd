LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

entity exp4_lx_dis is
port(
	clock : in std_logic;
	counter : in std_logic_vector(1 downto 0);
	status : in std_logic_vector(3 downto 0);
	direction : out std_logic_vector(3 downto 0)
);
end exp4_lx_dis;

architecture exp4_lx_dis_ar of exp4_lx_dis is
signal temp : std_logic_vector(3 downto 0);
begin
process(clock)
begin
if(clock'event and clock='1')then
case counter is
when "01" =>
	if status(1)='0' then
		temp <= "0100";--左
	else temp<=temp;
	end if;
when "10" =>
	if status(0)= '0' then
	temp <= "0010";--上
	elsif status(2)='0' then
		temp <= "1000";--下
	else temp<=temp;
	end if;
when "11" =>
	if status(1)='0' then
		temp <= "0110";--右
	else temp<=temp;
	end if;
	when others =>
	temp<=temp;
end case;
direction<=temp;
end if;
end process;
end exp4_lx_dis_ar;
