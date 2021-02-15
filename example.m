%% Example
% Consider a 24-ply quasi-isotropic laminate. The ply properties and ply
% thickness are listed in this file. This example file will illustrate how
% to use the functions in this repo to determine:
%
% # Engineering constants of the laminate
% # Deformation and stress distribution due to an applied load
% # Deformation and stress distribution because of a temperature change

%% Layup
t = 0.15E-3;
n = 24;
layup = QI_layup(n)*(pi/180);
z = ply_edges(t, n);

%% Material properties
E1 = 120E9;
E2 = 10E9;
v12 = 0.28;
G12 = 5E9;
alpha = [0.2E-6; 30E-6; 0]; % CTE in material CS

C = stiffness_matrix(E1, E2, v12, G12); % Material CS

%% ABD and abd matrix
C_r = rotate_C(C, layup); % Cell with the stiffness matrix
                          % of each ply in ply CS

ABD = ABD_matrix(C_r, z);
abd = inv(ABD);

%% Laminate engineering constants
% The engineering constants of the laminate can be determined from the
% abd-matrix as:
%
% $$E_x = \frac{1}{a_{11}H},\quad
%   E_y = \frac{1}{a_{22}H},\quad
%   G = \frac{1}{a_{22}H},$$
%
% with $H$ the laminate thickness.
E_x = 1/(abd(1,1)*n*t);
E_y = 1/(abd(2,2)*n*t);
G = 1/(abd(3,3)*n*t);

%% Deformation and stresses due to an applied load
% Let us apply a tensile load in x-direction.
N = [1E5; 0; 0;  % Nx, Ny, Nxy (in N/m)
       0; 0; 0]; % Mx, My, Mxy (in Nm/m)

def = abd*N; % Deformation vector with: [strain_x; strain_y; strain_xy;
             %                            kappa_x;  kappa_y;  kappa_xy]

[stress_r, z_int] = ply_stress(def, C_r, z); % ply CS
stress = rotate_stress_to_matCS(stress_r, layup); % material CS

plot_stress(stress_r, z_int, 1); % stress in 1* direction

%% Deformation and stresses due to cooling
% Consider the laminate is cooled down from a processing temperature of
% 220C to room temperature.
deltaT = -200;
alpha_r = rotate_alpha(alpha, layup); % CTEs for all plies in ply CS
Nth = thermal_force(C_r, alpha_r, z, deltaT);
def = abd*Nth;

[stress_r, z_int] = ply_stress(def, C_r, z, alpha_r, deltaT); % ply CS
stress = rotate_stress_to_matCS(stress_r, layup); % material CS