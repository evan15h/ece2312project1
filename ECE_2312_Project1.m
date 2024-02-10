clc;

inputDeviceID = audiodevinfo(1, 44100, 16, 1);
myRecorder = audiorecorder(44100, 16, 1, inputDeviceID);
recordblocking(myRecorder, 5);

%Get waveform data
myRecording = getaudiodata(myRecorder);
filename = 'ThirdPhrase.wav';
audiowrite(filename, myRecording, 44100);
