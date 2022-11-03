function Diff=indexing_Feature(A,B)

[~,c]=size(A);
k=c-1;
Ind=zeros(1,k);
for j=1:k
Ind(j)=j; 
end
Diff=setdiff(Ind,B);%%The operation must be between index,
end