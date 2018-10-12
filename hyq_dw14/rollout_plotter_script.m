% plot everything that comes out of a rollout
figure; plot(time,u); title('u');
figure; plot(time,th); title('th');
figure; plot(time,thd); title('thd');
figure; plot(time,des_th); title('des th');
figure; plot(time,des_thd); title('des thd');
figure; plot(time,X); title('X');
figure; plot(time,Xd); title('Xd');
figure; plot(time,RPY); title('RPY');
figure; plot(time(2:end),diff(RPY')); title('RPYd');


% close all;
% 
% figure();
% a(1) = subplot(121); a(2) = subplot(122);
% plot(time(2:end),diff(RPY'),'Parent', a(1),'lineWidth', 2);
% 
% plot(time(2:end),diff(RPY'),'Parent', a(2),'lineWidth', 2);
% 
% 
% xkcdify(a(2));
