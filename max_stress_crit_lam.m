function failed = max_stress_crit_lam(stress, strength)
    % max_stress_crit_lam Returns which plies failed.
    %
    % Input:
    %   stress   : Matrix of size (3, 2*n) with the stress state in material CS
    %              at the top and bottom of each ply.
    %   strength : Matrix of size (3, 2) with the strength values. The first
    %              column represents the compressive strength and the second
    %              column representing the tensile strength.
    %
    % Returns:
    %   failed   : Cell array for each ply with indexes indicating the stress
    %              component that exceeded the strength value.
    failed = cell(1, length(stress)/2);
    for i=1:length(failed)
        f_top = max_stress_crit(stress(:,i*2-1), strength);
        f_bot = max_stress_crit(stress(:,i*2), strength);
        failed{i} = unique([f_top; f_bot]);
    end
end