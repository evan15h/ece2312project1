%Code used to initially record all three phrases using MATLAB

clc;

inputDeviceID = audiodevinfo(1, 44100, 16, 1); %Obtain appropriate ID for the Samsung Book3 audio device
myRecorder = audiorecorder(44100, 16, 1, inputDeviceID);
recordblocking(myRecorder, 5);

myRecording = getaudiodata(myRecorder);
filename = 'ThirdPhrase.wav'; %'FirstPhrase', 'SecondPhrase', 'ThirdPhrase'...
audiowrite(filename, myRecording, 44100);
