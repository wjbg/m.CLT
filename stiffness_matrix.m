function C = stiffness_matrix(E1, E2, v12, G12)
    % stiffness_matrix Return stiffness matrix in material CS.
    %
    % Arguments:
    %   E1  : Young's modulus in fiber direction.
    %   E2  : Young's modulus transverse to direction.
    %   v12 : Poisson's ratio.
    %   G12 : Shear modulus.
    %
    % Returns:
    %   C   : stiffness matrix in material coordinate system
    v21 = E2*v12/E1;
    C = [    E1/(1-v12*v21), v21*E1/(1-v12*v21),   0;
         v21*E1/(1-v12*v21),     E2/(1-v12*v21),   0;
                          0,                  0, G12];
end