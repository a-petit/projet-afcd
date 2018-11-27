%{
    Trace la transformée de Fourier discrète du signal s,
    ayant été échantillonné avec un pas d'échantillonage a.
%}
function plot_fft(s, a, title)
    n      = size(s, 2);
    fe     = 1/a;
    domain = linspace(0, fe, n);
    plot(domain, abs(fft(s)), 'DisplayName', title);