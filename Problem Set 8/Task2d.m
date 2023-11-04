close all

autocorrelation_xx = [1.16, -0.4, 0, 0]; % 1-indexed

matrix1 = [autocorrelation_xx(1)];

matrix2 = [autocorrelation_xx(1), autocorrelation_xx(2); autocorrelation_xx(2), autocorrelation_xx(1)];

matrix3 = [autocorrelation_xx(1), autocorrelation_xx(2), autocorrelation_xx(3);
           autocorrelation_xx(2), autocorrelation_xx(1), autocorrelation_xx(2);
           autocorrelation_xx(3), autocorrelation_xx(2), autocorrelation_xx(1)];

a1 = -inv(matrix1)*autocorrelation_xx(2);
var1 = (1*1.16)+(a1*(-0.4));
a2 = -inv(matrix2)*[autocorrelation_xx(2), autocorrelation_xx(3)]';
var2 = sum([1 a2'].*autocorrelation_xx(1:3));
a3 = -inv(matrix3)*[autocorrelation_xx(2), autocorrelation_xx(3), autocorrelation_xx(4)]';
var3 = sum([1 a3'].*autocorrelation_xx(1:4));

N = 1024; % Length of the PSD vector
frequencies = linspace(0, 0.5, N);

%PDS = var1 ./ (abs(1 + a1 * exp(-1i * 2 * pi * frequencies))).^2;
%PDS = var2 ./ (abs(1 + a2 * exp(-1i * 2 * pi * frequencies))).^2;
PDS = var3 ./ (abs(1 + a3 * exp(-1i * 2 * pi * frequencies))).^2;

figure;
plot(frequencies, PDS);
title('Power Density Spectrum of AR(3) Process');
xlabel('Normalized Frequency');
ylabel('Power/Frequency (dB/Hz)');
grid on;
axis([0, 0.5, 0, 3]);