function C_r = rotate_C(C, theta)
    % rotate_C Returns stiffness matrix in ply CS.
    %
    % Arguments:
    %   C     : Stiffness matrix in material CS.
    %   theta : Rotation angle or, in case of a laminate, array of rotation
    %           angles (in radians!).
    %
    % Output:
    %   C_r   : Stiffness matrix in ply CS or, in case theta is an array
    %           of angles, a cell array with stiffness matrices in ply CS.
    R = Reuter();
    if length(theta) == 1
        T = transformation_matrix(theta);
        C_r = inv(T)*C*R*T*inv(R);
    else
        C_r = cell(length(theta), 1);
        for i=1:length(theta)
            T = transformation_matrix(theta(i));
            C_r{i} = inv(T)*C*R*T*inv(R);
        end
    end
end