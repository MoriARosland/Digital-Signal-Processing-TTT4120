close all

% Create an array of values between [0,1]:
f = 0 : 1/1000 : 1;

% Calculate X(f) for the given range:
N_x = 28;
X_f = (1-(0.9*exp(-j*2*pi*f)).^N_x)./(1-0.9*exp(-j*2*pi*f));
X_f = abs(X_f); % Magnitude response.

%Plot X(f):
plot(f,X_f);
xlabel('f');
ylabel('|X(f)|');
