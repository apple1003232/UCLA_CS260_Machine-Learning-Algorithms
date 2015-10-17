
function [new_label] = knn_classify_noa (train_data, train_label, new_data, k);
% k-nearest neighbor classifier 
% Input:
%  train_data: N*D matrix, each row as a sample and each column as a
%  feature
%  train_label: N*1 vector, each row as a label
%  new_data: M*D matrix, each row as a sample and each column as a
%  feature
%  
%  k: number of nearest neighbors
%
% Output:
%  new_label: M*1 matrix, each row as a label
%
% CS260 2015 Fall, Homework 1
new_label = [];
for i = 1:size(new_data,1)
    newData_mtrx = repmat(new_data(i,:),size(train_data,1),1);
    d = sqrt(sum((train_data - newData_mtrx).^2, 2));% sum by row, then get distance
    [minD,ind] = sort(d,'ascend');
    len = min(k, length(minD));
    
    new_label = [new_label; mode(train_label(ind(1:len)))];
    
end