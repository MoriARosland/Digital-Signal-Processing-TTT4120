A = 0.25;

fx = 0.04;
fy = 0.10;

L = 500;

% Sequences:
d_wave = generateD(A,L,fx,fy);
e = rand(1,L);
g = d_wave + e;

% FFT:
d_wave_fft_magnitude = abs(fft(d_wave));
g_fft_magnitude = abs(fft(g));
x=[0.99*exp(j*2*pi*fx) 0.99*exp(-j*2*pi*fx)];
y=[0.99*exp(j*2*pi*fy) 0.99*exp(-j*2*pi*fy)];

z=[-1 1];

[Hx,w]=freqz(poly(z),poly(x));
[Hy,w]=freqz(poly(z),poly(y));

H = Hx + Hy;
filter_denominator = [x,y];

q = filter(poly(z), poly(filter_denominator),g);

Q = abs(fft(q));

f=w/2/pi;

subplot(2,2,1);
plot(f,abs(H));
title('|H(f)|');
xlabel('Frequency');
ylabel('Magnitude');

subplot(2,2,3);
plot(q);
title('q[n]');
xlabel('Index [n]');
ylabel('Magnitude');

subplot(2,2,4);
plot(Q);
title('Q|(f)|');
xlabel('Frequency');
ylabel('Magnitude');

function d = generateD(A,L,f_x,f_y)
    d = [];
    d = zeros(1, 500);

    for n = 1 : 1 : L
        d(n) = A*cos(2*pi*f_x*n)+A*cos(2*pi*f_y*n);
    end
end