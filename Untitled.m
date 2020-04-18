%ªL¥@´­
%B41052029
echo on
t0=.15;
ts=0.001;
fc=250;
snr=10;
a=0.85;
fs=1/ts;
t=[0:ts:t0];
df=0.2;
snr_lin=10^(snr/10);
m=[ones(1,t0/(3*ts)),-2*ones(1,t0/(3*ts)),zeros(1,t0/(3*ts)+1)];
c=cos(2*pi*fc.*t);
m_n=m/max(abs(m));
[M,m,df1]=fftseq(m,ts,df);
M=M/fs;
f=[0:df1:df1*(length(m)-1)]-fs/2;
u=(1+a*m_n).*c;
[U,u,df1]=fftseq(u,ts,df);
U=U/fs;
signal_power=spower(u(1:length(t)));
pmn=spower(m(1:length(t)))/(max(abs(m)))^2;
eta=(a^2*pmn)/(1+a^2*pmn);
noise_power=eta*signal_power/snr_lin;
noise_std=sqrt(noise_power);
noise=noise_std*randn(1,length(u));
r=u+noise;
[R,r,df1]=fftseq(r,ts,df);
R=R/fs;
pause
signal_power
pause
eta
pause
subplot(2,2,1)
plot(t,m(1:length(t)))
axis([0 0.15 -2.1 2.1])
xlabel('Time')
title('The message signal')
pause
subplot(2,2,2)
plot(t,c(1:length(t)))
axis([0 0.15 -2.1 2.1])
xlabel('Time')
title('The carrier')
pause
subplot(2,2,3)
plot(t,u(1:length(t)))
axis([0 0.15 -2.1 2.1])
xlabel('Time')
title('The modulated signal')
pause
subplot(2,1,1)
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
plot(t,noise(1:length(t)))
title('Signal and noise')
xlabel('Time')
pause
subplot(2,1,1)
plot(f,abs(fftshift(U)))
title('Signal spectrum')
xlabel('Frequency')
subplot(2,1,2)
plot(f,abs(fftshift(R)))
title('Signal and noise spectrum')
xlabel('Frequency')