LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
ENTITY bascules IS
PORT (
d,ena
: IN STD_LOGIC;
qa,qb,qc,qd : OUT STD_LOGIC
);
END bascules;
ARCHITECTURE archi OF bascules IS
SIGNAL
testa, testb, testc, testd: STD_LOGIC ;
BEGIN
truc1 : PROCESS (ena,d)
BEGIN
IF ena = '1' THEN testa <= d;
ELSE testa <= testa;
END IF;
END PROCESS;
truc2 : PROCESS (ena)
BEGIN
IF ena = '1' THEN testb <= d;
ELSE testb <= testb;
END IF;
END PROCESS;
Truc3 : PROCESS (ena)
BEGIN
IF ( rising_edge(ena) ) THEN testc <= d;
END IF;
END PROCESS;
Truc4 : PROCESS (ena,d)
BEGIN
IF ( rising_edge(ena) ) THEN testd <= d;
END IF;
END PROCESS;

qa <= testa;
qb <= testb;
qc <= testc;
qd <= testd;
END archi;