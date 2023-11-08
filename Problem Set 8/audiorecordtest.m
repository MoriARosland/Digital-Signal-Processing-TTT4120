recording = audiorecorder;

disp("Recording Started")
recordblocking(recording, 1);
disp("Recording Stopped")

y = getaudiodata(recording)
sound(y)
plot(y)