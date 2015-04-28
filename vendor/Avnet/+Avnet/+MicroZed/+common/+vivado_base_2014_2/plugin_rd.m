function hRD = plugin_rd(part)
% Reference design definition

%   Copyright 2014-2015 The MathWorks, Inc.

% Construct reference design object
hRD = hdlcoder.ReferenceDesign('SynthesisTool', 'Xilinx Vivado');

% Create the reference design for the SOM-only
% This is the base reference design that other RDs can build upon
hRD.ReferenceDesignName = 'SOM Base System (Vivado 2014.2)';

% Determine the board name based on the part
hRD.BoardName = sprintf('Avnet MicroZed (%s)', upper(part));

% Tool information
hRD.SupportedToolVersion = {'2014.2'};

%% Add custom design files
% add custom Vivado design
hRD.addCustomVivadoDesign( ...
    'CustomBlockDesignTcl', 'system.tcl');

%% Add interfaces
% add clock interface
hRD.addClockInterface( ...
    'ClockConnection',   'clk_wiz_0/clk_out1', ...
    'ResetConnection',   'sys_rstgen/peripheral_aresetn');

% add AXI4 and AXI4-Lite slave interfaces
hRD.addAXI4SlaveInterface( ...
    'InterfaceConnection', 'axi_cpu_interconnect/M00_AXI', ...
    'BaseAddress',         '0x400D0000', ...
    'MasterAddressSpace',  'sys_ps7/Data');

