close all

N_x = 28;
N_h = 9;
N_y = N_x + N_h - 1;

n = 0 : 1 : N_x - 1;

x_n = 0.9.^n;
h = ones(1, N_h);

y_n = conv(x_n,h);

Yfft = fft(y_n,N_y);
y = ifft(Yfft,N_y);
n = 0 : N_y-1;

Yfft_div4 = fft(y_n,N_y/4);
y_div4 = ifft(Yfft_div4,N_y/4);
nd4 = 0 : N_y/4-1;

Yfft_div2 = fft(y_n,N_y/2);
y_div2 = ifft(Yfft_div2,N_y/2);
nd2 = 0 : N_y/2-1;

Yfft_mul2 = fft(y_n,N_y*2);
y_mul2 = ifft(Yfft_mul2,N_y*2);
nm2 = 0 : N_y*2-1;

subplot(2,2,1);
stem(n,y_n);
title('N_y');

subplot(2,2,2);
stem(nd4,y_div4);
title('N_y/4');

subplot(2,2,3);
stem(nd2,y_div2);
title('N_y/2');

subplot(2,2,4);
stem(nm2,y_mul2);
title('N_y*2');


