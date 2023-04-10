--Maestria en Ciencias (Mecatronica)
--Electronica Avanzada

--FSM_Rebotes

--Declaracion de librerias
library ieee;
use ieee.std_logic_1164.all;

--Definir la entidad
entity FSM_DAC is
		port (
	wr		: in	std_logic;
	rst		: in	std_logic;
	clk 	: in	std_logic;
	z		: in	std_logic; 
	rdy		: out	std_logic;
	sclk	: out	std_logic;
	sync	: out	std_logic;
	opc 	: out	std_logic_vector(1 downto 0)
		);
end FSM_DAC; 
--Definir arquitectura
architecture Estados of FSM_DAC is
signal qn, qp: std_logic_vector(1 downto 0);
begin
	machine:process(z, wr, qp)
	begin
		
	end process machine;
	qp <= (others => '0') when rst = '1' else qn when rising_edge(clk);
end Estados;
