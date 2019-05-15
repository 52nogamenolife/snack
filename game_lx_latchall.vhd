LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

entity game_lx_latchall is
	port(
		reset : in std_logic;
		clock : in std_logic;
		clk : in std_logic;
		size : in integer range 40 downto 4;
		newx : in integer range 63 downto 0;
		newy : in integer range 31 downto 0;
		x1out : inout integer range 63 downto 0;
		y1out : inout integer range 31 downto 0;
		xout : inout integer range 63 downto 0;
		yout : inout integer range 31 downto 0
		);
end game_lx_latchall;

architecture game_lx_latchall_ar of game_lx_latchall is
component game_lx_latch is
port(
	num : in integer range 5 downto -5;
	en: in std_logic;
	xvector : in integer range 63 downto 0;
	yvector : in integer range 31 downto 0;
	xout : out integer range 63 downto 0;
	yout : out integer range 31 downto 0
);
end component;
--signal x1out : integer range 63 downto 0;
--signal y1out : integer range 31 downto 0;
signal x2out : integer range 63 downto 0;
signal y2out : integer range 31 downto 0;
signal x3out : integer range 63 downto 0;
signal y3out : integer range 31 downto 0;
signal x4out : integer range 63 downto 0;
signal y4out : integer range 31 downto 0;
signal x5out : integer range 63 downto 0;
signal y5out : integer range 31 downto 0;
signal x6out : integer range 63 downto 0;
signal y6out : integer range 31 downto 0;
signal x7out : integer range 63 downto 0;
signal y7out : integer range 31 downto 0;
signal x8out : integer range 63 downto 0;
signal y8out : integer range 31 downto 0;
signal x9out : integer range 63 downto 0;
signal y9out : integer range 31 downto 0;
signal x10out : integer range 63 downto 0;
signal y10out : integer range 31 downto 0;
signal x11out : integer range 63 downto 0;
signal y11out : integer range 31 downto 0;
signal x12out : integer range 63 downto 0;
signal y12out : integer range 31 downto 0;
signal x13out : integer range 63 downto 0;
signal y13out : integer range 31 downto 0;
signal x14out : integer range 63 downto 0;
signal y14out : integer range 31 downto 0;
signal x15out : integer range 63 downto 0;
signal y15out : integer range 31 downto 0;
signal x16out : integer range 63 downto 0;
signal y16out : integer range 31 downto 0;
signal x17out : integer range 63 downto 0;
signal y17out : integer range 31 downto 0;
signal x18out : integer range 63 downto 0;
signal y18out : integer range 31 downto 0;
signal x19out : integer range 63 downto 0;
signal y19out : integer range 31 downto 0;
signal x20out : integer range 63 downto 0;
signal y20out : integer range 31 downto 0;
signal x21out : integer range 63 downto 0;
signal y21out : integer range 31 downto 0;
signal x22out : integer range 63 downto 0;
signal y22out : integer range 31 downto 0;
signal x23out : integer range 63 downto 0;
signal y23out : integer range 31 downto 0;
signal x24out : integer range 63 downto 0;
signal y24out : integer range 31 downto 0;
signal x25out : integer range 63 downto 0;
signal y25out : integer range 31 downto 0;
signal x26out : integer range 63 downto 0;
signal y26out : integer range 31 downto 0;
signal x27out : integer range 63 downto 0;
signal y27out : integer range 31 downto 0;
signal x28out : integer range 63 downto 0;
signal y28out : integer range 31 downto 0;
signal x29out : integer range 63 downto 0;
signal y29out : integer range 31 downto 0;
signal x30out : integer range 63 downto 0;
signal y30out : integer range 31 downto 0;
signal x31out : integer range 63 downto 0;
signal y31out : integer range 31 downto 0;
signal x32out : integer range 63 downto 0;
signal y32out : integer range 31 downto 0;
signal x33out : integer range 63 downto 0;
signal y33out : integer range 31 downto 0;
signal x34out : integer range 63 downto 0;
signal y34out : integer range 31 downto 0;
signal x35out : integer range 63 downto 0;
signal y35out : integer range 31 downto 0;
signal x36out : integer range 63 downto 0;
signal y36out : integer range 31 downto 0;
signal x37out : integer range 63 downto 0;
signal y37out : integer range 31 downto 0;
signal x38out : integer range 63 downto 0;
signal y38out : integer range 31 downto 0;
signal x39out : integer range 63 downto 0;
signal y39out : integer range 31 downto 0;
signal x40out : integer range 63 downto 0;
signal y40out : integer range 31 downto 0;
signal num : integer range 40 downto 0;
signal numtemp : integer range 40 downto 0;
signal reset_num1 : integer range 5 downto -5;
signal reset_num2 : integer range 5 downto -5;
signal reset_num3 : integer range 5 downto -5;
signal reset_num4 : integer range 5 downto -5;
begin
l1 : game_lx_latch port map(reset_num1,clock,newx,newy,x1out,y1out);
l2 : game_lx_latch port map(reset_num2,clock,x1out,y1out,x2out,y2out);
l3 : game_lx_latch port map(reset_num3,clock,x2out,y2out,x3out,y3out);
l4 : game_lx_latch port map(reset_num4,clock,x3out,y3out,x4out,y4out);
l5 : game_lx_latch port map(-1,clock,x4out,y4out,x5out,y5out);
l6 : game_lx_latch port map(-1,clock,x5out,y5out,x6out,y6out);
l7 : game_lx_latch port map(-1,clock,x6out,y6out,x7out,y7out);
l8 : game_lx_latch port map(-1,clock,x7out,y7out,x8out,y8out);
l9 : game_lx_latch port map(-1,clock,x8out,y8out,x9out,y9out);
l10 : game_lx_latch port map(-1,clock,x9out,y9out,x10out,y10out);
l11 : game_lx_latch port map(-1,clock,x10out,y10out,x11out,y11out);
l12 : game_lx_latch port map(-1,clock,x11out,y11out,x12out,y12out);
l13 : game_lx_latch port map(-1,clock,x12out,y12out,x13out,y13out);
l14 : game_lx_latch port map(-1,clock,x13out,y13out,x14out,y14out);
l15 : game_lx_latch port map(-1,clock,x14out,y14out,x15out,y15out);
l16 : game_lx_latch port map(-1,clock,x15out,y15out,x16out,y16out);
l17 : game_lx_latch port map(-1,clock,x16out,y16out,x17out,y17out);
l18 : game_lx_latch port map(-1,clock,x17out,y17out,x18out,y18out);
l19 : game_lx_latch port map(-1,clock,x18out,y18out,x19out,y19out);
l20 : game_lx_latch port map(-1,clock,x19out,y19out,x20out,y20out);
l21 : game_lx_latch port map(-1,clock,x20out,y20out,x21out,y21out);
l22 : game_lx_latch port map(-1,clock,x21out,y21out,x22out,y22out);
l23 : game_lx_latch port map(-1,clock,x22out,y22out,x23out,y23out);
l24 : game_lx_latch port map(-1,clock,x23out,y23out,x24out,y24out);
l25 : game_lx_latch port map(-1,clock,x24out,y24out,x25out,y25out);
l26 : game_lx_latch port map(-1,clock,x25out,y25out,x26out,y26out);
l27 : game_lx_latch port map(-1,clock,x26out,y26out,x27out,y27out);
l28 : game_lx_latch port map(-1,clock,x27out,y27out,x28out,y28out);
l29 : game_lx_latch port map(-1,clock,x28out,y28out,x29out,y29out);
l30 : game_lx_latch port map(-1,clock,x29out,y29out,x30out,y30out);
l31 : game_lx_latch port map(-1,clock,x30out,y30out,x31out,y31out);
l32 : game_lx_latch port map(-1,clock,x31out,y31out,x32out,y32out);
l33 : game_lx_latch port map(-1,clock,x32out,y32out,x33out,y33out);
l34 : game_lx_latch port map(-1,clock,x33out,y33out,x34out,y34out);
l35 : game_lx_latch port map(-1,clock,x34out,y34out,x35out,y35out);
l36 : game_lx_latch port map(-1,clock,x35out,y35out,x36out,y36out);
l37 : game_lx_latch port map(-1,clock,x36out,y36out,x37out,y37out);
l38 : game_lx_latch port map(-1,clock,x37out,y37out,x38out,y38out);
l39 : game_lx_latch port map(-1,clock,x38out,y38out,x39out,y39out);
l40 : game_lx_latch port map(-1,clock,x39out,y39out,x40out,y40out);
process(clock)
begin
if(clock'event and clock='1')then
num<=size;

if(reset='1')then 
	reset_num1<=2;
	reset_num2<=3;
	reset_num3<=4;
	reset_num4<=5;
	
	else
	reset_num1<=-1;
	reset_num2<=-1;
	reset_num3<=-1;
	reset_num4<=-1;
 

end if;

end if;
end process;
process(clk)
begin
if(clk'event and clk='1')then
if(num>0 and numtemp=0)then
numtemp<=num;
end if;

if numtemp>0 then
case numtemp is
when 1 =>
xout<=x1out;
yout<=y1out;
when 2 =>
xout<=x2out;
yout<=y2out;
when 3 =>
xout<=x3out;
yout<=y3out;
when 4 =>
xout<=x4out;
yout<=y4out;
when 5 =>
xout<=x5out;
yout<=y5out;
when 6 =>
xout<=x6out;
yout<=y6out;
when 7 =>
xout<=x7out;
yout<=y7out;
when 8 =>
xout<=x8out;
yout<=y8out;
when 9 =>
xout<=x9out;
yout<=y9out;
when 10 =>
xout<=x10out;
yout<=y10out;
when 11 =>
xout<=x11out;
yout<=y11out;
when 12 =>
xout<=x12out;
yout<=y12out;
when 13 =>
xout<=x13out;
yout<=y13out;
when 14 =>
xout<=x14out;
yout<=y14out;
when 15 =>
xout<=x15out;
yout<=y15out;
when 16 =>
xout<=x16out;
yout<=y16out;
when 17 =>
xout<=x17out;
yout<=y17out;
when 18 =>
xout<=x18out;
yout<=y18out;
when 19 =>
xout<=x19out;
yout<=y19out;
when 20 =>
xout<=x20out;
yout<=y20out;
when 21 =>
xout<=x21out;
yout<=y21out;
when 22 =>
xout<=x22out;
yout<=y22out;
when 23 =>
xout<=x23out;
yout<=y23out;
when 24 =>
xout<=x24out;
yout<=y24out;
when 25 =>
xout<=x25out;
yout<=y25out;
when 26 =>
xout<=x26out;
yout<=y26out;
when 27 =>
xout<=x27out;
yout<=y27out;
when 28 =>
xout<=x28out;
yout<=y28out;
when 29 =>
xout<=x29out;
yout<=y29out;
when 30 =>
xout<=x30out;
yout<=y30out;
when 31 =>
xout<=x31out;
yout<=y31out;
when 32 =>
xout<=x32out;
yout<=y32out;
when 33 =>
xout<=x33out;
yout<=y33out;
when 34 =>
xout<=x34out;
yout<=y34out;
when 35 =>
xout<=x35out;
yout<=y35out;
when 36 =>
xout<=x36out;
yout<=y36out;
when 37 =>
xout<=x37out;
yout<=y37out;
when 38 =>
xout<=x38out;
yout<=y38out;
when 39 =>
xout<=x39out;
yout<=y39out;
when 40 =>
xout<=x40out;
yout<=y40out;
when 0=>
xout<=xout;
yout<=yout;
end case;
numtemp<=numtemp-1;
end if;
end if;
end process;

end game_lx_latchall_ar;
