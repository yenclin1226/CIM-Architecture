% Initialization
num_samples = 1000; % Number of input matrices
input_matrices = randi([0, 256], 4, 4, num_samples); % Generate 100 random 4x4 integer matrices
weight_matrix = [0 16 0 0; 101 0 0 133; 127 230 100 39; 0 221 0 0];
compressed_matrix = [16 ;133;230;221];
restore_matrix = [0.368 0.788 0.165 0.273]; 

% Store results
original_results = zeros(4, 4, num_samples);
reconstructed_results = zeros(4, 4, num_samples);

% Loop through each input matrix
for i = 1:num_samples
    % Original multiplication
    input_matrix = input_matrices(:, :, i);
    original_result = input_matrix * weight_matrix;
    original_results(:, :, i) = original_result;
    
    % Compressed and restored multiplication
    compressed_result = input_matrix * compressed_matrix;
    reconstructed_result = compressed_result * restore_matrix;
    reconstructed_results(:, :, i) = reconstructed_result;
end

% Accuracy Comparison
% Compute the mean squared error (MSE) between original and reconstructed results
errors = zeros(num_samples, 1);
for i = 1:num_samples
    % Flatten matrices to vectors for error computation
    temp_result = original_results(:, :, i); % Extract the 4x4 matrix
    original_vector = temp_result(:); % Flatten to vector
    temp_reconstructed = reconstructed_results(:, :, i); % Extract the 4x4 matrix
    reconstructed_vector = temp_reconstructed(:); % Flatten to vector
    
    % Compute MSE
    errors(i) = mean((original_vector - reconstructed_vector).^2);
end


% Compute average MSE
average_mse = mean(errors);

% Compute accuracy as a percentage
% Accuracy (%) = (1 - (Average MSE / Variance of Original Results)) * 100

% Compute variance of the original results
original_values = original_results(:);
variance_original = var(original_values);

% Avoid division by zero
if variance_original == 0
    accuracy_percentage = 100;
else
    accuracy_percentage = (1 - (average_mse / variance_original)) * 100;
end

% Ensure accuracy is within 0% to 100%
accuracy_percentage = max(0, min(accuracy_percentage, 100));

% Display results
fprintf('Accuracy: %.2f%%\n', accuracy_percentage);
