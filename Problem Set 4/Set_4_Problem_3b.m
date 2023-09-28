% Filter coefficients
b_upper = [1.9,-1.9];
b_lower = [0.1,0.1];

a = [2,-1.8];

% Computes the frequency response
[h_upper,w_1] =freqz(b_upper,a);
[h_lower,w_2] = freqz(b_lower,a);

subplot(2,1,1);
plot(w_1,abs(h_upper));

axis([0,pi,0,1.5]);

title('Upper branch magnitude response');
xlabel('Angular frequency');
ylabel('Magnitude response');

subplot(2,1,2);
plot(w_2,abs(h_lower));

axis([0,pi,0,1.5]);

title('Lower branch magnitude response');
xlabel('Angular frequency');
ylabel('Magnitude response');
