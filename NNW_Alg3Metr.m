function Metrics= NNW_Alg3Metr(InputsP,Targets)
%%This algorithm uses three 3 metrics
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
 [r,c]=size(cm);
Wpre =zeros(1,c);
CsVec=zeros(1,c);
FP_i=zeros(1,c);
STR=zeros(1,c);
for i=1:c
Cs=sum(cm(:,i));
prec_i=cm(i,i)/Cs;
Wpre(i)=prec_i;
CsVec(i)=Cs;
CsVec1=sum(CsVec);
PrecisonOk=mean(Wpre)*100;%%well classified wrt to target value
% % calculate FPR   
Cs=sum(cm(i+1:r,i));
FP_i(i)=sum(Cs);
FP=sum(FP_i);
ST=sum(cm(i,i));
STR(i)=ST;
Tot=sum(STR);
TN=Tot-cm(1,1); 
FPR=FP/Tot;

Acc=(Tot/CsVec1)*100;
end
Metrics=[Acc,PrecisonOk,FPR];
  end

 