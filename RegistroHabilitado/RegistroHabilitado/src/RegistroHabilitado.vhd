--Maestria en Ciencias (Mecatronica)
--Electronica Avanzada

--Registro Habilitado

--Declaracion de librerias
library ieee;
use ieee.std_logic_1164.all;

--Definir la entidad
entity RegistroHabilitado is  
	generic (
		n : integer := 8
		);	
	port (
	rst : in	std_logic;
	clk : in	std_logic;
	ldr : in	std_logic;
	di	: in	std_logic_vector(n-1 downto 0);
	do	: out	std_logic_vector(n-1 downto 0)
	);									  
end RegistroHabilitado;					  

--Definicion de la arquitectura
architecture registro of RegistroHabilitado is
begin

	do <= (others => '0') when rst = '1' else di when rising_edge(clk) and ldr ='1';
		
end registro;
