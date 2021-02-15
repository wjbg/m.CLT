function alpha_r = rotate_alpha(alpha, theta)
    % rotate_alpha Returns CTE vector in ply CS.
    %
    % Arguments:
    %   alpha   : CTE vector in material CS.
    %   theta   : Rotation angle or array of rotation angles (in radians!).
    %
    % Returns:
    %   alpha_r : CTE vector in ply CS or, in case theta is an array
    %             of angles, a cell array with CTE's in ply CS.
    R = Reuter();
    if length(theta) == 1
        T = transformation_matrix(theta);
        alpha_r = R*inv(T)*inv(R)*alpha;
    else
        alpha_r = cell(length(theta), 1);
        for i=1:length(theta)
            T = transformation_matrix(theta(i));
            alpha_r{i} = R*inv(T)*inv(R)*alpha;
        end
    end
end