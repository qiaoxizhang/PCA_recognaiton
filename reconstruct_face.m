% Reconstruct.m 
function [] = reconstruct() 
load F:\study\�����ھ�\ʵ�鱨��\ʵ���\code\ORL\model.mat; 
% ������ͼƬ�������ӿռ��е�ϵ��
img = 'F:\study\�����ھ�\ʵ�鱨��\ʵ���\code\test2\10.jpg' 
a=imread(img); 
b=a(1:112*92); % b ����ʸ�� 1��N������ N��10304����ȡ˳�������к��У������ϵ��£�������
b=double(b); 
b=b-samplemean; 
c = b * base; % c ��ͼƬ a ���ӿռ��е�ϵ��, �� 1*p ��ʸ��
% ��������ϵ�����������ؽ�ͼ
% ǰ 15 �� 
t = 15; 
temp = base(:,1:t) * c(1:t)'; 
temp = temp + samplemean'; 
imwrite(mat2gray(reshape(temp, 112,92)),'F:\study\�����ھ�\ʵ�鱨��\ʵ���\code\test2\t1.jpg'); 
% ǰ 50 �� 
t = 50; 
temp = base(:,1:t) * c(1:t)'; 
temp = temp + samplemean'; 
imwrite(mat2gray(reshape(temp, 112,92)),'F:\study\�����ھ�\ʵ�鱨��\ʵ���\code\test2\t2.jpg'); 
% ǰ 100 �� 
t = 100; 
temp = base(:,1:t) * c(1:t)'; 
temp = temp + samplemean'; 
imwrite(mat2gray(reshape(temp, 112,92)),'F:\study\�����ھ�\ʵ�鱨��\ʵ���\code\test2\t3.jpg'); 
% ǰ 150 �� 
t = 150; 
temp = base(:,1:t) * c(1:t)'; 
temp = temp + samplemean'; 
imwrite(mat2gray(reshape(temp, 112,92)),'F:\study\�����ھ�\ʵ�鱨��\ʵ���\code\test2\t4.jpg'); 
% ǰ 199 �� 
t = 199; 
temp = base(:,1:t) * c(1:t)'; 
temp = temp + samplemean'; 
imwrite(mat2gray(reshape(temp, 112,92)),'F:\study\�����ھ�\ʵ�鱨��\ʵ���\code\test2\t5.jpg');