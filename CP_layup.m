function layup = CP_layup(n)
    % CP_layup Returns symmetric cross-ply lay-up.
    %
    % Arguments:
    %   n     : Number of plies.
    %
    % Returns:
    %   layup : Array of length n with ply orientation in degrees.
    if mod(n, 2) == 0
        unit = [0; 90];
        k = n/4;
        half = repmat(unit, k, 1);
        layup = vertcat(half, flipud(half));
    else
        layup = [];
    end
end