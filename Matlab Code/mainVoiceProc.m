close all;

audioFile = 'C:\Users\sebno\Dropbox\Subject\Sub1\Hello\Hello World\Hello World_5\Hello World_5_audio1.wav';
[audioData, fs] = audioread(audioFile);

% Create time axis
time = 1 : size(audioData);
time = (1.0 / fs) .* time; 

% Plot audio waveform
figure();
subplot(2,1,1);
plot(time, audioData);
ax = gca;
ax.Title.String = 'Audio Waveform of "Hello World"';
ax.XLabel.String = 'Time(s)';


s = spectrogram(audioData);