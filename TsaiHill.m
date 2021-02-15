function TH = TsaiHill(stress, strength)
    % TsaiHill Returns Tsai-Hill stress value.
    %
    % TH = sigma_1^2/S1^2 - sigma_1*sigma_2/S1^2 +
    %      sigma_2^2/S2^2 + sigma_6^2/S6^2
    %
    % Failure occurs when TH > 1.
    %
    % Arguments:
    %   stress   : Array of length 3 with the stress state in material CS.
    %   strength : Matrix of size (3, 2) with the strength values. The first
    %              column represents the compressive strength and the second
    %              column representing the tensile strength.
    %
    % Returns:
    %   TH       : Tsai-Hill stress value.
    if stress(1) < 0
        S1 = strength(1,1);
    else
        S1 = strength(1,2);
    end
    if stress(2) < 0
        S2 = strength(2,1);
    else
        S2 = strength(2,2);
    end
    S3 = strength(3,1);

    TH = stress(1)^2/S1^2 - stress(1)*stress(2)/S1^2 + ...
         stress(2)^2/S2^2 + stress(3)^2/S3^2;
end
