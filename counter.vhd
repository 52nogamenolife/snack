LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

entity counter is
	port(
		clock_f : in std_logic;
		clock_s : out std_logic;
		counter_out : out std_logic_vector(1 downto 0)
	);
end counter;

architecture counter_ar of counter is
begin
process(clock_f)
variable temp : integer range 3 downto 0:=0;
begin
if(clock_f'event and clock_f ='1')then
	if temp=3 then
	temp:=0;
	else
	temp:=temp+1;
	end if;

case temp is 
	when 0=>
	counter_out<="00";
	clock_s<='0';
	when 1=>
	counter_out<="01";
	clock_s<='0';
	when 2=>
	counter_out<="10";
	clock_s<='0';
	when 3=>
	counter_out<="11";
	clock_s<='1';
	when others=>
	counter_out<="11";
end case;
end if;
end process;
end counter_ar;