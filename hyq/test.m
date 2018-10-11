
close all    
clear all    
clc
    
addpath('hyq')
    
fig = figure;
opt = loadFigOptions();

h = initHomogeneousTransforms;
% j = initJacobians;
    
q = [ 0  0.75 -1.5   0  0.75 -1.5   0  -0.75 1.5  0  -0.75 1.5];
dq = zeros(12,1);

dt = 0.01; %not too smal otherwise it gets unstable
endTime = 1;
time = 0:dt:endTime;
feet = {};    
feetVel={};
first = 1;
stance_legs = {'LF','RF','LH','RH'};
       
for i=1:length(time)
        
    if (q(5) < 1.4) && (first == 1)
        q(5:6) = [q(5)+i*0.001 q(6)-i*0.002];
    elseif (q(5) > 0.75)
        first = 0;
        q(5:6) = [q(5)-i*0.001 q(6)+i*0.002];
    else
        first = 1;
    end
        
    h = updateKinematics(h, q);
%     Jb = computeJcb(stance_legs, feet)
     
    plotRobot(h)
end
