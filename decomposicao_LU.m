function crout_decomposition(A)

    [n, ~] = size(A);

    L = zeros(n);
    U = eye(n);


    for k = 1:n

        for j = k:n

            L(j, k) = A(j, k) - L(j, 1:k-1) * U(1:k-1, k);
        end

        for i = k+1:n

            U(k, i) = (A(k, i) - L(k, 1:k-1) * U(1:k-1, i)) / L(k, k);
        end
    end

    printf("L = \n");
    disp(L);
    printf("U = \n");
    disp(U);
end


A = input("");

crout_decomposition(A)