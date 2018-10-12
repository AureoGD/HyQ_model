%parameter fitting for weights w=[w1 w2 0 w4 w5 w6 0 w8];
%%%%%%                            b1 b2   b3 b3 b4   b5 
clear all
clc

load('X_data_raw.mat');
load('Y_data.mat');
load('Y_test.mat');
% X_data=[ones(158,1) X_data];
% [B, Bint, R, Rint, stats] = regress(Y_data, X_data);

% b
% b= fitrlinear(X_data,Y_data);
% b=fitlm(X_data, Y_data);

cost_weights = [10 20 20 30 0 10 100 1000];
X_cost=zeros(size(X_data));
X_cost_sum=zeros(158,1);
    
for col=1:8
    X_cost(:,col)=X_data(:,col).*cost_weights(col);
end

for jj=1:158
    X_cost_sum(jj)=sum(X_cost(jj,:));
end
figure()
plot(X_cost_sum-Y_test(:,2),'k*-','LineWidth',1);

% figure()
% hold on
% grid on
% for col=1:8
%     figure()
%     subplot(2,1,1)
%     hold on
%     grid on
%     plot(Y_test(:,1)-Y_test(:,2),'k-','LineWidth',3);
%     subplot(2,1,2)
%     hold on
%     grid on
%     for col=1:8
% end



