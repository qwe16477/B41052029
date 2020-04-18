%ªL¥@´­
%B41052029
function xx=fseries(funfcn,a,b,n,tol,p1,p2,p3)
j=sqrt(-1);
args0=[];
for nn=1:nargin-5
    args0=[args0,',p',int2str(nn)];
end
args=[args0,')'];
t=b-a;
xx(1)=eval(['1/(',num2str(t),').*quad(funfcn,a,b,tol,[]',args])

for i=1:n
    new_fun = 'exp_fnct';
    args=[',',num2str(i),',',num2str(t),args0,')'];
    xx(i+1)=eval(['1/(',num2str(t),').*quad(new_fun,a,b,tol,[],funfcn',args]);
end

