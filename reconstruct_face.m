% Reconstruct.m 
function [] = reconstruct() 
load F:\study\数据挖掘\实验报告\实验二\code\ORL\model.mat; 
% 计算新图片在特征子空间中的系数
img = 'F:\study\数据挖掘\实验报告\实验二\code\test2\10.jpg' 
a=imread(img); 
b=a(1:112*92); % b 是行矢量 1×N，其中 N＝10304，提取顺序是先列后行，即从上到下，从左到右
b=double(b); 
b=b-samplemean; 
c = b * base; % c 是图片 a 在子空间中的系数, 是 1*p 行矢量
% 根据特征系数及特征脸重建图
% 前 15 个 
t = 15; 
temp = base(:,1:t) * c(1:t)'; 
temp = temp + samplemean'; 
imwrite(mat2gray(reshape(temp, 112,92)),'F:\study\数据挖掘\实验报告\实验二\code\test2\t1.jpg'); 
% 前 50 个 
t = 50; 
temp = base(:,1:t) * c(1:t)'; 
temp = temp + samplemean'; 
imwrite(mat2gray(reshape(temp, 112,92)),'F:\study\数据挖掘\实验报告\实验二\code\test2\t2.jpg'); 
% 前 100 个 
t = 100; 
temp = base(:,1:t) * c(1:t)'; 
temp = temp + samplemean'; 
imwrite(mat2gray(reshape(temp, 112,92)),'F:\study\数据挖掘\实验报告\实验二\code\test2\t3.jpg'); 
% 前 150 个 
t = 150; 
temp = base(:,1:t) * c(1:t)'; 
temp = temp + samplemean'; 
imwrite(mat2gray(reshape(temp, 112,92)),'F:\study\数据挖掘\实验报告\实验二\code\test2\t4.jpg'); 
% 前 199 个 
t = 199; 
temp = base(:,1:t) * c(1:t)'; 
temp = temp + samplemean'; 
imwrite(mat2gray(reshape(temp, 112,92)),'F:\study\数据挖掘\实验报告\实验二\code\test2\t5.jpg');