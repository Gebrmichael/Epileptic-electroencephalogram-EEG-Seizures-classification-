load S007;
s = S007;

[swa,swd] = swt(s,8,'db8');

 cA1 = swa(1,:);     cD1 = swd(1,:); 
 cA2 = swa(2,:);     cD2 = swd(2,:); 
 cA3 = swa(3,:);     cD3 = swd(3,:); 
 cA4 = swa(4,:);     cD4 = swd(4,:); 
 cA5 = swa(5,:);     cD5 = swd(5,:); 
 cA6 = swa(6,:);     cD6 = swd(6,:); 
 cA7 = swa(7,:);     cD7 = swd(7,:); 
 cA8 = swa(8,:);     cD8 = swd(8,:); 


% Reconstract the SWT using iswt function
 mzero = zeros(size(swd));
A = mzero;
A(8,:) = iswt(swa,mzero,'db8');
D = mzero;


for i = 1:8
swcfs = mzero;
swcfs(i,:) = swd(i,:);
D(i,:) = iswt(mzero,swcfs,'db8');
eval(['D' num2str(i,'%01d') '=D(i,:)']);
end

A(7,:) = A(8,:) + D(8,:);
A(6,:) = A(7,:) + D(7,:);
A(5,:) = A(6,:) + D(6,:);
A(4,:) = A(5,:) + D(5,:);
A(3,:) = A(4,:) + D(4,:);
A(2,:) = A(3,:) + D(3,:);
A(1,:) = A(2,:) + D(2,:);


A1=A(1,:);
A2=A(2,:);
A3=A(3,:);
A4=A(4,:);
A5=A(5,:);
A6=A(6,:);
A7=A(7,:);
A8=A(8,:);


kp = 0;
for i = 1:8
subplot(8,2,kp+1), plot(A(i,:)); title(['Approx. level ',num2str(i)]);
subplot(8,2,kp+2), plot(D(i,:)); title(['Detail level ',num2str(i)]);
kp = kp + 2;
end
