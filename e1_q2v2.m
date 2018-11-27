% -- Données du programme

Fe = 32;
N  = 15;

%{
for f0 = [0.05 0.1 0.45 0.49 0.5 1]
    plot_spectrum(f0, Fe, N)
end
%}

plot_spectrum(7, Fe, N)

%plot_spectrum(0.4, Fe, N)

% -- Fonctions ------------------------------------------------------------

function plot_spectrum(f0, Fe, N)
    F0 = f0 * Fe
    
    %assert(Fe > 2 * F0);
    
    a  = 1 / Fe;

    % On choisit lambad_c tel que lambda_c < Fe/2

    lambda_c = Fe/2;
    lambdas  = -lambda_c:0.01:(lambda_c);

    % -- Calcul du spectre approché

    n = size(lambdas, 2);
    res = zeros(1, n);
    for k = 1:n
        res(k) = sn_lambda(lambdas(k), f0, a, N);
    end

    % -- Tracé du spectre approché

    clf;
    plot(lambdas, res)
    %plot(res)
    xlabel('\lambda')
    ylabel('|S_N(\lambda)|')
    
    saveas(gcf, strcat('img/ex1_q2_f0=', num2str(f0,2), '_F0=', num2str(F0,2), '.png'))
end

% sn_lambda renvoit le module de la transformée de fourier en lambda

function [s] = sn_lambda(lambda, f0, a, N)

    omega = pi * (f0 - a * lambda);
    s = a * (cos(omega) + 1i * sin(omega)) * sin(2 * N * omega) / sin(omega);
    s = abs(s);
end
    



