LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

entity game_lx_next is
	port(
		clock_f : in std_logic;
		clock_s : in std_logic;
		direction : in std_logic_vector(3 downto 0);
		hit : out std_logic;
		sizein : in integer range 40 downto 4;
		sizeout : out integer range 40 downto 4;
		x : in integer range 63 downto 0;
		y : in integer range 31 downto 0;
		applex : in integer range 63 downto 0;
		appley : in integer range 31 downto 0;
		win : out std_logic;
		newx : out integer range 63 downto 0;
		newy : out integer range 31 downto 0
	);
end game_lx_next;

architecture game_lx_next_ar of game_lx_next is
signal tempx : integer range 63 downto -1;
signal num : integer range 3 downto 0:=0;
signal tempy : integer range 31 downto -1;
signal tempdirection : std_logic_vector(3 downto 0);
signal tempsize : integer range 41 downto 4;
begin
process(clock_s)

begin
	IF(clock_s'event and clock_s='1')then
	tempsize<=sizein;
	case direction is
	when "0100"=>
	tempy<=y;
	if x=0 then
	tempx<=63;
	else
	tempx<=x-1;
	end if;
	
	tempdirection<=direction;
	when "0010"=>
	tempx<=x;
	if y=0 then
	tempy<=31;
	else
	tempy<=y-1;
	end if;
	tempdirection<=direction;
	when "1000"=>
	tempx<=x;
	if y=31 then
	tempy<=0;
	else
	tempy<=y+1;
	end if;
	tempdirection<=direction;

	when "0110"=>
	if x=63 then
	tempx<=0;
	else
	tempx<=x+1;
	end if;
	tempy<=y;
	tempdirection<=direction;
	when others=>
		case tempdirection is
		when "0100"=>
	tempy<=y;
	if x=0 then
	tempx<=63;
	else
	tempx<=x-1;
	end if;
	

	when "0010"=>
	tempx<=x;
	if y=0 then
	tempy<=31;
	else
	tempy<=y-1;
	end if;

	when "1000"=>
	tempx<=x;
	if y=31 then
	tempy<=0;
	else
	tempy<=y+1;
	end if;


	when "0110"=>
	if x=63 then
	tempx<=0;
	else
	tempx<=x+1;
	end if;
	tempy<=y;
	when others=>
	tempx<=x;
	tempy<=y;
		end case;
	end case;
	if(tempx=applex and tempy=appley)then
	if(tempsize<41)then
	tempsize<=tempsize+1;
	end if;
	hit<='1';
	case direction is
	when "0100"=>
	tempx<=x-1;
	tempy<=y;
	when "0010"=>
	tempx<=x;
	tempy<=y-1;
	when "1000"=>
	tempx<=x;
	tempy<=y+1;
	when "0110"=>
	tempx<=x+1;
	tempy<=y;
	when others=>
		case tempdirection is
		when "0100"=>
		tempx<=x-1;
		tempy<=y;
		when "0010"=>
		tempx<=x;
		tempy<=y-1;
		when "1000"=>
		tempx<=x;
		tempy<=y+1;
		when "0110"=>
		tempx<=x+1;
		tempy<=y;
		when others=>
		tempx<=x;
		tempy<=y;
		end case;
	end case;
	else hit<='0';
	end if;
		end if;
end process;
process(clock_f)
begin
if(clock_f'event and clock_f='1')then 
	if(num=3)then
	num<=0;
	else
	num<=num+1;
	end if;
	if(num=2)then
	if(tempsize<41)then
	sizeout<=tempsize;
	win<='0';
	else 
	win<='1';
	end if;
	newx<=tempx;
	newy<=tempy;
	end if;
	end if;
end process;
end game_lx_next_ar;
