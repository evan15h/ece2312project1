%This code generates the frequency and spectrogram waveforms for all three phrases given in the project

clc;
clear;
%---------------------------------------------------------------------------------------------------------------------
%Get audio data

[myRecording1, Fs1] = audioread('FirstPhrase.wav');

%Time base
num_samples = length(myRecording1); 
t1 = (0:num_samples-1)/Fs1;

%Plot
figure(1)
hold on;
plot(t1, myRecording1);
xlabel('Time (seconds)');
ylabel('Amplitude');
title('First Phrase Waveform');
grid on;
xlim([0 max(t1)]);
hold off;

%Spectrogram
figure(2)
hold on;
spectrogram(myRecording1,kaiser(256,5),220,512,Fs1,'yaxis');
ylim([0 8]); %Only show first 8kHz
title('First Phrase Spectrogram');
hold off;

%---------------------------------------------------------------------------------------------------------------------
%Get audio data

[myRecording2, Fs2] = audioread('SecondPhrase.wav');

%Time base
num_samples = length(myRecording2);
t2 = (0:num_samples-1)/Fs2;

%Plot
figure(3)
hold on;
plot(t2, myRecording2);
xlabel('Time (seconds)');
ylabel('Amplitude');
title('Second Phrase Waveform');
grid on;
xlim([0 max(t2)]);
hold off;

%Spectrogram
figure(4)
hold on;
spectrogram(myRecording2,kaiser(256,5),220,512,Fs2,'yaxis');
ylim([0 8]); %Only show first 8kHz
title('Second Phrase Spectrogram');
hold off;

%---------------------------------------------------------------------------------------------------------------------
%Get audio data

[myRecording3, Fs3] = audioread('ThirdPhrase.wav');

%Time base
num_samples = length(myRecording3);
t3 = (0:num_samples-1)/Fs3;

%Plot
figure(5)
hold on;
plot(t3, myRecording3);
xlabel('Time (seconds)');
ylabel('Amplitude');
title('Third Phrase Waveform');
grid on;
xlim([0 max(t3)]);
hold off;

%Spectrogram
figure(6)
hold on;
spectrogram(myRecording3,kaiser(256,5),220,512,Fs3,'yaxis');
ylim([0 8]); %Only show first 8kHz
title('Third Phrase Spectrogram');
hold off;
