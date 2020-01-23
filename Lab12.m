%% Lab8
%    Name : Yamin Yee
%    Date : Dec 5, 2019
%    Lab Assignment : #11  

clear all; close all; clc; format compact;
disp('Lab #11');
disp(' ');
disp('%%%% Yamin Yee          %%%%');
disp('%%%% CECS 463 Fall 2019 %%%%');
disp('%%%% Lab Assignment #11 %%%%');
disp('%%%% 12/05/2019          %%%%');
disp(' ');
str=datestr(now); disp(['Matlab Time Stamp: ',str]);
disp('');


% Find the length of signal 
lt = cell(0.050 * samp_freq);
%Find next largeest power of 2
lt = ceil(log2(lx)) +1;
lt = 2^lt;
lt = 2^lt;
%Construct frequency axis
w = (0: it - 1 ) / lt * samp_freq;
%Find min and max indices into frequency domain 
if( margin ~= 4 )
    wmin = min(find(w >= 220 ));
    wmax = min(find(w >= 440 )); 
else 
    wmin = min(find(w >= minfreq));
    wmax = min(find(w >= maxfreq));
end

% How many 50 msec chunks are in signal ?
 chunks = floor(1/lx);
 fprintf('Calculating frequency spectra using %d sections...\n', chunks);
 % Allocate space
 X = zeros(chunks+1, lt);
 %Loop over signal, calculate fft
 for k = 1:chunks,
     input = notes(lx * (k-1)+1 : lx*k);
     X(k,:)= abs(fft(input, lt))';
 end
 %Do the last bit (odd size, the fractionsla part)
 Z = Z(:);
 X(chunks+1, :) = Z';
 %Contruct time signal 
 t = (0:lx : chunks*lx)/samp_freq;
 
 %Plot in 3-D
 surf(t,w(wmin : wmax ), X(:, wmin:wmax)');
 
 %Transform to 2-D view 
 view(2);
 %Set colors
 colormap(hot)
 %Labels...
 ylabel('Frequency in Hz');
 xlabel('Time in seconds');
 title('Time/Frequncy Representation');
 