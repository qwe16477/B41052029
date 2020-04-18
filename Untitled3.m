%ªL¥@´­
%B41052029
echo on
df=0.01;
fs=5;
ts=1/fs;
t=[-5:ts:5];
x=zeros(1,length(t));
x(16:26)=t(16:26)+2;
x(27:31)=2*ones(1,5);
x(32:41)=2+2*cos(0.5*pi*t(32:41));
x(42:46)=2*ones(1,5);


[X,x1,df1]=fftseq(x,ts,df);
f=[0:df1:df1*(length(x1)-1)]-fs/2;
X1=X/fs;


H=[ones(1,ceil(1.5/df1)),zeros(1,length(X)-2*ceil(1.5/df1)),ones(1,ceil(1.5/df1))];
Y=X.*H;
y1=ifft(Y);


h=[zeros(1,ceil(5/ts)),t(ceil(5/ts)+1:ceil(6/ts)),ones(1,ceil(7/ts)-ceil(6/ts)),zeros(1,51-ceil(7/ts))];
y2=conv(h,x);

pause
plot(f,fftshift(abs(X1)))
pause
plot(t,abs(y1(1:length(t))));
pause
plot([-10:ts:10],y2);
