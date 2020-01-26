% Lab #14  Dow Jones Industrial Average
%    Name : Yamin Yee
%    Date : Dec 5, 2019
%    Lab Assignment : #13  

clear all; close all; clc; format compact;
disp('Lab #13');
disp(' ');
disp('%%%% Yamin Yee          %%%%');
disp('%%%% CECS 463 Fall 2019 %%%%');
disp('%%%% Lab Assignment #14 %%%%');
disp('%%%% 12/09/2019          %%%%');
disp(' ');
str=datestr(now); disp(['Matlab Time Stamp: ',str]);
disp('');
clc;close all;clear all;

clear all; close all; clc; format compact;
fprintf('Lab #29  Dow Jones Industrial Average\n');
str=datestr(now); fprintf('Matlab Time Stamp: %s\n',str);
load djia; djia=djia'; week=0:length(djia)-1; Lw=length(week);
%% Problem 1
fprintf('Problem 1\n');
figure();
subplot(2,1,1); plot(week,djia);  grid on;
title('Dow Jones Industrial Average (DJIA)'); xlabel('Week'); ylabel('DJIA');
subplot(2,1,2); semilogy(week,djia); grid on;
title('Dow Jones Industrial Average (DJIA)'); xlabel('Week'); ylabel('log10(DJIA)');
Sdjia=1000; 
for k=1:Lw-1 
    Sdjia=Sdjia*djia(k+1)/djia(k); 
end; 
fprintf('  Investment of $1000 in DJIA after %d weeks: $%8.2f\n',Lw,Sdjia);
Sapr=1000; r=0.03;
for k=1:Lw-1 
    Sapr=Sapr*(1+r/52); 
end; 
fprintf('  Investment of $1000 at %4.2f%% annual interest after %d weeks: $%8.2f\n',r*100,Lw,Sapr);
%% Problem 2
fprintf('Problem 2\n');
p=3; % order of predictive filter
N=520; % length in samples allowed for convergence
X=zeros(N-p,p);
for k=1:N-p
    X(k,:)=djia(k:k+p-1);
end
x=djia(p+1:N)';
a=-X\x;
fprintf('  Predictor coefficients: a = {'); fprintf('%6.4f ',a); fprintf('}\n');
%% Problem 3
fprintf('Problem 3\n');
xhat1=-X*a; n=week(1):week(length(xhat1));
b=[0,flipud(a)'];
xhat2 = -filter(b,[1],djia)';
fprintf('  FIR filter coefficients: b = {'); fprintf('%6.4f ',b); fprintf('}\n');
e=x+X*a; E1=e'*e;
err = djia(p+1:N)' - xhat2(p+1:N); E2=err'*err;
fprintf('  Compare errors: e''*e - err''*err = %6.2f\n',E1-E2);
fprintf('  where e=x+X*a and err=djia(p+1:N)-xhat2(p+1:N)\n');

figure();
hold on;
subplot(2,2,1);
plot(week(1:N),djia(1:N)); grid on;
title('DJIA'); xlabel('Week'); ylabel('DJIA');
subplot(2,2,2)
plot(n,xhat1);  grid on;
title('DJIA Predictor XHAT1'); xlabel('Week'); ylabel('xhat1');
subplot(2,2,3);
plot(n,xhat2(1:N-p));  grid on;
title('DJIA Predictor XHAT2'); xlabel('Week'); ylabel('xhat2');
%legend('DJIA','xhat1 Predictor','xhat2 Predictor','Location','Northwest');
subplot(2,2,4);
plot(n,e(1:N-p));  grid on;
title('Error = e(n)=x+X*a'); xlabel('Week'); ylabel('Error');
hold off;

%% Problem 4
fprintf('Problem 4\n');
Error=zeros(1,10);
for p=1:10
  N=520; % length in samples allowed for convergence
  X=zeros(N-p,p);
  for k=1:N-p
      X(k,:)=djia(k:k+p-1);
  end
  x=djia(p+1:N)';
  a=-X\x;
  fprintf('  p=%d-order Predictor Coefficients: a = {',p); fprintf('%6.4f ',a); fprintf('}\n');
  xhat1=-X*a; n=week(1):week(length(xhat1));
  b=[0,flipud(a)'];
  xhat2 = -filter(b,[1],djia)';
  fprintf('    FIR filter Coefficients: b = {'); fprintf('%6.4f ',b); fprintf('}\n');
  e=x+X*a; E1=e'*e/length(e); MSE(p)=E1;
  fprintf('    Mean Square Error of %d-th order predictor= %6.2f\n',p,E1);
  err = djia(p+1:N)' - xhat2(p+1:N); E2=err'*err;
  %fprintf('  Compare errors: e''*e - err''*err = %6.2f\n',E1-E2);
  %fprintf('  where e=x+X*a and err=djia(p+1:N)-xhat2(p+1:N)\n');

  figure();
  %hold on;
  subplot(2,2,1);
  plot(week(1:N),djia(1:N)); grid on;
  title('DJIA'); xlabel('Week'); ylabel('DJIA');
  subplot(2,2,2)
  plot(n,xhat1);  grid on;
  str=sprintf('DJIA XHAT1(%d)',p); title(str); xlabel('Week'); ylabel('xhat1');
  subplot(2,2,3);
  plot(n,xhat2(1:N-p));  grid on;
  str=sprintf('DJIA XHAT2(%d)',p); title(str); xlabel('Week'); ylabel('xhat2');
  %legend('DJIA','xhat1 Predictor','xhat2 Predictor','Location','Northwest');
  subplot(2,2,4);
  plot(n,e(1:N-p));  grid on;
  str=sprintf('Error(%d) = e(n)=x+X*a',p); title(str); xlabel('Week'); ylabel('Error');
  %hold off;
end
figure(); hold on; 
np=1:10;
stem(np,MSE);
str=sprintf('Mean Squared Error = MSE(p)'); title(str);xlabel('Order p'); ylabel('MSE');
axis([0,10,min(MSE)-0.1,max(MSE)+0.1]); grid on;
[Emin,pmin]=min(MSE);
text(pmin-0.75,Emin+0.05,'MSEmin') 
stem(pmin,Emin,'r');
%% Problem 5
fprintf('Problem 5\n');
g=1000; p=4; r=0.03;
for n=p+1:520+p+1
    if(djia(n+1)>djia(n))
        g=g*djia(n+1)/djia(n);
    else
        g=g*(1+r/52);
    end
end
fprintf('  Strategy 1: Optimum return g=$%8.2f\n',g);
g=1000; p=4; r=0.03;
g=g*(1+r/52)^520;
fprintf('  Strategy 2: Leave $1000 in bank g=$%8.2f\n',g);   
g=1000; p=4; r=0.03;
for n=p+1:520+p+1
  g=g*djia(n+1)/djia(n);
end
fprintf('  Strategy 3: Invest every week in DJ Idustrials g=$%8.2f\n',g); 

g=1000; p=4; r=0.03;
X=zeros(N-p,p);
for k=1:N-p
  X(k,:)=djia(k:k+p-1);
end
x=djia(p+1:N)';
a=-X\x;
b=[0,flipud(a)'];
xhat = -filter(b,[1],djia)';
for n=p+1:520+p+1
    if(xhat(n+1)>xhat(n))
        g=g*djia(n+1)/djia(n);
    else
        g=g*(1+r/52);
    end
end
fprintf('  Strategy 4: Invest every week using DJIA Predictor g=$%8.2f\n',g);  
APR=(exp(log(g/1000)/N)-1)*52;
fprintf('  Equivalent APR = %4.3f\n',APR);
%% Problem 6
fprintf('Problem 6\n');
fprintf('  Using last 520 weeks of DJIA data:\n');
g=1000; p=4; r=0.03; 
Nf=length(djia); Ns=length(djia)-N+1;
for n=Ns:Nf-1
    if(djia(n+1)>djia(n))
        g=g*djia(n+1)/djia(n);
    else
        g=g*(1+r/52);
    end
end
fprintf('  Strategy 1: Optimum return g=$%8.2f\n',g);
g=1000; p=4; r=0.03;
g=g*(1+r/52)^N;
fprintf('  Strategy 2: Leave $1000 in bank g=$%8.2f\n',g);   
g=1000; p=4; r=0.03;
for n=Ns:Nf-1
  g=g*djia(n+1)/djia(n);
end
fprintf('  Strategy 3: Invest every week in DJ Idustrials g=$%8.2f\n',g); 

g=1000; p=4; r=0.03;
X=zeros(N-p,p);
for k=1:N-p
  X(k,:)=djia(k:k+p-1);
end
x=djia(p+1:N)';
a=-X\x;
b=[0,flipud(a)'];
xhat = -filter(b,[1],djia)';
for n=Ns:Nf-1
    if(xhat(n+1)>xhat(n))
        g=g*djia(n+1)/djia(n);
    else
        g=g*(1+r/52);
    end
end
fprintf('  Strategy 4: Invest every week using DJIA Predictor g=$%8.2f\n',g);  
APR=(exp(log(g/1000)/N)-1)*52;
fprintf('  Equivalent APR = %4.3f\n',APR);

%% Problem 7




tilefigs;


