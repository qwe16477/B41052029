%ªL¥@´­
%B41052029
echo on
t0=.15;
ts=0.001;
fc=250;
snr=20
fs=1/ts;
df=0.3;
t=[0:ts:t0];
snr_lin=10^(snr/10);
% message signal
m=[ones(1,t0/(3*ts)),-2*ones(1,t0/(3*ts)),zeros(1,t0/(3*ts)+1)];
c=cos(2*pi*fc.*t);
u=m.*c;
[M,m,dfl]=fftseq(m,ts,df);
M=M/fs;
[U,u,dfl]=fftseq(u,ts,df);
U=U/fs;
[C,c,dfl]=fftseq(c,ts,df);
f=[0:dfl:dfl*(length(m)-1)]-fs/2;
signal_power=spower(u(1:length(t)));
noise_power=signal_power/snr_lin;
noise_std=sqrt(noise_power);
noise=noise_std*randn(1,length(u));
r=u+noise;
[R,r,dfl]=fftseq(r,ts,df);
R=R/fs;
pause
signal_power
pause
clf
subplot(2,2,1)
plot(t,m(1:length(t)))
xlabel('Time')
title('The message signal')
pause
subplot(2,2,2)
plot(t,c(1:length(t)))
xlabel('Time')
title('The carrier')
pause
subplot(2,2,3)
plot(t,u(1:length(t)))
xlabel('Time')
title('The message signal')
pause
subplot(2,2,1)
plot(f,abs(fftshift(M)))
xlabel('Frequency')
title('Spectrum of the message signal')
subplot(2,1,2)
plot(f,abs(fftshift(U)))
title('Spectrum of the message signal')
xlabel('Frequency')
pause
subplot(2,1,1)
plot(t,noise(1:length(t)))
title('Noise sample')
xlabel('Time')
pause
subplot(2,1,2)
plot(t,r(1:length(t)))
title('Signal and noise')
xlabel('Time')
pause
subplot(2,1,1)
plot(f,abs(fftshift(U)))
title('Signal spectrum')
xlabel('Frequency')
subplot(2,1,2)
plot(f,abs(fftshift(R)))
title('Signal and noise apectrum')
xlabel('Frequency')