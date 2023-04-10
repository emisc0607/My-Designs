--Maestria en Ciencias (Mecatronica)
--Electronica Avanzada

--Contador Descendente

--Declaracion de librerias
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--Definir la entidad
entity Contador_Descendente is
	generic(n: integer := 8
	);
	port (
	rst	:	in	std_logic;
	clk	:	in	std_logic;
	k	:	in	std_logic_vector(n-1 downto 0);
	opc	:	in	std_logic_vector(1 downto 0);
	q	:	out	std_logic_vector(n-1 downto 0);
	z	:	out	std_logic
	);
end Contador_Descendente;

--Declaracion de la arquitectura

architecture Contador of Contador_Descendente is
--definicion de las seniales internas
signal qp, qn, zr : std_logic_vector(n-1 downto 0);
begin
	q <= qp;
	zr <= (others => '0');
	z <= '1' when qp = zr else '0';
	
		-- opc 	| qn
		--------|-----
		-- 00	| qp  	hold
		--01 	| qp-1	shift
		-- 1x	| k		load
	--Multiplexor
	Mux:process(opc, qp, k) 
	begin  
		if opc(1)='1' then
			qn <= k;
		elsif opc(0)='1' then
			qn <= std_logic_vector(unsigned(qp) - 1); --transformar qp a tipo unsigned y transformar la resta a vector logico
		else --opc(0)='0' then
			qn <= qp;			
		end if;
			
	end process Mux;
	qp <= (others => '0') when rst = '1' else qn when rising_edge(clk);
		
end Contador;