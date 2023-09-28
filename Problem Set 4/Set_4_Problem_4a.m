A = 0.25;

f_x = 0.04;
f_y = 0.10;

L = 500;

% Sequences:
d_wave = generateD(A,L,f_x,f_y);
e = rand(1,L);
g = d_wave + e;

% FFT:
d_wave_fft_magnitude = abs(fft(d_wave));
g_fft_magnitude = abs(fft(g));

subplot(3,2,1);
plot(d_wave);
title('d(n)');
xlabel('Index [n]');
ylabel('Magnitude');

subplot(3,2,3);
plot(e);
title('e(n)');
xlabel('Index [n]');
ylabel('Magnitude');

subplot(3,2,5);
plot(g);
title('g(n)');
xlabel('Index [n]');
ylabel('Magnitude');

subplot(3,2,2);
plot(d_wave_fft_magnitude);
title('|D(f)|');
xlabel('Frequency');
ylabel('Magnitude');

subplot(3,2,6);
plot(g_fft_magnitude);
title('|G(f)|');
xlabel('Frequency');
ylabel('Magnitude');
ylim([0, 80]);

function d = generateD(A,L,f_x,f_y)
    d = [];
    d = zeros(1, 500);

    for n = 1 : 1 : L
        d(n) = A*cos(2*pi*f_x*n)+A*cos(2*pi*f_y*n);
    end
end




 
