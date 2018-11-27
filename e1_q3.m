

% Frequence d'échantillonage
Fe = 32;
% Fréquence du signal
F0 = 7;
% Demi-nombre d'échantillons, influe sur l'intervalle de temps
% d'observation du signal x(t)
N  = 15;
% Phase initiale du signal
f0 = 0.2;
% Pas d'échantillonage
a  = 1 / Fe
% T
T = 2 * N * a


res_app = zeros(1, 2 * N);
res_fft = zeros(1, 2 * N);

% Calcul du spectre approché
lambda_c = 1 / (2 * a);
lambdas = linspace(-lambda_c, lambda_c, 2 * N);

% Subdivision de l'intervalle de temps
t = linspace(-N  * a, (N - 1) * a, 2 * N);
% Signal échantillonné
x_n = f(t, F0);
% La fft directe
fft_xn = fft(x_n);

for k = (-N):(N-1)
    lambda_k = k / T;
    res_app(k + N+1) = sn_lambda(lambda_k, Fe, f0, F0, N);
    res_fft(k + N+1) = sn_kt(fft_xn, k, T, Fe, N);
end

clf;
hold on;
plot(lambdas, res_app, 'r')
plot(lambdas, res_fft, 'b')
% plot(t, fft_xn, '--b')
%plot(t, real(f(t, F0))); % Pourquoi a-t-on un signal complexe ??


% S_N(lambda) : le module du spectre approché en lambda
% @param lambda : un réel
function [s] = sn_lambda(lambda, Fe, f0, F0, N)
    omega = pi * f0 * (1 - lambda / F0);
    s = (1 / Fe) * (cos(omega) + 1i * sin(omega)) * sin(2 * omega * N) / sin(omega);
    s = abs(s);
end

% f(x)
function [y] = f(x, F0)
    y = exp(2 * 1i * pi * F0 * x);
end

% res_fft(i) = sn_kt(fft_xn, k, T, Fe, N);
% S_N(k/T) : le module du spectre exact
function [s] = sn_kt(fft_xn, k, T, Fe, N)
    s = (1 / Fe) * exp(1i * (0.) * k * pi) * fft_xn(N - k);
    %s = (1 / Fe) * exp(1i * k * pi) * fft_xn(N - k);
    %s = (1 / Fe) * exp(1i * k * pi) * fft_xn(N - k);
    s = abs(s);
end
    



