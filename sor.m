A = [9 4 0; 4 9 -1; 0 -1 9];
b = [20; 12; 51];
omega = 1;
epsilon = 1e-2;
kmax = 20;

n = length(b);
x = zeros(n, 1);
L = tril(A, -1);
D = diag(diag(A));
R = triu(A, 1);

iter = 0;
res = [];

while iter < kmax

    x_old = x;

    for i = 1:n

        sigma = L(i, :) * x + R(i, :) * x_old;
        x(i) = omega * ((b(i) - sigma) / A(i, i)) + (1 - omega) * x_old(i);

    end
    iter = iter + 1;
    residual = norm(A * x - b);
    res = [res; residual];
    if residual < epsilon
        break;
    end
end

disp('x = ');
disp(x);
disp('iter = ');
disp(iter);
disp('hres = ');
disp(res);
