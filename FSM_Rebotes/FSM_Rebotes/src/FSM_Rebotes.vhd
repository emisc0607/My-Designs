--Maestria en Ciencias (Mecatronica)
--Electronica Avanzada

--FSM_Rebotes

--Declaracion de librerias
library ieee;
use ieee.std_logic_1164.all;

--Definir la entidad
entity FSM_Rebotes is
	port (
	rst	: in	std_logic;
	clk : in	std_logic;
	b	: in	std_logic;
	e	: in	std_logic;
	bf	: out	std_logic;
	p	: out	std_logic
		);
end FSM_Rebotes;

--Definir arquitectura
architecture Estados of FSM_Rebotes is
signal qn, qp: std_logic_vector(1 downto 0);
begin
	machine:process(b, e, qp)
	begin
		case qp is
			when "00" => 	--Estado S0
			bf <= '0';
			p <= '0';
			if b = '1' then
				qn <= "01";
			else
				qn <= qp;
			end if;
			when "01" => 	--Estado S1
			bf <= '0';
			p <= '1';
			if e = '1' then
				qn <= "10";
			else
				qn <= qp;
			end if;
			when "10" => 	--Estado S2
			bf <= '1';
			p <= '0';
			if b = '1' then
				qn <= qp;
			else
				qn <= "11";
			end if;
			when others => 	--Estado S3
			bf <= '1';
			p <= '1';
			if e = '1' then
				qn <= "00";
			else
				qn <= qp;
			end if;
		end case;
	end process machine;
	qp <= (others => '0') when rst = '1' else qn when rising_edge(clk);
end Estados;

