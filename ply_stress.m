function [stress_r, z_int] = ply_stress(def, C_r, z, varargin)
    % ply_stress Returns ply stresses in ply CS.
    %
    % Mandatory arguments:
    %   def      : Laminate deformation vector with strains (1:3) and
    %              curvatures (4:6).
    %   C_r      : Cell array of length n with stiffness matrices in ply CS.
    %   z        : Array of length n+1 with the ply edge locations.
    %
    % Optional arguments to take into account thermal stresses:
    %   alpha_r  : Cell array of length n with CTE vectors in ply CS.
    %   deltaT   : Temperature difference.
    %
    % Returns:
    %   stress_r : Matrix of size (3, 2*n) with the stress state in ply CS
    %              at the top and bottom of each ply.
    %   z_int    : Array of length 2*n with edge location for each ply.
    switch nargin
      case 3
        alpha_r = cell(length(C_r), 1);
        alpha_r(:) = {[0;0;0]};
        deltaT = 0;
      case 5
        alpha_r = varargin{1};
        deltaT = varargin{2};
      otherwise
        error('Wrong number of arguments. Should be either 3 or 5.')
    end

    z_int = repelem(z, 2);
    z_int = z_int(2:end-1);
    stress_r = zeros(3, length(z_int));

    eps_0 = def(1:3);
    kappa = def(4:6);

    for i=1:length(C_r)
        eps = [eps_0 + z_int(i*2-1)*kappa - alpha_r{i}*deltaT, ...
               eps_0 + z_int(i*2)*kappa - alpha_r{i}*deltaT];
        stress_r(:, i*2-1) = C_r{i}*eps(:,1);
        stress_r(:, i*2) = C_r{i}*eps(:,2);
    end

end