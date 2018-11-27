clf;

% Frequence d'échantillonage
Fe = 32;
% Fréquence du signal
F0 = 7;
% Nombre d'échantillons par moitié
N  = 15;
% Phase initiale du signal ?
f0 = 0.2;
% Pas d'échantillonage
a  = 1 / Fe;
% T
T = 2 * N * a;

% Calcul du spectre approché
lambda_c = 1 / (2 * a);
lambdas = linspace(-lambda_c, lambda_c, 2 * N);
ks = linspace(-lambda_c*T, lambda_c*T, 2 * N);

% Subdivision de l'intervalle de temps
t = 0:a:(T-a); % t = linspace(-N  * a, (N - 1) * a, 2 * N);
% Signal échantillonné
xn = real(f(t, F0));
% La fft directe
fft_xn = fft(xn);


clf;
hold on
%plot(lambdas, abs(fft_xn), 'DisplayName', 'fft');
plot(t, xn,   'DisplayName', 'signal');
return;

k = 1:(2 * N);
s = zeros(1, 2 * N);
for i=1:(2*N)
    s(1, i) = sn_kt(fft_xn, a, N, k(i));
end

n = size(lambdas, 2);
res = zeros(1, n);
for k = 1:n
    res(k) = sn_lambda(lambdas(k), f0, a, N);
end

clf;
hold on
%plot(lambdas, abs(fft_xn), 'DisplayName', 'fft');
plot(ks, s,   'DisplayName', 'S_n(k/T)');
plot(lambdas, res, 'DisplayName', 'S_n(\lambda)');
xlabel('\lambda_k');
legend()


% -- Fonctions ------------------------------------------------------------

% f(x)
function [y] = f(x, F0)
    y = exp(2 * 1i * pi * F0 * x);
end

% S_N(k/T) : le module du spectre approché
function [s] = sn_kt(tfd, a, N, k)
    s = a * exp(1i * pi * k * (1 - 2 * N)) * tfd(k);
    s = abs(s);
end

% S_N(lambda)
function [s] = sn_lambda(lambda, f0, a, N)

    omega = pi * (f0 - a * lambda);
    s = a * (cos(omega) + 1i * sin(omega)) * sin(2 * N * omega) / sin(omega);
    s = abs(s);
end
    



