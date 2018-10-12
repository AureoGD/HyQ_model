% function [] = writeWholeBodyTrajectoryMsg(thetas, name_file)
clear all
close all
clc

%% mu6_SR_data_terrain_init_25-Aug-2016-12-1
%% mu6_SR_data_terrain_init_23-Aug-2016-19-16
%% mu6_jl_SR_data_terrain_init_28-Aug-2016-16-49
%% mu6_jl_SR_data_terrain_init_28-Aug-2016-18-25
%% mu6_jl_SR_data_terrain_init_29-Aug-2016-12-0
%% mu6_jl_SR_data_terrain_init_30-Aug-2016-20-15

%% mu7_jl_SR_data_terrain_init_02-Sep-2016-12-8
%% mu7_jl_SR_data_terrain_init_02-Sep-2016-17-5
%% mu7_jl_SR_data_terrain_init_02-Sep-2016-19-4
%% mu7_jl_SR_data_terrain_init_06-Sep-2016-17-58


%% potential %%
%% mu6_jl_SR_data_terrain_init_28-Aug-2016-12-19
%% mu6_jl_SR_data_terrain_init_28-Aug-2016-13-3
%% mu6_jl_SR_data_terrain_init_29-Aug-2016-15-52
%% mu6_jl_SR_data_terrain_init_29-Aug-2016-19-31


filename_root='mu9_rearTesttmp_PD601_hyq2max_60_data_09-Aug-2016-18-53';
% jump=0; %jump==0 - rearing task jump==1 - jumping task 
task_code = 1; %(0-rear; 1-jump; 2-self-righting; 3-Self-righting case 2)
file_load = [filename_root, '.mat'] ;
load(file_load);
task.go0 = [-0.075; 0.63; -1.32; -0.075; 0.63; -1.32; -0.075; -0.63; 1.32; -0.075; -0.63; 1.32;];
thetas=out.datx(end,:);

switch (task_code)
    case 0
        [X,Xd,Q,RPY,th,thd,u,time] = hyqRearingRollout(task, thetas,1);
    case 1
        [X,Xd,Q,RPY,th,thd,u,des_th,des_thd,LF_foot_pos,RF_foot_pos,LH_foot_pos,...
        RH_foot_pos,time] = hyqRearingRollout(task, thetas,0);
    case 2
        %% trajectories with mu6 prefix
        [X,Xd,Q,RPY,th,thd,u,time] = hyq_do_Rollout_right(thetas,task,1);
    case 3
        %% trajectories with mu7 prefix
        [X,Xd,Q,RPY,th,thd,u,time] = hyq_do_Rollout_right_back(thetas,task,1);
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
    
    name_file_yaml=[filename_root,'_trajectory.yaml'];
    WriteYaml(name_file_yaml,output);


% end

