-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 32-bit"
-- VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"

-- DATE "06/10/2021 14:37:33"

-- 
-- Device: Altera EP4CGX15BF14C6 Package FBGA169
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIV.CYCLONEIV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	bascules IS
    PORT (
	d : IN std_logic;
	ena : IN std_logic;
	qa : OUT std_logic;
	qb : OUT std_logic;
	qc : OUT std_logic;
	qd : OUT std_logic
	);
END bascules;

-- Design Ports Information
-- qa	=>  Location: PIN_K9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- qb	=>  Location: PIN_K8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- qc	=>  Location: PIN_H10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- qd	=>  Location: PIN_H12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d	=>  Location: PIN_D10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ena	=>  Location: PIN_J7,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF bascules IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_d : std_logic;
SIGNAL ww_ena : std_logic;
SIGNAL ww_qa : std_logic;
SIGNAL ww_qb : std_logic;
SIGNAL ww_qc : std_logic;
SIGNAL ww_qd : std_logic;
SIGNAL \ena~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \qa~output_o\ : std_logic;
SIGNAL \qb~output_o\ : std_logic;
SIGNAL \qc~output_o\ : std_logic;
SIGNAL \qd~output_o\ : std_logic;
SIGNAL \d~input_o\ : std_logic;
SIGNAL \ena~input_o\ : std_logic;
SIGNAL \ena~inputclkctrl_outclk\ : std_logic;
SIGNAL \testa~combout\ : std_logic;
SIGNAL \testc~q\ : std_logic;
SIGNAL \testd~q\ : std_logic;

BEGIN

ww_d <= d;
ww_ena <= ena;
qa <= ww_qa;
qb <= ww_qb;
qc <= ww_qc;
qd <= ww_qd;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\ena~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \ena~input_o\);

-- Location: IOOBUF_X22_Y0_N2
\qa~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \testa~combout\,
	devoe => ww_devoe,
	o => \qa~output_o\);

-- Location: IOOBUF_X22_Y0_N9
\qb~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \testa~combout\,
	devoe => ww_devoe,
	o => \qb~output_o\);

-- Location: IOOBUF_X33_Y14_N2
\qc~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \testc~q\,
	devoe => ww_devoe,
	o => \qc~output_o\);

-- Location: IOOBUF_X33_Y14_N9
\qd~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \testd~q\,
	devoe => ww_devoe,
	o => \qd~output_o\);

-- Location: IOIBUF_X33_Y27_N8
\d~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d,
	o => \d~input_o\);

-- Location: IOIBUF_X16_Y0_N15
\ena~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ena,
	o => \ena~input_o\);

-- Location: CLKCTRL_G17
\ena~inputclkctrl\ : cycloneiv_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \ena~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \ena~inputclkctrl_outclk\);

-- Location: LCCOMB_X32_Y14_N28
testa : cycloneiv_lcell_comb
-- Equation(s):
-- \testa~combout\ = (GLOBAL(\ena~inputclkctrl_outclk\) & (\d~input_o\)) # (!GLOBAL(\ena~inputclkctrl_outclk\) & ((\testa~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d~input_o\,
	datac => \ena~inputclkctrl_outclk\,
	datad => \testa~combout\,
	combout => \testa~combout\);

-- Location: FF_X32_Y14_N9
testc : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ena~inputclkctrl_outclk\,
	asdata => \d~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \testc~q\);

-- Location: FF_X32_Y14_N3
testd : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ena~inputclkctrl_outclk\,
	asdata => \d~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \testd~q\);

ww_qa <= \qa~output_o\;

ww_qb <= \qb~output_o\;

ww_qc <= \qc~output_o\;

ww_qd <= \qd~output_o\;
END structure;


