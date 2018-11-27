A=1;
f0=1;
T_e=0.1;
duree=0.9;
t=0 :T_e :duree;
y=A*sin(2*pi*f0*t);
fe=1/T_e;
N=length(y);
Yfft=fft(y);
m=(0:(N-1)/2);
f=(m)/N*fe;
% tracé du spectre d’amplitude entre [0;fe/2]
figure
subplot(2,1,1)
if mod(N,2) == 0  \% test si N est pair pour le tracé du spectre
stem(f,abs(Yfft(1:N/2))/N)
else
stem(f,abs(Yfft(1:(N+1)/2))/N)
end
% la normalisation par N permet d’avoir les bonnes amplitudes au niveau
% du spectre
ylabel(’Abs(S(f))’)
% Le tracé du spectre peut s’effectuer de manière continu
% à l’aide de la fonction plot au lieu de stem.
title(’Spectre d’’amplitude')