close all

N_x = 28;
N_h = 9;

n = 0 : 1 : N_x - 1;

x_n = 0.9.^n;
h = ones(1, N_h);

y_n = conv(x_n,h);
n = 0 : length(y_n) - 1;
stem(n,y_n);
xlabel('n');
ylabel('y(n)');


