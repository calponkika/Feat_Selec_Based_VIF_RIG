function G=Grp_class (M1)
M=unique(M1,'rows'); 
T1=M(:,1:end-1);
T=M{:,end};
 [r,~]=size(T);
 Grpe1={'smurf','back','teardrop','pod','land','neptune'};
 Grpe2={'satan','ipsweep','portsweep','nmap'};
 Grpe3={'warezclient','guess_passwd','warezmaster','imap','ftp_write',...
      'multihop','spy','phf'};
 Grpe4={'buffer_overflow','rootkit','loadmodule','perl'};
  N=cell(r,1);
  for i=1:r;
  if strcmp(T(i,1),'normal');  
      N{i,1}='Normal'; 
  end
if ismember(T(i,1),Grpe1);
       N {i,1}='DOS';
end
  if ismember(T(i,1),Grpe2);
      N{i,1}='Probe';
  end
 if ismember(T(i,1),Grpe3);      
      N{i,1}='U2R';
  end   
 if ismember(T(i,1),Grpe4);
       N{i,1}='R2L';
 end       
  end
G1=cell2table(N);
G=[T1 G1];
Catg=categorical(N);
Cats=categories(Catg);
Occ=countcats(Catg);
T=zeros(1,length(Occ));
Q=cell(1,length(Occ));
fprintf('The number of instances by category is shown in table below\n');
fprintf('%2s%12s%14s\n','Sno','Category','Frequency');
fprintf ('--------------------------------\n');
for j=1:length(Occ)
ClassesStat=Occ(j,1);
T(j)=ClassesStat;
nberOfNonZeros=find(T(j)~=0);
L1=length(nberOfNonZeros);
L2=length(Occ);

GdClass=Cats(j,1);
Q(j,1)=GdClass;
fprintf ('%2d%12s%14d\n',j,Q{j},T(j));
end
if L2-L1>0
 fprintf('Congratulation!!your sample size is stratified, Go on next step\n ');
else
   fprintf('Sorry!! your sample size is not stratified, you may load a new data.\n');
end
end
