function hB = plugin_board(part)
% Use Plugin API to create board plugin object

%   Copyright 2015 The MathWorks, Inc.

hB = hdlcoder.Board;

% Target Board Information
hB.BoardName    = sprintf('Avnet MicroZed (%s)', upper(part));

% FPGA Device
hB.FPGAVendor   = 'Xilinx';
hB.FPGAFamily   = 'Zynq';
% Determine the device based on the part
hB.FPGADevice   = sprintf('xc7%s', lower(part));
hB.FPGAPackage  = 'clg400';
hB.FPGASpeed    = '-1';

% Tool Info
hB.SupportedTool = {'Xilinx Vivado'};

% FPGA JTAG chain position
hB.JTAGChainPosition = 2;

%% Add interfaces
% Standard "External Port" interface
hB.addExternalPortInterface( ...
    'IOPadConstraint', {'IOSTANDARD = LVCMOS25'});
