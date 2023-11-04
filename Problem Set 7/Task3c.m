% Problem Task3c

close all

K = 100;  % Length of each segment
num_segments = 200;

sequence_length = K*num_segments;
white_noise = randn(1, sequence_length);

b = [1];
a = [1, 1/2];

x = filter(b, a, white_noise);



mean_estimates = zeros(1, num_segments);

for i = 1:num_segments
    start_index = (i - 1) * K + 1;
    end_index = i * K;
    
    segment = x(start_index:end_index);
    mean_estimates(i) = mean(segment);
end

varianceX = var(mean_estimates);
meanX = mean(mean_estimates);
varianceX
meanX


% Plot the histogram with 20 bins
histogram(mean_estimates, 20);
xlabel('Mean Estimates');
ylabel('Frequency');
title('Histogram of Mean Estimates');

