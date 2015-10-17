%codes for 4c
clc;
clear;
close all;
[trainData,train_label, ~]=one_hot_encoding('car_train.data');
[validData,valid_label, ~]=one_hot_encoding('car_valid.data');
[testData,test_label,~]=one_hot_encoding('car_test.data');

%normalization
norTraData = normalize(trainData);
norValData = normalize(validData);
norTesData = normalize(testData);

acu_v = [];
for k = 1:2:23
[knnV,looV] = knn_classify(norTraData, train_label, norValData, valid_label,k);
acu_v = [acu_v;k, knnV,looV];
end

knnAscend = sortrows(acu_v, 2);
kRight = knnAscend(size(knnAscend,1),1);

acu_t = [];
for k = 1:2:23
[knnT,looT] = knn_classify(norTraData, train_label, norTesData, test_label,k);
acu_t = [acu_t;k, knnT,looT];
end

[x,y] = knn_classify(norTraData, train_label, norTesData, test_label,kRight)



