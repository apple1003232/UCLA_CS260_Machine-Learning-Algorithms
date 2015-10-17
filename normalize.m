%normalization
function [norData] = normalize(data);
% Pre-processing, normalize binary features.
% Input:
%  data: N*D matrix, each row as a sample and each column as a feature
%  
% Output:
%  norData:  normalized N*D matrix, each row as a sample and each column as a 
% feature, range from 0 to 1
%
% CS260 2015 Fall, Homework 1
len = size(data,1);
maxV = [4,4,4,3,3,3];
minV = [0,0,0,0,0,0];
range = maxV - minV;
norData = (data - repmat(minV,len,1) ) ./ repmat(range, len, 1);