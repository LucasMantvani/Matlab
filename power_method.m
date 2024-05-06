% Definindo os vetores
vec_x = input("");
vec_m = input("");
vec_s = input("");

n = size(vec_m, 1);

A = zeros(n, n);

A(1, :) = vec_m;

for i = 1:n-1
  A(i+1, i) = vec_s(i);
end

old_x = vec_x;

max_iterations = 30;
lambda = 0;
iterations = 0;

while iterations < max_iterations
    iterations = iterations + 1;

    y = A * vec_x;

    vec_x = y / norm(y);

    lambda = vec_x' * A * vec_x;

    erro = abs(abs(vec_x' * old_x) - 1);

    if erro < 1e-6
        break;
    end

    old_x = vec_x;

end

disp('x = ');
disp(vec_x);
fprintf('k = %d\n', iterations);

