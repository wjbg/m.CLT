function failed = max_stress_crit(stress, strength)
    % max_stress_crit Returns stress components that exceed strength.
    %
    % Arguments:
    %   stress   : Array of length 3 with the stress state in material CS.
    %   strength : Matrix of size (3, 2) with the strength values. The first
    %              column represents the compressive strength and the second
    %              column representing the tensile strength.
    %
    % Returns:
    %   failed   : Array of indexes indicating the stress component that
    %              exceeded the strength value.
    failed = find((strength(:,1) > stress) + (stress > strength(:,2)));
end
