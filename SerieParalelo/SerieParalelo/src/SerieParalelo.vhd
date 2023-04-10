--Maestria en Ciencias (Mecatronica)
--Electronica Avanzada

--Registro Serie Paralelo

--Declaracion de librerias
library ieee;
use ieee.std_logic_1164.all;

--Definir la entidad	 	
entity SerieParalelo is	  
	generic (
		n : integer := 4
		);	
	port (
	rst : in 	std_logic;
	clk : in 	std_logic;
	shl : in	std_logic;
	di  : in 	std_logic;
	do 	: out std_logic_vector(n-1 downto 0)
		);
end SerieParalelo;							
--Definicion de la arquitectura
architecture Registro of SerieParalelo is 
--Declarar inner signals
	signal qn, qp : std_logic_vector(n-1 downto 0);
	begin										   
		do <= qp;
		
		-- shl	| qn
		--------|-----
		-- 0	| qp						hold
		-- 1	| qp(n-2 downto 0) & di 	shift	 
		
		--Multiplexor
		Mux:process(shl, qp, di)
		begin
			if shl = '1' then
				qn <= qp(n-2 downto 0) & di;
			else
				qn <= qp;					
			end if;
		end process Mux;	
		
		qp <= (others => '0') when rst = '1' else qn when rising_edge(clk);		--FilpFlop
			
end Registro;
