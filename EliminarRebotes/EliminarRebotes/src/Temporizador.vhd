--Maestria en Ciencias (Mecatronica)
--Electronica Avanzada

--Temporizador Generico

--Declaracion de librerias
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--Definir la entidad
entity Temporizador is
	generic (n : integer := 8
	);

	port (
		rst	:	in	std_logic;
		clk	:	in	std_logic;
		k	:	in	std_logic_vector(n-1 downto 0);
		str	: 	in	std_logic;
		tout:	out std_logic
		);
end Temporizador;

--Definir arquitectura
architecture Generico of Temporizador is
signal qn, qp: std_logic_vector(n-1 downto 0);
begin
	
		-- str  qp = k	|  qn
		----------------|-----
		--  0	   x    |  0  		clear
		--  1	   0    |  qp+1  	count
		--  1	   1    |  0  		clear
	--Multiplexor
	Mux:process(str, qp, k) 
	begin  
		if str = '0' then
			qn <= (others => '0');
			tout <= '0';
		elsif qp = k then
			qn <= (others => '0');
			tout <= '1';
		else
			qn <= std_logic_vector(unsigned(qp)+1);
			tout <= '0';
		end if;
			
	end process Mux;
	
	qp <= (others => '0') when rst = '1' else qn when rising_edge(clk);
	
end Generico;