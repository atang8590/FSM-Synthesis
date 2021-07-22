library ieee;
use ieee.std_logic_1164.all;

entity Clocked_process_one is
  port (
    clock, reset, sig, a, b : in std_logic;
    out_x : out std_logic
  ) ;
end Clocked_process_one;

----------------

architecture Behavioural of Clocked_process_one is

    signal sig_x : std_logic;
begin

    process_x : process( clock, a, b, reset, sig )
    
    begin
	 sig_x <= sig;
        if reset ='1' then
            out_x <='0';
     

            elsif rising_edge(clock) then
                if sig_x = '1' then
                    out_x <= a and b;
                    else
                    out_x <= a or b;
                    end if;
        end if ;
    end process ; -- process_x

end Behavioural ; -- Behavioural