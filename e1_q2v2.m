

lambda_c = 15;
lambdas = -lambda_c:0.01:(lambda_c);

n = size(lambdas, 2);
res = zeros(1, n);
for k = 1:n
    res(k) = sn_lambda(lambdas(k));
end

clf;
hold on;
plot(lambdas, res)

% Renvoit le module de la transformée de fourier en lambda
function [s] = sn_lambda(lambda) 
    Fe = 32;
    F0 = 7;
    N  = 15;
    f0 = 0.2;
    a  = 1 / Fe;

    omega = pi * f0 * (1 - lambda / F0);
    s = (1 / Fe) * (cos(omega) + 1i * sin(omega)) * sin(2 * omega * N) / sin(omega);
    s = abs(s);
end
    



