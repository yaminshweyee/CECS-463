%% Lab4
%    Name : Yamin Yee
%    Date : Oct 10, 2019
%    Lab Assignment : #05  

clear all; close all; clc; format compact;
disp('Lab #5');
disp(' ');
disp('%%%% Yamin Yee          %%%%');
disp('%%%% CECS 463 Fall 2019 %%%%');
disp('%%%% Lab Assignment #05 %%%%');
disp('%%%% 10/15/2019          %%%%');
disp(' ');
str=datestr(now); disp(['Matlab Time Stamp: ',str]);
disp('');


%% Problem 1
T=1; %Fundamental Period
F=1/T; w=2*pi*F;
dT=0.01; %step sizez
t = -1.1:dT:1.1; %declare the range of t over the fundamental period 0<t<1
x=.5*sign(sin(w*t)); %square wave
%sq=.5*(square(2*pi*F*t,50)); %square wave
figure();
plot(t,x,'b');
hold on; grid on;
axis([-1.1, 1.1, -1.1, 1.1]); title('Periodic Square Wave');
xlabel('time t');ylabel('f(t)');
c0=(1/T)*sum(x*dT);
N=9;
for n=1:N
cn(n)=(dT/T)*sum(x.*exp(-1j*2*pi*n*t/T));
end
c_n=conj(cn);
f=c0;
for n=1:N
f=f+cn(n)*exp(1j*w*n*t)+c_n(n)*exp(-1j*w*n*t);
end
plot(t,f,'k');
%Matrix Formulation
n=0;
Wn=exp(1j*w*t'*n);
W_n=conj(Wn);
c0=(dT/T)*x*W_n;
n=1:N;
Wn=exp(1j*w*t'*n); % T is period, t is time vector, n is coefficient index vector.
W_n=conj(Wn); % Simply the conjugate of Wn, & c0 is average value of function
cn=(dT/T)*x*W_n;
c_n=conj(cn);
gN=c0+Wn*cn.'+W_n*c_n.'; % Careful not to conjugate transpose the row vector cn
plot(t,gN,'r');
%RMSE
%Both Row vectors checked
[r,c]=size(x);
[r,c]=size(f);
[r,c]=size(gN);
figure();
rmse = sqrt(sum(abs(x-f).^2)/length(x));
grid on; plot(t,rmse,'k');
str = sprintf ('RMS Error ||x(t)-gN(t)|| with RMSE= %6.4f ', rmse);
title(str); xlabel('time t'); ylabel('Root Mean Square Error');
fprintf('Number of coefficients for rmse<0.075 is %i',N);
