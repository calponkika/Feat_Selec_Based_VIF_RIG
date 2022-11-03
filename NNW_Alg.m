function Accuracy= NNW_Alg(InputsP,Targets)

[Inp,~]=size(InputsP);
 n =(round((Inp *2)/3))+5;
net = patternnet(n);
net.performFcn = 'crossentropy';
net.trainFcn = 'trainscg';
% % % net.layer{1}.transferFcn='Relu';
net=configure(net,InputsP, Targets);
 net.divideParam.trainRatio = 70/100;
 net.divideParam.valRatio = 15/100;
 net.divideParam.testRatio = 15/100;
 [net,~] = train(net, InputsP, Targets);
 outputs = net(InputsP);
 Y=outputs;
 T= Targets;
[~,cm]=confusion(T,Y);
[rcm,~]=size(cm);
B2=zeros (1,rcm);
D5=zeros (1,rcm);
 for i2=1:rcm
diag=cm(i2,i2);
B2(i2)=diag ;      
Num=sum(B2(1,:));
d3=cm(:,i2) ;      
Sum_col=sum(d3);    
D5(i2)=Sum_col ;        %
De1=sum(D5(1,:));
Accuracy=(Num/De1)*100;
  end
end
 