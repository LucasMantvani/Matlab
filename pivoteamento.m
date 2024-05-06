function pivoteamento(A)

    [n, ~] = size(A);

    L = eye(n);
    U = A;
    P = eye(n);
    Pk = zeros(n, n, n-1);
    Mk = zeros(n, n, n-1);

    % Aplicar eliminação de Gauss com pivoteamento parcial
    for k = 1:n-1
        % Encontrar o pivô
        [~, max_row] = max(abs(U(k:n, k)));
        max_row = max_row + k - 1;

        % Trocar linhas na matriz U e na matriz de permutação
        U([k, max_row], :) = U([max_row, k], :);
        P([k, max_row], :) = P([max_row, k], :);

        % Calcular a matriz de eliminação
        M = eye(n);
        M(k+1:end, k) = -U(k+1:end, k) / U(k, k);

        % Atualizar as matrizes L, U e P
        U = M * U;
        L = L * inv(M);
        Pk(:, :, k) = P;
        Mk(:, :, k) = M;
    end

    % Calcular a inversa de A
    inv_A = inv(U) * inv(L) * P;

    % Mostrar as matrizes na tela
    fprintf("inv(A) =\n");
    disp(inv_A);
    fprintf("L =\n");
    disp(L);
    fprintf("U =\n");
    disp(U);
    fprintf("P =\n");
    disp(P);
    % Mostrar as matrizes de permutação e eliminação
    for k = 1:size(A, 1)-1
        fprintf("P%d =\n", k);
        disp(Pk(:, :, k));
    end
    for k = 1:size(A, 1)-1
        fprintf("M%d =\n", k);
        disp(Mk(:, :, k));
    end
end

% Exemplo de uso
teste = [2, 4, 2; 1, -1, 3; 3, 1, 1];
pivoteamento(teste);

