clc;

Fs = 44100;

%Ryan- Head Size 20.0cm: 0.583ms Delay
%Leo- Head Size 20.5cm: 0.598ms Delay
%Evan- Head Size 20.8cm: 0.606ms Delay
%Average Delay:0.596ms Delay = about 26 padded zeros.


%Delay-------------------------------------------------------------------------------------------------------------------------------------------------

padded_zeros = [26, 44, 441, 4410];
time_delay = [0.596, 1, 10, 100]; %ms
i = 1;

%0ms Delay
filename = 'teamRLE-stereosoundfile-0ms.wav';
audiowrite(filename, [myRecording1 myRecording1], Fs);

%0.596ms, 1ms, 10ms, 100ms
for zero_change = padded_zeros
    time = time_delay(i);
    %L = padarray(myRecording1, zero_change, 0,'post');
    R = padarray(myRecording1, zero_change, 0,'pre');
    col_length = size(R, 1) - zero_change;
    final_R = R(1:col_length, :);
    Stereo = [myRecording1 final_R];
    filename = sprintf('teamRLE-stereosoundfile-%.3fms.wav', time);
    audiowrite(filename, Stereo, Fs);
    i = i+1;
end

%Attenuate-------------------------------------------------------------------------------------------------------------------------------------------------

dB_levels = [-1.5, -3, -6];

%For 0ms Delay
[myRecording1, Fs] = audioread('teamRLE-stereosoundfile-0ms.wav');
for dB_change = dB_levels
    attenuation_factor = 10^(dB_change/20);
    attenuatedR = myRecording1(:, 2)*attenuation_factor;
    attenuated_stereo = [myRecording1(:, 1), attenuatedR];
    filename = sprintf('teamRLE-stereosoundfile-0ms-%.1fdB.wav', dB_change);
    audiowrite(filename, attenuated_stereo, Fs);
end

%For 0.596ms Delay
[myRecording1, Fs] = audioread('teamRLE-stereosoundfile-0.596ms.wav');
for dB_change = dB_levels
    attenuation_factor = 10^(dB_change/20);
    attenuatedR = myRecording1(:, 2)*attenuation_factor;
    attenuated_stereo = [myRecording1(:, 1), attenuatedR];
    filename = sprintf('teamRLE-stereosoundfile-0.596ms-%.1fdB.wav', dB_change);
    audiowrite(filename, attenuated_stereo, Fs);
end

