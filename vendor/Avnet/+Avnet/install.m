function install(mode)
% Avnet.install adds/removes Avnet HDL BSPs

% Copyright 2015 MathWorks, Inc. All Rights Reserved.

    if nargin == 0
        mode = 0;
    end

    %% Initialization
    % Determine where we're operating out of
    vendorRootDir = fileparts(strtok(mfilename('fullpath'), '+'));
    olddir = cd(vendorRootDir); % Make sure we can access the tools
    cleanup = onCleanup(@()cd(olddir));

    % Update the path
    paths = {...
        fullfile(vendorRootDir),...    
    };

    if mode == 0
        pathfunc = @addpath;
    else
        pathfunc = @rmpath;
    end

    pathfunc(paths{:});
    status = savepath;
    if status
        error('Failed to save the path!');
    end

    %% Cleanup
    rehash('toolboxreset');
    rehash('toolboxcache');
    updateHdlwaPlatformList('ip_core');
end