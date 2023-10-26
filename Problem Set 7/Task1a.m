% Problem Set 7 - Task 1a

close all;

sequence_length = 100;

t = 0 : sequence_length-1;

random_binary_x = 2* randi([0,1], 1, sequence_length)-1;
white_noise = randn(1, sequence_length);
uniform_noise = rand(1, sequence_length);

figure;


p1 = plot(t, random_binary_x, 'b');
hold on;

p2 = plot(t, white_noise, 'r');

p3 = plot(t, uniform_noise, 'black');

xlabel("Time");
ylabel("Amplitude");
legend([p1,p2,p3], 'Binary Noise', 'White Noise', 'Uniform Noise');

grid on;