library ieee;
use ieee.std_logic_1164.all;


-------Entity Definition made here-----------
entity Clocked_process_one is
  port (
    clock, reset, sig, a, b : in std_logic;
    out_x : out std_logic
  ) ;
end Clocked_process_one;

----------------

architecture Behavioural of Clocked_process_one is
-----------Normally signals and constants come here too
    signal sig_x : std_logic;
begin
-------And variables also belong this guy

    ----Sensitivity list taking all signals that has the possible of changing values
    process_x : process( clock, a, b, reset, sig )
    
    begin
	 sig_x <= sig;


     -----Asynchronous reset clocked process.
     ----When the reset goes high it doesnt matter what clock says the assignment
     ---- within the reset block must be executed 
        if reset ='1' then
            out_x <='0';
     ------Every signal assignment in a clocked process always
     -----produces a flip flop and in vhdl specifically produces D-flip flop.

     ------But this code will have one flip flop since the multiple signal 
     ------assignment is applied to one output signal.

            elsif rising_edge(clock) then
                if sig_x = '1' then
                    out_x <= a and b;
                    else
                    out_x <= a or b;
                    end if;
        end if ;
    end process ; -- process_x

end Behavioural ; -- Behavioural