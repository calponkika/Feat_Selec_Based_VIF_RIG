function   [OptSeqMeth]=Performance_VIF_RIG(~,~) 

%%Load a sample size 
  load Sample_Size45K1
   M=samplesize4;

 % Dataset trasformation 
Num_Dataset=Data_Conversion(M);
% Remove constant features 
[K,PreFS]=Zero_SdtRemvl_Modified(Num_Dataset);
% transform the class label into big classes 
[Inputs,Targets]=DataMorph_NNW(PreFS);
% The class label in one column , while Targets stands for
% Multiclassification of 5 classes 
Y=PreFS(:,end);

A=Inputs; 
% The following function allows to sequentially load many inputs. These
% inputs were scaled and outliers were removed by using Zscore with
% predefined parameters [2.5-3.5] 
B=InputSequences(A); 
%Preallocating the outputs
RsquAdj=zeros(1,length(B));
Rsquared=zeros(1,length(B));
Acc_RIG1=zeros(length(B),3);
Acc_IGVIF1=zeros(length(B),3);
Acc_init=zeros(length(B),3);
Acc_VIFRem=zeros(length(B),3);
Acc_TIG1=zeros(length(B),3);
% INPUT SEQUENCE RESULTED FROM VIF  WHY NOT IG 
%Q=Inpt_Non_Collinear;
for i=1:length(B)
    fprintf('===================================================\n')
    fprintf('Preprocessed sample size No[%d]\n',i)
    fprintf('===================================================\n')
    InpAcc=B{i};
    %Multicollinearity detection by using VIF
    Inpt_N_VIF=Severe_VIF_Removal(M,K,InpAcc');
       fprintf('\n')
    fprintf('=====================================\n')
    fprintf('Apply Backpropagation only on your Sample\n')
    fprintf('=====================================\n')
    % The function for computing the classification performance of initial
    % data by using backpropagation//No feature selection 
    Accuracy_No_Transformation=NNW_Alg3Metr(InpAcc,Targets);
    fprintf('The results from it are in the table\n')
    fprintf('\n')
    % The function for computing the classification performance, after
    % selecting features   by using traditional Information Gain (TIG),by
    % taking X percentage
    fprintf('=====================================\n')
    fprintf('USE Traditional Inf. Gain [50precent of Ranked features]\n')
    fprintf('=====================================\n')
    Acc_TIG=Traditional_IG(InpAcc',Y,Targets); 
    fprintf('\n')
   % The function for computing the classification performance, after
    % selecting features   by using Robust  Information Gain (RIG) ,Novelty
    % method
   
    fprintf('=====================================\n')
    fprintf('Apply R.I.G on your Sample\n')
    fprintf('=====================================\n')
    Acc_RIG=OptFeature_RIG(M,K,InpAcc',Y,Targets); 
    fprintf('\n')
    % The function for computing the classification performance, after
    % removing collinear  features   by using Variance Inflation Factor (VIF)
    % method
   fprintf('=====================================\n')
    fprintf('Apply VIF  on your Sample\n')
    fprintf('=====================================\n')
    Accuracy_VIF_Removal=NNW_Alg3Metr(Inpt_N_VIF',Targets);
    fprintf('Se results in the summarized table\n')
    fprintf('\n')
    % The function for computing the classification performance, after
    % removing features  by using the combination of Variance Inflation Factor (VIF)
    % and RIG methodS  [[The proposed method]]
     fprintf('=====================================\n')
     fprintf('Apply VIF+R.I.G on your Sample\n')
    fprintf('=====================================\n')
     Acc_IGVIF=OptFeat_IG_VIF(M,K,InpAcc',Y,Targets); 
     fprintf('=====================================\n') 
    fprintf('\n')
   % Evaluate R-squared 
    XRsq=Inpt_N_VIF;
    mdl1 = fitlm( XRsq,Y);
    Rsquared1= mdl1.Rsquared.Ordinary;
    RsquAdj1=mdl1.Rsquared.Adjusted;
    fprintf('=====================================\n')

    Rsquared(i,:)=Rsquared1;
    RsquAdj(i,:)= RsquAdj1;
    Acc_init(i,:)= Accuracy_No_Transformation;
    Acc_RIG1(i,:)=Acc_RIG;
    Acc_TIG1(i,:)=Acc_TIG;
    Acc_VIFRem(i,:)=Accuracy_VIF_Removal;
    Acc_IGVIF1(i,:)=Acc_IGVIF; 
       
end
%The function that will display the your results accordingly 
OptSeqMeth=Decisio3Metric(Acc_init,Acc_TIG1, Acc_RIG1,Acc_VIFRem,Acc_IGVIF1);
    fprintf('\n')
    fprintf('\n')
 fprintf('=====================================\n')
 fprintf('SUMMARY OF RSQUARED\n')
 fprintf('=====================================\n') 
 fprintf('Sample|Rsquared ||Radjusted\n')
for k=1:length(B)
fprintf('%2d     |%3.2f    ||%3.2f     | \n',k,Rsquared(k),RsquAdj(k))
end
 fprintf('=======================================================\n')
  fprintf('               END            \n') 

end


