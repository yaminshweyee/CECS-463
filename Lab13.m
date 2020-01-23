%% Lab13
%    Name : Yamin Yee
%    Date : Dec 5, 2019
%    Lab Assignment : #13  

clear all; close all; clc; format compact;
disp('Lab #13');
disp(' ');
disp('%%%% Yamin Yee          %%%%');
disp('%%%% CECS 463 Fall 2019 %%%%');
disp('%%%% Lab Assignment #13 %%%%');
disp('%%%% 12/05/2019          %%%%');
disp(' ');
str=datestr(now); disp(['Matlab Time Stamp: ',str]);
disp('');
clc;close all;clear all;

%% Problem 1
%%  440 Hz
Fs = 44100; % sampling frequency in Hz

N = Fs * 2; % length of the 2 sec signal

n = 0:N-1; % discrete time variable

f_analog = 440; % analog frequency in Hz

w_dig = 2*pi*f_analog/Fs; % radian digital frequency

x = cos(w_dig * n); % the signal

% Normalize samples to the range [-1,1]

% Not really needed here b/c cos is already in this range,

% but done anyway to illustrate how you normalize.

x = x / max(abs(x));

sound(x,Fs,16); % play it through sound card

X = fftshift(fft(x)); % centered DFT

Xmag = abs(X); % centered DFT magnitude

XmagdB = 20*log10(Xmag); % convert to dB

% Plot the centered magnitude against analog frequency

w = -pi:2*pi/N:pi-2*pi/N; % dig rad freq vector

f = w * Fs /(2*pi); % analog freq vector

figure(1);

plot(f,XmagdB);

xlim([-20000 20000]);

title('Centered DFT Magnitude for 100 Hz  Tone');

xlabel('analog frequency, Hz');

ylabel('dB');

% Plot the centered magnitude against radian digital freq

figure(2);

plot(w,XmagdB);

xlim([-pi pi]);

title('Centered DFT Magnitude for 440 Hz Pure Tone');

xlabel('radian digital frequency \omega');

ylabel('dB');

% Plot against normalized digital frequency

figure(3);

plot(w/pi,XmagdB);

xlim([-1 1]);

title('Centered DFT Magnitude for 440 Hz Tone');

xlabel('normalized digital frequency \omega/\pi');

ylabel('dB');

% wait 3 seconds in case sound card is still busy pause(3);

audiowrite('A-440.wav',x,Fs); % write to wave file

[x2,Fs] = audioread('A-440.wav'); % read it back in

sound(x2,Fs,16); 

%% 441 Hz

Fs = 44100; % sampling frequency in Hz

N = Fs * 2; % length of the 2 sec signal

n = 0:N-1; % discrete time variable

f_analog = 441; % analog frequency in Hz

w_dig = 2*pi*f_analog/Fs; % radian digital frequency

x = cos(w_dig * n); % the signal

% Normalize samples to the range [-1,1]

% Not really needed here b/c cos is already in this range,

% but done anyway to illustrate how you normalize.

x = x / max(abs(x));

sound(x,Fs,16); % play it through sound card

X = fftshift(fft(x)); % centered DFT

Xmag = abs(X); % centered DFT magnitude

XmagdB = 20*log10(Xmag); % convert to dB

% Plot the centered magnitude against analog frequency

w = -pi:2*pi/N:pi-2*pi/N; % dig rad freq vector

f = w * Fs /(2*pi); % analog freq vector

figure(1);

plot(f,XmagdB);

xlim([-20000 20000]);

title('Centered DFT Magnitude for 100 Hz  Tone');

xlabel('analog frequency, Hz');

ylabel('dB');

% Plot the centered magnitude against radian digital freq

figure(2);

plot(w,XmagdB);

xlim([-pi pi]);

title('Centered DFT Magnitude for 441 Hz Pure Tone');

xlabel('radian digital frequency \omega');

ylabel('dB');

% Plot against normalized digital frequency

figure(3);

plot(w/pi,XmagdB);

xlim([-1 1]);

title('Centered DFT Magnitude for 441 Hz Tone');

xlabel('normalized digital frequency \omega/\pi');

ylabel('dB');

% wait 3 seconds in case sound card is still busy pause(3);

audiowrite('A-441.wav',x,Fs); % write to wave file

[x2,Fs] = audioread('A-441.wav'); % read it back in

sound(x2,Fs,16); 

%% 445 Hz

Fs = 44100; % sampling frequency in Hz

N = Fs * 2; % length of the 2 sec signal

n = 0:N-1; % discrete time variable

f_analog = 445; % analog frequency in Hz

w_dig = 2*pi*f_analog/Fs; % radian digital frequency

x = cos(w_dig * n); % the signal

% Normalize samples to the range [-1,1]

% Not really needed here b/c cos is already in this range,

% but done anyway to illustrate how you normalize.

x = x / max(abs(x));

sound(x,Fs,16); % play it through sound card

X = fftshift(fft(x)); % centered DFT

Xmag = abs(X); % centered DFT magnitude

XmagdB = 20*log10(Xmag); % convert to dB

% Plot the centered magnitude against analog frequency

w = -pi:2*pi/N:pi-2*pi/N; % dig rad freq vector

f = w * Fs /(2*pi); % analog freq vector

figure(1);

plot(f,XmagdB);

xlim([-20000 20000]);

title('Centered DFT Magnitude for 445 Hz  Tone');

xlabel('analog frequency, Hz');

ylabel('dB');

% Plot the centered magnitude against radian digital freq

figure(2);

plot(w,XmagdB);

xlim([-pi pi]);

title('Centered DFT Magnitude for 445 Hz Pure Tone');

xlabel('radian digital frequency \omega');

ylabel('dB');

% Plot against normalized digital frequency

figure(3);

plot(w/pi,XmagdB);

xlim([-1 1]);

title('Centered DFT Magnitude for 445 Hz Tone');

xlabel('normalized digital frequency \omega/\pi');

ylabel('dB');

% wait 3 seconds in case sound card is still busy pause(3);

audiowrite('A-445.wav',x,Fs); % write to wave file

[x2,Fs] = audioread('A-445.wav'); % read it back in

sound(x2,Fs,16);

%% Problem 2
%%  100 Hz
Fs = 44100; % sampling frequency in Hz

N = Fs * 2; % length of the 2 sec signal

n = 0:N-1; % discrete time variable

f_analog = 100; % analog frequency in Hz

w_dig = 2*pi*f_analog/Fs; % radian digital frequency

x = cos(w_dig * n); % the signal

% Normalize samples to the range [-1,1]

% Not really needed here b/c cos is already in this range,

% but done anyway to illustrate how you normalize.

x = x / max(abs(x));

sound(x,Fs,16); % play it through sound card

X = fftshift(fft(x)); % centered DFT

Xmag = abs(X); % centered DFT magnitude

XmagdB = 20*log10(Xmag); % convert to dB

% Plot the centered magnitude against analog frequency

w = -pi:2*pi/N:pi-2*pi/N; % dig rad freq vector

f = w * Fs /(2*pi); % analog freq vector

figure(1);

plot(f,XmagdB);

xlim([-20000 20000]);

title('Centered DFT Magnitude for 100 Hz  Tone');

xlabel('analog frequency, Hz');

ylabel('dB');

% Plot the centered magnitude against radian digital freq

figure(2);

plot(w,XmagdB);

xlim([-pi pi]);

title('Centered DFT Magnitude for 100 Hz Pure Tone');

xlabel('radian digital frequency \omega');

ylabel('dB');

% Plot against normalized digital frequency

figure(3);

plot(w/pi,XmagdB);

xlim([-1 1]);

title('Centered DFT Magnitude for 100 Hz Tone');

xlabel('normalized digital frequency \omega/\pi');

ylabel('dB');

% wait 3 seconds in case sound card is still busy pause(3);

audiowrite('A-100.wav',x,Fs); % write to wave file

[x2,Fs] = audioread('A-100.wav'); % read it back in

sound(x2,Fs,16); 

%%  250 Hz
Fs = 44100; % sampling frequency in Hz

N = Fs * 2; % length of the 2 sec signal

n = 0:N-1; % discrete time variable

f_analog = 250; % analog frequency in Hz

w_dig = 2*pi*f_analog/Fs; % radian digital frequency

x = cos(w_dig * n); % the signal

% Normalize samples to the range [-1,1]

% Not really needed here b/c cos is already in this range,

% but done anyway to illustrate how you normalize.

x = x / max(abs(x));

sound(x,Fs,16); % play it through sound card

X = fftshift(fft(x)); % centered DFT

Xmag = abs(X); % centered DFT magnitude

XmagdB = 20*log10(Xmag); % convert to dB

% Plot the centered magnitude against analog frequency

w = -pi:2*pi/N:pi-2*pi/N; % dig rad freq vector

f = w * Fs /(2*pi); % analog freq vector

figure(1);

plot(f,XmagdB);

xlim([-20000 20000]);

title('Centered DFT Magnitude for 250 Hz  Tone');

xlabel('analog frequency, Hz');

ylabel('dB');

% Plot the centered magnitude against radian digital freq

figure(2);

plot(w,XmagdB);

xlim([-pi pi]);

title('Centered DFT Magnitude for 250 Hz Pure Tone');

xlabel('radian digital frequency \omega');

ylabel('dB');

% Plot against normalized digital frequency

figure(3);

plot(w/pi,XmagdB);

xlim([-1 1]);

title('Centered DFT Magnitude for 250 Hz Tone');

xlabel('normalized digital frequency \omega/\pi');

ylabel('dB');

% wait 3 seconds in case sound card is still busy pause(3);

audiowrite('A-250.wav',x,Fs); % write to wave file

[x2,Fs] = audioread('A-250.wav'); % read it back in

sound(x2,Fs,16); 

%% 300 Hz

Fs = 44100; % sampling frequency in Hz

N = Fs * 2; % length of the 2 sec signal

n = 0:N-1; % discrete time variable

f_analog = 300; % analog frequency in Hz

w_dig = 2*pi*f_analog/Fs; % radian digital frequency

x = cos(w_dig * n); % the signal

% Normalize samples to the range [-1,1]

% Not really needed here b/c cos is already in this range,

% but done anyway to illustrate how you normalize.

x = x / max(abs(x));

sound(x,Fs,16); % play it through sound card

X = fftshift(fft(x)); % centered DFT

Xmag = abs(X); % centered DFT magnitude

XmagdB = 20*log10(Xmag); % convert to dB

% Plot the centered magnitude against analog frequency

w = -pi:2*pi/N:pi-2*pi/N; % dig rad freq vector

f = w * Fs /(2*pi); % analog freq vector

figure(1);

plot(f,XmagdB);

xlim([-20000 20000]);

title('Centered DFT Magnitude for 300 Hz  Tone');

xlabel('analog frequency, Hz');

ylabel('dB');

% Plot the centered magnitude against radian digital freq

figure(2);

plot(w,XmagdB);

xlim([-pi pi]);

title('Centered DFT Magnitude for 300 Hz Pure Tone');

xlabel('radian digital frequency \omega');

ylabel('dB');

% Plot against normalized digital frequency

figure(3);

plot(w/pi,XmagdB);

xlim([-1 1]);

title('Centered DFT Magnitude for 300 Hz Tone');

xlabel('normalized digital frequency \omega/\pi');

ylabel('dB');

% wait 3 seconds in case sound card is still busy pause(3);

audiowrite('A-300.wav',x,Fs); % write to wave file

[x2,Fs] = audioread('A-300.wav'); % read it back in

sound(x2,Fs,16); 

%% Problem 3
%. Find the frequencies for Middle C=440Hz, E (major 3rd) and G (perfect 5th)
%that make a harmonious chord(unison, major 3rdand 5thas explained below). 
%Use these frequencies to make a file “chord.wav”file.
%Play it through WMP (Windows Media Player) and describe its sound.
%Plot the waveform and show the signal from t=0.500 to 0.505. Label the plot

%% E = 440*(1.0595)^(-7) = 329.570Hz
Fs = 44100; % sampling frequency in Hz

N = Fs * 2; % length of the 2 sec signal

n = 0:N-1; % discrete time variable

f_analog = 329.570; % analog frequency in Hz

w_dig = 2*pi*f_analog/Fs; % radian digital frequency

x = cos(w_dig * n); % the signal

% Normalize samples to the range [-1,1]

% Not really needed here b/c cos is already in this range,

% but done anyway to illustrate how you normalize.

x = x / max(abs(x));

sound(x,Fs,16); % play it through sound card

X = fftshift(fft(x)); % centered DFT

Xmag = abs(X); % centered DFT magnitude

XmagdB = 20*log10(Xmag); % convert to dB

% Plot the centered magnitude against analog frequency

w = -pi:2*pi/N:pi-2*pi/N; % dig rad freq vector

f = w * Fs /(2*pi); % analog freq vector

figure(1);

plot(f,XmagdB);

xlim([-20000 20000]);

title('Centered DFT Magnitude for 329.570 Hz  Tone');

xlabel('analog frequency, Hz');

ylabel('dB');

% Plot the centered magnitude against radian digital freq

figure(2);

plot(w,XmagdB);

xlim([-pi pi]);

title('Centered DFT Magnitude for 329.570 Hz Pure Tone');

xlabel('radian digital frequency \omega');

ylabel('dB');

% Plot against normalized digital frequency

figure(3);

plot(w/pi,XmagdB);

xlim([-1 1]);

title('Centered DFT Magnitude for 329.570 Hz Tone');

xlabel('normalized digital frequency \omega/\pi');

ylabel('dB');

% wait 3 seconds in case sound card is still busy pause(3);

audiowrite('A-329.570.wav',x,Fs); % write to wave fil
[x2,Fs] = audioread('A-329.570.wav'); % read it back in

sound(x2,Fs,16); 
%% G = 440*(1.0595)^(-2) = 391.968 Hz
Fs = 44100; % sampling frequency in Hz

N = Fs * 2; % length of the 2 sec signal

n = 0:N-1; % discrete time variable

f_analog = 391.968; % analog frequency in Hz

w_dig = 2*pi*f_analog/Fs; % radian digital frequency

x = cos(w_dig * n); % the signal

% Normalize samples to the range [-1,1]

% Not really needed here b/c cos is already in this range,

% but done anyway to illustrate how you normalize.

x = x / max(abs(x));

sound(x,Fs,16); % play it through sound card

X = fftshift(fft(x)); % centered DFT

Xmag = abs(X); % centered DFT magnitude

XmagdB = 20*log10(Xmag); % convert to dB

% Plot the centered magnitude against analog frequency

w = -pi:2*pi/N:pi-2*pi/N; % dig rad freq vector

f = w * Fs /(2*pi); % analog freq vector

figure(1);

plot(f,XmagdB);

xlim([-20000 20000]);

title('Centered DFT Magnitude for 329.570 Hz  Tone');

xlabel('analog frequency, Hz');

ylabel('dB');

% Plot the centered magnitude against radian digital freq

figure(2);

plot(w,XmagdB);

xlim([-pi pi]);

title('Centered DFT Magnitude for 329.570 Hz Pure Tone');

xlabel('radian digital frequency \omega');

ylabel('dB');

% Plot against normalized digital frequency

figure(3);

plot(w/pi,XmagdB);

xlim([-1 1]);

title('Centered DFT Magnitude for 391.968 Hz Tone');

xlabel('normalized digital frequency \omega/\pi');

ylabel('dB');

% wait 3 seconds in case sound card is still busy pause(3);

audiowrite('A-391.968.wav',x,Fs); % write to wave fil
[x2,Fs] = audioread('A-391.968.wav'); % read it back in

sound(x2,Fs,16); 
