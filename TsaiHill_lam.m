function TH = TsaiHill_lam(stress, strength)
    % TsaiHill_lam Returns Tsai-Hill values for each ply.
    %
    % Arguments:
    %   stress   : Matrix of size (3, 2*n) with the stress state in material CS
    %              at the top and bottom of each ply.
    %   strength : Matrix of size (3, 2) with the strength values. The first
    %              column represents the compressive strength and the second
    %              column representing the tensile strength.
    %
    % Returns:
    %   TH       : Array of length 2*n with the Tsai-Hill values.
    TH = zeros(length(stress), 1);
    for i=1:length(stress)
        TH(i) = TsaiHill(stress(:,i), strength);
    end
end