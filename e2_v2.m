% -------------------------------------------------------------------------
% -- QUESTION 1 -----------------------------------------------------------

h  = 1.1

s1_color = 'b'
s2_color = 'm'

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
clf;
hold on;
ylim([-h h]);

%plot(s2, s2_color, 'DisplayName', 'signal s2');
plot(s1, s1_color, 'DisplayName', 'signal s1');
%title('Superposition des signaux s1 et s2');
title('Signal s1');
%title('Signal s2');
xlabel('t')
ylabel('s(t)')
legend()
%return;

% Tracé de la transformée de Fourier discrète
clf;
hold on;

fe = 1/a;

domain = linspace(0, fe, size(s1, 2));
plot(domain, abs(fft(s1)), s1_color, 'DisplayName', '|fft(s1)|');

domain = linspace(0, fe, size(s2, 2));
plot(domain, abs(fft(s2)), s2_color, 'DisplayName', '|fft(s2)|');

%plot_fft(s1, a, '|fft(s1)|');
%plot_fft(s2, a, '|fft(s2)|');
%title('Superposition des modules de la TFD de s1 et s2');
%title('Module de la TFD de s2');
title('Module de la TFD de s1');
xlabel('\lambda')
ylabel('|fft(s)|')
legend()
%return;

% Tracé du spectre approché du signal
clf;
hold on;

%domain = linspace(-fe/2, fe/2, size(s2, 2));
%plot(domain, fftshift(abs(fft(s2))), s2_color, 'DisplayName', 'Spectre approché de s2');

domain = linspace(-fe/2, fe/2, size(s1, 2));
plot(domain, fftshift(abs(fft(s1))), s1_color, 'DisplayName', 'Spectre approché de s1');

title('Approximation du spectre de s1');
%title('Module de la TFD de s2');
%title('Module de la TFD de s1');
xlabel('\lambda')
%ylabel('|fft(s)|')

%plot_fft_approached(s1, a);
%plot_fft_approached(s2, a);
legend()
%return;

% -------------------------------------------------------------------------
% -- QUESTION 2 -----------------------------------------------------------

Q = 16;
m = subdivide(s1, Q, 256);

clf;
hold on

p = zeros(Q, 128);

for i=1:Q
    tfa = plot_fft_approached(m(i,:), a);
    p(i, :) = tfa(1:128);
end

clf;
hold on

x = linspace(0, 0.5, 128);

fe  = 1/a;
x   = linspace(0, fe/2, 128);

y = 1:Q;
%mesh(x, y, p);
contour(x, y, p);

for Q=2:16
    plot_subdiv(Q, s1, a)
end

function plot_subdiv(Q, s, a)
    m = subdivide(s, Q, 256);
    p = zeros(Q, 128);

    for i=1:Q
        tfa = plot_fft_approached(m(i,:), a);
        p(i, :) = tfa(1:128);
    end

    clf;
    hold on

    fe  = 1/a;
    x   = linspace(0, fe/2, 128);

    y = 1:Q;
    %mesh(x, y, p);
    contour(x, y, p);
    
    saveas(gcf, strcat('img/ex2_contour', int2str(Q), '.png'))
end