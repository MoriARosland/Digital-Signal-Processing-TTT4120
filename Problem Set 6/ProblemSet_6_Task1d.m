close all

N_x = 28;

% Create an array of values between [0,1]:
f = 0 : 1/100000 : 1;

% Calculate X(f) for the given range:
X_f = (1-(0.9*exp(-j*2*pi*f)).^N_x)./(1-0.9*exp(-j*2*pi*f));
X_f = abs(X_f); % Magnitude response.



N_1 = N_x / 4;
N_2 = N_x / 2;
N_3 = N_x;
N_4 = N_x * 2;

n = 0 : 1 : N_x - 1;
x_n = 0.9.^n;

fft_1 = fft(x_n,N_1);
k1 = 0 : 1 : N_1-1;
f1 = k1./N_1;

fft_2 = fft(x_n,N_2);
k2 = 0 : 1 : N_2-1;
f2 = k2./N_2;

fft_3 = fft(x_n,N_3);
k3 = 0 : 1 : N_3-1;
f3 = k3./N_3;

fft_4 = fft(x_n,N_4);
k4 = 0 : 1 : N_4-1;
f4 = k4./N_4;

subplot(2,2,1);
plot(f,X_f);
hold on;
stem(f1,abs(fft_1));
title("N = 7");
xlabel('f');
ylabel('|X(f)|');

subplot(2,2,2);
plot(f,X_f);
hold on;
stem(f2,abs(fft_2));
title("N = 14");
xlabel('f');
ylabel('|X(f)|');

subplot(2,2,3);
plot(f,X_f);
hold on;
stem(f3,abs(fft_3));
title("N = 28");
xlabel('f');
ylabel('|X(f)|');

subplot(2,2,4);
plot(f,X_f);
hold on;
stem(f4,abs(fft_4));
title("N = 56");
xlabel('f');
ylabel('|X(f)|');




