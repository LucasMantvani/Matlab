
A = input("");

n = size(A, 1);


P = eye(n);
L = zeros(n,n);
U = A;

pks = {};
mks = {};


for k = 1:n-1
    [~, m] = max(abs(U(k:n,k)));
    p = m + k - 1;

    if p ~= k

        temp = P(k,1:end);
        P(k,1:end) = P(p, 1:end);
        P(p,1:end) = temp;

        temp = U(k,1:end);
        U(k,1:end) = U(p, 1:end);
        U(p,1:end) = temp;

        temp = L(k, 1:end);
        L(k,1:end) = L(p, 1:end);
        L(p,1:end) = temp;
    end

    Pk = eye(n);
    Pk([k,p],1:end) = Pk([p,k], 1:end);
    pks{end+1} = Pk;


    Mk = eye(n);
    Mk(k+1:end, k) = -U(k+1:end, k) / U(k, k);

    U(k+1:end, 1:end) = U(k+1:end, 1:end) + Mk(k+1:end, k) * U(k, 1:end);
    mks{end+1} = Mk;
    L(k+1:end, k) = -Mk(k+1:end, k);
end

% Ajuste dos valores da diagonal principal de L
L(1:n+1:end) = 1;

% Inversa de A
invA = inv(A);

% Impressão das matrizes
disp('inv(A) =');
disp(invA);

disp('L =');
disp(full(L));

disp('U =');
disp(U);

disp('P =');
disp(P);

% Impressão das matrizes de permutação
for i = 1:length(pks)
    fprintf('P%d =\n', i);
    disp(pks{i});
end

% Impressão das matrizes de eliminação
for i = 1:length(pks)
    fprintf('M%d =\n', i);
    disp(mks{i});
end
