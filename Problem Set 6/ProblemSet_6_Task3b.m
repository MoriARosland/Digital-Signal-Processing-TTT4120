close all;

f1 = 7 / 40;
f2 = 9 / 40;

N = 1024;

n = 0 : 1000;
x = sin(2*pi*f1.*n)+sin(2*pi*f2.*n);

X = fft(x,N);
f = (0:N-1)./(N);
F = f.*N;

plot(f,abs(X));
xlim([0,0.5]);
xlabel('f');
ylabel('|X(f)|');