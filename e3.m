clf;

% -- Données inittiales

f  = 1;      % La fréquence du signal
Fe = 20;     % La fréquence d'échantillonage
a  = 1/Fe;   % Le pas d'échantillonage

% -- Génération du signal échantilloné

N = 40;
s = zeros(1, N);
for i = 1:N
    s(1, i) = sin((i-1) * a * 2 * pi);
end

% -- Génération du filtre

d = zeros(1, N);
for i = 1:4
    d(1,i) = 1/4;
end

% -- Aperçu du signal et du filtre

hold on
domain = 0:a:(2-a);
plot(domain, s, 'DisplayName','le signal');
plot(domain, d, 'DisplayName','le filtre');

%{
clf;
hold on;
plot(abs(fft(s)));
plot(abs(fft(d)));
return;
%}

% -- Calcul du signal filtré

g = ifft(fft(d) .* fft(s));
plot(domain, g, 'DisplayName','le signal filtré');


% -- Reconstitution du signal

s1 = ifft(fft(g) .* invert(fft(d), 1.0e-10));
plot(domain, s1, 'ob', 'DisplayName','le signal reconstitué');
legend()

% -- Fonction d'inversion

function [invD] = invert(d, eps)
    assert(eps > 0);
    n = size(d, 2);
    invD = zeros(1, n);
    for k = 1:n
        if abs(d(1, k)) > eps
            invD(1, k) = 1 / d(1, k);
        else 
            invD(1, k) = 1 / eps;
        end
    end
end
