-- Maestria en Ciencias en Mecatronica
-- Electronica Avanzada
-- Decodificador de direccion encoder (FSM)			   		 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- Definicion de la entidad
entity Encoder_direccion is
    port
	 (
		  RST : in  STD_LOGIC;
		  CLK : in  STD_LOGIC;
		  A   : in  STD_LOGIC;
		  B   : in  STD_LOGIC;
		  S   : out STD_LOGIC
	  );
end Encoder_direccion;
-- Definicion de la arquitectura
architecture FMS of Encoder_direccion is
-- Definicion de seniales internas
signal Qp, Qn : std_logic_vector(2 downto 0); 
signal AB : std_logic_vector(1 downto 0); 

begin
	AB <= A & B;
	
	maquina: process(Qp,AB) 
	begin
		case Qp is
			when "000" =>			-- S0
				case AB is
					when "01" =>
					Qn <= "001";
					when "10" =>
					Qn <= "100";
					when others =>
					Qn <= Qp;
				end case;
			S <= '0';
			when "001" =>			-- S1
				case AB is
					when "11" =>
					Qn <= "010";
					when "00" =>
					Qn <= "111";
					when others =>
					Qn <= Qp;
				end case;
			S <= '0';
			when "010" =>			-- S2
				case AB is
					when "10" =>
					Qn <= "011";
					when "01" =>
					Qn <= "110";
					when others =>
					Qn <= Qp;
				end case;
			S <= '0';
			when "011" =>			-- S3
				case AB is
					when "00" =>
					Qn <= "000";
					when "11" =>
					Qn <= "101";
					when others =>
					Qn <= Qp;
				end case;
			S <= '0';
			when "100" =>			-- S4
				case AB is
					when "11" =>
					Qn <= "101";
					when "00" =>
					Qn <= "000";
					when others =>
					Qn <= Qp;
				end case;
			S <= '1';
			when "101" =>			-- S5
				case AB is
					when "01" =>
					Qn <= "110";
					when "10" =>
					Qn <= "011";
					when others =>
					Qn <= Qp;
				end case;
			S <= '1';
			when "110" =>			-- S6
				case AB is
					when "00" =>
					Qn <= "111";
					when "11" =>
					Qn <= "010";
					when others =>
					Qn <= Qp;
				end case;
			S <= '1';
			when others =>			-- S7
				case AB is
					when "10" =>
					Qn <= "100";
					when "01" =>
					Qn <= "001";
					when others =>
					Qn <= Qp;
				end case;
			S <= '1';
		end case;
	end process maquina;
	
Qp <= (others => '0') when RST = '1' else Qn when rising_edge(CLK);
	
end FMS;