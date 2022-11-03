 function W=Outl_Thresh_Sequenc(Ub,U0,r)
 % Arthmetic sequence to generate apossible predefined parameter existing
 % in Zscore for ourlier detection 
N=((Ub-U0)/r)+1 ; 
W=zeros(1,N);
for i=1:N
    Un=U0+r*(i-1);
    W(i)=Un;
end
end