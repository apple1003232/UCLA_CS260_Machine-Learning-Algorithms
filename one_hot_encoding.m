function [Data, label, data] = one_hot_encoding(filename);
% one_hot_encoding 
% Input:
%  filename: filename or filepath
%  
% Output:
%  data: N*D matrix, each row as a sample and each column as a component of
%  a feature, this is a binary matrix.
%  label: N*1 vector, each row as a label
%  Data: N*D matrix, each row as a sample and each column as a
%  representation of a feature, e.g. 1 as vhigh, 2 as high etc.
%
% CS260 2015 Fall, Homework 1

fid = fopen(filename);
org_data = textscan(fid,'%s%s%s%s%s%s%s%*[^\n]','delimiter',',');
fclose(fid);

m1 = zeros(1,4);
m2 = zeros(1,3);
m = 0;

data_col = [];
data = [];

DataC= [];
Data = [];
label = [];


for c = 1:3%column1:3 -- features buying maint doors
    for r = 1:size(org_data{1,c},1);%row -- training examples
        x = org_data{1,c}{r,1};
       
            if (strcmp(x,'vhigh') || strcmp(x,'2'))
                m1(1,1) = 1;
                m = 1;
            elseif (strcmp(x,'high') || strcmp(x,'3'))
                m1(1,2) = 1;
                m = 2;
            elseif (strcmp(x,'med') || strcmp(x,'4'))
                m1(1,3) = 1;
                m = 3;
            elseif (strcmp(x,'low') || strcmp(x,'5more'));
                m1(1,4) = 1;
                m = 4;
            end
        data_col = [ data_col; m1 ];
        DataC = [DataC; m];
        m1 = zeros(1,4);
        m = 0;
    end
    data = [data,data_col];
    data_col = [];
    Data = [Data, DataC];
    DataC = [];
end

for c = 4:6%column4:6 -- features persons lug-boot safety
    for r = 1:size(org_data{1,c},1);%row -- training examples
        x = org_data{1,c}{r,1};
       
            if (strcmp(x,'small') || strcmp(x,'2') || strcmp(x,'low'))
                m2(1,1) = 1;
                m = 1;
            elseif (strcmp(x,'4') || strcmp(x,'med'))
                m2(1,2) = 1;
                m = 2;
            elseif (strcmp(x,'more') || strcmp(x,'big') || strcmp(x,'high'))
                m2(1,3) = 1;
                m = 3;
            end
        data_col = [ data_col; m2 ];
        DataC = [DataC; m];
        m2 = zeros(1,3);
        m = 0;
    end
    data = [data,data_col];
    data_col = [];
    Data = [Data, DataC];
    DataC = [];
end

c=7;
for r = 1:size(org_data{1,c},1);%row -- training examples
        x = org_data{1,c}{r,1};
       
            if (strcmp(x,'unacc'))
                m = 1;
            elseif (strcmp(x,'acc') )
                m = 2;
            elseif (strcmp(x,'good'))
                m = 3;
            elseif (strcmp(x,'vgood'))
                m = 4;
            end
        label = [ label; m ];
        m = 0;
end

