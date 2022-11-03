function   [B]=InputSequences(A) 
%%CREATE A SEQUENCES OF INPUTS ,use cells so you create a dynamic sequences
%%%proposed threshold and their imputation method extend the outlier
%%%magnitude from [2.5-3.5] 
O{1}=OutlierRemovalFxn.IsOutlier_2p5_Mean(A);
O{2}=OutlierRemovalFxn.IsOutlier_2p7_Mean(A);
O{3}=OutlierRemovalFxn.IsOutlier_2p9_Mean(A);
O{4}=OutlierRemovalFxn.IsOutlier_3p1_Mean(A);%%//New fnct 
O{5}=OutlierRemovalFxn.IsOutlier_3p3_Mean(A);%%//New fnct
O{6}=OutlierRemovalFxn.IsOutlier_3p5_Mean(A);
Med{1}=OutlierRemovalFxn.IsOutlier_2p5_Median(A);
Med{2}=OutlierRemovalFxn.IsOutlier_2p7_Median(A);
Med{3}=OutlierRemovalFxn.IsOutlier_2p9_Median(A);
Med{4}=OutlierRemovalFxn.IsOutlier_3p1_Median(A);%%//New fnct
Med{5}=OutlierRemovalFxn.IsOutlier_3p3_Median(A);%%//New fnct
Med{6}=OutlierRemovalFxn.IsOutlier_3p5_Median(A);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
M{1}=zscore(A);
M{2}=MinMaxScaling(A);
M{3}=DScaling(A);
%%%Sequence Methods 
M{4}=DScaling(O{1});
M{5}=DScaling(O{2});
M{6}=DScaling(O{3});
M{7}=DScaling(O{4});
M{8}=DScaling(O{5});
M{9}=DScaling(O{6});
M{10}=zscore(O{1});
M{11}=zscore(O{2});
M{12}=zscore(O{3});
M{13}=zscore(O{4});
M{14}=zscore(O{5});
M{15}=zscore(O{6});
M{16}=MinMaxScaling(O{1});
M{17}=MinMaxScaling(O{2});
M{18}=MinMaxScaling(O{3});%%the winner
M{19}=MinMaxScaling(O{4});
M{20}=MinMaxScaling(O{5});
M{21}=MinMaxScaling(O{6});
M{22}=DScaling(Med{1});
M{23}=DScaling(Med{2});
M{24}=DScaling(Med{3});
M{25}=DScaling(Med{4});
M{26}=DScaling(Med{5});
M{27}=DScaling(Med{6});
M{28}=zscore(Med{1});  
M{29}=zscore(Med{2});
M{30}=zscore(Med{3});
M{31}=zscore(Med{4});
M{32}=zscore(Med{5});
M{33}=zscore(Med{6});
M{34}=MinMaxScaling(Med{1});
M{35}=MinMaxScaling(Med{2});
M{36}=MinMaxScaling(Med{3});
M{37}=MinMaxScaling(Med{4});
M{38}=MinMaxScaling(Med{5});
M{39}=MinMaxScaling(Med{6});
%%%Add new function if it exists
L=length(M);
 B=cell(1,L);
for i=1:L;
    K=M{i}';
    B{i}=K;
end
end