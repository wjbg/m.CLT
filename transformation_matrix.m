function T = transformation_matrix(theta)
    % transformation_matrix Returns transformation matrix.
    %
    % Argument:
    %   theta : rotation angle (in radians!).
    %
    % Returns:
    %   T     : transformation matrix for theta.
    n = sin(theta);
    m = cos(theta);
    T = [ m^2,  n^2,   2*m*n;
          n^2,  m^2,  -2*m*n;
         -m*n,  m*n, m^2-n^2];
end