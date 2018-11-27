%{
    Renvoit l'échantillonage sur une durée T d'un signal ayant 
    pour fréquence f1 sur une durée T1, puis
    pour fréquence f2 sur une durée T2, puis
    complétée par des zéros.

    Le signal est échantilloné avec un pas 'a'.
%}
function [s] = sampling(T1, T2, T, f1, f2, a)
    n = ceil(T / a);
    s = zeros(1, n);
    
    n1         = floor(T1 / a);
    thetas     = linspace(0, T1 * f1 * 2 * pi, n1 + 1); % +1 for offset
    s(1, 1:n1) = sin(thetas(1:n1));
    offset     = sin(thetas(n1 + 1));

    n2         = floor(T2/a);
    thetas     = linspace(0, T2 * f2 * 2 * pi, n2);
    s(1, (n1 + 1):(n1 + n2)) = sin(offset + thetas);
end