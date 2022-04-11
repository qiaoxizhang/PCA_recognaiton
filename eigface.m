% eigface.m 
function [] = eigface() 
% calc xmean,sigma and its eigen decomposition 
allsamples=[];%所有训练图像
for i=1:40 
 for j=1:5 
 a=imread(strcat('F:\study\数据挖掘\实验报告\实验二\code\ORL\s',num2str(i),'\',num2str(j),'.jpg')); 
 % imshow(a); 
 b=a(1:112*92); % b 是行矢量 1×N，其中 N＝10304，提取顺序是先列后行，即从上到下，从左到右
 b=double(b); 
 allsamples=[allsamples; b]; % allsamples 是一个 M * N 矩阵，allsamples 中每一行数据代表一张图片，其中 M＝200 
 end 
end 
samplemean=mean(allsamples); % 平均图片，1 × N 
for i=1:200 xmean(i,:)=allsamples(i,:)-samplemean; % xmean 是一个 M × N 矩阵，xmean每一保存的数据是“每个图片数据-平均图片”
end; 
% 获取特征值及特征向量
sigma=xmean*xmean'; % M * M 阶矩阵
[v d]=eig(sigma); 
d1=diag(d); 
% 按特征值大小以降序排列
dsort = flipud(d1); 
vsort = fliplr(v); 
%以下选择 90%的能量
dsum = sum(dsort); 
 dsum_extract = 0; 
 p = 0; 
 while( dsum_extract/dsum < 0.9) 
 p = p + 1; 
 dsum_extract = sum(dsort(1:p)); 
 end 
p = 199; 
% (训练阶段)计算特征脸形成的坐标系
%while (i<=p && dsort(i)>0) 
% base(:,i) = dsort(i)^(-1/2) * xmean' * vsort(:,i); % base 是 N×p 阶矩阵，除以dsort(i)^(1/2)是对人脸图像的标准化，详见《基于 PCA 的人脸识别算法研究》p31 
% i = i + 1; % xmean' * vsort(:,i)是小矩阵的特征向量向大矩阵特征向量转换的过程
%end 
base = xmean' * vsort(:,1:p) * diag(dsort(1:p).^(-1/2)); 
% 生成特征脸
for (k=1:p), 
 temp = reshape(base(:,k), 112,92); 
 newpath = ['F:\study\数据挖掘\实验报告\实验二\code\test\' int2str(k) '.jpg']; 
 imwrite(mat2gray(temp), newpath); 
end 
avg = reshape(samplemean, 112,92); 
imwrite(mat2gray(avg),'F:\study\数据挖掘\实验报告\实验二\code\test\average.jpg'); 
% 将模型保存
save('F:\study\数据挖掘\实验报告\实验二\code\ORL\model.mat', 'base', 'samplemean');