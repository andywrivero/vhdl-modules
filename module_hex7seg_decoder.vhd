library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity module_hex7seg_decoder is
    port 
    (
        digit : in std_logic_vector (3 downto 0);
        seg   : out std_logic_vector (6 downto 0)
    );
end module_hex7seg_decoder;

architecture module_hex7seg_decoder_ar of module_hex7seg_decoder is
begin
    seg <= "1000000" when digit = "0000" else -- 0
           "1111001" when digit = "0001" else -- 1
           "0100100" when digit = "0010" else -- 2
           "0110000" when digit = "0011" else -- 3 
           "0011001" when digit = "0100" else -- 4
           "0010010" when digit = "0101" else -- 5
           "0000010" when digit = "0110" else -- 6
           "1111000" when digit = "0111" else -- 7
           "0000000" when digit = "1000" else -- 8
           "0011000" when digit = "1001" else -- 9
           "0100000" when digit = "1010" else -- a
           "0000011" when digit = "1011" else -- b
           "1000110" when digit = "1100" else -- c
           "0100001" when digit = "1101" else -- d
           "0000100" when digit = "1110" else -- e
           "0001110";                         -- f 
            
end module_hex7seg_decoder_ar;
