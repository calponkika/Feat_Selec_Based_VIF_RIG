function  Dlog=DScaling(D)
[ra2,ca2 ]=size (D);
Max_1=zeros(1,ca2);
Dlog=zeros(ra2,ca2);
for i2=1:ca2
Max1=abs(max(D(:,i2)));
Max_1(i2)=Max1;
end
Log_abs=log10(Max_1);
       Round_up=ceil(Log_abs);
        e=Round_up;
      [~, ce]=size(e);
   %Appy division 
for i2=1:ca2
 for j2=1:ra2
for k2=1:ce
    if i2==k2;
 Qlog= D(j2,i2)/10^e(1,k2); 
 Dlog(j2,i2)=Qlog;

    end 

 end
end
end