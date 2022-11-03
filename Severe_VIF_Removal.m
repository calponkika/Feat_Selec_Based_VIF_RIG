function [New_Inp]=Severe_VIF_Removal(M,K,Mn3) %%K,M3 are output of zeroremvl_Modified
tic
List1_Feature=indexing_Feature(M,K);
VIF_1=VIF(Mn3); 
K_idx=find(VIF_1>10);%%Collinear vif coeff zitandukanye na index yazo kuri features 
SVIF=VIF_1(K_idx);%%Tacking its values
[~,ck]=size(K_idx);
if ck > 0
New_Inp_Vif=Mn3(:,K_idx);
List2_Feature=List1_Feature(K_idx);%%we project to list one  
Nk_idx=find(VIF_1<10); %%Not severe colinearIdx
New_Inp=Mn3(:,Nk_idx);

[~,ck]=size(New_Inp_Vif);
[r,c]=size(New_Inp);

fprintf('The size of sample size without any severe collinear attribute is[%d x %d]\n',r,c);

fprintf('\n')
fprintf('The number of detected severe collinear features is [%2d] and they are listes as follows:\n',length(K_idx));
fprintf('\n')

fprintf('The detected features as severe collinear (DFSC) predictors from your inputs\n')
fprintf('-------------------------------------\n')
    fprintf('Sno    |DFSC   |VIF  |\n')
fprintf('------------------------------------\n')
for k=1:length(List2_Feature);
    fprintf('%d     | %d   |%3.2f |\n',k,List2_Feature(k),SVIF(k))
end
% fprintf('The VIF for the above feature is %3.2f\n',SVIF);

fprintf('------------------------------------\n')

else
New_Inp=Mn3;   
fprintf('------------------------------------------------------------\n')
fprintf('This sample size has not collinear attribute \n');
fprintf('-------------------------------------------------------------\n')
end
toc
  fprintf('The  elapse time for SvereVIF is [%3.3f]\n',toc);

end
