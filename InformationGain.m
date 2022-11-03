    function [gain] = InformationGain(X,Y)  
    %%Calcul information gaing 
    
      [m,n] = size(X);
        gain = ones(1,n)*entropy(Y);
              for i = 1:n
            [~,~,feature] = unique(X(:,i));
            for j = 1:max(feature)
                p = histc(feature(feature==j),j)/m;
                gain(i) = gain(i) - p*entropy(Y(feature==j));
               
            end
              end           
    
    end
    
 
 

