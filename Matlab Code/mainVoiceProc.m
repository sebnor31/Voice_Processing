close all;

audioFile = 'C:\Users\nsebkhi3\Dropbox\Subject\Sub1\Hello\Hello World\Hello World_5\Hello World_5_audio1.wav';
[audioData, fs] = audioread(audioFile);

%% Get output parameters after applying downsampling and VAD
ADR = 10;
FrameLen = 300; %256
StepLen = 210;  %200
[ startTime, stopTime, totalTime, audioOut, fsOut ] = getActiveSpeech( audioFile, ADR, FrameLen, StepLen);

%% Plot audio waveform
figure();
subplot(2,1,1);
hold on;

% Create time axis
numAudioPts = size(audioOut);
time = 0 : ( numAudioPts - 1);
time = (1.0 / fsOut) .* time; 

% Plot downsampled audio data as waveform with start and stop active speech
plot(time, audioOut);
plot([startTime startTime], [-1 1], 'g', 'LineWidth', 2);
plot([stopTime stopTime], [-1 1], 'r', 'LineWidth', 2);
hold off;

% Format axis
ax = gca;
ax.Title.String = 'Audio Waveform of "Hello World"';
ax.XLabel.String = 'Time(s)';