close all
clear all
clc

tic

% export LD_RUN_PATH=/home/aradulescu/OneShot/hyq_matode/matode/toolbox
% export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$LD_RUN_PATH

% --------------------  Initialization --------------------------------
% User defined input parameters (need to be edited)
%strfitnessfct = 'fsphere';  % name of objective/fitness function
%N = 50;               % number of objective variables/problem dimension
N = 12 * 16; %dofs * n_gaussians
task = task_hyq_selfRighting(N);
% xmean= task.initgo02Max';

task.go0 = zeros(12,1);
task.go0(1) = deg2rad(-25);
task.go0(4) = deg2rad(-25);
task.go0(7) = deg2rad(-25);
task.go0(10) = deg2rad(-25);
% task.go0(3) = - pi/2;
task.go0 = tf_joints_gazebo2matlab(task.go0);

task.init= [  task.go0(1)*ones(1,16),... %positions gp0
              task.go0(2)*ones(1,16),...
              task.go0(3)*ones(1,16),...
              task.go0(4)*ones(1,16),... %positions gp0
              task.go0(5)*ones(1,16),...
              task.go0(6)*ones(1,16),...
              task.go0(7)*ones(1,16),...
              task.go0(8)*ones(1,16),...
              task.go0(9)*ones(1,16),...
              task.go0(10)*ones(1,16),... %positions gp0
              task.go0(11)*ones(1,16),...
              task.go0(12)*ones(1,16)]; 
          
xmean= task.init';

% filename = 'mu6_SR_data_terrain_init_23-Aug-2016-19-16.mat';
% xmean = loadPrevSol(filename);
task.startSol=xmean; %just for book-keeping
[X,Xd,Q,RPY,th,thd,u,time] = hyq_do_Rollout_right(xmean,task,1);
