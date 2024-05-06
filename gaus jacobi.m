function jacobi(A, b, x0, tol)
    n = length(b);
    x = x0;
    err = Inf;
    k = 0;
    
    while err > tol
        x_old = x;
        for i = 1:n
            sigma = 0;
            for j = 1:n
                if j ~= i
                    sigma = sigma + A(i,j) * x_old(j);
                end
            end
            x(i) = (b(i) - sigma) / A(i,i);
        end
        err = norm(x - x_old) / norm(x);
        k = k + 1;
    end
    
    fprintf("k = %d\n", k);
    disp("x =");
    disp(x);
end

A   = input("");
b   = input("");
x0  = input("");
tol = input("");


jacobi(A, b, x0, tol);
