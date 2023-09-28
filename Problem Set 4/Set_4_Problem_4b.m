close all

fx = 0.04;
fy = 0.10;

x=[0.99*exp(j*2*pi*fx) 0.99*exp(-j*2*pi*fx)];
y=[0.99*exp(j*2*pi*fy) 0.99*exp(-j*2*pi*fy)];

z=[-1 1];

zplane(z',x');
zplane(z',y');

[Hx,w]=freqz(poly(z),poly(x));
[Hy,w]=freqz(poly(z),poly(y));

f=w/2/pi;

subplot(2,1,1)
plot(f,abs(Hx));
title('H_x|(f)|');
xlabel('Frequency');
ylabel('Magnitude');

subplot(2,1,2)
plot(f,abs(Hy));
title('H_y|(f)|');
xlabel('Frequency');
ylabel('Magnitude');