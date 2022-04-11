% FaceRec.m 
% PCA 人脸识别修订版，识别率 88％ 
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
for i=1:200 xmean(i,:)=allsamples(i,:)-samplemean; % xmean 是一个 M × N 矩阵，xmean每一行保存的数据是“每个图片数据-平均图片”
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
i=1; 

% (训练阶段)计算特征脸形成的坐标系
base = xmean' * vsort(:,1:p) * diag(dsort(1:p).^(-1/2)); 
allcoor = allsamples * base; 
accu = 0; 
% 测试过程
for i=1:40 
 for j=6:10 %读入 40 x 5 副测试图像
 a=imread(strcat('F:\study\数据挖掘\实验报告\实验二\code\ORL\s',num2str(i),'\',num2str(j),'.jpg')); 
 b=a(1:10304); 
 b=double(b); 
 tcoor= b * base; %计算坐标，是 1×p 阶矩阵
 for k=1:200 
 mdist(k)=norm(tcoor-allcoor(k,:)); 
 end; 
 %三阶近邻 
 [dist,index2]=sort(mdist); 
 class1=floor( (index2(1)-1)/5 )+1; 
 class2=floor((index2(2)-1)/5)+1; 
 class3=floor((index2(3)-1)/5)+1; 
 if class1~=class2 && class2~=class3 
 class=class1; 
 elseif class1==class2 
 class=class1; 
 elseif class2==class3 
 class=class2; 
 end; 
 if class==i 
 accu=accu+1; 
 end; 
 end; 
end; 
accuracy=accu/200 %输出识别率