--Maestria en Ciencias (Mecatronica)
--Electronica Avanzada

--Contador Descendente

--Declaracion de librerias
library ieee;
use ieee.std_logic_1164.all;

--Definir la entidad		
entity Tristate_Buffer is
	generic(n: integer := 4
	);
	port (
		di	: in	std_logic_vector(n-1 downto 0);
		oe	: in	std_logic;						
		do	: out	std_logic_vector(n-1 downto 0);
		dio	: inout std_logic_vector(n-1 downto 0)
	);									  
	
end Tristate_Buffer;

--Definir arquitectura
architecture Tristate of Tristate_Buffer is
begin
	do <= dio;
	dio <= di when oe = '1' else (others => 'Z');
end Tristate;
