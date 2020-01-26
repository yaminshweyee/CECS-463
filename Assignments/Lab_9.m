%% Lab8
%    Name : Yamin Yee
%    Date : Nov 21, 2019
%    Lab Assignment : #09  

clear all; close all; clc; format compact;
disp('Lab #8');
disp(' ');
disp('%%%% Yamin Yee          %%%%');
disp('%%%% CECS 463 Fall 2019 %%%%');
disp('%%%% Lab Assignment #09 %%%%');
disp('%%%% 11/21/2019          %%%%');
disp(' ');
str=datestr(now); disp(['Matlab Time Stamp: ',str]);
disp('');

%% 
disp('Plots of Figures 1 and 2 and Correlation');
x = [0 4 4 0];
y = [1 1 0 0];
u = [-1 1 1 -1];
v = [2 2 -1 1];
k = 360;
d1 = distance(x, y, k);
d2 = distance(u, v, k);
pts = 1:length(d2)/length(d1):length(d2)+1;
d3=d2(round(pts(1:length(d1))));
rhos = zeros(1, length(d1));
for i=1:length(d1)
    rhos(i) = correlate(i, d1, d3);
end 
rho = max(rhos);
figure(); hold on; grid on;
title(['Figures1 and 2 Distances: ', num2str(rho), 'Correlation']);
xlabel('Sample Number');
ylabel('Magnitude');
plot(1:length(d1),d1);
plot(1:length(d2),d2);
hold off;
disp(' ');

%% Figure 1 and 3 and Correlation 
disp('Plots of Figures 1 and 3 and Correlation');
x = [0 4 4 0];
y = [1 1 0 0];
u = [0 0 1];
v = [0 2 0];
k = 360;
d1 = distance(x,y,k);
d2 = distance(u,v,k);
pts = 1:length(d2)/length(d1):length(d2)+1;
d3 = d2(round(pts(1:length(d1))));
rhos = zeros(1,length(d1));
for i=1:length(d1)
    rhos(i) = correlate(i,d1,d3);
end
rho = max(rhos);
figure(); hold on; grid on;
title(['Figures 1 and 3 Distances: ', num2str(rho), 'Correlation']);
xlabel('Sample number');
ylabel('Magnitude');
plot(1:length(d1),d1);
plot(1:length(d2),d2);
hold off;
disp(' ');

%% 4
disp('Plot of Figures 1 and 4 and Correlation');
x = [0 4 4 0];
y = [1 1 0 0];
u = [0 2 3 4 6 4 3 2];
v = [1 3 6 3 2 1 -2 1];
k = 360;
d1 = distance(x,y,k);
d2 = distance(u,v,k);
pts=1:length(d2)/length(d1):length(d2)+1;
d3 = d2(round(pts(1:length(d1))));
rhos = zeros(1, length(d1));
for i = 1:length(d1)
    rhos(i) = correlate(i,d1,d3);
end
rho = max(rhos);
figure(); hold on;
title(['Figures 1 and 4 distances: ', num2str(rho), 'Correlation']);
xlabel('Sample number');
ylabel('Magnitude');
plot(1:length(d1),d1);
plot(1:length(d2),d2);
hold off;
disp(' ');

%% 2 and 3
disp('Plots of Figures 2 and 3 and Correlation');
x=[-1 1 1 -1];
y=[2 2 -1 -1];
u=[0 0 1];
v=[0 2 0];
k=360;
d1=distance(x,y,k);
d2=distance(u,v,k);
pts=1:length(d2)/length(d1):length(d2)+1;
d3=d2(round(pts(1:length(d1))));
rhos=zeros(1,length(d1));
for i=1:length(d1)
    rhos(i)=correlate(i,d1,d3);
end
rho=max(rhos);
figure(); hold on; grid on;
title(['Figures 2 and 3 Distances: ', num2str(rho), ' Correlation']);
xlabel('Sample number');
ylabel('Magnitude');
plot(1:length(d1),d1);
plot(1:length(d2),d2);
hold off;
disp(' ');


%% 3 of 4
disp('Plot of Figure 3 and 4 and Correlation');
x =[ 0 0 1 ];
y =[ 0 2 0 ];
u =[ 0 2 3 4 5 4 3 2 ];
v =[ 1 3 6 4 2 1 -2 1];
k = 360;
d1 = distance(x,y,k);
d2 = distance(u, v, k);
pts = 1:length(d2)/length(d1):length(d2)+1;
d3 = d2(round(pts(1:length(d1))));
rhos=zeros(1,length(d1));
for i=1:length(d1)
    rhos(i)=correlate(i,d1,d3);
end
rho=max(rhos);
figure(); hold on; grid on;
title(['Figures 3 and 4 Distances: ', num2str(rho), ' Correlation']);
xlabel('Sample number');
ylabel('Magnitude');
plot(1:length(d1),d1);
plot(1:length(d2),d2);
hold off;
disp(' ');

%% Function 
function d = distance(x,y,k)
figure();hold on; grid on;%
axis([min(x)-1 max(x)+1 min(y)-1 max(y)+1]);
title('Shape and Distances from Center');
for i = 1:length(x)-1
    plot([x(i),x(i+1)],[y(i),y(i+1)],'b');
end
plot([x(length(x)),x(1)],[y(length(x)),y(1)],'b');
hold off;%
cx=sum(x)/length(x);
cy=sum(y)/length(y);
p=0;
s=zeros(1,length(x));
for i=1:length(x)-1
    l=sqrt((x(i+1)-x(i))^2+(y(i+1)-y(i))^2);
    p=p+l;
    s(i)=l;
end
l=sqrt((x(length(x))-x(1))^2+(y(length(y))-y(1))^2);
p=p+l;
s(length(x))=l;
% k=360;%
l=zeros(1,length(x));
for i=1:length(l)
    l(i)=round(s(i)/p*k);
end
n=1;
indexx=zeros(1,sum(l));
for i=1:length(x)
    for j = 1:l(i)
        if i~=length(x)
            div=abs(x(i)-x(i+1))/l(i);
            if x(i)<x(i+1)
                indexx(n)=(j-1)*div+x(i);
            elseif x(i)>x(i+1)
                indexx(n)=x(i)-(j-1)*div;
            else
                indexx(n)=x(i);
            end
        else
            div=abs(x(i)-x(1))/l(i);
            if x(i)<x(1)
                indexx(n)=(j-1)*div+x(i);
            elseif x(i)>x(1)
                indexx(n)=x(i)-(j-1)*div;
            else
                indexx(n)=x(i);
            end
        end
        n=n+1;
    end
end
n=1;
indexy=zeros(1,sum(l));
for i=1:length(y)
    for j = 1:l(i)
        if i~=length(y)
            div=abs(y(i)-y(i+1))/l(i);
            if y(i)<y(i+1)
                indexy(n)=(j-1)*div+y(i);
            elseif y(i)>y(i+1)
                indexy(n)=y(i)-(j-1)*div;
            else
                indexy(n)=y(i);
            end
        else
            div=abs(y(i)-y(1))/l(i);
            if y(i)<y(1)
                indexy(n)=(j-1)*div+y(i);
            elseif y(i)>y(1)
                indexy(n)=y(i)-(j-1)*div;
            else
                indexy(n)=y(i);
            end
        end
        n=n+1;
    end
end
hold on;%
for i= 1:sum(l)
    plot([indexx(i),cx],[indexy(i),cy],'k');
end
hold off;%
d=zeros(1,sum(l));
for i = 1:sum(l)
    d(i)=sqrt((indexx(i)-cx)^2+(indexy(i)-cy)^2);
end
hold on;%
plot(cx, cy, 'r*');
hold off;%
end
function [rho] = correlate(k, x, orig_y)
% correlate.m - How much are 2 signals alike?
% Usage: [roh] = correlate(k, x, y);
% inputs: k = shift (integer between 0 and length(y)-1)
% x, y = the signals to correlate
% output: rho = the correlation coefficients -1..0..1
% Note: This function assumes length(x) = length(y).

N = length(x);
y = [orig_y(k+1:length(orig_y)), orig_y(1:k)]; % Shift y by k units
sxx = x*x.' - sum(x)*sum(x)/N;
syy = y*y.' - sum(y)*sum(y)/N;
sxy = x*y.' - sum(x)*sum(y)/N;
rho = sxy / sqrt(sxx*syy); % Correlation coefficient for lag k
end
