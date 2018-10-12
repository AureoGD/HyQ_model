function [y] = torquepolicy(x,weights,tf)
%gets a set of weights and returns a torque profile
%note that the mus and sigmas are hardcoded
%note that the distance between kernels is 0.2 
%note that the profile is tf seconds long

mus = 0:0.2:tf;
sigmas = 0.1*ones(size(mus));

%weights = 100*ones(size(mus));
%weights = 100*(1-(2*rand(size(mus))));
%x = 0:0.01:3;

y = zeros(1,size(x,2));

for i=1:size(x,2);
    y(i) = gaussianWeightedRegression(x(i),mus,sigmas,weights);
end
%plot(x,y,'r','LineWidth',3); hold on; 

% yy = zeros(size(mus,2),size(x,2));
% for i=1:size(mus,2);
%     yy(i,:)=weights(i) * gaussmf(x,[sigmas(i) mus(i)]);
% end
% 
% plot(x,yy);hold off;