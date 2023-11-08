close all

load("vowels.mat")

recorded_vowel = audiorecorder;
recording_duration = 1; % seconds

% Record your vowel:
disp("Recording Started")
recordblocking(recorded_vowel, recording_duration);
disp("Recording Stopped")

audio_data = getaudiodata(recorded_vowel);

%vowel = v{1};
vowel = audio_data;
desired_vowel = v{2};

% Compute coefficients a using linear prediction filter (AR[10]):
vowel_coefficients = lpc(vowel,10);
desired_vowel_coefficients = lpc(desired_vowel,10);

vowel_prediction_error = filter(vowel_coefficients,1,vowel);

transformed_vowel = filter(1,desired_vowel_coefficients,vowel_prediction_error);

sound(vowel) % Original recorded vowel
pause(2)
sound(transformed_vowel) % New vowel (the transformed vowel)