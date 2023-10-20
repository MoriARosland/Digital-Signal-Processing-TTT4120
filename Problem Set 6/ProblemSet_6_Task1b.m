close all

N_x = 28;

N_1 = N_x / 4;
N_2 = N_x / 2;
N_3 = N_x;
N_4 = N_x * 2;

n = 0 : 1 : N_x - 1;
x_n = 0.9.^n;

fft_1 = fft(x_n,N_1);
fft_2 = fft(x_n,N_2);
fft_3 = fft(x_n,N_3);
fft_4 = fft(x_n,N_4);






