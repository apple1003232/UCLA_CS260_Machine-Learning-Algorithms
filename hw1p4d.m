% codes for 4d
clc;
clear;
close all;
load('boundary.mat');

t = 1/100;
plotData = [];
for xi = 0:t:1
    for yi = 0:t:1
        plotData = [plotData;xi yi];
    end
end

%k= 1 5 15 20
[plotLabel] = knn_classify_noa(features, labels, plotData,20);

[x1, ~] = find(plotLabel==1);
p1 = plotData(x1,:);% points labeled 1
[x2, ~] = find(plotLabel==-1);
p2 = plotData(x2,:);% points labled -1

plot(p1(:,1), p1(:,2),'r:.');
hold on;
plot(p2(:,1), p2(:,2),'b:.');

title('k = 20');