function z = ply_edges(h, n)
    % ply_edges Returns ply top and bottom surface locations.
    %
    % Arugments:
    %   h : Ply thickness.
    %   n : Number of plies.
    %
    % Output:
    %   z : Array of length n+1 with the locations of the ply edges.
    z = linspace(-n*h/2, n*h/2, n+1)';
end