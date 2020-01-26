x = audioread('speechdata.wav');%Get speech data
n = 0:length(x)-1;
fs=8000; Ts = 1/fs; %Sampling rate
blockTime = 0.020; %20ms blocks of voice sample
NumSmaples = fs*1; %Nu,ber of smaples in 1 sec of voice data
L = length(x);
figure(1); clf(1);
plot(n*Ts,x); title('Speech Signal');
xlabel('time (sec)'); ylabel('Amplitude');

%% Question 1
NS = fs*blockTime; %Number of smaples in a block of voice data
NBLKS = L/NS; %Number of blocks in 1 sec sample
Ls = L/fs; %Number of seconds in voice sample
fprintf('Q1. Number of samples in speech data = %i => %i seconds\n', L, Ls);
fprintf(' Number of samples in 20 ms block = %5. 1f\n\n', Ls, NBLKS);
fprintf(' Number of blocks in %i sec voice sample = %5.1f\n\n', Ls, NBLKS);

%% Question 2
f = 200; T = 1/f; %Pluse frequency 
N = NS*T/blockTime; 
fprintf('Q2. A pluse every N = %5.if samples \n\n', N);

%% Question 3
%(a) 
fprintf('Q3a. Estimated Wave X2 of speech.m\n');
fprintf(' H(z)=S''(z)/X(z)=0*z^0 + a1*z^(-1)+a2*z^(-2)+...+ap*z^(-p)\n');
fprintf(' b=[0 a1 a2 ... ap] and a=[1]\n');

fprintf('Q3b. Error Wave E of speech.m\n');
fprintf(' H(z)=E(z)/S(z)=1*z^0 - a1*z^(-1)- a2*z^(-2)-...-ap*z^(-p)\n');
fprintf(' b=[1 -a1 -a2 ... -ap] and a=[1]\n');

fprintf('Q3c. Synthesized Wave RECON of speech.m\n');
fprintf(' H(z)=S*(z)/E(z)=1/[1*z^0 - a1*z^(-1)- a2*z^(-2)-...-ap*z^(-p)]\n');
fprintf(' a=[1 -a1 -a2 ... -ap] and b=[1]\n');
fprintf(' If e(n)=Gx(n) then H(z)=S*(z)/X(z) and b=[G]\n\n');

fprintf('Q4a. H(z)=E(z)/X(z)=1*z^0 - a1*z^(-1)- a2*z^(-2)\n');
fprintf('Q4b. H(z)=X(z)/E(z)=1/[1*z^0 - a1*z^(-1)- a2*z^(-2)]\n');
fprintf('Q4c. a0=1, a1=1.3789 and a2=-0.9506\n');

a0 = 1; a1 = 1.3789; a2 = -0.9506; a =[a0 -a1 -a2]; p = roots(a);
figure(2); clf(2); zplane(1,p);
pang = angle(p(1))*180/pi; pmag = abs(p(1));
w = angle(p(1))*fs; formant = w/2/pi;
fprintf(' Poles at locations: %5.2f at angle +/- %5.2f\n', pmag, pang);
fprintf(' Formant frequency = (%5.2f of fs/2) is %6.2f Hz\n\n', pang/180, formant);
k = 0:0.001:0.5; z = exp(j*2*pi*k); Hz=1.0./(a0 -a1*z.^(-1)-a2*z.^(-2));
figure(3); clf(3); plot(k*fs,abs(Hz)); gird;
title('Magnitude Frequency Response');
xlabel('frequency (Hz)'); ylabel('|H(z)|');

%Run speech.m function
x1 = audioread('speech.data.wav'); %Get speech data
nblks = NBLKS; %Get number of blocks
for k=0:NS-1 
    if(mod(k,N) == 0) e1(k+1)=1; else e1(k+1) = 0; end
end
n = 0:length(e1)-1;
figure(4); clf(4); stem(n,e1); grid;
title('200 Hz Pluse String'); xlabel('Index'); ylabel('Uni Pluse');
axis([0 length(e1) -1 2]);
pause(1);

[e,x2,recon,synth] = speech(x1,nblks,e1);

%Ouput normalized sound data
soundsc(x2/max(abs(x2))); pause(3);
soundsc(recon/max(abs(recon))); pause(3);
soundsc(synth/max(abs(synth))); pause(3);

fprint('\nEND Assignment #14\n');
