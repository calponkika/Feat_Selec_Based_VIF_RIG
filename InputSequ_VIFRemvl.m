function   [Inp]=InputSequ_VIFRemvl(B) 
load Sample_Size45K1
  M=samplesize4;
Num_Dataset=Data_Conversion(M);
[K,PreFS]=Zero_SdtRemvl_Modified(Num_Dataset);
[Inputs,~]=DataMorph_NNW(PreFS);%%Separate into five group
A=Inputs; %%%Pick the input part resulted from the above function  , and call it A . You can recuperate it on the work place
B=InputSequences(A);%%B is a cell
T=B{1};
T1=T';
L=length(B);
N_VIF=cell(1,L);%

   Inp=Severe_VIF_Removal(M,K, A);
 end