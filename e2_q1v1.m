
a = 0.1; %période d'échantillonage

pts1 = subdivision_I(0, 256, a);
X1 = fnc(pts1)

pts2 = subdivision_I(0, 512, a);
X2 = fnc(pts2);

clf;
hold on;
%plot(pts2, X2);
plot(freqs(256, a), abs(fft(X1)));
plot(freqs(512, a), abs(fft(X2)));


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