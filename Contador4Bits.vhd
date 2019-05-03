library ieee;
use ieee.std_logic_1164.all;

entity contador4bits is
port(
	clk: in std_logic;
	Q: out std_logic_vector

);
end contador4Bits;

architecture archContador4Bits of Contador4Bits is

component FlipFlopD is
port(
	D: in std_logic;
	clk: in std_logic;
	Preset: in std_logic;
	Clear: in std_logic;
	Q: out std_logic
);

end component;

signal Q0, Q1, Q2, Q3, SClear: std_logic;
begin

	cont0: FlipFlopD port map (not(Q0), SClear,'1', clk, Q0);
	cont1: FlipFlopD port map (not(Q1), SClear,'1', Q0, Q1);
	cont2: FlipFlopD port map (not(Q2), SClear,'1', Q1, Q2);
	cont3: FlipFlopD port map (not(Q3), SClear,'1', Q2, Q3);
	
	Q(0) <= Q0;
	Q(1) <= Q1;
	Q(2) <= Q2;
	Q(3) <= Q3;
	
	SClear <= not(not (Q0) and Q1 and not (Q2) and (Q3));
	
end archContador4Bits;

