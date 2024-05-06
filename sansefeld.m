A = input("");

n = size(A, 1);
betas = zeros(n, 1);

betas(1,1) = (sum(abs(A(1, 2:end))))/A(1, 1);

for i = 2:n
    sum_right = sum(abs(A(i, i+1:end)));
    sum_left  = sum(abs(A(i, 1:i-1))) * betas(i-1,1);

    betas(i,1) = (sum_right + sum_left)/A(i, i);
end

max_beta = max(betas(1:end, 1));

if max_beta <= 1
    satisfies = 'SATISFAZ';
else
    satisfies = 'NÃO SATISFAZ';
end

disp(satisfies);

