%% Lab1
%    Name : Yamin Yee
%    Date : Sep 9, 2019
%    Lab Assignment : #01 - Quadrilaterals 

clear all; close all; clc; format compact;
disp('Lab #1 -- Quadrilaterals');
disp(' ');
disp('%%%% Yamin Yee          %%%%');
disp('%%%% CECS 463 Fall 2019 %%%%');
disp('%%%% Lab Assignment #01 %%%%');
disp('%%%% 9/10/2019          %%%%');
disp(' ');
str=datestr(now); disp(['Matlab Time Stamp: ',str]);
disp('');

%% Problem 5
disp('Quadrilaterals')
figure(1); clf(1);
hold on; grid on;
axis([-10, 10, -10, 10]);%set center
plot((0),(0), 'k+');%origin 

%3
%functions to compute area of a triangle in the complex plane
area_triangle=@(x1,x2,x3) 0.5*abs( real(x1)*(imag(x2)-imag(3))...
                                 +real(x2)*(imag(x3)-imag(x1)) +real(x3)*(imag(x1)-(imag(x2))));

area_quadrilateral =@(x1,x2,x3,x4) ...
area_triangle(x1,x2,x3) + area_triangle(x1,x3,x4);

%cross product function 
xprod =@(x1, x2)real(x1)*imag(x2) - imag(x1)*real(x2);



%generate 4 random points each quadrant from [0,10]
Q1 =+randi(10)+1j*(randi(10));%Q1
Q2 =-randi(10)+1j*(randi(10));%Q2
Q3 =-randi(10)-1j*(randi(10));%Q3
Q4 =+randi(10)-1j*(randi(10));%Q4

%4
%Generate the Vertices from the points
V1 = Q2-Q1;
V2 = Q3-Q2;
V3 = Q4-Q3;
V4 = Q1-Q4;

Area = area_quadrilateral( Q1, Q2, Q3, Q4 );

%find the cross products of succeding points
xp1 = xprod( V1, V2 );
xp2 = xprod( V2, V3 );
xp3 = xprod( V3, V4 );
xp4 = xprod( V4, V1 );

%Store the cross products in array for checking 
xp = [ xp1, xp2, xp3, xp4 ];

%Show the Complex points genereated 
disp('4 Random Genereated Points:');
fprintf('Q1=%4.2f+%4.2fj\n', real(Q1), imag(Q1));
fprintf('Q2=%4.2f+%4.2fj\n', real(Q2), imag(Q2));
fprintf('Q3=%4.2f+%4.2fj\n', real(Q3), imag(Q3));
fprintf('Q4=%4.2f+%4.2fj\n', real(Q4), imag(Q4));

%plot the points 
plot(real(Q1),imag(Q1),'marker','*');
plot(real(Q2),imag(Q2),'marker','*');
plot(real(Q3),imag(Q3),'marker','*');
plot(real(Q4),imag(Q4),'marker','*');

%Trace the Quadrilateral 
plot([real(Q1),real(Q2)],[imag(Q1),imag(Q2)]);
plot([real(Q2),real(Q3)],[imag(Q2),imag(Q3)]);
plot([real(Q3),real(Q4)],[imag(Q3),imag(Q4)]);
plot([real(Q4),real(Q1)],[imag(Q4),imag(Q1)]);

%Type of Graph After Identifying Type and Area 
if (all(xp > 0) || all(xp < 0))
    title(sprintf('CONVEX Quadrilateral: Area =%4.2f', Area));%graph title
    fprintf('CONVEX: AREA = %4.2f', Area);
elseif( any(xp == 0))
        title(sprintf('TRIANGLE: Area = %4.2f', Area));
        fprintf('TRIANGLE: AREA = %4.2f', Area);
else
    title(sprintf('CONCAVE Quadritieal: Area =%4.2f', Area));
    fprintf('CONCAVE: AREA = %4.2f', Area);
end
