function [K,T]=Zero_SdtRemvl_Modified(Inp) 
%%Check the constant features 
[~,ca]=size(Inp);
Std1_1=zeros(1,ca);
for i=1:ca;
Std1=std(Inp(:,i));
Std1_1(i)=Std1;
K=find(~Std1_1);
if Std1 ~=0;
   X1=Inp(:,i); 
   X2{i}=X1; 
end
 
 T=cell2mat(X2); 
[r,c]=size(T);
end
fprintf('\n')
fprintf('The prepared sample size from your loaded data is[%d x %d]\n\n',r,c);
fprintf('---------------------------------------------------------------------\n')
fprintf('USELESS PREDICTORS[Features with homogeneous or the same data] DETECTION\n')
fprintf('----------------------------------------------------------------------\n')
fprintf('The detected useless predictors from data inputs is [%2d]\n',K)
%end


