%% Lab8
%    Name : Yamin Yee
%    Date : Nov 14, 2019
%    Lab Assignment : #08  

clear all; close all; clc; format compact;
disp('Lab #8');
disp(' ');
disp('%%%% Yamin Yee          %%%%');
disp('%%%% CECS 463 Fall 2019 %%%%');
disp('%%%% Lab Assignment #08 %%%%');
disp('%%%% 11/14/2019          %%%%');
disp(' ');
str=datestr(now); disp(['Matlab Time Stamp: ',str]);
disp('');


%% Problem 1
a = 1; M = 5000;
px = (a^2)/3;
x  = px*rand(1,M);

%% Problem 2
clc; clear all; close all; format compact;
a1 = -0.8; a2 = -0.9; b1 = 1; b2 = -0.85;
b = [0,b1,b2]; a = [1. -a1, -a2 ];
n = 0:200;
x = 1*n;
d = filter(b,a,x);

%% Problem 3
N = 50; a = 1; Px = a*a/3; delta = 1/10/N/Px/2;
Lx = length(x); y = zeros(1, Lx);
h  = zeros(1,N);
for n = N:Lx
    x1 = x(n:-1:n-N+1); %get next N-element x vector 
    y(n)= h*x1';         %scalar product
    e = d(n) - y(n);    %find error
    h = h + delta * e *x1;%update N-element h vector 
end

%% Problem 4
% 4(a)
M = 5000;
n = 0 : M-1;
x = -1 + 2*rand(1,M);
a1 = -0.8; a2 = -0.9; b1 = 1; b2 = 0.85;
b = [ 0, b1, b2 ]; a = [1, -a1, -a2 ];
d = filter( b, a, x);
N = 50; Px = (1.0/(1+M))*(x*x'); delta = 1/(10*N*Px)/2;
K = 10*N;
y = zeros(1,M);
h = zeros(1,N);
m = 1; k = 1;
ase(m) = 0;
for n = N:M
    x1= x(n:-1:n-N+1);
    y(n) = h*x1';
    e = d(n) - y(n);
    if (mod(n,K) == 0)
        k = 1;
        m = m+1;
        ase(m) = 0;
    end
    ase(m) = ((k-1)*ase(m)+ e*e)/k;
    k = k+1;
    h = h+ delta*e*x1;
end

figure();
ne = 0:m-1; plot(ne, ase); grid on;
title('Average Square Error (LMS)');
xlabel('Averaging Index M'); ylabel('ASE(M)');

% 4(b)
figure();
n = 0:100; p=(n==0); hx=filter(b,a,p);
hf = filter(h,1,p);
error = abs(hx - hf );
title('FIR Impulse Response');
subplot(2,1,1); stem(n,hf);
subplot(2,1,2); stem(n,error);

% 4(c)
%values of the following variables were changed
% N, M, delta 
