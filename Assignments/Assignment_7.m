%% Lab7 
%    Name : Yamin Yee
%    Date : Oct 29, 2019
%    Lab Assignment : #04 - Quadrilaterals 

clear all; close all; clc; format compact;
disp('Lab #7');
disp(' ');
disp('%%%% Yamin Yee          %%%%');
disp('%%%% CECS 463 Fall 2019 %%%%');
disp('%%%% Lab Assignment #07 %%%%');
disp('%%%% 10/29/2019          %%%%');
disp(' ');
str=datestr(now); disp(['Matlab Time Stamp: ',str]);
disp('');

%% Problem 1
disp('Problem 1');
b =[1,1,1,1,1,1]; nb = [-2:3];
a =[1,2,1]; na = [-1:1];
[p, np, r, nr ] = deconv_m(b,nb,a,na);
fprintf(' p  = '); fprintf(' %2d', p); disp(' ');
fprintf(' np = '); fprintf(' %2d',np); disp(' ');
fprintf(' np = '); fprintf(' %2d',np); disp(' ');
fprintf(' r = '); fprintf(' %2d', r); disp(' ');
fprintf(' nr = '); fprintf(' %2d',nr); disp(' ');

%% Problem 2
disp('Problem 2');
b =[1, -1, -4, 4]; a = [1, -2.75, 1.625, -0.25];
[R, p, k ] = residuez(b,a);
disp(R); disp(p); disp(k);
b = [0, 0, 1]; a = [1, 2, 1.25, 0.25];
[R, p, k] =residuez(b,a);
disp(R); disp(p); disp(k);



% %%Problem 3
% disp('Problem 3');
% %disp('Ac = b0;');
% disp('r = sqrt(a2);');
% disp('w0 = acos(-a1/(2*r));');
% disp('As = (b1/r+Ac*cos(w0))/sin(w0);');
% disp('v0 = w0/(pi);');
% 
% disp('function [As,Ac,r,v0] = invCCPP(b0,b1,a1a2);');
% disp('Ac = b0;');
% disp('r = sqrt(a2);');
% disp('w0 = acos(-a1/(2*r));');
% disp('As = (b1/r+Ac*cos(w0))/sin(w0);');
% disp('v0 = w0/(pi);');
% 
% b0 = 2; b1 = 3; a1 = -1; a2 = 0.81;
% [Ac,As,r,v0] = invCCPP(b0,b1,a1,a2);
% n = (0:20);
% x = Ac*(r.^n).*cos(v0*pi*n)+As*(r.^n).*sin(v0*pi*n);
% y = filter([b0,b1],[1,a1,a2],impseq(0,0,20));
% error = abs(max(x-y));
% disp(['error =', num2str(error)]);

%% Problem 4
disp('Problem 4a ');
disp('(i) The system function: H(z) = 5/(1-0.25*z^-1), |z| > 0.5');
disp('(ii) The difference equation: y(n) = 5x(n)+0.25y(n-1)');
b = [5,0]; a = [1,-0.25]; zplane(b,a); title('Pole-Zero - 4a');
disp('(iii) The output: y(n) = 20(n+1)(0.25)^(n+1)*u(n+1)');

disp('Problem 4b ');
disp('(i) The system function: H(z) = 2/(1-*z^-1), |z| > 1');
disp('(ii) The difference equation: y(n) = 2x(n)+y(n-1)');
b = [2,0]; a = [1,-1]; zplane(b,a); title('Pole-Zero - 4b');
disp('(iii) The output: y(n) = 8/3*u(n)-2/3(1/4)^n*u(n)');


%% Problem 5
disp('P 5 ');
b1 = [1,-1]; nb1 = [0,1];
al1 = [1,0,-0.81]; nal1 = [0,1,2];
al2 = [1,-0.7]; na12 = [0,1];
[a1,na1] = conv_m(al1,nal1,al2,na12);
b2 = [0.1914,1.62]; nb2 = [0,1];
a2 = [1,0,-0.81]; na2 = [0,1,2];
[bnr1,nbnr1] = conv_m(b1,nb1,a2,na2);
[bnr2,nbnr2] = conv_m(b2,nb2,a1,na1);
[b,nb] = sigadd(bnr1,nbnr1,bnr2,nbnr2);
[a,na] = conv_m(a1,na1,a2,na2);
[R,p,k] = residuez(b,a);
disp(R); disp(p); disp(k);
n = (0:20);
x = 0.7.^n; xic = [0.1914,1.64];
yb1 = filter(b1,al1,x,xic);
yb2 = R(1)*((p(1)).^n)+R(3)*((p(3)).^n)+R(5)*((p(5)).^n);
error = max(abs(yb1-yb2));
disp(['error = ',num2str(error)]);


%% Problem 6
disp('P 6 ');
disp('Zero-input response yzi(n) = -0.52010*(0.99)^n*u(n)+1.5002*(0.99)^n*u(n)');
disp('Zero-input response yzs(n) = -0.0253*(-0.99)^n*u(n)+5.0253*(0.99)^n*u(n)');


%% Function 
disp('Functions ');
function [p,np,r,nr] = deconv_m(b,nb,a,na)
[p,r] = deconv(b,a);
np1 = nb(1) - na(1); np2 = np1 + length(p) - 1;
np = [np1:np2];
nr1 = nb(1); nr2 = nr1 + length(r) - 1;
nr = [nr1:nr2];
end

function [As,Ac,r,V0] = invCCPP(b0,b1,a1,a2)
Ac = b0; r = sqrt(a2); V0 = acos(-a1/2/r)/pi;
As = b1/r + Ac*(cos(pi*V0))/sin(pi/V0);
end
