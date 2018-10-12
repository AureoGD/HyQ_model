% function [] = writeWholeBodyTrajectoryMsg(thetas, name_file)
clear all
close all
clc

% jump=0; %jump==0 - rearing task jump==1 - jumping task 
task_code= 2; %(0-rear; 1-jump; 2-self-righting;)
switch (task_code)
    case 0
         load('rear_60_hyq2max_good1.mat')
% load('/home/aradulescu/OneShot/hyq_dw14/Rearing_GOOD/mu9_rearTest_PD601_hyqGreen_RPYabs_60_data_20-Jul-2016-14-19.mat')
% load('mu9_rearTest_PD601_hyq2max_60_data_29-Jul-2016-18-7.mat')
% load('mu9_rearTest_PD601_hyq2max_72_data_26-Jul-2016-14-41.mat')
% load('mu9_rearTest_PD601_hyq2max_60_data_29-Jul-2016-13-33.mat')
% load('/home/aradulescu/OneShot/hyq_dw14/Rearing_GOOD/mu9_rearTest_PD601_hyqGreen_60_data_16-Jul-2016-19-32.mat')
% load('/home/aradulescu/OneShot/hyq_dw14/Rearing_GOOD/mu9_rearTest_PD601_hyqGreen_60_data_14-Jul-2016-19-1.mat')
% load('/home/aradulescu/OneShot/hyq_dw14/Rearing_GOOD/mu9_rearTest_PD601_hyqGreen_60_data_14-Jul-2016-19-1.mat')% load('mu9_rearTest_PD601_hyqGreen_RPYabs_60_data_20-Jul-2016-14-19.mat')
% load('/home/aradulescu/OneShot/hyq_dw14/Rearing_GOOD/mu9_rearTest_PD601_hyqGreen_80_data_20-Jul-2016-15-5.mat')
% load('/home/aradulescu/OneShot/hyq_dw14/Rearing_GOOD/mu9_rearTest_PD601_hyqGreen_60_data_20-Jul-2016-16-53.mat')
% load('mu9_rearTest_PD601_hyq2max_60_data_26-Jul-2016-15-5.mat')

    case 1
        load('jumping_optim_result_DATA.mat');
    case 2
%         load('mu9_SR_data_terrain_initL_07-Jul-2016-13-16.mat');
    load('mu6_SR_data_terrain_init_25-Aug-2016-12-1.mat');
end


task.go0 = [-0.075; 0.63; -1.32; -0.075; 0.63; -1.32; -0.075; -0.63; 1.32; -0.075; -0.63; 1.32;];

% if (jump==0)
% else
%     load('jumping_optim_result_DATA.mat')
% end
thetas=out.datx(end,:);


% thetas = [  0*ones(1,16),... %positions
%                  pi*ones(1,16),...
%                  -pi*ones(1,16),...
%                  -0.2*ones(1,16),...
%                  -0.8*ones(1,16),...
%                  1.6*ones(1,16)];      

% 
% thetas = [  -0.2*ones(1,16),... %positions
%                  0.8*ones(1,16),...
%                  -1.6*ones(1,16),...
%                  -0.2*ones(1,16),...
%                  -0.8*ones(1,16),...
%                  1.6*ones(1,16)]; 
%      
% if (jump==0)
%     [X,Xd,Q,RPY,th,thd,u,time] = hyqRearingRollout(thetas,1);
% else
%     [X,Xd,Q,RPY,th,thd,u,des_th,des_thd,LF_foot_pos,RF_foot_pos,LH_foot_pos,...
%     RH_foot_pos,time] = hyq_do_Rollout(thetas,1);
% end
switch (task_code)
    
    case 0
        [X,Xd,Q,RPY,th,thd,u,time] = hyqRearingRollout(task, thetas,1);
    case 1
        [X,Xd,Q,RPY,th,thd,u,des_th,des_thd,LF_foot_pos,RF_foot_pos,LH_foot_pos,...
        RH_foot_pos,time] = hyq_do_Rollout(thetas,1);
    case 2
        [X,Xd,Q,RPY,th,thd,u,time] = hyq_do_Rollout_right(thetas,task,0);
end

step_disc=5;
end_point=3001;

thdd = diff(thd,1,2);
thdd = [zeros(size(thdd,1),1) , thdd];

RPYd =  diff(RPY,1,2);
RPYd = [zeros(size(RPYd,1),1) , RPYd];

%start create ros-msg-like  
output={};
output.joints={};
output.joints.names = {'lf_haa_joint', 'lf_hfe_joint', 'lf_kfe_joint', ...
    'rf_haa_joint', 'rf_hfe_joint', 'rf_kfe_joint',...
    'lh_haa_joint', 'lh_hfe_joint', 'lh_kfe_joint',...
    'rh_haa_joint', 'rh_hfe_joint', 'rh_kfe_joint'};

output.base={};
% dCOM=[0.02707 0.0000 0.0329]; 
% distCM=sqrt(sum(dCOM.^2));
% X(1,:)=X(1,:)-(dCOM(1)*(cos(RPY(2,:)).*cos(RPY(3,:))));
% X(3,:)=X(3,:)-(dCOM(3)*(cos(RPY(1,:)).*cos(RPY(2,:))));

Xt=zeros(size(X));
% X(1,:)=X(1,:)-(distCM*(cos(RPY(2,:))));
% X(3,:)=X(3,:)-(distCM*(cos(RPY(1,:))));

for jj=1:length(X)
    
Rx=[1 0 0; 0 cos(RPY(1,jj)) -sin(RPY(1,jj)); 0 sin(RPY(1,jj))  cos(RPY(1,jj))];
Ry=[cos(RPY(2,jj)) 0  sin(RPY(2,jj)); 0 1 0; -sin(RPY(2,jj))  0 cos(RPY(2,jj))];
Rz=[cos(RPY(3,jj)) -sin(RPY(3,jj)) 0; sin(RPY(3,jj)) cos(RPY(3,jj)) 0; 0 0 1];

Rxyz=Rx*Ry*Rz;

TF=[Rxyz X(:,jj); 0 0 0 1];

COT_COMF=[-0.02707; 0.0000; -0.0329; 1];

COT=TF*COT_COMF;

Xt(:,jj)=COT(1:3);
end

Xtd =  diff(Xt,1,2);
Xtd = [zeros(size(Xtd,1),1) , Xtd];


position=[Xt; RPY];
velocity=[Xtd; RPYd];

%base information
output.base.position1=position(1,1:step_disc:end_point);
output.base.position2=position(2,1:step_disc:end_point);
output.base.position3=position(3,1:step_disc:end_point);
output.base.position4=position(4,1:step_disc:end_point);
output.base.position5=position(5,1:step_disc:end_point);
output.base.position6=position(6,1:step_disc:end_point);

output.base.velocity1=velocity(1,1:step_disc:end_point);
output.base.velocity2=velocity(2,1:step_disc:end_point);
output.base.velocity3=velocity(3,1:step_disc:end_point);
output.base.velocity4=velocity(4,1:step_disc:end_point);
output.base.velocity5=velocity(5,1:step_disc:end_point);
output.base.velocity6=velocity(6,1:step_disc:end_point);

    %% Adjust sign convention
%     th(2,1:step_disc:end)=-th(2,1:step_disc:end);
%     th(3,1:step_disc:end)=-th(3,1:step_disc:end);  
%     th(5,1:step_disc:end)=-th(5,1:step_disc:end);
%     th(6,1:step_disc:end)=-th(6,1:step_disc:end);
%     th(8,1:step_disc:end)=-th(8,1:step_disc:end);
%     th(9,1:step_disc:end)=-th(9,1:step_disc:end);  
%     th(11,1:step_disc:end)=-th(11,1:step_disc:end);
%     th(12,1:step_disc:end)=-th(12,1:step_disc:end);    
    

    th(4,1:step_disc:end)=-th(4,1:step_disc:end); 
    th(10,1:step_disc:end)=-th(10,1:step_disc:end);

    
    th(2,1:step_disc:end)=-th(2,1:step_disc:end)+pi/2; 
    th(5,1:step_disc:end)=-th(5,1:step_disc:end)+pi/2; 
    
    th(3,1:step_disc:end)=-th(3,1:step_disc:end)-pi; 
    th(6,1:step_disc:end)=-th(6,1:step_disc:end)-pi; 
        
    th(8,1:step_disc:end)=-th(8,1:step_disc:end)-pi/2; 
    th(11,1:step_disc:end)=-th(11,1:step_disc:end)-pi/2; 
    
    th(9,1:step_disc:end)=-th(9,1:step_disc:end)+pi; 
    th(12,1:step_disc:end)=-th(12,1:step_disc:end)+pi; 

    %% Tweaks - check why needed - may be difference in models used
  
%     th(10,1:step_disc:end)=th(10,1:step_disc:end)+pi/8; 
%     th(7,1:step_disc:end)=th(7,1:step_disc:end)+pi/8; 

%     th(5,1:step_disc:end)=th(5,1:step_disc:end)-pi/2;
%     th(6,1:step_disc:end)=pi+th(6,1:step_disc:end);
    

    output.joints.lf_haa_joint.position=th(1,1:step_disc:end_point);
    output.joints.lf_haa_joint.velocity=thd(1,1:step_disc:end_point);
    output.joints.lf_haa_joint.acceleration=thdd(1,1:step_disc:end_point);
    output.joints.lf_haa_joint.effort=u(1,1:step_disc:end_point);

    output.joints.lf_hfe_joint.position=th(2,1:step_disc:end_point);
    output.joints.lf_hfe_joint.velocity=thd(2,1:step_disc:end_point);
    output.joints.lf_hfe_joint.acceleration=thdd(2,1:step_disc:end_point);
    output.joints.lf_hfe_joint.effort=u(2,1:step_disc:end_point);

    output.joints.lf_kfe_joint.position=th(3,1:step_disc:end_point);
    output.joints.lf_kfe_joint.velocity=thd(3,1:step_disc:end_point);
    output.joints.lf_kfe_joint.acceleration=thdd(3,1:step_disc:end_point);
    output.joints.lf_kfe_joint.effort=u(3,1:step_disc:end_point);
    
    output.joints.rf_haa_joint.position=th(4,1:step_disc:end_point);
    output.joints.rf_haa_joint.velocity=thd(4,1:step_disc:end_point);
    output.joints.rf_haa_joint.acceleration=thdd(4,1:step_disc:end_point);
    output.joints.rf_haa_joint.effort=u(4,1:step_disc:end_point);

    output.joints.rf_hfe_joint.position=th(5,1:step_disc:end_point);
    output.joints.rf_hfe_joint.velocity=thd(5,1:step_disc:end_point);
    output.joints.rf_hfe_joint.acceleration=thdd(5,1:step_disc:end_point);
    output.joints.rf_hfe_joint.effort=u(5,1:step_disc:end_point);

    output.joints.rf_kfe_joint.position=th(6,1:step_disc:end_point);
    output.joints.rf_kfe_joint.velocity=thd(6,1:step_disc:end_point);
    output.joints.rf_kfe_joint.acceleration=thdd(6,1:step_disc:end_point);
    output.joints.rf_kfe_joint.effort=u(6,1:step_disc:end_point);
    
    output.joints.lh_haa_joint.position=th(7,1:step_disc:end_point);
    output.joints.lh_haa_joint.velocity=thd(7,1:step_disc:end_point);
    output.joints.lh_haa_joint.acceleration=thdd(7,1:step_disc:end_point);
    output.joints.lh_haa_joint.effort=u(7,1:step_disc:end_point);

    output.joints.lh_hfe_joint.position=th(8,1:step_disc:end_point);
    output.joints.lh_hfe_joint.velocity=thd(8,1:step_disc:end_point);
    output.joints.lh_hfe_joint.acceleration=thdd(8,1:step_disc:end_point);
    output.joints.lh_hfe_joint.effort=u(8,1:step_disc:end_point);

    output.joints.lh_kfe_joint.position=th(9,1:step_disc:end_point);
    output.joints.lh_kfe_joint.velocity=thd(9,1:step_disc:end_point);
    output.joints.lh_kfe_joint.acceleration=thdd(9,1:step_disc:end_point);
    output.joints.lh_kfe_joint.effort=u(9,1:step_disc:end_point);
    
    output.joints.rh_haa_joint.position=th(10,1:step_disc:end_point);
    output.joints.rh_haa_joint.velocity=thd(10,1:step_disc:end_point);
    output.joints.rh_haa_joint.acceleration=thdd(10,1:step_disc:end_point);
    output.joints.rh_haa_joint.effort=u(10,1:step_disc:end_point);

    output.joints.rh_hfe_joint.position=th(11,1:step_disc:end_point);
    output.joints.rh_hfe_joint.velocity=thd(11,1:step_disc:end_point);
    output.joints.rh_hfe_joint.acceleration=thdd(11,1:step_disc:end_point);
    output.joints.rh_hfe_joint.effort=u(11,1:step_disc:end_point);

    output.joints.rh_kfe_joint.position=th(12,1:step_disc:end_point);
    output.joints.rh_kfe_joint.velocity=thd(12,1:step_disc:end_point);
    output.joints.rh_kfe_joint.acceleration=thdd(12,1:step_disc:end_point);
    output.joints.rh_kfe_joint.effort=u(12,1:step_disc:end_point);
    
    name_file='mu6_SR_data_terrain_init_25-Aug-2016-12-1';
    name_file_yaml=[name_file,'_trajectory.yaml'];
    WriteYaml(name_file_yaml,output);


% end

