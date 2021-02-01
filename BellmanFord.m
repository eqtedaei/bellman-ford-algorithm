% Writen by: Amir Eqtedaei
% amir.eqtedaei@shahroodut.ac.ir
clc
clear all
close all

a{1}=[0,3,2,5,inf,inf;  % enter graph weight
    3,0,inf,1,4,inf;
    2,inf,0,2,inf,1;
    5,1,2,0,3,inf;
    inf,4,inf,3,0,2;
    inf,inf,1,inf,2,0];


for i=1:size(a{1},1)
    aa=a{1}(i,:);
    aa(isinf(aa))=0;
    x=find(aa~=0);
    N{i}=x;
end
clear x y
disp('iteration 1')
a{1}
for j=1:100
    for i=1:size(a{j},1)
        x=a{j}(i,:);
        y=N{i};
        z=[x;[a{j}(y,:)+[x(y)]']];
        
        a{j+1}(i,:)=min (z);
    end
    disp('==================================')
    disp(['iteration ',num2str(j+1)])
    a{j+1}
    if a{j}==a{j+1}
        break;
    end
    j=j+1;
end
