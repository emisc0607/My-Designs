--Maestria en Ciencias (Mecatronica)
--Electronica Avanzada

--Temporizador_libre

--Declaracion de librerias
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--Definir la entidad
entity Temporizador_libre is
	generic (n : integer := 8
	);

	port (
		rst	:	in	std_logic;
		clk	:	in	std_logic;
		k	:	in  std_logic_vector(n-1 downto 0);
		tout:	out std_logic
		);
end Temporizador_libre;

--Definir arquitectura
architecture Libre of Temporizador_libre is
signal qn, qp: std_logic_vector(n-1 downto 0);
begin
	
		--  qp = k	|  qn
		------------|-----
		--	   0    |  qp+1  	count
		--	   1    |  0  		clear
	--Multiplexor
	Mux:process(qp, k) 
	begin  
		if qp = k then
			qn <= (others => '0');
			tout <= '1';
		else
			qn <= std_logic_vector(unsigned(qp)+1);
			tout <= '0';
		end if;
	end process Mux;
	
	qp <= (others => '0') when rst = '1' else qn when rising_edge(clk);
	
end Libre;