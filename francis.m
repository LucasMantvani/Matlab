A_input = input('');
epsilon_input = input('');

n = size(A_input, 1);
k_count = 0;
errors = [];
spd_status = 'não é';

if isequal(A_input, A_input') && all(eig(A_input) > 0)
    spd_status = 'é';
end

while true
    [Q, R] = qr(A_input);
    A_input = R * Q;
    off_A = sqrt(sum(sum(A_input.^2)) - sum(diag(A_input).^2));
    errors = [errors; off_A];

    k_count = k_count + 1;

    if off_A < epsilon_input
        D_sorted = sort(diag(A_input), 'descend');
        break;
    end
end

D_output = D_sorted;
k_output = k_count;
errors_output = errors;
spd_output = spd_status;

disp('D = ');
disp(D_output);
fprintf('k = %d\n', k_output);
disp('erros = ');
disp(errors_output);
fprintf('A %s SPD\n', spd_output);

