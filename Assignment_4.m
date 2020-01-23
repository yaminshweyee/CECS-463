%% Lab4
%    Name : Yamin Yee
%    Date : Oct 10, 2019
%    Lab Assignment : #04 - Quadrilaterals 

clear all; close all; clc; format compact;
disp('Lab #4 -- Frequency Domain Representaion H(w) = DTFT[h(n)]');
disp(' ');
disp('%%%% Yamin Yee          %%%%');
disp('%%%% CECS 463 Fall 2019 %%%%');
disp('%%%% Lab Assignment #04 %%%%');
disp('%%%% 10/10/2019          %%%%');
disp(' ');
str=datestr(now); disp(['Matlab Time Stamp: ',str]);
disp('');

%% Problem 1
disp('Problem 1');
%% Problem 1a
disp('(1a): x(n)-x(n-1)+x(n-2)+0.95y(n-1)-0.9025y(n-2)');
a = [1,-0.95,0.9025];
b = [1,-1,1];
Q = 500; w = [-Q:1:Q]*(pi/Q);

H = freqresp(b,a,w);
magH = abs(H); angH = angle(H);

figure(1); clf(1);
subplot (2,1,1);
plot(w/pi, magH); grid on; title('Magnitude Response');
xlabel('w/pi'); ylabel('magnitude H');

subplot (2,1,2);
plot(w/pi, angH); grid on; title('Phase Response');
xlabel('w/pi'); ylabel('angle H');
disp(' ');

%% Problem 2b
disp('(1b): x(n) - 1.7678x(n-1) + 1.5625x(n-2) + 1.134y(n-1) - 0.64(n-2)');
a = [1,-1.134,0.64];
b = [1,-1.7678,1.5625];
Q = 500; w = [-Q:1:Q]*(pi/Q);

H = freqresp(b,a,w);
magH = abs(H); angH = angle(H);

figure(2); clf(2);
subplot(2,1,1);
plot(w/pi, magH); grid on; title('Magnitude Response');
xlabel('w/pi'); ylabel('magnitude H');

subplot(2,1,2);
plot(w/pi, angH); grid on; title('Phase Response');
xlabel('w/pi'); ylabel('angle H')
disp(' ');


%% Problem 2
disp(' Problem 2');
disp('y(n) = 0.5x(n) - 0.8y(n-1) + 0.985y(n-2)');
a = [1,0.8,-0.95];
b = 0.5;
Q = 500; w = [-Q:1:Q]*(pi/Q);

H = freqresp(b,a,w);
magH = abs(H); angH = angle(H);

figure(3); clf(3);
subplot(2,1,1); 
plot(w/pi, magH); grid on; title('Magnitude Response');
xlabel('w/pi'); ylabel('magnitude H');

subplot(2,1,2); 
plot(w/pi, angH); grid on; title('Phase Response');
xlabel('w/pi'); ylabel('angle H');
disp(' ');

%% Problem 3
disp('Problem 3');
disp(' y(n) = 0.5x(n) - 0.8y(n-1) + 0.95y(n-2), x(n) = sin(0.8pi*n+30deg)');
a = [1,0.8,-0.95]; b=0.5; 
n = 0:0.1:5; x = sin(0.8*pi*n+(30*pi/180));
y = filter(b,a,x);

figure(4); clf(4);
subplot(2,1,1); stem(n,x); grid on; title('Input Sequence');
xlabel('n'); ylabel('x(n)');

subplot(2,1,2); stem(n,y); grid on; title('Output Sequence');
xlabel('n'); ylabel('x(n)');
disp(' ');
