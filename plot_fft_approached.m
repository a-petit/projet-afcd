%{
    Trace la transformée de Fourier approchée du signal s,
    ayant été échantillonné avec un pas d'échantillonage a.
%}
function [out] = plot_fft_approached(s, a)
    n       = size(s, 2);
    half_n  = floor(n / 2);
    fe      = 1/a;
    domain  = linspace(0, fe, n);
 
    seg1        = 1:half_n;
    seg2        = half_n+1:n;
    fft_module  = abs(fft(s));
    
    %plot(domain(seg1)     , fft_module(seg1));
    %plot(domain(seg2) - fe, fft_module(seg2));
    
    x = [domain(seg1),     domain(seg2)    ];
    y = [fft_module(seg1), fft_module(seg2)];
    
    plot(x, y);
    
    out = y;