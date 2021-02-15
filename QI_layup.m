function layup = QI_layup(n)
    % QI_layup Returns symmetric QI lay-up.
    %
    % Arguments:
    %   n     : Number of plies (must be multiple of 8).
    %
    % Output:
    %   layup : Array of length n+1 with ply orientation in degrees.
    if mod(n, 8) == 0
        unit = [45; 0; -45; 90];
        k = n/8;
        half = repmat(unit, k, 1);
        layup = vertcat(half, flipud(half));
    else
        layup = [];
    end
end