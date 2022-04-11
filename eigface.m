% eigface.m 
function [] = eigface() 
% calc xmean,sigma and its eigen decomposition 
allsamples=[];%����ѵ��ͼ��
for i=1:40 
 for j=1:5 
 a=imread(strcat('F:\study\�����ھ�\ʵ�鱨��\ʵ���\code\ORL\s',num2str(i),'\',num2str(j),'.jpg')); 
 % imshow(a); 
 b=a(1:112*92); % b ����ʸ�� 1��N������ N��10304����ȡ˳�������к��У������ϵ��£�������
 b=double(b); 
 allsamples=[allsamples; b]; % allsamples ��һ�� M * N ����allsamples ��ÿһ�����ݴ���һ��ͼƬ������ M��200 
 end 
end 
samplemean=mean(allsamples); % ƽ��ͼƬ��1 �� N 
for i=1:200 xmean(i,:)=allsamples(i,:)-samplemean; % xmean ��һ�� M �� N ����xmeanÿһ����������ǡ�ÿ��ͼƬ����-ƽ��ͼƬ��
end; 
% ��ȡ����ֵ����������
sigma=xmean*xmean'; % M * M �׾���
[v d]=eig(sigma); 
d1=diag(d); 
% ������ֵ��С�Խ�������
dsort = flipud(d1); 
vsort = fliplr(v); 
%����ѡ�� 90%������
dsum = sum(dsort); 
 dsum_extract = 0; 
 p = 0; 
 while( dsum_extract/dsum < 0.9) 
 p = p + 1; 
 dsum_extract = sum(dsort(1:p)); 
 end 
p = 199; 
% (ѵ���׶�)�����������γɵ�����ϵ
%while (i<=p && dsort(i)>0) 
% base(:,i) = dsort(i)^(-1/2) * xmean' * vsort(:,i); % base �� N��p �׾��󣬳���dsort(i)^(1/2)�Ƕ�����ͼ��ı�׼������������� PCA ������ʶ���㷨�о���p31 
% i = i + 1; % xmean' * vsort(:,i)��С���������������������������ת���Ĺ���
%end 
base = xmean' * vsort(:,1:p) * diag(dsort(1:p).^(-1/2)); 
% ����������
for (k=1:p), 
 temp = reshape(base(:,k), 112,92); 
 newpath = ['F:\study\�����ھ�\ʵ�鱨��\ʵ���\code\test\' int2str(k) '.jpg']; 
 imwrite(mat2gray(temp), newpath); 
end 
avg = reshape(samplemean, 112,92); 
imwrite(mat2gray(avg),'F:\study\�����ھ�\ʵ�鱨��\ʵ���\code\test\average.jpg'); 
% ��ģ�ͱ���
save('F:\study\�����ھ�\ʵ�鱨��\ʵ���\code\ORL\model.mat', 'base', 'samplemean');