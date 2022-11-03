function D2 =MinMaxScaling(A)
[ra,ca]=size(A);
Max_1=zeros(1,ca);
Min_1=zeros(1,ca);
dif=zeros(1,ca);
Q=zeros(ra,ca);
D2=zeros(ra,ca);
for i=1:ca
Max1=max(A(:,i));
Min1=min(A(:,i));
Max_1(i)=Max1;
Min_1(i)=Min1;
diff1=Max_1(i)-Min_1(i);
dif(i)=diff1;
end
for j=1:ra
 Ad=A(j,:)-Min_1;
   Q(j,:)=Ad;
 end
   [~, cm]= size(Max_1);
   [~, cq]=size(Q);
   [~, cs]=size(dif);
  
for k=1:cq
for k1=1:cm
for l=1:cs
 for j=1:ra
if l==k==k1
 Q2= Q(j,k)/dif(1,l);
 D2(j,k)=Q2;
if dif(1,l)==0.5; 
D2(j,k)=0;
else 
D2(j,k);
 end
end
end
 end
 end
end
end