library ieee;
use ieee.std_logic_1164.all;

entity contador4bitsFFJK is
port(
	clk: in std_logic;
	Q: out std_logic_vector(3 downto 0)

);
end contador4BitsFFJK;

architecture archContador4BitsFFJK of Contador4BitsFFJK is

signal signalQ: std_logic_vector(3 downto 0);
signal sClear: std_logic;

component FlipFlopJK is
port (
	J,K: in std_logic;
	clk: in std_logic;
	Preset: in std_logic;
	Clear: in std_logic;
	Q, Qbar: out std_logic

);
end component;

begin

	cont0: FlipFlopJK port map ('0', '0', clk, '1', sClear, signalQ(0));
	cont1: FlipFlopJK port map ('0', '0', signalQ(0), '1', sClear, signalQ(1));
	cont2: FlipFlopJK port map ('0', '0', signalQ(1), '1', sClear, signalQ(2));
	cont3: FlipFlopJK port map ('0', '0', signalQ(2), '1', sClear, signalQ(3));
	
	Q <= signalQ;
	
	sClear <= not(signalQ(0) and not(signalQ(1)) and signalQ(2) and signalQ(3));
	
	
end archContador4BitsFFJK;

