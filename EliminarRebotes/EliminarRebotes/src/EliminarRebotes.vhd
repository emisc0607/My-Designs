--Maestria en Ciencias (Mecatronica)
--Electronica Avanzada

--EliminarRebotes: Circuito eliminador de rebotes

--Declaracion de librerias
library ieee;
use ieee.std_logic_1164.all;

--Definir la entidad
entity EliminarRebotes is
	port (
	rst	: in	std_logic;
	clk : in	std_logic; 
	k	: in	std_logic_vector(3 downto 0);
	b	: in	std_logic;
	bf	: out	std_logic
		);
end EliminarRebotes;

--Definir arquitectura
architecture Union of EliminarRebotes is
--Temporizador
component Temporizador
	generic (n : integer := 8
	);

	port (
		rst	:	in	std_logic;
		clk	:	in	std_logic;
		k	:	in	std_logic_vector(n-1 downto 0);
		str	: 	in	std_logic;
		tout:	out std_logic
		);
end component;
--FSM
component FSM_Rebotes
	port (
	rst	: in	std_logic;
	clk : in	std_logic;
	b	: in	std_logic;
	e	: in	std_logic;
	bf	: out	std_logic;
	p	: out	std_logic
		);
end component;

signal p, e : std_logic;

begin
	--Instanciacion de los componentes
	tiempo: Temporizador generic map(4) port map(rst, clk, k, p, e);
	
	
	
	fsm:	FSM_Rebotes	 port map(rst, clk, b, e, bf, p);
end Union;