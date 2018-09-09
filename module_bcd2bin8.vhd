library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity module_bcd2bin is
	generic 
	(
		BCD_WIDTH : integer := 4;
		BIN_WIDTH : integer := 4
	);
    port 
    ( 
        bcd : in std_logic_vector (BCD_WIDTH - 1 downto 0); -- bcd number 
        bin : out std_logic_vector (BIN_WIDTH - 1 downto 0) -- binary representation
    );   
end module_bcd2bin;

architecture module_bcd2bin_ar of module_bcd2bin is
begin
    -- reverse double-dabble to convert to binary
    process (bcd)
        variable tmp : unsigned (BCD_WIDTH - 1 downto 0);
    begin
        tmp := unsigned (bcd);
        
        for i in 0 to BIN_WIDTH - 1 loop
            bin(i) <= tmp(0);
            tmp := tmp srl 1;
            
            if tmp(3) = '1' then
                tmp := tmp - 3;
            end if;
        end loop;
    end process;
end module_bcd2bin_ar;
