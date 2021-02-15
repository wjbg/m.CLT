function S_r = rotate_S(S, theta)
    % rotate_S Returns compliance matrix in ply CS.
    %
    % Arguments:
    %   S     : Compliance matrix in material CS.
    %   theta : Rotation angle (in radians!).
    %
    % Returns:
    %   S_r   : Compliance matrix in ply CS.
    T = transformation_matrix(theta);
    R = Reuter();
    S_r = R*inv(T)*inv(R)*S*T;
end