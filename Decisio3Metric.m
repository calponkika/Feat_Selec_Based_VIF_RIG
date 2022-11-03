function [Output] =Decisio3Metric(AccPrec_Fpr0,AccPrec_Fpr_TIG,Acc_RIG,AccPrec_FprVIF,AccPrec_FprIG_VIF)
%%Split the performance according to your structure 
Acc_init=AccPrec_Fpr0(:,1);
  G1=Acc_init(1:3); 
  G2=Acc_init(4:end);
%%precision
  Prec=AccPrec_Fpr0(:,2);
  P_1=Prec(1:3);
  P_2=Prec(4:end);
 %%False positve rate
  FP1=AccPrec_Fpr0(:,3);
  FP1_1=FP1(1:3);
  FP1_2=FP1(4:end);
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  Acc_TIG=AccPrec_Fpr_TIG(:,1);
  AcTIG1=Acc_TIG(1:3);
  AcTIG2=Acc_TIG(4:end);
  Prec_TIG=AccPrec_Fpr_TIG(:,2);
  PrTIG1=Prec_TIG(1:3);
  PrTIG2=Prec_TIG(4:end);
  FPR_TIG=AccPrec_Fpr_TIG(:,3);
  FprTIG1= FPR_TIG(1:3);
  FprTIG2= FPR_TIG(4:end);
  %%%%%%%%%%%%%%%%%%%%%%%
  Acc_RIG2=Acc_RIG(:,1);
IG1=Acc_RIG2(1:3);
IG2=Acc_RIG2(4:end);
Prec_RIG2=Acc_RIG(:,2);
PreInit1=Prec_RIG2(1:3);
PreInit2=Prec_RIG2(4:end);
FPR_Init=Acc_RIG(:,3);
FPR_Init1=FPR_Init(1:3);
FPR_Init2=FPR_Init(4:end);

%%Perormance after removing strong collinear features by using  VIF
AccVIF=AccPrec_FprVIF(:,1);%%ACCURACY FOR IG-VIF
Acc_VIF1=AccVIF(1:3);
Acc_VIF2=AccVIF(4:end);

Prec2=AccPrec_FprVIF(:,2);%precision AccVIF Prec2
P2_1=Prec2(1:3);
P2_2=Prec2(4:end);
%FPR for  IG_VIF
 FP2=AccPrec_FprVIF(:,3);
  FP2_1=FP2(1:3);
  FP2_2=FP2(4:end);
 %%%%%%%%%%%%%%%%%
AccVIFRIG=AccPrec_FprIG_VIF(:,1);
 IG_VIF1=AccVIFRIG(1:3);
 IG_VIF2=AccVIFRIG(4:end);
Prec3=AccPrec_FprIG_VIF(:,2);%% 
Prec3_1=Prec3(1:3);
Prec3_2=Prec3(4:end);
Fpr3=AccPrec_FprIG_VIF(:,3);
Fpr3_1=Fpr3(1:3);
Fpr3_2=Fpr3(4:end);
% [maxIG1,idxmaxIG1]=max(IG_VIF);
 Output=[Acc_init,AccVIF, AccVIFRIG];
% Method visualization are orderwith repect to iNPUTSEQUENCE FXN
%%You may use cross product o match two methods 
 M={'Zscore.'...
     'MinMax normalization.'...
     'Decimal Scaling.'};
   CM={ 'ZOD and Decimal Scaling,Threshold=2.5,Opt=Mean.'...
    'ZOD and Decimal Scaling,Threshold=2.7,Opt=Mean.'...
    'ZOD and Decimal scaling,ThresholdT=2.9,Opt=Mean.'...
     'ZOD and Decimal Scaling,Threshold=3.1, Opt=Mean.'...
     'ZOD and Decimal Scaling,Threshold=3.3,Opt=Mean.'...
      'ZOD and Decimal Scaling,Threshold=3.5,Opt=Mean.'...
      'ZOD and Zscore,Threshold=2.5, Opt=Mean.'...
     'ZOD and Zscore,Threshold=2.7, Opt=Mean.'...
     'ZOD and Zscore,Threshold=2.9, Opt=Mean.'...
     'ZOD and Zscore,Threshold=3.1,Opt=Mean.'...
      'ZOD and Zscore,Threshold=3.3,Opt=Mean.'...
      'ZOD and Zscore,Threshold=3.5, Opt=Mean.'...
     'ZOD and MinMax,Threshold=2.5,Opt=Mean.'...
    'ZOD and MinMax,Threshold=2.7,Opt=Mean.'...
    'ZOD and MinMax,Threshold=2.9,Opt=Mean.'...
    'ZOD and MinMax,Threshold=3.1,Opt=Mean.'...
    'ZOD and MinMax,Threshold=3.3,Opt=Mean.'...
     'ZOD and MinMax,Threshold=3.5,Opt=Mean.'...
     'ZOD (Decimal scaling),Threshold=2.5,Opt=Median.'...
    'ZOD (Decimal scaling),Threshold=2.7,Opt=Median.'...
    'ZOD (Decimal scaling),Threshold=2.9, Opt=Median.'...
   'ZOD(Decimal scaling),Threshold=3.1,Opt=Median.'...
     'ZOD(Decimal scaling),Threshold=3.3,Opt=Median.'...
   'ZOD (Decimal scaling),Threshold=3.5,Opt=Median.'...
   'ZOD (Zscore),Threshold=2.5,Opt=Median.'...
   'ZOD (Zscore),Threshold=2.7,Opt=Median.'...
   'ZOD (Zscore),Threshold=2.9,Opt=Median.'...
   'ZOD (Zscore),Threshold=3.1,Opt=Median.'...
    'ZOD (Zscore),Threshold=3.3,Opt=Median.'...
      'ZOD (Zscore),Threshold=3.5,Opt=Median.'...
   'ZOD(MinMax), Threshold=2.5, Opt=Median.'...
   'ZOD(MinMax), Threshold=2.7, Opt=Median.'...
   'ZOD(MinMax), Threshold=2.9, Opt=Median.'...
   'ZOD(MinMax), Threshold=3.1, Opt=Median.'...
    'ZOD(MinMax), Threshold=3.3, Opt=Median.'...
   'ZOD(MinMax), Threshold=3.5, Opt=Median.'};
%%%%%%
fprintf('\n')
fprintf('\n')
%%%%%
fprintf('----------------------------------------------------------------------------------\n')
fprintf('COMPARISON BETWEEN RESULTS\n')
fprintf('=====================================================================================\n')
fprintf('ACCOURACIES WITHOUT VIF             || ACCOURACIES WITH VIF\n')
fprintf('----------------------------------------------------------------------------------\n')
fprintf('Sample|Initial Input   || RIG  ||    VIF          ||   VIF-RIG       ||Applied methods generated  \n')
fprintf('No    |Acc.| Prec.|FPR ||Acc  ||Acc. |Prec  |FPR ||Acc. |Prec  |FPR || from ZOD-FS method       \n')
fprintf('======================================================================================\n')
for j=1:length(G1)
fprintf('%2d |%3.2f |%3.2f  |%3.3f || %3.2f||%3.2f|%3.2f|%3.3f ||%3.2f|%3.2f|%3.3f|%s  \n',j,G1(j),P_1(j),FP1_1(j),IG1(j),Acc_VIF1(j),P2_1(j),FP2_1(j),IG_VIF1(j),Prec3_1(j),Fpr3_1(j),M{j})
end
for j1=1:length(G2)
    j2=j1+length(G1);
fprintf('%2d |%3.2f|%3.2f  |%3.3f || %3.2f||%3.2f|%3.2f|%3.3f ||%3.2f|%3.2f|%3.3f|%s  \n',j2,G2(j1),P_2(j1),FP1_2(j1),IG2(j1),Acc_VIF2(j1),P2_2(j1),FP2_2(j1),IG_VIF2(j1),Prec3_2(j1),Fpr3_2(j1),CM{j1})
end
% fprintf('--------------------------------------------------------------------------------------\n')
fprintf('\n')
fprintf('\n')
fprintf('====================================================================================\n')
fprintf('COMPARISON BETWEEN Robust Information Gain RIG and TraditionalInformation Gain\n')
fprintf('=====================================================================================\n')
fprintf('Robust Information Gain       ||      Traditional Info.Gain at 50%%\n ')
fprintf('----------------------------------------------------------------------------------\n')
fprintf('Sample|    RIG                ||     TIG            ||Applied methods generated  \n')
fprintf('-----  -----------------------  -------------------  -----------------------------\n')
fprintf('No    |Acc.| Prec.|FPR        ||  Acc | Prec  |FPR  || from ZOD-FS method       \n')
fprintf('======================================================================================\n')
for j=1:length(G1)
fprintf('%2d |%3.2f |%3.2f  |%3.3f    ||%3.2f|%3.2f|%3.2f    ||%s  \n',j,IG1(j),PreInit1(j), FPR_Init1(j), AcTIG1(j), PrTIG1(j),FprTIG1(j),M{j})
end
for j1=1:length(G2)
    j2=j1+length(G1);
fprintf('%2d |%3.2f |%3.2f  |%3.3f    ||%3.2f|%3.2f|%3.2f    ||%s \n',j2,IG2(j1),PreInit2(j1), FPR_Init2(j1), AcTIG2(j1), PrTIG2(j1),FprTIG2(j1),CM{j1})
end
fprintf('\n')
fprintf('\n')

fprintf('SUMMARY: DETECTED BEST SAMPLE SIZES \n')
fprintf('---------------------------------------------------\n')
IdxFit=find((AccVIFRIG>AccVIF)&(AccVIFRIG>Acc_init)&(Prec3>Prec2)&(Prec3>Prec)&(Fpr3<FP2)& (Fpr3<FP1)); %%Constraints of proposed mehtod2
fprintf('The best sample size that fits  the (VIF+IG) Method \n')
fprintf('-------------------------------------------------------\n')
fprintf('\n')
fprintf('|Sample |   Initial%%)  || VIF (%%)       ||  VIF_RIG %%) ||\n')
fprintf('|size No|Acc. |prec     ||  Acc. |prec    || Acc. |prec   ||\n')
fprintf('---------------------------------------------------------\n')
 for t=1:length(IdxFit)%%
fprintf('|%d  |%3.2f |%3.2f     || %3.2f |%3.2f   || %3.2f|%3.2f||\n',IdxFit(t), Acc_init(IdxFit(t)),Prec(IdxFit(t)),AccVIF(IdxFit(t)),Prec2(IdxFit(t)),AccVIFRIG(IdxFit(t)), Prec3(IdxFit(t)))
 end
 fprintf('=======================================================\n')
 
end

