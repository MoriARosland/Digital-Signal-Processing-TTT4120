% Problem 2 Task c

close all

sequence_length = 2000;
white_noise = randn(1, sequence_length);

b = [1];
a = [1, 1/2];

x = filter(b, a, white_noise);

x_mean = mean(x);
x_corr = xcorr(x) / sequence_length;
disp(['MeanX ' num2str(x_mean)]);
disp(['PowerX ' num2str(x_power)]);

t = 0:length(x) - 1;

% --- %
l = 0: 1 : 20000;
corr_calc = (-1/2).^abs(l);
correstimator = xcorr(corr_calc);
% --- %

% --- %
powertest = abs(fft(x_corr,sequence_length));
power_realtest = abs(fft(corr_calc,sequence_length));
% --- %


figure;
subplot(2,1,1);
plot(powertest);
title('Power density theory');
xlabel('Time (n)');
ylabel('Amplitude');

subplot(2,1,2);
plot(power_realtest);
title('Power density estimator');
xlabel('Time (n)');
ylabel('Amplitude');

x_power = 0;

for i = 1:2000
    x_power = x_power + x(i)^2;
end

x_power = x_power / sequence_length;
x_power

