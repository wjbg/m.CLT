function NM = thermal_force(C_r, alpha_r, z, deltaT)
    % thermal_force Returns fictive thermal forces and moments.
    %
    % Arguments:
    %   C_r     : Cell array of length n with stiffness matrices in ply CS.
    %   alpha_r : Cell array of length n with CTE vectors in ply CS.
    %   z       : Array of length n+1 with the ply edge locations.
    %   deltaT  : Temperature difference.
    %
    % Returns:
    %   NM      : Array with fictive in-plane loads (1:3) and moments (4:6).
    N = zeros(3,1);
    M = zeros(3,1);
    if length(z) - 1 == length(C_r)
        for i=1:length(C_r)
           N = N + deltaT * C_r{i} * alpha_r{i} * (z(i+1) - z(i));
           M = M + 0.5*deltaT * C_r{i} * alpha_r{i} * (z(i+1)^2 - z(i)^2);
        end
    end
    NM = [N;M];
end
