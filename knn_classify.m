function [new_accu, train_accu] = knn_classify(train_data, train_label, new_data, new_label, k)
% k-nearest neighbor classifier 
% Input:
%  train_data: N*D matrix, each row as a sample and each column as a
%  feature
%  train_label: N*1 vector, each row as a label
%  new_data: M*D matrix, each row as a sample and each column as a
%  feature
%  new_label: M*1 vector, each row as a label
%  k: number of nearest neighbors
%
% Output:
%  new_accu: accuracy of classifying new_data
%  train_accu: accuracy of classifying train_data (using leave-one-out
%  strategy)
%
% CS260 2015 Fall, Homework 1


test_label = [];
for i = 1:size(new_data,1)
    newData_mtrx = repmat(new_data(i,:),size(train_data,1),1);
    d = sqrt(sum((train_data - newData_mtrx).^2, 2));% sum by row, then get distance
    [minD,ind] = sort(d,'ascend');
    len = min(k, length(minD));
    
    test_label = [test_label; mode(train_label(ind(1:len)))];
    
end

%new_accu
new_accu = length(find((test_label-new_label)==0)) / size(new_label,1);


%train_accu
test_label = [];
for i = 1:size(train_data,1)
    trainData_mtrx = repmat(train_data(i,:),size(train_data,1),1);
    d = sqrt(sum((train_data - trainData_mtrx).^2, 2));% sum by row, then get distance
    d(i,:) = [];
    [minD,ind] = sort(d,'ascend');
    test_label = [test_label; train_label(ind(1))];
    
end
train_accu = length(find((test_label-train_label)==0)) / size(train_label,1);