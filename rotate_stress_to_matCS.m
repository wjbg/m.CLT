function stress = rotate_stress_to_matCS(stress_r, layup)
    % rotate_stress_to_matCS Rotates stresses in ply CS to mat CS.
    %
    % Input:
    %   stress_r : Vector of size (3, 2*n) with the stress state
    %              in ply CS at the top and bottom of each ply.
    %   layup    : Array of length n with the ply orientation (in radians!)
    %
    % Returns:
    %   stress   : Vector of size (3, 2*n) with the stress state
    %              in mat CS at the top and bottom of each ply.
    stress = zeros(size(stress_r));
    for i=1:length(layup)
        T = transformation_matrix(layup(i));
        stress(:,i*2-1) = T*stress_r(:,i*2-1);
        stress(:,i*2) = T*stress_r(:,i*2);
    end
end
