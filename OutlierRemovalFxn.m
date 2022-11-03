classdef  OutlierRemovalFxn
    %%Outlier deterction and imputation  functions 
      methods(Static) 
 function D1mean =IsOutlier_2p5_Mean(B,~)
 Po=Outlier_Val_Properties;    
A=zscore(B);
[ra,ca]=size(A);
Mean_1=zeros(1,ca);
 D1mean=zeros(ra,ca);
for i=1:ca
Mean1=mean(A(:,i));
Mean_1(i)=Mean1;
end
 for i=1:ca
for  j=1:ra
if abs(A(j,i))>Po.ThreshVal(1)
   A(j,i)=Mean_1(1,i); 
end
D1mean=A;
 end
 end
 end

 function D1med =IsOutlier_2p5_Median(B,~)
 Po=Outlier_Val_Properties;    
A=zscore(B);
[ra,ca]=size(A);
Median_1=zeros(1,ca);
 D1med=zeros(ra,ca);
for i=1:ca
Median1=median(B(:,i));
Median_1(i)=Median1;
end
for i=1:ca
 for j=1:ra
if abs(A(j,i))>Po.ThreshVal(1)  
   A(j,i)=Median_1(1,i); 
   D1med=A;
 end
 end
end 
 end
 function D2me =IsOutlier_2p7_Mean(B,~)
Po=Outlier_Val_Properties;      
A=zscore(B);
[ra,ca]=size(A);
Mean_1=zeros(1,ca);
 D2me=zeros(ra,ca);
for i=1:ca
Mean1=mean(A(:,i));
Mean_1(i)=Mean1;
end
for i=1:ca
 for j=1:ra
if abs(A(j,i))>Po.ThreshVal(2)  
   A(j,i)=Mean_1(1,i); 
end
D2me=A;
 end
 end
 end
 function D2med =IsOutlier_2p7_Median(B,~)
Po=Outlier_Val_Properties;     
A=zscore(B);
[ra,ca]=size(A);
Median_1=zeros(1,ca);
 D2med=zeros(ra,ca);
for i=1:ca
Median1=median(B(:,i));
Median_1(i)=Median1;
end
for i=1:ca
 for j=1:ra
if abs(A(j,i))>Po.ThreshVal(2)  
   A(j,i)=Median_1(1,i); 
   D2med=A;
 end
 end
end 
 end
 
 function D3mean =IsOutlier_2p9_Mean(B,~)
Po=Outlier_Val_Properties;    
A=zscore(B);
[ra,ca]=size(A);
Mean_1=zeros(1,ca);
D3mean=zeros(ra,ca);
for i=1:ca
Mean1=mean(A(:,i));
Mean_1(i)=Mean1;
end
for j=1:ra
for i=1:ca
 if abs(A(j,i))>Po.ThreshVal(3) ;
   A(j,i)=Mean_1(1,i); 
end
D3mean=A;
 end
 end
 end 
 function D3med =IsOutlier_2p9_Median(B,~)
Po=Outlier_Val_Properties;     
A=zscore(B);
[ra,ca]=size(A);
Median_1=zeros(1,ca);
 D3med=zeros(ra,ca);
 K=zeros(ra,ca);
for i=1:ca
Median1=median(A(:,i));
Median_1(i)=Median1;
end
for i=1:ca
 for j=1:ra
if abs(A(j,i))>Po.ThreshVal(3)  
   K(j,i)=Median_1(1,i); 
    
end
D3med=K;
 end
 end
 end
 
 function D4mean =IsOutlier_3p1_Mean(B,~) 
Po=Outlier_Val_Properties;     
A=zscore(B);
[ra,ca]=size(A);
Mean_1=zeros(1,ca);
D4mean=zeros(ra,ca);
for i=1:ca
Mean1=mean(A(:,i));
Mean_1(i)=Mean1;
end
for j=1:ra
for i=1:ca
 if abs(A(j,i))>Po.ThreshVal(4) ;
   A(j,i)=Mean_1(1,i); 
end
D4mean=A;
 end
 end
 end
 function D4med =IsOutlier_3p1_Median(B,~) %%
Po=Outlier_Val_Properties;     
A=zscore(B);
[ra,ca]=size(A);
Median_1=zeros(1,ca);
 D4med=zeros(ra,ca);
for i=1:ca
Median1=median(B(:,i));
Median_1(i)=Median1;
end
for i=1:ca
 for j=1:ra
if abs(A(j,i))>Po.ThreshVal(4) ; 
   A(j,i)=Median_1(1,i); 
end
D4med=A;
 end
 end
 end % 
 
 function D5mean =IsOutlier_3p3_Mean(B,~) 
Po=Outlier_Val_Properties;      
A=zscore(B);
[ra,ca]=size(A);
Mean_1=zeros(1,ca);
D5mean=zeros(ra,ca);
for i=1:ca
Mean1=mean(A(:,i));
Mean_1(i)=Mean1;
end
for j=1:ra
for i=1:ca
 if abs(A(j,i))>Po.ThreshVal(5) ;
   A(j,i)=Mean_1(1,i); 
end
D5mean=A;
 end
 end
 end
 function D5med =IsOutlier_3p3_Median(B,~) %%
Po=Outlier_Val_Properties;      
A=zscore(B);
[ra,ca]=size(A);
Median_1=zeros(1,ca);
 D5med=zeros(ra,ca);
for i=1:ca
Median1=median(B(:,i));
Median_1(i)=Median1;
end
for i=1:ca
 for j=1:ra
if abs(A(j,i))>Po.ThreshVal(5) ; 
   A(j,i)=Median_1(1,i); 
end
D5med=A;
 end
 end
 end % 
 
 function D6mean =IsOutlier_3p5_Mean(B,~) 
Po=Outlier_Val_Properties;     
A=zscore(B);
[ra,ca]=size(A);
Mean_1=zeros(1,ca);
D6mean=zeros(ra,ca);
for i=1:ca
Mean1=mean(A(:,i));
Mean_1(i)=Mean1;
end
for j=1:ra
for i=1:ca
 if abs(A(j,i))>Po.ThreshVal(6)  ;
   A(j,i)=Mean_1(1,i); 
end
D6mean=A;
 end
 end
 end
 function D6med=IsOutlier_3p5_Median(B,~) %%
Po=Outlier_Val_Properties;     
A=zscore(B);
[ra,ca]=size(A);
Median_1=zeros(1,ca);
 D6med=zeros(ra,ca);
for i=1:ca
Median1=median(B(:,i));
Median_1(i)=Median1;
end
for i=1:ca
 for j=1:ra
if abs(A(j,i))>Po.ThreshVal(6) ; 
   A(j,i)=Median_1(1,i); 
end
D6med=A;
 end
 end
 end % 
  end
end