  function [ Inp_Perf_VectOpt] = OptFeat_IG_VIF(M,K,Mn3,Y,Targets)
  tic
  %%This function removes K,VIF,and check later RIG
   List1_Feature=indexing_Feature(M,K);  
   VIF_1=VIF(Mn3); 
   K_idx=find(VIF_1>10);
   List2_Feature=setdiff(List1_Feature,K_idx);

%%========Application==vif+RIG========
    [New_Inp]=Severe_VIF_Removal(M,K,Mn3);
   
      X1=New_Inp;

    %=====RIG =======
   [IGvect]= InformationGain(X1,Y);
   [IG1,indexes] = sort(IGvect,'ascend'); 
   
   n=length(IG1);
   Nbr_bins=round(sqrt(n)); 
   range=max(IG1)-min(IG1);
   BinWidth=range/Nbr_bins;
   fprintf('The computed IG values from this sample size falls in range[ %3.4f - %3.4f]\n',min(IG1),max(IG1));

   if range==0
       fprintf('The IG  for your data is the same\n')
   else
       InputVIF_RIG=cell(1,Nbr_bins);
       Perfomance_All=cell(1,Nbr_bins);
       Feature_All=cell(1,Nbr_bins);
       AccIG=zeros(3,Nbr_bins);
       
       CUM=zeros(1,Nbr_bins);
       for i=1:Nbr_bins
           CumEdge=min(IG1)+(i-1)*BinWidth ;
           CUM(i)=CumEdge;
           RemainVect=find(IG1>=CumEdge);
           idxInp=indexes(RemainVect);
           InputIG=X1(:,idxInp);
           Acc_Prec_Fpr=NNW_Alg3Metr(InputIG',Targets);
           InputVIF_RIG{i}=InputIG;
           Perfomance_All{i}= Acc_Prec_Fpr;
          AccIG(:,i)=Acc_Prec_Fpr;
      
          Acc1=AccIG(1,:);
          Precion=AccIG(2,:);
         [AccMax,Idxmax]=max(Acc1);
          PrecMax=Precion(Idxmax);
          FPRate=AccIG(3,:);
          FprMax=FPRate(Idxmax);
          %%=============================
          idxoptimal=indexes(IG1>=CUM(Idxmax));
          Selected_Features=List2_Feature(idxoptimal);
          Feature_All{i}=Selected_Features;
           %===========================

         Acc_Prec_FprMax=[AccMax PrecMax FprMax];
          Optimal_Input= InputVIF_RIG{Idxmax};
           OptPerf=Perfomance_All{Idxmax};
           Optimal_Feature=Feature_All{Idxmax};
         Inp_Perf_VectOpt={Optimal_Input, OptPerf,Optimal_Feature};
       end
  
  L=length(Selected_Features);
  fprintf('The number of selected Optimal features by VIF_IG is[%d] \n',L);
 fprintf('The computed perfr. at consecutive new cutoff point is shown below \n')
 fprintf('Sn0 |Accuracy |Precison |FPR rate|\n')
 fprintf('-----------------------------------\n')
 for j=1:Nbr_bins
 fprintf('%2d |%3.2f     |%3.2f    |%3.3f     | \n',j,Acc1(j),Precion(j), FPRate(j))
 end
  fprintf('-----------------------------------\n')
 fprintf('The optimal index  for cumulative edges [%d]\n',Idxmax); 
fprintf('The optimal accuracy for this input is [%3.2f%%],test Acc. is [%3.2f%%]\n',AccMax, Acc_Prec_FprMax(1)); 
fprintf('The optimal Precison is [%3.2f%%] and FPR is [%3.3f]\n', Acc_Prec_FprMax(2), Acc_Prec_FprMax(3)); 
fprintf('The features for optimal features are \n');
 fprintf('-----------------------------------\n')   
 fprintf('Sno    | FeatN0\n')
 fprintf('-----------------------------------\n')   
   for k=1:L
       fprintf('%2d    |%2d     | \n',k,Selected_Features(k))   
   end
    fprintf('-----------------------------------\n')
save Optimal_Features
     toc 
 fprintf('The elapsed Time for opt VIF_RIG is  [%d]\n',toc );
   end    
  end
  