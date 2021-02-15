function plot_stress(stress_int, z_int, i)
    % plot_stress Plots stress distribution through thickness.
    %
    % Arguments:
    %   stress_int : Stresses at the ply interfaces.
    %   z_int      : Corresponding ply interface locations.
    %   i          : Stress component to plot
    hold on;
    box on;
    plot([0, 0], [min(z_int), max(z_int)], ':k')
    plot(stress_int(i,:), z_int)

    ax = gca;
    ax.YDir = 'reverse';

    xlabel('stress, Pa')
    hold off;
end