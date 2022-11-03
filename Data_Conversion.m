function  Num_Dataset =Data_Conversion(K)
NewDat=Grp_class(K);
% % % % Split M into numerical split and categorical splits
M1=NewDat(:,[1,5:41]); 
M2=NewDat(:,[2:4,42]);  
Md= table2array(M1);
[r,c]=size(M2);
K1=zeros(r,c); 

for i=1:c
[~,~,G]=unique(M2(:,i));
K1(:,i)=G;
end
 %%Reoganise your data //Keep the initial label that was binded on dataset
  Num_Dataset=[Md(:,1) K1(:,1:3) Md(:,2:38) K1(:,4)]; 
end