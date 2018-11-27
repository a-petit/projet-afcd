clf;
hold on;


% -------------------------------------------------------------------------
% -- QUESTION 1 -----------------------------------------------------------

% Durées des signaux
T1 = 128;
T2 = 64;
T  = 256;

% Fréquences des signaux, en Hz = 1/s
f1 = 0.1;
f2 = 0.2;

% Borne du support de la TF
lambda_c = max(f1, f2);

% Le pas d'échantillonage permettant la reconstitution du signal
a = 1 / (2 * lambda_c + 0.3);

% Le signal échantilloné

s1 = sampling(T1, T2, 256, f1, f2, a);
s2 = sampling(T1, T2, 512, f1, f2, a);

% Tracé du signal échantilloné

plot(s2);
plot(s1);

% Tracé de la transformée de Fourier discrète

clf;
hold on;

plot_fft(s1, a);
plot_fft(s2, a);

% Tracé du spectre approché du signal

clf;
hold on;

half_n = floor(n / 2);
seg1 = 1:half_n;
seg2 = half_n+1:n;
plot(abs_tfd(seg1)     , tfd(seg1));
plot(abs_tfd(seg2) - fe, tfd(seg2));

s




% -------------------------------------------------------------------------
% -- QUESTION 2 -----------------------------------------------------------


Q = 4;
n = size(s, 2);

itv_sze  = 256;         % le nombre d'échantillons dans un intervalle
itv_sigs = zeros(Q, itv_sze);
itv_len = floor(2 / (Q + 1) * n) % la longueur d'un intervalle par rapport au signal

size(s, 1)
size(s, 2)
%s(1, 1:itv_len)

for i=1:Q
    i0  = floor((i-1) / (Q + 1) * n) + 1;   % index du premier échantillon
    itv_sigs(i, 1:itv_len) = s(i0:(i0+itv_len-1));
end

itv_tfd = abs(fft(itv_sigs));
mesh(itv_tfd, 1:q);
return;

clf;
hold on;

for i=1:Q
    %plot(abs(fft(itv_sigs(i, :))));
    itv_tfd = abs(fft(itv_sigs(i, :)));
    plot(itv_tfd(1:itv_sze/2));
end

%{
function [itvs] = partitionate(s, Q, n)
    prop = 2 / (Q + 1);
    itvs = zeros(Q, n);
  %}  






