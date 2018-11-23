N = 15
Fe = 32
F0 = 7
f0 = 0.2
a = 1/Fe


plot(-N:N-1, abs(fft(sN_ksurT(a, k, N, x(-N:N-1, F0, a)))))


%argument : le vecteur X des x de x(-N) à x(N-1) de longueur 2N
function [res] = sN_ksurT(a, k, N, X)
    res = 0
    for n = 0:2*N-1
        res = res + X(n+1)*exp(-n*1i*pi*k/N)
    end
    res = a*exp(1i*pi*k)*res
end

function [res] = x(k, F0, a)
    res = exp(2*1i*pi*F0*a*k)
end