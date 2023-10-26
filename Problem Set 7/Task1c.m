% Problem Set 7 Task 1c

sequence_length = 2000;

random_binary_x = 2* randi([0,1], 1, sequence_length)-1;
white_noise = randn(1, sequence_length);
uniform_noise = rand(1, sequence_length);

% Calculate the mean of each sequence
mean_random_binary_x = mean(random_binary_x);
mean_white_noise = mean(white_noise);
mean_uniform_noise = mean(uniform_noise);

% Display the means
disp(['Mean of random_binary_x: ' num2str(mean_random_binary_x)]);
disp(['Mean of white_noise: ' num2str(mean_white_noise)]);
disp(['Mean of uniform_noise: ' num2str(mean_uniform_noise)]);

% Find the autocorrelation of each sequence
auto_corr_random_binary_x = xcorr(random_binary_x, 'coeff');
auto_corr_white_noise = xcorr(white_noise, 'coeff');
auto_corr_uniform_noise = xcorr(uniform_noise, 'coeff');

% Define the lag values
lag = -10:10;

% Plot the autocorrelation results for the specified lag interval using stem()
subplot(3, 1, 1);
stem(lag, auto_corr_random_binary_x(sequence_length - 10:sequence_length + 10));
title('Autocorrelation of Random Binary Sequence');

subplot(3, 1, 2);
stem(lag, auto_corr_white_noise(sequence_length - 10:sequence_length + 10));
title('Autocorrelation of White Noise Sequence');

subplot(3, 1, 3);
stem(lag, auto_corr_uniform_noise(sequence_length - 10:sequence_length + 10));
title('Autocorrelation of Uniform Noise Sequence');