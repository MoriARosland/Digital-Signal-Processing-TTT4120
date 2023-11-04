sequence_length = 1000;

random_noise = randn(1,sequence_length);

x = random_noise-0.4*random_noise;

% Order of AR-Process:
p1 = 1;
p2 = 2;
p3 = 3;

[ar_coeff_p1, error_var1] = aryule(x,p1);
[ar_coeff_p2, error_var2] = aryule(x,p2);
[ar_coeff_p3, error_var3] = aryule(x,p3);

disp(['First-order coefficients: ', num2str(ar_coeff_p1)]);
disp(['First-order sigma^2: ', num2str(error_var1)]);
disp(['Second-order coefficients: ', num2str(ar_coeff_p2)]);
disp(['Second-order sigma^2: ', num2str(error_var2)]);
disp(['Third-order coefficients: ', num2str(ar_coeff_p3)]);
disp(['Third-order sigma^2: ', num2str(error_var3)]);