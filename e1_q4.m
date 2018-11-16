
function [res] = sn_kt (k, T)
    Fe = 32;
    F0 = 7;
    N  = 15;
    f0 = 0.2;
    a  = 1 / Fe;
    
    res = a * fft(

