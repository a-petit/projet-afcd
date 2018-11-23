% taille intervalle
T = 256;
% nb sous intervalles
Q = 12;
% taille des sous intervalles
Tq = 2*T/(Q+1);
%periode entre deux intervalles 
p = T/(Q+1);
results = zeros(Q, 128);
abscisses = zeros(Q, 128);
for i = 1:128
    abscisses(:,i) = i*ones(Q,1);
end


for i = 0:Q-1
   sub = subdivision_I(i*p, i*p+256, 1);
   X = fnc(sub);
   FFT = fft(X);
   res = abs(FFT);
   results(i+1, :) =  res(1:128);
end

%mesh(results);
clf;
hold on;
contour(linspace(0, 0.5, 128), 1:Q, results);%0.5 est fe/2 où fe =1/a avec a=1
mesh(linspace(0, 0.5, 128), 1:Q, results);


function [y] = fnc(pts)
k=1;
y=[];
for t = pts
    f1 = 0.1;
    f2 = 0.2;

    if t<=128
        y(k) = sin(2*pi*t*f1);
    elseif t<=192
        y(k) = sin(2*pi*t*f2);
    else 
        y(k) = 0;
    end
    k = k+1;
end
end

function [points] = subdivision_I(t0, T, a)
    points = linspace(t0,T,ceil(T/a));
end

function [map_frequences] = freqs(T, a)
    map_frequences = linspace(0, 1/a, ceil(T/a));
end