autocorrelation_xx = [1.16, -0.4, 0, 0]; % 1-indexed

matrix1 = [autocorrelation_xx(1)];

matrix2 = [autocorrelation_xx(1), autocorrelation_xx(2); autocorrelation_xx(2), autocorrelation_xx(1)];

matrix3 = [autocorrelation_xx(1), autocorrelation_xx(2), autocorrelation_xx(3);
           autocorrelation_xx(2), autocorrelation_xx(1), autocorrelation_xx(2);
           autocorrelation_xx(3), autocorrelation_xx(2), autocorrelation_xx(1)];


% Optimal first-order predictors:
a1 = -inv(matrix1)*autocorrelation_xx(2);
var1 = (1*1.16)+(a1*(-0.4));
disp(['First-order coefficients: ', num2str(a1)])
disp(['First-order variance: ', num2str(var1)])

% Optimal second-order predictors:
a2 = -inv(matrix2)*[autocorrelation_xx(2), autocorrelation_xx(3)]';
var2 = sum([1 a2'].*autocorrelation_xx(1:3));
disp(['Second-order coefficients: ', num2str(a2')])
disp(['Second-order variance: ', num2str(var2)])

% Optimal third-order predictors:
a3 = -inv(matrix3)*[autocorrelation_xx(2), autocorrelation_xx(3), autocorrelation_xx(4)]';
var3 = sum([1 a3'].*autocorrelation_xx(1:4));
disp(['Third-order coefficients: ', num2str(a3')])
disp(['Third-order variance: ', num2str(var3)])





