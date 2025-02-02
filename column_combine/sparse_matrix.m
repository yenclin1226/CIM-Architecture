

sparsity =50; % Define sparsity percentage (e.g., 50%)
result_matrix = generate_sparse_matrix(sparsity);

% Display the result
disp('Generated Sparse Matrix:');
disp('[');
for i = 1:size(result_matrix, 1)
    fprintf('   [%3d, %3d, %3d, %3d],\n', result_matrix(i, :));
end
disp(']');  

function sparse_matrix = generate_sparse_matrix(sparsity_percentage)
    % Generate a random 4x4 matrix with integer values between 0 and 9
    matrix = randi([0,255], 4, 4);
    
    % Calculate the number of zero elements based on sparsity percentage
    total_elements = numel(matrix);
    num_zeros = round(total_elements * sparsity_percentage / 100);
    
    % Randomly choose indices to set to zero
    zero_indices = randperm(total_elements, num_zeros);
    matrix(zero_indices) = 0;
    
    % Return the sparse matrix
    sparse_matrix = matrix;
end
