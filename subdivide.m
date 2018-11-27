
function [m] = subdivide(s, Q, out_length)
    n = size(s, 2);
    m = zeros(Q, out_length);
    read_len = floor(2 / (Q + 1) * n);

    for i=1:Q
        read_idx = floor((i-1) / (Q + 1) * n) + 1;
        m(i, 1:read_len) = s(read_idx:(read_idx+read_len-1));
    end
    