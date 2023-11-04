close all

sequence_length = 20000;
white_noise = randn(1, sequence_length);

b = [1];
a = [1, 1/2];

x = filter(b, a, white_noise);

% Parameters for the Bartlett method
fs = 1;              % Sampling frequency (change as needed)

% Number of segments
K_values = [10, 100];

% Create subplots for each K value
for i = 1:length(K_values)
    K = K_values(i);

    % Calculate the segment length
    segment_length = length(x) / K;

    % Estimate the power spectral density using the Bartlett method
    [pxx, f] = pwelch(x, hamming(segment_length), 0, segment_length, fs);

    % Create a new figure for each K value
    figure;
    plot(f, 10*log10(pxx));
    title(['Power Spectral Density (K = ' num2str(K) ')']);
    xlabel('Frequency (Hz)');
    ylabel('Power/Frequency (dB/Hz)');
end
