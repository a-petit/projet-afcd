
% Durées des signaux
T1 = 128
T2 = 64
T  = 256

% Fréquences des signaux, en Hz = 1/s
f1 = 0.1
f2 = 0.2

% Borne du support de la TF
lambda_c = max(f1, f2);

% Le pas d'échantillonage permettant la reconstitution du signal
a = 1 / (2 * lambda_c + 1);

% Le signal échantilloné
n = ceil(T / a)
s = zeros(1, n);


offset = 0;
n1 = floor(T1/a)
thetas = linspace(0, T1 * f1 * 2 * pi, n1 + 1); % +1 for offset
s(1, 1:n1) = sin(offset + thetas(1:n1));
offset     = sin(offset + thetas(n1 + 1));

n2     = floor(T2/a)
thetas = linspace(0, T1 * f1 * 2 * pi, n2)
s(1, (n1 + 1):(n1 + n2)) = sin(offset + thetas);

% plot(s)

tfd = abs(fft(s));

% Tracé de la transformée de Fourier discrète

fe = 1/a;
abs_tfd = linspace(0, fe, n);
plot(abs_tfd, tfd);

% Tracé du spectre approché du signal

%{
abs_tfa = mod(abs_tfd, (fe/2)) - floor(abs_tfd / (fe/2)) * (fe/2);
plot(abs_tfa, abs(fft(s)));
%}

half_n = floor(n / 2);

%{
abs_tfa = abs_tfd;
abs_tfa(half_n:n) = abs_tfa(half_n:n) - fe;
plot(abs_tfa, abs(fft(s)));
%}

hold on;
seg1 = 1:half_n;
seg2 = half_n+1:n;
plot(abs_tfd(seg1)     , tfd(seg1));
plot(abs_tfd(seg2) - fe, tfd(seg2));

%{
half_n = n / 2
abs_tfa = zeros(1, n);
abs_tfa(1 : half_n)     = abs_tfd(half_n+1, n) - fe;
abs_tfa(half_n + 1 : n) = abs_tfd(1, half_n);
plot(itv, abs(fft(s)));
%}

s;




