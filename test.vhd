LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

entity test is

port(
clk : in std_logic;
numtemp : inout integer range 40 downto 0;
		reset : in std_logic;
		reset_latch : in std_logic;
		size : in integer range 40 downto 4;
clock : inout std_logic;
	newx : in integer range 63 downto 0;
		newy : in integer range 31 downto 0;
		x1out : inout integer range 63 downto 0;
		y1out : inout integer range 31 downto 0;
		x2out : inout integer range 63 downto 0;
		y2out : inout integer range 31 downto 0;
		x3out : inout integer range 63 downto 0;
		y3out : inout integer range 31 downto 0;
		x4out : inout integer range 63 downto 0;
		y4out : inout integer range 31 downto 0;
		x5out : inout integer range 63 downto 0;
		y5out : inout integer range 31 downto 0;
		xout : inout integer range 63 downto 0;
		yout : inout integer range 31 downto 0
	
);
end test;
architecture test_ar of test is
component exp4_lx_clock is
	port(
		clk : in std_logic;
		reset : in std_logic;
		size : in integer range 40 downto 4;
		clock : out std_logic
	);
end component;
component game_lx_latchall is
	port(
		numtemp : inout integer range 40 downto 0;
		reset : in std_logic;
		clock : in std_logic;
		clk : in std_logic;
		size : in integer range 40 downto 4;
		newx : in integer range 63 downto 0;
		newy : in integer range 31 downto 0;
		x1out : inout integer range 63 downto 0;
		y1out : inout integer range 31 downto 0;
		x2out : inout integer range 63 downto 0;
		y2out : inout integer range 31 downto 0;
		x3out : inout integer range 63 downto 0;
		y3out : inout integer range 31 downto 0;
		x4out : inout integer range 63 downto 0;
		y4out : inout integer range 31 downto 0;
		x5out : inout integer range 63 downto 0;
		y5out : inout integer range 31 downto 0;
		xout : inout integer range 63 downto 0;
		yout : inout integer range 31 downto 0
		);
end component;
begin
u1 : exp4_lx_clock port map(clk,reset,size,clock);
u : game_lx_latchall port map(numtemp,reset_latch,clock,clk,size,newx,newy,x1out,y1out,x2out,y2out,x3out,y3out,x4out,y4out,x5out,y5out,xout,yout);
end test_ar;